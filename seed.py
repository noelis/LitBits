from sqlalchemy import func
from server import app
from datetime import datetime

from model import (connect_db, db, Book, Genre, Author, User, UserBook, BookGenre, BookAuthor)

from sqlalchemy.orm.exc import NoResultFound

import xmltodict
import requests


def get_book_titles(api_url):
    """Get title, year published and mini-summary from API into a dictionary. """

    print "Loading books.."

    #Response object from API
    response = requests.get(api_url)

    # Turn response.content (string) into dictionary
    metadata = xmltodict.parse(response.content)

    books = metadata['feed']['entry']

    # List of book 'entry' objects from nested dictionary.
    # Each book object is a dictionary.
    books = metadata['feed']['entry']

    for book in books:
        title = book['title']
        release_year = book['dcterms:issued']
        summary = book['summary'].encode("utf-8")
        download_url = book['link'][1]['@href']
        book_cover = book['link'][4]['@href']

        # Creates an instance of the Book class
        book_add = Book(title=title, 
                    release_year=release_year,
                    url=download_url,
                    book_cover=book_cover,
                    mini_summary=summary)

        # Adds book to the session.
        db.session.add(book_add)

        # Commits book so it gets added to the table.
        db.session.commit()

        # Check if book['author'] is a dictionary object
        if isinstance(book['author'], dict):
            author_name = book['author']['name'].encode('utf-8')
            author = Author(name=author_name) # Creates an instance of the Author class
            try:
                # Check in the database to see if this author exists. 
                # If we get 1 result, then don't add them to the table. 
                get_authors = Author.query.filter(Author.name == author_name).one()
                pass
            except NoResultFound:
                # If we check in the db and get this error, then author doesn't exist yet.
                #  Add/commit to db
                db.session.add(author)
                db.session.commit()

            # Query the Author table by name to find the author_id
            get_author = Author.query.filter(Author.name == author_name).one() # Returns an author object

            # Creates BookAuthor instance 
            book_author_link = BookAuthor(book_id=book_add.book_id, 
                                            author_id=get_author.author_id)

            # Add/commit instance to BookAuthor association table.
            db.session.add(book_author_link)
            db.session.commit()
        else:
            book_authors = book['author'] # List of dictionaries

            for author in book_authors:
                author_name = author['name'].encode('utf-8') # Grabs author from dict obj

                author_pair = Author(name=author_name) # Creates an instance of the Author class
                
                db.session.add(author_pair) # Add/commit author_pair instance
                db.session.commit()
                
                # Query the Author table by name to find the author_id
                get_authors = Author.query.filter(Author.name == author_name).one()

                # Creates an instance of the BookAuthor class
                book_author_link = BookAuthor(book_id=book_add.book_id, 
                                            author_id=get_authors.author_id)
                 # Add/commit author_pair instance
                db.session.add(book_author_link)
                db.session.commit()

                
if __name__ == '__main__':
    # Call connect_db function & pass in Flask app
    connect_db(app)

    # Create tables
    db.create_all()

    # Call functions to load info from each API endpoint page
    get_book_titles('http://www.feedbooks.com/books/top.atom')
    get_book_titles('http://www.feedbooks.com/books/top.atom?page=2')
    get_book_titles('http://www.feedbooks.com/books/top.atom?page=3')
    get_book_titles('http://www.feedbooks.com/books/top.atom?page=4')
    get_book_titles('http://www.feedbooks.com/books/top.atom?page=5')

