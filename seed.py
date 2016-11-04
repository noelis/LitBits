from sqlalchemy import func
from server import app
from datetime import datetime

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
            get_author(book, book_added)

def book_api_request(api_url):
    """Make API request, get a response in text format, parse it using xmltodict."""

    response = requests.get(api_url)

    # Turn response.content (string) into dictionary
    metadata = xmltodict.parse(response.content)

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
    load_book_info()

