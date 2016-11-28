from jinja2 import StrictUndefined
from flask import (Flask, render_template, redirect, request, flash, session, jsonify)
from flask_debugtoolbar import DebugToolbarExtension
from model import (connect_db, db, Book, Genre, Author, User, UserBook, BookGenre, BookAuthor)
from sqlalchemy.orm.exc import NoResultFound
from search import clean_up_query, search_all, get_top_books, get_titles, get_authors, get_genres, get_ratings_avg, get_book_ids
from random import sample

import bcrypt

# -*- coding: utf-8 -*-


app = Flask(__name__)

# For Flask sessions and debug toolbar
app.secret_key = "TBD"


# Have Jinja raise an error if you use an undefined variable in the template.
app.jinja_env.undefined = StrictUndefined
app.jinja_env.auto_reload = True


@app.route("/search_suggestions.json")
def get_search_suggestions():
    """ Return search suggestions as JSON."""

    # Calls functions that query each table and returns a list.
    # Turns list into dictionary so we can turn it into json.
    search_suggestions = {'autocomplete': get_genres(get_authors(get_titles()))}

    return jsonify(search_suggestions)


@app.route('/')
def index():
    """ Load splash page """

    return render_template("splash.html")


@app.route('/home')
def load_home():
    """ Loads the home page. """

    return render_template("index.html")


@app.route('/search', methods=["GET"])
def search():
    """ Loads search results page. """

    q = request.args.get("q")

    if q != "":
        # cleans up the query and formats it
        clean_query = clean_up_query(q)
        # calls function that queries db.
        search_results = search_all(clean_query)
        return render_template("search.html", search_results=search_results , q=q)
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
        flash("You've already signed up!")
        return redirect("/login")

    except NoResultFound:

        new_user = User(name=name, email=email, password=bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(14)))
        db.session.add(new_user)
        db.session.commit()
        flash("You have been registered successfully!")  # Convert to JS messages
        return redirect("/home")


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
            return redirect("/home")
        else:
            flash("Your password does not match. Try again.")
            return redirect("/home")
        
    # If user does not exist it will throw a NoResultFound error
    except NoResultFound: 
        flash("Your email does not exist. Try again.")
        return redirect("/home")


@app.route('/logout')
def logout():
    """ Process logout request."""
    if 'user_id' in session:
        del session['user_id']
        flash("You have been logged out of your account. Goodbye! ")
        return redirect('/home')


@app.route('/book/<int:book_id>', methods=["GET"])
def book_details(book_id):
    # use book_id passed in from url to make sure it exists in our db

    try:
        book = Book.query.filter(Book.book_id == book_id).one()
        avg_rating = format(get_ratings_avg(book_id), '.2f')

        # check if user is logged in
        if 'user_id' in session:
            # if user is logged in, check if they have rated the book.

            user_rating = UserBook.query.filter_by(book_id=book_id, user_id=session['user_id']).first()
            # book = Book.query.get(book_id)
            user = User.query.get(session['user_id'])
            prediction = None

            all_books = get_book_ids()
            recommended_books = [] # list of book ids

            for book_id in all_books:
                each_book = Book.query.get(book_id)
                prediction = user.predict_rating(each_book)
                if prediction > 3.0:
                    recommended_books.append(each_book)

            shuffled_recs = sample(recommended_books, len(recommended_books))

            # If user has not rated the book, make a prediction. DO I NEED THIS STILL?!
            if user_rating is None:
                prediction = None
                # prediction = format(user.predict_rating(book), '.2f')
                shuffled_recs = None
        else:
            user_rating = None
            prediction = None
            shuffled_recs = None

        return render_template("book.html", book=book, avg_rating=avg_rating, user_rating=user_rating, prediction=prediction, shuffled_recs=shuffled_recs)

    except NoResultFound:
        flash("This book does not exist.")
        return redirect("/home")


@app.route('/author/<int:author_id>')
def author_details(author_id):
    # use author_id passed in from url to make sure it esxists in our db

    try:
        name = Author.query.filter(Author.author_id == author_id).one()
        return render_template("author.html", author=name)
    except NoResultFound:
        flash("This author does not exist.")
        return redirect("/home")


@app.route('/genre/<int:genre_id>')
def genre_details(genre_id):
    # user book_id passed in from url to make sure it esxists in our db

    try:
        genre_type = Genre.query.filter(Genre.genre_id == genre_id).one()
        return render_template("genre.html", genre_type=genre_type)
    except NoResultFound:
        flash("This genre does not exist.")
        return redirect("/home")


@app.route('/rating', methods=['POST'])
def process_rating():
    """ Process rating."""
    new_score = request.form.get("rating")
    user_id = session['user_id']
    book_id = request.form.get("book_id")

    try:
        rating = UserBook.query.filter(UserBook.book_id == book_id, UserBook.user_id == user_id).one()
        rating.rating = new_score
        db.session.commit()
        flash("Your rating has been updated successfully")

    except NoResultFound:
        new_review = UserBook(user_id=int(user_id), book_id=int(book_id), rating=int(new_score))
        db.session.add(new_review)
        db.session.commit()
        flash("Your rating has been added successfully!")

    return redirect("/book/" + book_id)


@app.route('/goodreads_oauth_callback')
def goodreads_oauth_callback():
    """ For goodreads Oauth."""

    return render_template("goodreads_oauth.html")

if __name__ == '__main__':
    # Enable Flask DebugToolbarExtension
    app.debug=True

    # Call function from model.py that connects database to Flask app 
    connect_db(app)

    # DebugToolbarExtension(app)
    
    # Configure http port used by app
    app.run(host="0.0.0.0", port=5000)