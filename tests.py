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

        # app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False


    def test_home(self):
        """ Test '/' route in app."""

        # get the html returned from the '/' route 
        rendered_home = self.client.get('/')
        self.assertIn("<h1>Use Bootstrap's carousel to show multiple items per slide.</h1>", rendered_home.data)


    def test_login(self):
        rendered_login = self.client.post('/login', data=dict(email="test@testing.com", password="testing123"), follow_redirects=True)

        self.assertIn("<h1>Use Bootstrap's carousel to show multiple items per slide.</h1>", rendered_login.data)

if __name__ == '__main__':

    # This runs all of or tests
    unittest.main()