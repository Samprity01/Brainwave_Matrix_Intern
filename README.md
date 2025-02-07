📌 Library Management System - Database Design & Implementation Report
Internship Title: Database Management Intern
Project Title: Design and Implementation of a Relational Database for a Library Management System
Report Submission Date: 08.02.2025

1. Introduction
1.1 Project Goal
The goal of this project is to design and implement a relational database system for managing a library efficiently. This system will store and manage information related to books, members, book loans, returns, and fines.

1.2 Scope of the Project
The Library Management System (LMS) database will support the following functionalities:

Book Management: Store details like title, author, category, and availability status.
Member Management: Maintain member records, including contact details and membership information.
Borrowing & Returning Books: Track book transactions, due dates, and return status.
Fine Calculation: Automatically calculate overdue fines for late returns.


1.3 Importance
Eliminates manual record-keeping errors.
Enhances retrieval efficiency using structured queries.
Ensures data integrity and security.
Facilitates scalability for future expansions.


2. Database Design
2.1 Entity-Relationship (ER) Diagram
(Attach an ER diagram using MySQL Workbench, Lucidchart, or any other tool.)

2.2 Schema Design & Relationships
Entity	Attributes	Primary Key (PK) / Foreign Key (FK)
Books	BookID, Title, Author, ISBN, Category, Status	PK: BookID
Members	MemberID, Name, Email, Phone, MembershipDate	PK: MemberID
Borrow	BorrowID, MemberID, BookID, BorrowDate, DueDate, ReturnDate, FineAmount	PK: BorrowID, FK: MemberID, FK: BookID


2.3 Normalization Process
1NF (First Normal Form): Ensures atomicity; all attributes contain single values.
2NF (Second Normal Form): Eliminates partial dependency; each non-key attribute is fully dependent on the primary key.
3NF (Third Normal Form): Removes transitive dependency; non-key attributes depend only on the primary key.





🔹 Database & SQL Skills:
MySQL Database Management – Creating, updating, and managing databases.
SQL Queries – Writing queries for CRUD operations (Create, Read, Update, Delete).
Joins & Relationships – Understanding foreign keys, primary keys, and table relationships.
Stored Procedures & Triggers – Automating tasks in MySQL.
Database Normalization – Optimizing the database structure.

🔹 Version Control & Deployment:
Git & GitHub – Pushing code to a GitHub repository, managing branches.
Git Bash / CLI – Running Git commands for commits and pushes.

🔹 Development Tools:
VS Code – Writing and running SQL code inside VS Code.
SQLTools Extension – Connecting and managing the MySQL database in VS Code.


🔹 Debugging & Troubleshooting:
Database Connectivity Issues – Fixing authentication errors, setting up the correct MySQL driver.
