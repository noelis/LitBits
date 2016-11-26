from server import app
import unittest
from model import connect_db


class IntegrationTest(unittest.TestCase):
    """ Test for Flask routes. """

    def setUp(self):
        # This runs before each of the tests in this class.
        # Requires you to set up testing client

        self.client = app.test_client()
        app.config['TESTING'] = True
        connect_db(app)

    def test_splash(self):
        """ Test '/' route in app (the splash page)"""

        # get the html returned from the '/' route
        rendered_home = self.client.get('/')
        self.assertIn("<p>Your favorite classics right at your finger tips.</p>", rendered_home.data)

    def test_home(self):
        """ Test /home route. """

        rendered_home = self.client.get('/home')
        self.assertIn("LitBits", rendered_home.data)

    def test_successful_login(self):
        """ Test /login route with test user. If successful should redirect to /home."""

        rendered_login = self.client.post('/login', data=dict(email="test@testing.com", password="testing123"), follow_redirects=True)
        self.assertIn("You are now logged in.", rendered_login.data)

    def test_unsuccessful_login(self):
        """ Test /login route with wrong password. It should redirect to /home and flash an error message."""

        rendered_login = self.client.post('/login', data=dict(email="test@testing.com", password="testing"), follow_redirects=True)
        self.assertIn("Your password does not match. Try again.", rendered_login.data)

    # def test_successful_registration(self):
    #     """ Test /register route with test user that already exists. If unsuccessful should redirect to /login."""

        # Requires new user info to test out each time. Commented out b/c tested it works and don't want to create a new user for each test ran.
    #     rendered_registration = self.client.post('/register', data=dict(name="New", email="test@supertest.com", password="testing123"), follow_redirects=True)
    #     print rendered_registration.data
    #     self.assertIn("You have been registered successfully!", rendered_registration.data)

    def test_book(self):
        """ Test book page"""

        rendered_book = self.client.get('/book/20')
        self.assertIn("Heart of Darkness", rendered_book.data)

    def test_author(self):
        """ Test author page"""

        rendered_author = self.client.get('/author/17')
        self.assertIn("Joseph Conrad", rendered_author.data)

    def test_genre(self):
        """ Test genre page"""

        rendered_author = self.client.get('/genre/1')
        self.assertIn("Fiction", rendered_author.data)



if __name__ == '__main__':

    # This runs all of or tests
    unittest.main()
