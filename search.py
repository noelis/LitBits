from model import (connect_db, db, Book, Genre, Author, User, UserBook, BookGenre, BookAuthor)
from flask_sqlalchemy import SQLAlchemy


def get_top_books():
    """Query the books table and get the top 100 books."""

    top_books = Book.query.order_by(Book.book_id).limit(100).all()

    return top_books

def clean_up_query(search_query):
    """ Format query with wildcards and escape out of any apostrophe's that may in the query."""

    clean_query = "%" + search_query.replace("'", "\'") + "%"

    return clean_query

def search_all(search_query):
    """Query the books, authors, genres tables an see if returns anything."""

    search_results = []

    # Querying by table returns list of objects.
    title = Book.query.filter(Book.title.ilike(search_query)).all()
    # append results from query to empty list.
    search_results.append(title)

    author = Author.query.filter(Author.name.ilike(search_query)).all()
    search_results.append(author)

    genre = Genre.query.filter(Genre.genre.ilike(search_query)).all()
    search_results.append(genre)


    # Returns a list of nested lists with results from each query: [ [books], [authors], [genres] ]
    return search_results

def get_titles():
    """Query the books table to get all book titles in db."""

    search_suggestions = []

    # Querying by table returns list of objects.
    books = Book.query.all()
    
    for book in books:
        # book.title returns title in unicode
        search_suggestions.append(book.title)

    return search_suggestions

def get_authors(search_suggestions):
    """Query the authors table to get all authors in db."""

    authors = Author.query.all()
    
    for author in authors:
        # author.name returns title in unicode
        search_suggestions.append(author.name)

    return search_suggestions

def get_genres(search_suggestions):
    """Query the authors table to get all authors in db."""

    genres = Genre.query.all()
    
    for genre in genres:
        # genre.genre returns title in unicode
        search_suggestions.append(genre.genre)

    return search_suggestions


def search_author(search_query):
    """Query the authors table and see if returns anything."""

    # Querying by table returns list of objects.
    author = Author.query.filter(Author.name.ilike(search_query)).all()

    return author


def search_genres(search_query):
    """Query the genre table and see if returns anything."""

    # Querying by table name returns list of objects.
    genre = Genre.query.filter(Genre.genre.ilike(search_query)).all()

    return genre


def get_ratings_avg(book_id):
    """ Query db for book ratings and find average rating. """

    all_ratings = UserBook.query.filter(UserBook.book_id == book_id).all()
    sum_ratings = 0

    for individual_rating in all_ratings:
        sum_ratings += individual_rating.rating

    return sum_ratings/float(len(all_ratings))


if __name__ == '__main__':
    
    # Import Flask app from server.py file
    from server import app

    # Call connect_db function & pass in Flask app
    connect_db(app)
   