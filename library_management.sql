Create DATABASE LibraryManagement;
USE LibraryManagement;

create table Books(
   BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    Category VARCHAR(100),
    PublicationYear INT,
    Status ENUM('Available', 'Borrowed', 'Reserved') DEFAULT 'Available'

);

create table Members(
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    Address TEXT,
    MembershipDate DATE DEFAULT CURDATE()
);



create table Librarians(
    LibrarianId int AUTO_INCREMENT PRIMARY KEY,
    Name varchar(255) not null,
    Email varchar(100) unique not null,
    Phone varchar(15) unique not null.
    Password varchar(255) not null
)


Create table Borrow(
    BorrowID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    BorrowDate DATE DEFAULT CURDATE(),
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FineAmount DECIMAL(5,2) DEFAULT 0,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID) ON DELETE CASCADE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE
);

CREATE TABLE Fines (
    FineID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    BorrowID INT,
    FineAmount DECIMAL(5,2) NOT NULL,
    Status ENUM('Pending', 'Paid') DEFAULT 'Pending',
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID) ON DELETE CASCADE,
    FOREIGN KEY (BorrowID) REFERENCES Borrow(BorrowID) ON DELETE CASCADE
);

CREATE TABLE Reservations (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    ReservationDate DATE DEFAULT CURDATE(),
    Status ENUM('Active', 'Completed', 'Cancelled') DEFAULT 'Active',
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID) ON DELETE CASCADE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE
);

INSERT INTO Books (Title, Author, ISBN, Category, PublicationYear, Status)
VALUES 
('The Great Gatsby', 'F. Scott Fitzgerald', '9780743273565', 'Fiction', 1925, 'Available'),
('1984', 'George Orwell', '9780451524935', 'Dystopian', 1949, 'Available'),
('To Kill a Mockingbird', 'Harper Lee', '9780061120084', 'Classic', 1960, 'Available');

INSERT INTO Members (Name, Email, Phone, Address)
VALUES 
('John Doe', 'johndoe@email.com', '9876543210', '123 Main St'),
('Alice Smith', 'alicesmith@email.com', '8765432109', '456 Elm St');

INSERT INTO Librarians (Name, Email, Phone, Password)
VALUES 
('Emma Watson', 'emma.librarian@email.com', '7654321098', 'securepassword');

-- Borrow a Book
INSERT INTO Borrow (MemberID, BookID, DueDate) VALUES (1, 1, DATE_ADD(CURDATE(), INTERVAL 14 DAY));

-- Reserve a Book
INSERT INTO Reservations (MemberID, BookID) VALUES (2, 2);

-- Fine Entry
INSERT INTO Fines (MemberID, BorrowID, FineAmount) VALUES (1, 1, 5.00);

-- Retrieve Borrowed Books
SELECT B.Title, M.Name, Br.BorrowDate, Br.DueDate 
FROM Borrow Br
JOIN Books B ON Br.BookID = B.BookID
JOIN Members M ON Br.MemberID = M.MemberID
WHERE Br.ReturnDate IS NULL;

-- Check Active Reservations
SELECT R.ReservationID, M.Name, B.Title, R.ReservationDate, R.Status 
FROM Reservations R
JOIN Members M ON R.MemberID = M.MemberID
JOIN Books B ON R.BookID = B.BookID
WHERE R.Status = 'Active';