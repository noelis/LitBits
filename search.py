from model import (connect_db, db, Book, Genre, Author, User, UserBook, BookGenre, BookAuthor)
from flask_sqlalchemy import SQLAlchemy



def clean_up_query(search_query):
    """ Format query with wildcards and escape out of any apostrophe's that may in the query."""

    clean_query = "%" + search_query.replace("'", "\'") + "%"

    return clean_query

def search_bar(search_query):
    """Query the books, authors, genres tables an see if returns anything."""

    search_results = []

    # Querying by model returns list of objects.
    title = Book.query.filter(Book.title.ilike(search_query)).all()
    # append results from query to empty list.
    search_results.append(title)

    author = Author.query.filter(Author.name.ilike(search_query)).all()
    search_results.append(author)

    genre = Genre.query.filter(Genre.genre.ilike(search_query)).all()
    search_results.append(genre)


    # Returns a list of nested lists: [ [books], [authors], [genres] ]
    return search_results

if __name__ == '__main__':
    
    # Import Flask app from server.py file
    from server import app

    # Call connect_db function & pass in Flask app
    connect_db(app)
   