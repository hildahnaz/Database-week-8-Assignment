# Database-week-8-Assignment
Library management system
# 📚 Library Management System (MySQL)

This project is a relational database for managing a library's catalog, members, staff, and lending activity. It includes tables for books, authors, publishers, categories, members, librarians, and loans.

---

## 🧾 Description

The **Library Management System** allows you to:

- Store information about books, their authors, categories, and publishers.
- Manage library members and librarians.
- Track book loans including issue dates, due dates, and return dates.

It’s designed using **MySQL** and includes foreign key constraints to ensure data integrity across relationships.

---

## 🛠️ Technologies Used

- MySQL (or MariaDB)
- SQL DDL/DML

---

## 📁 Database Schema Overview

- `Authors` – stores author details.
- `Categories` – book genres/types.
- `Publishers` – publishing company details.
- `Books` – the main catalog of books.
- `Members` – library users.
- `Librarians` – staff responsible for issuing books.
- `Loans` – tracks book checkouts and returns.

---

## ⚙️ How to Set Up the Project

### 🧩 Prerequisites

- MySQL Server installed (e.g., via XAMPP, WAMP, or MySQL Workbench)
- MySQL client or database GUI (e.g., phpMyAdmin, DBeaver, MySQL Workbench)

---

### 🚀 Steps to Run

1. Open your MySQL client or GUI.
2. Copy and paste the contents of the `library.sql` file into a new query tab.
3. Execute the script.

The script will:

- Create the `library` database.
- Create all required tables with foreign key relationships.
- Insert sample data.
- Display contents of all tables for verification.

---

## 📊 Sample Queries

You can use the following queries to interact with the data:

```sql
-- View all books with author and category
SELECT B.title, A.name AS author, C.name AS category
FROM Books B
JOIN Authors A ON B.author_id = A.author_id
JOIN Categories C ON B.category_id = C.category_id;

-- View all current loans
SELECT L.loan_id, M.name AS member, B.title AS book, L.issue_date, L.due_date
FROM Loans L
JOIN Members M ON L.member_id = M.member_id
JOIN Books B ON L.book_id = B.book_id;
