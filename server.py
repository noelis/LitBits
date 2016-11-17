from jinja2 import StrictUndefined
from flask import (Flask, render_template, redirect, request, flash, session)
from flask_debugtoolbar import DebugToolbarExtension
from model import (connect_db, db, Book, Genre, Author, User, UserBook, BookGenre, BookAuthor)
from sqlalchemy.orm.exc import NoResultFound
from search import clean_up_query, search_bar

import bcrypt


app = Flask(__name__)

# For Flask sessions and debug toolbar
app.secret_key = "TBD"


# Have Jinja raise an error if you use an undefined variable in the template.
app.jinja_env.undefined = StrictUndefined
app.jinja_env.auto_reload = True


@app.route('/')
def index():
    """ Home """

    top_books = Book.query.order_by(Book.book_id).limit(100).all()

    return render_template("index.html", top_books=top_books)

@app.route('/search', methods=["GET"])
def search():
    """ Loads search results page. """

    q = request.args.get("q")

    if q != "":
        # cleans up the query and formats it
        clean_query = clean_up_query(q)
        # calls function that queries db.
        search_results = search_bar(clean_query)
        return render_template("search.html", search_results=search_results)
    else:
        flash("Please enter a valid alphanumeric character.")
        return redirect('/')


@app.route('/register', methods=["POST"])
def process_registration():
    """ Get user info from form and add them to db."""

    name = request.form.get("name")
    email = request.form.get("email")
    password = request.form.get("password")

    check_user_in_db_query = User.query.filter(User.email == email)

    try:

        check_user_in_db_query.one()
        flash("You've already signed up!") # Convert to JS messages
        return redirect("/login")

    except NoResultFound: 

        new_user = User(name=name, email=email, password=bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(14)))
        db.session.add(new_user)
        db.session.commit()
        flash("You have been registered successfully!")  # Convert to JS messages
        return redirect("/")


@app.route('/login', methods=["POST"])
def process_login():
    """ Process user's credentials for login. """

    email = request.form.get("email")
    password = request.form.get("password")

    try:
        # Check if user exists in db
        verify_user = User.query.filter(User.email == email).one()

        # If user does exist: make sure the (hashed) password entered, matches the (hashed) password in the db.
        if bcrypt.hashpw(password.encode("UTF_8"), verify_user.password.encode("UTF_8")).decode() == verify_user.password:
            # If password matches, add user to the Flask session
            session['user_id'] = verify_user.user_id
            flash("You are now logged in.")
            return redirect("/")
        else:
            flash("Your password does not match. Try again.")
            return redirect("/")
        
    # If user does not exist it will throw a NoResultFound error
    except NoResultFound: 
        flash("Your email does not exist. Try again.")
        return redirect("/login")


@app.route('/logout')
def logout():
    """ Process logout request."""
    if 'user_id' in session:
        del session['user_id']
        flash("You have been logged out of your account. Goodbye! ") 
        return redirect('/')


@app.route('/book/<int:book_id>')
def book_details(book_id):
    # use book_id passed in from url to make sure it esxists in our db

    try:
        book = Book.query.filter(Book.book_id == book_id).one()
        return render_template("book.html", book=book)
    except NoResultFound:
        flash("This book does not exist.")
        return redirect("/")


@app.route('/author/<int:author_id>')
def author_details(author_id):
    # use author_id passed in from url to make sure it esxists in our db

    try:
        name = Author.query.filter(Author.author_id == author_id).one()
        return render_template("author.html", author=name)
    except NoResultFound:
        flash("This author does not exist.")
        return redirect("/")


@app.route('/genre/<int:genre_id>')
def genre_details(genre_id):
    # user book_id passed in from url to make sure it esxists in our db

    try:
        genre_type = Genre.query.filter(Genre.genre_id == genre_id).one()
        return render_template("genre.html", genre_type=genre_type)
    except NoResultFound:
        flash("This genre does not exist.")
        return redirect("/")


@app.route('/review', methods=['GET'])
def allow_rating():
    """ Allow user to rate or update an existing rating a book."""
    pass

@app.route('/review', methods=['POST'])
def process_rating():
    """ Process rating."""
    pass

@app.route('/goodreads_oauth_callback')
def goodreads_oauth_callback():
    """ For goodreads Oauth."""

    return render_template("goodreads_oauth.html")

if __name__ == '__main__':
    # Enable Flask DebugToolbarExtension
    app.debug=True

    # Call function from model.py that connects database to Flask app 
    connect_db(app)

    DebugToolbarExtension(app)
    
    # Configure http port used by app
    app.run(host="0.0.0.0", port=5000)