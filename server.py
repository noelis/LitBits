from jinja2 import StrictUndefined
from flask import (Flask, render_template, redirect, request, flash, session)
from flask_debugtoolbar import DebugToolbarExtension
from model import (connect_db, db, Book, Genre, Author, User, UserBook, 
                    BookGenre, BookAuthor)
from sqlalchemy.orm.exc import NoResultFound


app = Flask(__name__)

# For Flask sessions and debug toolbar
app.secret_key = "TBD"

# Have Jinja raise an error if you use an undefined variable in the template.
app.jinja_env.undefined = StrictUndefined


if __name__ == '__main__':
    # Configure http port used by app
    app.run(port=5000)

    # Enable Flask DebugToolbarExtension
    app.debug = True
    DebugToolbarExtension(app)

    # Call function from model.py that connects database to Flask app 
    connect_db(app)


