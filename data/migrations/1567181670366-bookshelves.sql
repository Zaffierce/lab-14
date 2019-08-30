CREATE DATABASE lab14_normal WITH TEMPLATE lab14;
--This creates a second database based off of the original

CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));
--now we're creating a new bookshelves table

INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;
--now we're inserting in the bookshelves(name) from our original
--and only selecting the unique values from books

ALTER TABLE books ADD COLUMN bookshelf_id INT;
--now we're adding a new column called bookshelf_id and setting the data type to INT

UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;
--sets the bookshelf_id in books to match the id from bookshelves 

ALTER TABLE books DROP COLUMN bookshelf;
--drops the column bookshelf from books

ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);
--sets the foreign key in books to bookshelf_id, allowing things to be able to linked together

