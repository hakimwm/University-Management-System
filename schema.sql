-- =============================================
-- UNIVERSITY ORDBMS SCHEMA
-- PostgreSQL ORDBMS Assignment
-- =============================================

-- 1. CREATE CUSTOM TYPES (ORDBMS Feature)
CREATE TYPE address_type AS (
    street     TEXT,
    city       TEXT,
    region     TEXT,
    country    TEXT
);

CREATE TYPE contact_info_type AS (
    email      TEXT,
    phone      TEXT
);

-- 2. CREATE TABLES

CREATE TABLE departments (
    dept_id     SERIAL PRIMARY KEY,
    dept_name   TEXT NOT NULL,
    location    address_type        -- composite type used here
);

CREATE TABLE students (
    student_id  SERIAL PRIMARY KEY,
    full_name   TEXT NOT NULL,
    dob         DATE,
    address     address_type,       -- ORDBMS: composite type
    contact     contact_info_type,  -- ORDBMS: composite type
    courses     TEXT[],             -- ORDBMS: array type
    dept_id     INT REFERENCES departments(dept_id)
);

CREATE TABLE courses (
    course_id   SERIAL PRIMARY KEY,
    course_name TEXT NOT NULL,
    credits     INT,
    dept_id     INT REFERENCES departments(dept_id)
);

CREATE TABLE enrollments (
    enrollment_id  SERIAL PRIMARY KEY,
    student_id     INT REFERENCES students(student_id),
    course_id      INT REFERENCES courses(course_id),
    grade          TEXT,
    enrolled_on    DATE DEFAULT CURRENT_DATE
);

-- 3. INSERT SAMPLE DATA

INSERT INTO departments (dept_name, location) VALUES
('Computer Science', ROW('Main Campus', 'Navrongo', 'Upper East', 'Ghana')),
('Mathematics',      ROW('Block B', 'Navrongo', 'Upper East', 'Ghana'));

INSERT INTO students (full_name, dob, address, contact, courses, dept_id) VALUES
('Ama Owusu',   '2004-03-12',
 ROW('House 12', 'Navrongo', 'Upper East', 'Ghana'),
 ROW('ama@email.com', '0241234567'),
 ARRAY['CSC 206', 'CSC 208', 'MTH 202'], 1),

('Kofi Mensah', '2003-07-21',
 ROW('House 5', 'Kumasi', 'Ashanti', 'Ghana'),
 ROW('kofi@email.com', '0557654321'),
 ARRAY['CSC 204', 'MTH 214', 'CDS 204'], 1),

('Abena Asante', '2004-11-05',
 ROW('House 9', 'Accra', 'Greater Accra', 'Ghana'),
 ROW('abena@email.com', '0201122334'),
 ARRAY['MTH 202', 'MTH 214'], 2);

INSERT INTO courses (course_name, credits, dept_id) VALUES
('Database Management',        3, 1),
('Python Programming',         3, 1),
('System Analysis and Design', 3, 1),
('Discrete Mathematics',       3, 2),
('Linear Algebra II',          3, 2);

INSERT INTO enrollments (student_id, course_id, grade) VALUES
(1, 1, 'A'), (1, 2, 'B+'),
(2, 3, 'A-'), (2, 5, 'B'),
(3, 4, 'A'), (3, 5, 'A-');

-- 4. DEMONSTRATION QUERIES

-- Query 1: All students with their address and contact
SELECT full_name,
       (address).city        AS city,
       (contact).email       AS email,
       (contact).phone       AS phone
FROM students;

-- Query 2: Students and their enrolled courses (array)
SELECT full_name, courses AS registered_courses
FROM students;

-- Query 3: Students enrolled with grades
SELECT s.full_name, c.course_name, e.grade
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c  ON e.course_id  = c.course_id
ORDER BY s.full_name;

-- Query 4: Students in a specific department
SELECT s.full_name, d.dept_name
FROM students s
JOIN departments d ON s.dept_id = d.dept_id;