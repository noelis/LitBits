import numpy
from sklearn import model_selection
from sklearn.metrics import pairwise, mean_squared_error
from math import sqrt
import pandas

# from model import (connect_db, db, User, UserBook)

# SOURCE: http://online.cambridgecoding.com/notebooks/eWReNYcAfB/implementing-your-own-recommender-systems-in-python-2

def total_users():
    """ Find number of unique users with ratings in the UserBooks table."""

    total_users = int(db.session.query(db.func.count(db.distinct(UserBook.user_id))).one()[0])

    return total_users


def total_books():
    """ Find number of unique users with ratings in the UserBooks table."""

    total_books = int(db.session.query(db.func.count(db.distinct(UserBook.book_id))).one()[0])

    return total_books

def map_user_id(data):
    """ Maps user_id to a number between 0-246"""


    user_id_mapping = {}

    num = 0

    for user in data.itertuples():
        # Check user_id already exists in dictionary, if doesn't add it.
        if user.user_id not in user_id_mapping:
            user_id_mapping[user.user_id] = num
            num +=1

    return user_id_mapping

def map_book_id(data):
    """ Maps user_id to a number between 0-246"""


    book_id_mapping = {}

    num = 0

    for book in data.itertuples():
        # Check user_id already exists in dictionary, if doesn't add it.
        if book.book_id not in book_id_mapping:
            book_id_mapping[book.book_id] = num
            num +=1

    return book_id_mapping


def split_data():
    """ Split ratings data into training vs test data for algorithm"""

    # all_data is not unique number of users. It's all of the data that is in the UserBook table.
    all_data = data = pandas.read_sql_table('user_books', con='postgresql:///books', columns=['user_book_id', 'user_id', 'book_id', 'book_read', 'rating', 'updated_at'])


    train_data, test_data = model_selection.train_test_split(all_data, test_size=0.25)
    # Now training matrix contains 75% data and the testing matrix contains 25% data.
    #  Note train_data and test_data are both a list of objects.

    return train_data, test_data


def create_user_item_matrix(total_books, total_users, data):
    """Create a user-item matrices."""

    """ User-Item filtering will take a particular user, find users that are similar 
    to that user based on similarity of ratings, and recommend items that those similar 
    users liked."""

    #  Must call function twice to create one for training and another for testing data

    # NOTE: TOTAL_USERS and TOTAL_BOOKS is a unique number of users that has rated/books that were rated.

    data_matrix = numpy.zeros((total_users, total_books))

    matrix_user_position = map_user_id(data)

    matrix_book_position = map_book_id(data)

    for line in data.itertuples():
        data_matrix[matrix_user_position[line.user_id], matrix_book_position[line.book_id]] = line[5]

    return data_matrix


def find_cosine_similarity(train_data_matrix, type='user'):
    """Find cosine similarity for (training data) for both users and books. Output valie: 0 - 1."""
    # try it with a dfferent metric like euclidean.

    if type == 'user':
        similarity = pairwise.pairwise_distances(train_data_matrix, metric='cosine')
    else:
        similarity = pairwise.pairwise_distances(train_data_matrix.T, metric='cosine')

    return similarity





def rmse(prediction, ground_truth):
    """Evaluate accuracy of predicted ratings using Root Mean Squared Error (RMSE)."""
    # NOTE: what is ground truth?

    prediction = prediction[ground_truth.nonzero()].flatten() 
    ground_truth = ground_truth[ground_truth.nonzero()].flatten()

    return sqrt(mean_squared_error(prediction, ground_truth))

if __name__ == '__main__':

    total_books = total_books()
    total_users = total_users()
    train_data, test_data = split_data()
    training_matrix = create_user_item_matrix(total_books, total_users, train_data)
    test_matrix = create_user_item_matrix(total_books, total_users, test_data)

    item_similarity = find_cosine_similarity(training_matrix, type='item')
    user_similarity = find_cosine_similarity(training_matrix, type='user')

    item_predict = predict(training_matrix, item_similarity, type='item')
    user_predict = predict(training_matrix, user_similarity, type='user')

    # user_cf_rmse = rmse(user_prediction, test_data_matrix))
    # item_cf_rmse = rmse(item_prediction, test_data_matrix))
