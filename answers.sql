-- Create the library database
CREATE DATABASE IF NOT EXISTS library;
USE library;

-- Drop tables in reverse dependency order
DROP TABLE IF EXISTS Loans;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Members;
DROP TABLE IF EXISTS Librarians;
DROP TABLE IF EXISTS Publishers;

-- Create Authors table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    bio TEXT
);

-- Create Categories table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Create Publishers table
CREATE TABLE Publishers (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255)
);

-- Create Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT NOT NULL,
    category_id INT NOT NULL,
    publisher_id INT NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    year_published YEAR,
    copies_available INT DEFAULT 1,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id)
);

-- Create Members table
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    join_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create Librarians table
CREATE TABLE Librarians (
    librarian_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

-- Create Loans table
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    librarian_id INT NOT NULL,
    issue_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (librarian_id) REFERENCES Librarians(librarian_id)
);

-- Insert sample Authors
INSERT INTO Authors (name, bio)
VALUES 
('Ngũgĩ wa Thiong\'o', 'Renowned Kenyan writer and academic.'),
('Chinua Achebe', 'Author of "Things Fall Apart".'),
('Margaret Atwood', 'Canadian poet, novelist, literary critic.');

-- Insert sample Categories
INSERT INTO Categories (name)
VALUES 
('Fiction'),
('Non-Fiction'),
('Biography'),
('Science');

-- Insert sample Publishers
INSERT INTO Publishers (name, address)
VALUES 
('East African Publishers', 'Nairobi, Kenya'),
('Heinemann', 'London, UK'),
('Penguin Books', 'New York, USA');

-- Insert sample Books
INSERT INTO Books (title, author_id, category_id, publisher_id, isbn, year_published, copies_available)
VALUES 
('The River Between', 1, 1, 1, '9789966462103', 1965, 4),
('Things Fall Apart', 2, 1, 2, '9780435905255', 1958, 3),
('The Handmaid\'s Tale', 3, 1, 3, '9780385490818', 1985, 2);

-- Insert sample Members
INSERT INTO Members (name, email, phone)
VALUES 
('Alice Wanjiku', 'alice@example.com', '0711000001'),
('Brian Otieno', 'brian@example.com', '0722000002'),
('Cynthia Mwangi', 'cynthia@example.com', '0733000003');

-- Insert sample Librarians
INSERT INTO Librarians (name, email, phone)
VALUES 
('Daniel Kariuki', 'daniel@library.com', '0744000004'),
('Grace Njeri', 'grace@library.com', '0755000005');

-- Insert sample Loans
INSERT INTO Loans (book_id, member_id, librarian_id, issue_date, due_date)
VALUES 
(1, 1, 1, '2025-05-06', '2025-05-20'),
(2, 2, 2, '2025-05-04', '2025-05-18');

-- Display contents of Authors table
SELECT * FROM Authors;

-- Display contents of Categories table
SELECT * FROM Categories;

-- Display contents of Publishers table
SELECT * FROM Publishers;

-- Display contents of Books table
SELECT * FROM Books;

-- Display contents of Members table
SELECT * FROM Members;

-- Display contents of Librarians table
SELECT * FROM Librarians;

-- Display contents of Loans table
SELECT * FROM Loans;
