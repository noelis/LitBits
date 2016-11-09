""" Define each table in a class and establish connection to database. """

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class Genre(db.Model):
    """Genre metadata available for books."""

    __tablename__ = "genres"

    genre_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    genre = db.Column(db.String(64),
                        nullable=False)

    def __repr__(self):
        """ Provide helpful representation of genres table when printed"""

        return "<Genre genre_id=%s genre=%s>" % (self.genre_id, self.genre)


class Author(db.Model):
    """Name of author associated with a book. """

    __tablename__ = "authors"

    author_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    name = db.Column(db.String(128), 
                        nullable=False)

    def __repr__(self):
        """ Provide helpful representation of authors table when printed"""

        return "<Author author_id=%s name=%s>" % (self.author_id, self.name)

class Book(db.Model):
    """Public domain books to rate/collect. """

    __tablename__ = "books"

    book_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    title = db.Column(db.String(256),
                        nullable=False)
    release_year = db.Column(db.Integer,
                        nullable=True)
    url = db.Column(db.String(256),
                        nullable=False)
    book_cover = db.Column(db.String(256),
                        nullable=False)
    mini_summary = db.Column(db.String(1024),
                        nullable=False)
    goodreads_id = db.Column(db.Integer,
                        nullable=True)

    genres = db.relationship("Genre",
                        secondary="book_genres",
                        backref="books")
    author = db.relationship("Author",
                        secondary="book_authors",
                        backref="books")

    def __repr__(self):
        """ Provide helpful representation of books table when printed"""

        return "<Book title=%s release_year=%i goodreads_id=%i url=%s>" % (self.title, self.release_year, self.goodreads_id, self.url)


class User(db.Model):
    """User information for book website."""

    __tablename__ = "users"

    user_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    name = db.Column(db.String(64),
                        nullable=False)
    goodreads_id = db.Column(db.Integer,
                        nullable=True)
    email = db.Column(db.String(128),
                        nullable=True)
    password = db.Column(db.String(64),
                        nullable=True)
    # look up how to encrypt password before adding to DB

    def __repr__(self):
        """ Provide helpful representation of users table when printed"""

        return "<User user_id=%s goodreads_id=%s name=%s>" % (self.user, self.goodreads_id, self.name)


class UserBook(db.Model):
    """ Books that the user is planning on reading or has read/rated. """

    # This is a middle table

    __tablename__ = "user_books"

    user_book_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    user_id = db.Column(db.Integer,
                        db.ForeignKey("users.user_id"),
                        nullable=False)
    book_id = db.Column(db.Integer,
                        db.ForeignKey("books.book_id"),
                        nullable=False)
    book_read = db.Column(db.Boolean,
                        default=False,
                        nullable=False)
    rating = db.Column(db.Integer,
                        nullable=True)
    updated_at = db.Column(db.DateTime,
                        nullable=True)

    book = db.relationship("Book",
                        backref="user_books")
    user = db.relationship("User",
                        backref="user")


class BookGenre(db.Model):
    """ Displays genre that corresponds with each book."""

    # This is an association table

    __tablename__ = "book_genres"

    book_genre_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    book_id = db.Column(db.Integer,
                        db.ForeignKey("books.book_id"),
                        nullable=False)
    genre_id = db.Column(db.Integer,
                        db.ForeignKey("genres.genre_id"),
                        nullable=False)


class BookAuthor(db.Model):
    """ Displays author that corresponds with each book. """

    # This is an association table

    __tablename__ = "book_authors"

    book_author_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    book_id = db.Column(db.Integer,
                        db.ForeignKey("books.book_id"),
                        nullable=False)
    author_id = db.Column(db.Integer,
                        db.ForeignKey("authors.author_id"),
                        nullable=False)


# _________________________________________
def connect_db(app):
    """Connect database to Flask app (in Server.py)"""

    # Establishes the type of database it is, and database name:
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///books' 
    # app.config['SQLALCHEMY_ECHO'] = True            # To help with debugging 
    db.app = app
    db.init_app(app)


if __name__ == '__main__':

    # Import Flask app from server.py file
    from server import app

    # Call connect_db function & pass in Flask app
    connect_db(app)
    # db.create_all()

    print "DB connected."
