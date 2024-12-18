CREATE DATABASE library;
USE library;

CREATE TABLE fact_borrowings (
    borrow_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    date_id INT,
    borrow_duration INT
);

CREATE TABLE dim_book (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(100),
    genre VARCHAR(50)
);

CREATE TABLE dim_member (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(50),
    membership_level VARCHAR(50)
);

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    date DATE,
    year INT,
    month INT
);

CREATE TABLE dim_genre (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(50)
);

ALTER TABLE dim_book
ADD COLUMN genre_id INT;

ALTER TABLE dim_book
ADD CONSTRAINT fk_genre
FOREIGN KEY (genre_id) REFERENCES
dim_genre(genre_id);

INSERT INTO fact_borrowings (borrow_id, book_id, member_id, date_id, borrow_duration)
VALUES
(1, 301, 401, 501, 14),
(2, 302, 402, 502, 7),
(3, 303, 403, 503, 21);

INSERT INTO dim_genre (genre_id, genre_name) VALUES
(1, 'Fiction'),
(2, 'Non-Fiction'),
(3, 'Science Fiction');

INSERT INTO dim_book (book_id, book_title, genre_id) 
VALUES
(301, 'To Kill a Mockingbird', 1),
(302, 'Sapiens: A Brief History of Humankind', 2),
(303, 'Dune', 3);

INSERT INTO dim_member (member_id, member_name, membership_level) VALUES
(401, 'Emily Davis', 'Gold'),
(402, 'Michael Brown', 'Silver'),
(403, 'Sophia Lee', 'Bronze');

INSERT INTO dim_date (date_id, date, year, month) VALUES
(501, '2024-11-01', 2024, 11),
(502, '2024-11-02', 2024, 11),
(503, '2024-11-03', 2024, 11);
