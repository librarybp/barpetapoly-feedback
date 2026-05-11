-- Barpeta Polytechnic Feedback System Database Schema

CREATE DATABASE IF NOT EXISTS barpeta_feedback_db;
USE barpeta_feedback_db;

-- Subjects Table
CREATE TABLE subjects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    subject_code VARCHAR(50) UNIQUE NOT NULL,
    subject_name VARCHAR(255) NOT NULL,
    department VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Teachers Table
CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_name VARCHAR(255) NOT NULL,
    subject_id INT NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(15),
    department VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (subject_id) REFERENCES subjects(id) ON DELETE CASCADE
);

-- Students Table
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    enrollment_no VARCHAR(50) UNIQUE NOT NULL,
    student_name VARCHAR(255) NOT NULL,
    department VARCHAR(100) NOT NULL,
    semester INT,
    password_hash VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Admin Users Table
CREATE TABLE admin_users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Faculty Users Table
CREATE TABLE faculty_users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_id INT NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (teacher_id) REFERENCES teachers(id) ON DELETE CASCADE
);

-- Feedback Questions Table
CREATE TABLE feedback_questions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    question_text TEXT NOT NULL,
    question_type ENUM('rating', 'text', 'multiple') DEFAULT 'rating',
    question_order INT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Feedbacks Table (Main feedback submissions)
CREATE TABLE feedbacks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    teacher_id INT NOT NULL,
    subject_id INT NOT NULL,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    average_rating DECIMAL(3, 2),
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (teacher_id) REFERENCES teachers(id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(id) ON DELETE CASCADE,
    UNIQUE KEY unique_feedback (student_id, teacher_id, subject_id)
);

-- Feedback Answers Table (Individual question responses)
CREATE TABLE feedback_answers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    feedback_id INT NOT NULL,
    question_id INT NOT NULL,
    answer_value VARCHAR(500),
    rating_value INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (feedback_id) REFERENCES feedbacks(id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES feedback_questions(id) ON DELETE CASCADE
);

-- Create indexes for better performance
CREATE INDEX idx_feedback_student ON feedbacks(student_id);
CREATE INDEX idx_feedback_teacher ON feedbacks(teacher_id);
CREATE INDEX idx_feedback_subject ON feedbacks(subject_id);
CREATE INDEX idx_feedback_date ON feedbacks(submitted_at);
CREATE INDEX idx_teacher_subject ON teachers(subject_id);

-- Insert sample data

INSERT INTO subjects (subject_code, subject_name, department) VALUES
('CS101', 'Data Structures', 'Computer Science'),
('CS102', 'Database Systems', 'Computer Science'),
('EC101', 'Digital Electronics', 'Electronics & Communication'),
('ME101', 'Mechanics', 'Mechanical Engineering');

INSERT INTO teachers (teacher_name, subject_id, email, phone, department) VALUES
('Dr. Rajesh Kumar', 1, 'rajesh@barpetapoly.edu', '9876543210', 'Computer Science'),
('Prof. Priya Singh', 2, 'priya@barpetapoly.edu', '9876543211', 'Computer Science'),
('Dr. Amit Sharma', 3, 'amit@barpetapoly.edu', '9876543212', 'Electronics & Communication'),
('Prof. Vikram Patel', 4, 'vikram@barpetapoly.edu', '9876543213', 'Mechanical Engineering');

INSERT INTO students (enrollment_no, student_name, department, semester) VALUES
('BP001', 'Aman Singh', 'Computer Science', 3),
('BP002', 'Priya Sharma', 'Computer Science', 3),
('BP003', 'Rohit Kumar', 'Electronics & Communication', 3),
('BP004', 'Anjali Verma', 'Mechanical Engineering', 3);

INSERT INTO admin_users (username, password_hash, email) VALUES
('admin', MD5('admin123'), 'admin@barpetapoly.edu');

INSERT INTO faculty_users (teacher_id, email, password_hash) VALUES
(1, 'rajesh@barpetapoly.edu', MD5('faculty123')),
(2, 'priya@barpetapoly.edu', MD5('faculty123')),
(3, 'amit@barpetapoly.edu', MD5('faculty123')),
(4, 'vikram@barpetapoly.edu', MD5('faculty123'));

INSERT INTO feedback_questions (question_text, question_type, question_order, is_active) VALUES
('How would you rate the overall teaching quality?', 'rating', 1, TRUE),
('Was the course content covered adequately?', 'rating', 2, TRUE),
('Provide suggestions for improvement', 'text', 3, TRUE),
('How would you rate the classroom management?', 'rating', 4, TRUE),
('Would you recommend this teacher for other courses?', 'multiple', 5, TRUE);