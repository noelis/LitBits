from sqlalchemy import func
from server import app
from datetime import datetime

from model import (connect_db, db, Book, Genre, Author, User, UserBook, BookGenre, BookAuthor)

import xmltodict
import requests




def get_book_titles():
    """Get title, year published and mini-summary from API into a dictionary. """

    print "Loading books.."

    # Delete all rows in the table (in case there were any previous existing rows).
    # This makes sure we're not adding duplicates.
    Book.query.delete()

    #Response object from API
    response = requests.get('http://www.feedbooks.com/books/top.atom')

    # Turn response.content (string) into dictionary
    metadata = xmltodict.parse(response.content)

    books = metadata['feed']['entry']

    # List of book 'entry' objects from nested dictionary.
    # Each book object is a dictionary.
    books = metadata['feed']['entry']

    for book in books:
        title = book['title']
        release_year = book['dcterms:issued']
        summary = book['summary'].encode("utf-8")
        download_url = book['link'][1]['@href']
        book_cover = book['link'][4]['@href']

        # Creates an instance of the Book class
        book = Book(title=title, 
                    release_year=release_year, 
                    url=download_url,
                    book_cover=book_cover,
                    mini_summary=summary)

        # Adds book to the session.
        db.session.add(book)

        # Commits book so it gets added to the table.
        db.session.commit()

        # Grab links by index
        # Get epub string link[1][1][1]
        # Get book image url
        # commit book

        # Check if book['author'] is a dictionary object
        if isinstance(book['author'], dict):
            author_name = book['author']['name'].encode('utf-8')

            # Creates an instance of the Author class
            author = Author(name=author_name)

            # Adds author to the session & commits it so it gets added to the table
            db.session.add(author)
            db.session.commit()

            # Query the Book/Author tables by title/name to find the book_id & author_id
            get_book = Book.query.filter(Book.title == title).one()  # Returns a book object
            get_author = Author.query.filter(Author.name == author_name).one() # Returns an author object

            # Creates BookAuthor instance to add/commit to BookAuthor association table.
            book_author_link = BookAuthor(book_id=get_book.book_id, 
                                            author_id=get_author.author_id)
            db.session.add(book_author_link)
            db.session.commit()
        else:
            book_authors = book['author'] # List of dictionaries
            for author in book_authors:
                author_name = author['name'].encode('utf-8') # Grabs author from dict obj

                author_pair = Author(name=author_name)
                
                db.session.add(author_pair)
                db.session.commit()
                
                get_book = Book.query.filter(Book.title == title).one() 
                get_authors = Author.query.filter(Author.name == author_name).one()

                book_author_link = BookAuthor(book_id=get_book.book_id, 
                                            author_id=get_author.author_id)
                db.session.add(book_author_link)
                db.session.commit()

# --------------------------
        # Check type for author
            # If string add to author table
            # commit author 
            # add author and book to author/book table

            # else loop over authors, add each to author table
                # commit author 
                # Add athor and book to author/book table


# def get_authors(book_info):

#     author_names = []

#     for book in books:
#         if isinstance(book['author'], dict):
#             print book['author']['name']
#             book_info[book['title']] = book_info.get(book['title']) + tuple(book['author']['name'])
            
#         else: 
#             pass

#         book_authors = book['author']  # list of dictionaries
#         for author in book_authors:

#             book_info[book['title']] = book_info.get(book['title']) + (author['name'])
#             author_names.append(book['author']['name'])

# def genres():

#     book_genres = {}
#     genres = []  

#     for book in books:
#         # Inside the category key is a list of dictionaries.
#         # Each dictionary contains 1 genre for that book title
#         book_genres['title'] = ()
#         genre_info = book['category'] 
#         for genre_label in genre_info:
#             book_info[]
#             book_genres['title'] = book_genres.get('title'], genre_label['@label'])

#     for book in books:
#         # itprinerate through book dictionary using keywords!
#         book_info = ['title', 'id', 'author['name']', 'dcterms:issued', 'summary',  
#         for info in book_info:
#             book.get(info, None)

# def load_books():
#     """ Get books and their metadata from feedbooks API"""

#     #Response object from API
#     response = requests.get('http://www.feedbooks.com/books/top.atom')

#     # Turn response.content (string) into dictionary
#     metadata = xmltodict.parse(response.content)

#     # List of book 'entry' objects from nested dictionary.
#     # Each book object is a dictionary.
#     books = metadata['feed']['entry']

#     for book in books:
#         # itprinerate through book dictionary using keywords!
#         book_info = ['title', 'id', 'author['name']', 'dcterms:issued', 'summary',  
#         for info in book_info:
#             book.get(info, None)

    # soup = BeautifulSoup(response.text, 'html.parser')

    # for entry in soup.find_all('entry'):
    #     metadata = entry.contents
    #     unicode_to_strip = "u'\n'"
    #     metadata[:] = (unicode_to_strip for unicode_to_strip in metadata if unicode_to_strip != "u'\n'")
    #     return metadata

