from rauth.service import OAuth1Service, OAuth1Session
from os import environ

def get_goodreads_access_token():
    """ Gets access token and access token secret."""

    # Gets the key, secret from shell enviroment.
    app_key = environ["KEY"]
    app_secret = environ["SECRET"]

    # Creates the goodreads object to generate access token.
    goodreads = OAuth1Service(
        consumer_key=app_key,
        consumer_secret=app_secret,
        name='goodreads',
        request_token_url='http://www.goodreads.com/oauth/request_token',
        authorize_url='http://www.goodreads.com/oauth/authorize',
        access_token_url='http://www.goodreads.com/oauth/access_token',
        base_url='http://www.goodreads.com/'
        )

    request_token, request_token_secret = goodreads.get_request_token(header_auth=True)
    authorize_url = goodreads.get_authorize_url(request_token)

    print 'Visit this URL in your browser: ' + authorize_url
    accepted = 'n'
    while accepted.lower() != 'y':
        # you need to access the authorize_link via a browser,
        # and manually authorize your app to access your account.
        accepted = raw_input('Have you authorized me? (y/n) ')

    session = goodreads.get_auth_session(request_token, request_token_secret)

    ACCESS_TOKEN = session.access_token
    ACCESS_TOKEN_SECRET = session.access_token_secret


def initialize_goodreads_session():
    """ Creates goodreads session with access token/secret."""

    # Gets the key, secret, access token, access token secret from shell enviroment.
    app_key = environ["KEY"]
    app_secret = environ["SECRET"]
    access_token = environ['ACCESS_TOKEN']
    access_token_secret = environ['ACCESS_TOKEN_SECRET']

    # Creates the session object.
    session = OAuth1Session(
            consumer_key=app_key,
            consumer_secret=app_secret,
            access_token=access_token,
            access_token_secret=access_token_secret)

    return session

    # Test adding a book to your 'to-read' shelf. Book_id 631932 for "The Greedy Python"
    # data = {'name': 'to-read', 'book_id': 631932}

    # # Now use the API endpoint to add the book to your own "to-read" shelf
    # response = session.post('http://www.goodreads.com/shelf/add_to_shelf.xml', data)
