-- 1. Create the database
CREATE DATABASE IF NOT EXISTS StudentManagementSystem;
USE StudentManagementSystem;

-- 2. Create Students table
CREATE TABLE IF NOT EXISTS Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    gender VARCHAR(10),
    date_of_birth DATE,
    email VARCHAR(100),
    phone VARCHAR(15)
);

-- 3. Create Courses table
CREATE TABLE IF NOT EXISTS Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    course_description TEXT
);

-- 4. Create Enrollments table (Many-to-Many relationship)
CREATE TABLE IF NOT EXISTS Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- 5. Insert sample data into Students table
INSERT INTO Students (name, gender, date_of_birth, email, phone) VALUES
('Amit Kumar', 'Male', '2002-05-14', 'amit@example.com', '9876543210'),
('Priya Sharma', 'Female', '2001-08-20', 'priya@example.com', '9876512345'),
('Rahul Verma', 'Male', '2003-03-10', 'rahul@example.com', '9876509876');

-- 6. Insert sample data into Courses table
INSERT INTO Courses (course_name, course_description) VALUES
('Mathematics', 'Basic and Advanced Math'),
('Computer Science', 'Programming and Data Structures'),
('Physics', 'Mechanics and Thermodynamics');

-- 7. Insert sample data into Enrollments table
INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2024-01-10'),
(1, 2, '2024-01-15'),
(2, 2, '2024-02-01'),
(3, 3, '2024-02-10'),
(2, 1, '2024-03-01');

-- 8. Example query: Get all students with their enrolled courses
SELECT 
    s.name AS student_name,
    c.course_name,
    e.enrollment_date
FROM 
    Enrollments e
JOIN 
    Students s ON e.student_id = s.student_id
JOIN 
    Courses c ON e.course_id = c.course_id;
