/*
Name: Andrew Brough
Date: February 16, 2018
Purpose: To create a database and table to store information about books.
*/

#Set the environment
SET SQL_MODE = 'STRICT_ALL_TABLES';
SET SQL_SAFE_UPDATES = 0;

# 1) drop the existing database, create it and use it
DROP DATABASE IF EXISTS db_books;
CREATE DATABASE db_books;
USE db_books;

# 2) drop the table, if it exists
DROP TABLE IF EXISTS tbl_books;

#Create a table
CREATE TABLE tbl_books (
	title_id 		CHAR(6) NOT NULL,
    book_title 		VARCHAR(80) NOT NULL,
    book_type 		VARCHAR(20) NOT NULL,
    publisher_id 	CHAR(4) NOT NULL,
    book_price 		DECIMAL(5,2) UNSIGNED NOT NULL DEFAULT 0,
    ytd_sales 		INTEGER UNSIGNED NOT NULL DEFAULT 0,
    publisher_date	DATE
);

# 3) Display the description of the table
DESC tbl_books;

# 4) Insert records into the table
INSERT INTO tbl_books
VALUES
('PC8888', 'Secrets of Silicon Valley', 'popular_comp', '1389', 40.00,  4095, '1998-06-12'),
('BU1032', 'The Busy Executive\'s Database Guide', 'business', '1389', 29.99, 4000,'1999-06-10'),
('PS7777', 'Emotional Security: A New Algorithm', 'psycho', '0736', 17.99,  3336,'1998-12-10'),
('PS3333', 'Prolonged Data Deprivation: Four Case Studies', 'psycho', '0736', 29.99, 407, '2000-12-31'),
('BU1111', 'Cooking with Computers: Surreptitious Balance Sheets', 'business', '1389', 21.95, 3876, '1999-02-10'),
('MC2222', 'Silicon Valley Gastronomic Treats', 'mod_cook', '0877', 29.99,  203, '1998-06-09'),
('TC7777', 'Sushi, Anyone?', 'trad_cook', '0877', 29.99,  4095,'2002-05-31'),
('TC4203', 'Fifty Years in Buckingham Palace Kitchens', 'trad_cook', '0877', 21.95,  15096,'2008-02-12'),
('PC1035', 'But Is It User Friendly?', 'popular_comp', '1389', 42.95,  8780,'1998-06-30'),
('BU2075', 'You Can Combat Computer Stress!', 'business', '0736', 12.99, 18722, '2000-11-19'),
('PS2091', 'Is Anger the Enemy?', 'psycho', '0736', 21.95,  2045, '1998-06-15'),
('PS2106', 'Life Without Fear', 'psycho', '0736', 17.00, 111, '2003-10-05'),
('MC3021', 'The Gourmet Microwave', 'mod_cook', '0877', 12.99, 22246,'2005-06-18'),
('TC3218', 'Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean', 'trad_cook', '0877', 40.95,  375, '1998-10-21'),
('BU7832', 'Straight Talk About Computers', 'business', '1389', 29.99, 4095, '2004-07-22'),
('PC9999', 'Net Etiquette', 'popular_comp', '1389', 59.99, 2011,'2002-10-26');

INSERT INTO tbl_books (title_id, book_title, book_type, publisher_id)
VALUES
('PS1372', 'Computer Phobic and Non-Phobic Individuals: Behavior Variations', 'psycho', '0736'), 
('PC1234','Intro to Java','popular_comp', '1111');

# 5) Display all the records of the table
SELECT * FROM tbl_books;

# 6) Set title_id as the primary key
ALTER TABLE tbl_books
MODIFY title_id CHAR(6) PRIMARY KEY,

# 7) Add a new field/column called short_description
ADD COLUMN short_description VARCHAR(100) AFTER book_title;

# 8) Display the description of the table
DESC tbl_books;

# 9) The book title, type and publishing date of all the books published in the 20th century (Jan 01, 1900 to Dec 31, 1999). 
SELECT book_title, book_type, publisher_date FROM tbl_books
WHERE publisher_date >=CAST('1900-01-01' AS DATE) AND publisher_date <= CAST('1999-12-31' AS DATE);

# 10) A list of all computer and business books. 
SELECT * FROM tbl_books
WHERE title_id LIKE 'PC%' OR title_id LIKE 'BU%';

# 11) List all books with either of 0736, 0877, 1111 as the publisher id.
SELECT * FROM tbl_books
WHERE publisher_id IN ('0736', '0877', '1111');

# 12) The book title and  publisher id of all the books whose publisher date is undefined.
SELECT book_title AS 'Book Title', publisher_id AS 'Publisher Id' FROM tbl_books
WHERE publisher_date IS NULL;

# 13) Update the ytd_sales to 5 for books that currently have a ytd_sales of 0.
UPDATE tbl_books
SET ytd_sales = 5
WHERE ytd_sales = 0;

# 14) Using a single update statement set the short_description field
UPDATE tbl_books
SET short_description = CASE
WHEN book_type = 'popular_comp' THEN 'Computing is fun'
WHEN book_type = 'business' THEN 'Be a smart business person'
WHEN book_type = 'psycho' THEN 'De-stress yourself'
WHEN book_type = 'mod_cook' THEN 'Modern Cooking is quick'
WHEN book_type = 'trad_cook' THEN 'Traditional cooking takes time'
END;

# 15) Display all the records of the table
SELECT * FROM tbl_books;

# 16) Delete the records for all the books published in 1999
DELETE FROM tbl_books
WHERE YEAR(publisher_date) = 1999;

# 17) Display all the records of the table
SELECT * FROM tbl_books;

