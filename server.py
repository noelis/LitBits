from jinja2 import StrictUndefined
from flask import (Flask, render_template, redirect, request, flash, session)
from flask_debugtoolbar import DebugToolbarExtension
from model import (connect_db, db, Book, Genre, Author, User, UserBook, BookGenre, BookAuthor)
from sqlalchemy.orm.exc import NoResultFound
from search import clean_up_query, search_bar


app = Flask(__name__)

# For Flask sessions and debug toolbar
app.secret_key = "TBD"


# Have Jinja raise an error if you use an undefined variable in the template.
app.jinja_env.undefined = StrictUndefined
app.jinja_env.auto_reload = True


@app.route('/')
def index():
    """ Home """

    return render_template("index.html")

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


# @app.route('/register', methods=["GET"])
# def register_form():
#     """ Show the registration form."""

#     return render_template("register_form.html")

@app.route('/register', methods=["POST"])
def process_registration():
    """ Get user info from form and add them to db."""

    username = request.form.get("username")
    email = request.form.get("email")
    password = request.form.get("password")

    check_user_in_db_query = User.query.filter(User.email == email)

    try:

        check_user_in_db_query.one()
        flash("You've already signed up!") # Convert to JS messages
        return redirect("/login")

    except NoResultFound: 

        new_user = User(username=username, email=user_name, password=password)  
        db.session.add(new_user)
        db.session.commit()
        flash("You have been registered successfully!") # Convert to JS messages
        return redirect("/")

@app.route('/login', methods=["GET"])
def login_page():
    """ Display login page. """

    return render_template("login_form.html")

@app.route('/login', methods=["POST"])
def process_login():
    """ Process login. """
    pass

@app.route('/logout')
def logout():
    """ Process logout request."""
    pass

@app.route('/book_details/<int:book_id>')
def book_details(book_id):
    pass


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

