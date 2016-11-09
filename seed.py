from sqlalchemy import func
from server import app
from datetime import datetime
from os import environ

from model import (connect_db, db, Book, Genre, Author, User, UserBook, BookGenre, BookAuthor)

from sqlalchemy.orm.exc import NoResultFound

import xmltodict
import requests

def load_book_info():
    """Load information to book, author and book_authors tables in db."""

    for i in range(1, 6):
        print "Loading books.."
        books = book_api_request('http://www.feedbooks.com/books/top.atom?page=' + str(i))

        for book in books:
            title, release_year, summary, download_url, book_cover = get_book_metadata(book)
            book_added = add_book_metadata(title, release_year, summary, download_url, book_cover)
            if book_added != None:
                get_author(book, book_added)
                get_genre(book, book_added)


def get_goodreads_book_id():
    """Query db for book titles, search Goodreads and get their goodreads_id."""


    all_books = db.session.query(Book).order_by(Book.book_id).all()

    app_key = environ["KEY"]

    for book in all_books:

        print "\n~~~~~~~~~~~~~~~~~~~~~~Searching goodreads for book id", book.book_id, ", ", book.title, 'author: ', book.author[0].name.encode('ascii', 'ignore')

        payload = {'key': app_key, 'q': book.title}

        response = requests.get("https://www.goodreads.com/search/index.xml", params=payload)

        search_result = xmltodict.parse(response.text)

        all_matches = search_result['GoodreadsResponse']['search']['results']['work']

        print 'found', len(all_matches), 'matches'

        matchfound = False
        for match in all_matches:
            print '\tlooking at gooodreads author ', match['best_book']['author']['name'].encode('ascii', 'ignore')

            goodreads_lastname = match['best_book']['author']['name'].encode('ascii', 'ignore').split()[-1]
            database_lastname = book.author[0].name.encode('ascii', 'ignore').split()[-1]

            if goodreads_lastname == database_lastname:
                if match['ratings_count']['#text'] > 1000:
                    goodreads_id = match['best_book']['id']['#text']
                    add_goodreads_book_id(book.title, goodreads_id)
                    print "found a suitable match, moving on"
                    matchfound = True
                else:
                    print '************ ERROR!!!!! found a match but there are only', match['ratings_count']['#text'], 'ratings'
                break

        # if we got here and no match, :-(
        if not matchfound:
            print '***************** ERROR!!!!! no match found! boo hoo.'

def add_goodreads_book_id(book_title, add_goodreads_id):
    """ Add goodreads book_id to books table."""

    search_book = Book.query.filter(Book.title == book_title).first()
    search_book.goodreads_id = add_goodreads_id

    db.session.commit()


def book_api_request(api_url):
    """Make API request, get a response in text format, parse it using xmltodict."""

    response = requests.get(api_url)

    # Turn response.content (string) into dictionary
    metadata = xmltodict.parse(response.text)

    # List of 'entry' objects from 'feed'dictionary. Each 'entry' is a book (dict).
    books = metadata['feed']['entry']

    return books


def get_book_metadata(book):
    """ Gets book metadata from API."""

    title = book['title']
    release_year = book['dcterms:issued']
    summary = book['summary'].encode("utf-8")
    download_url = book['link'][1]['@href']
    book_cover = book['link'][4]['@href']

    return [title, release_year, summary, download_url, book_cover]


def add_book_metadata(title, release_year, summary, download_url, book_cover):
    """Creates Book object and adds metadata to db."""

    if title.encode('utf-8') not in ("The Public Domain: Enclosing the Commons of the Mind", "Password Incorrect"):

        # Creates an instance of the Book class
        book_add = Book(title=title, 
                    release_year=release_year,
                    url=download_url,
                    book_cover=book_cover,
                    mini_summary=summary)

        # Add/commit book so it gets added to the table.
        db.session.add(book_add)
        db.session.commit()

        return book_add


def get_genre(book, book_add):
    """ Gets genre info from book entry."""

    #TODO: Refactor and add try/except instead of if not category in book.

    if not 'category' in book:
        # If there is no category key, continue without adding genre info.
        pass

    elif isinstance(book['category'], dict):
        genre = book['category']['@label']
        genre_added = add_genre(genre)
        link_genre_book(genre_added, book_add)

    else:
        book_genres = book['category']         # List of dictionaries

        for genre in book_genres:
            # Grabs genre from dict
            book_genre = genre['@label']
            genre_added = add_genre(book_genre)
            link_genre_book(genre_added, book_add)


def add_genre(genre_to_add):
    """ Creates Genre object, check if it already exists in db & adds it."""

    # Creates an instance of the Author class
    add_genre = Genre(genre=genre_to_add)

    try:
        # Check if genre exists & do not add them if so.
        check_genre = Genre.query.filter(Genre.genre == genre_to_add).one()
    except NoResultFound:

        # If we get this error, then genre doesn't exist yet. Add/commit to db
        db.session.add(add_genre)
        db.session.commit()

    check_genre = Genre.query.filter(Genre.genre == genre_to_add).one()
    return check_genre


def link_genre_book(genre_added, book_add):
    """Creates a BookGenre object and adds it to db."""

     # Creates an instance of the BookGenre class
    book_genre_link = BookGenre(book_id=book_add.book_id, 
                                    genre_id=genre_added.genre_id)

    # Add/commit instance to BookGenre association table.
    db.session.add(book_genre_link)
    db.session.commit()


def get_author(book, book_add):
    """ Gets author info from book."""

    if isinstance(book['author'], dict):
        author_name = book['author']['name'].encode('utf-8')
        author_added = add_author(author_name)
        link_author_book(author_added, book_add)
    else:
        # List of dictionaries
        book_authors = book['author'] 

        for author in book_authors:
            # Grabs author from dict obj
            author_name = author['name'].encode('utf-8') 
            author_added = add_author(author_name)
            link_author_book(author_added, book_add)


def add_author(author_name):
    """ Creates Author object, check if it already exists in db & adds it."""

    # Creates an instance of the Author class
    author = Author(name=author_name)

    try:
        # Check if author exists & do not add them if so.
        check_author = Author.query.filter(Author.name == author_name).one()
    except NoResultFound:

        # If we get this error, then author doesn't exist yet. Add/commit to db
        db.session.add(author)
        db.session.commit()

    check_author = Author.query.filter(Author.name == author_name).one()
    return check_author


def link_author_book(author_added, book_add):
    """Creates a BookAuthor object and adds it to db."""

     # Creates an instance of the BookAuthor class
    book_author_link = BookAuthor(book_id=book_add.book_id, 
                                    author_id=author_added.author_id)

    # Add/commit instance to BookAuthor association table.
    db.session.add(book_author_link)
    db.session.commit()

                
if __name__ == '__main__':
    # Call connect_db function & pass in Flask app
    connect_db(app)

    # Create tables
    db.create_all()

    # Call function to load books to db.
    # load_book_info()

    #Call function to get/load goodreads_id to title db.
    get_goodreads_book_id()

