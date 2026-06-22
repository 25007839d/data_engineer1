-- =====================================================
-- SQL MODULE 2
-- CONSTRAINTS + ADVANCED DDL + DML
-- =====================================================

-- =====================================================
-- CREATE TABLE
-- =====================================================

CREATE TABLE student (
    student_id NUMBER(5),
    student_name VARCHAR2(50),
    marks NUMBER(3)
);

-- =====================================================
-- CREATE TABLE AS SELECT (CTAS)
-- =====================================================

CREATE TABLE student_backup
AS
SELECT *
FROM student;

-- =====================================================
-- NOT NULL CONSTRAINT
-- =====================================================

CREATE TABLE student_notnull (
    student_id NUMBER(5) NOT NULL,
    student_name VARCHAR2(50),
    marks NUMBER(3)
);

-- VALID
INSERT INTO student_notnull
VALUES (101,'Rahul',85);

-- INVALID
-- INSERT INTO student_notnull
-- VALUES (NULL,'Rahul',85);

-- =====================================================
-- CHECK CONSTRAINT
-- =====================================================

CREATE TABLE student_check (
    student_id NUMBER(5),
    student_name VARCHAR2(50),
    marks NUMBER(3)
    CHECK (marks BETWEEN 0 AND 100)
);

-- VALID
INSERT INTO student_check
VALUES (101,'Rahul',95);

-- INVALID
-- INSERT INTO student_check
-- VALUES (102,'Amit',150);

-- =====================================================
-- CHECK CONSTRAINT (TABLE LEVEL)
-- =====================================================

CREATE TABLE employee_check (
    emp_id NUMBER,
    emp_name VARCHAR2(50),
    salary NUMBER,
    CHECK (salary > 10000)
);

-- =====================================================
-- ADD CHECK USING ALTER
-- =====================================================

ALTER TABLE employee_check
ADD CHECK (salary < 500000);

-- =====================================================
-- UNIQUE CONSTRAINT
-- =====================================================

CREATE TABLE student_unique (
    student_id NUMBER UNIQUE,
    student_name VARCHAR2(50)
);

-- VALID
INSERT INTO student_unique
VALUES (101,'Rahul');

-- INVALID
-- Duplicate value
-- INSERT INTO student_unique
-- VALUES (101,'Amit');

-- =====================================================
-- UNIQUE TABLE LEVEL
-- =====================================================

CREATE TABLE employee_unique (
    emp_id NUMBER,
    emp_name VARCHAR2(50),
    UNIQUE(emp_id)
);

-- =====================================================
-- UNIQUE USING ALTER
-- =====================================================

ALTER TABLE employee_unique
ADD UNIQUE(emp_id);

-- =====================================================
-- PRIMARY KEY
-- =====================================================

CREATE TABLE department (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50)
);

INSERT INTO department
VALUES (10,'IT');

INSERT INTO department
VALUES (20,'HR');

-- INVALID
-- Duplicate Primary Key
-- INSERT INTO department
-- VALUES (10,'Finance');

-- =====================================================
-- PRIMARY KEY TABLE LEVEL
-- =====================================================

CREATE TABLE project (
    project_id NUMBER,
    project_name VARCHAR2(50),
    PRIMARY KEY(project_id)
);

-- =====================================================
-- PRIMARY KEY USING ALTER
-- =====================================================

CREATE TABLE client (
    client_id NUMBER,
    client_name VARCHAR2(50)
);

ALTER TABLE client
ADD PRIMARY KEY(client_id);

-- =====================================================
-- FOREIGN KEY
-- =====================================================

CREATE TABLE employee (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    dept_id NUMBER,
    FOREIGN KEY(dept_id)
    REFERENCES department(dept_id)
);

INSERT INTO employee
VALUES (101,'Rahul',10);

INSERT INTO employee
VALUES (102,'Amit',20);

-- INVALID
-- 99 does not exist in parent table
-- INSERT INTO employee
-- VALUES (103,'Priya',99);

-- =====================================================
-- FOREIGN KEY WITH ON DELETE CASCADE
-- =====================================================

CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    dept_id NUMBER,
    FOREIGN KEY(dept_id)
    REFERENCES department(dept_id)
    ON DELETE CASCADE
);

INSERT INTO orders VALUES (1,10);
INSERT INTO orders VALUES (2,10);

-- Delete Parent

DELETE FROM department
WHERE dept_id = 10;

-- Child records automatically removed

-- =====================================================
-- ALTER TABLE ADD COLUMN
-- =====================================================

ALTER TABLE employee
ADD email VARCHAR2(100);

-- =====================================================
-- ALTER TABLE MODIFY COLUMN
-- =====================================================

ALTER TABLE employee
MODIFY emp_name VARCHAR2(100);

-- =====================================================
-- ALTER TABLE DROP COLUMN
-- =====================================================

ALTER TABLE employee
DROP COLUMN email;

-- =====================================================
-- ALTER TABLE RENAME COLUMN
-- =====================================================

ALTER TABLE employee
RENAME COLUMN emp_name TO employee_name;

-- =====================================================
-- DROP UNUSED COLUMNS
-- =====================================================

ALTER TABLE employee
SET UNUSED (employee_name);

ALTER TABLE employee
DROP UNUSED COLUMNS;

-- =====================================================
-- TRUNCATE
-- =====================================================

TRUNCATE TABLE employee;

-- =====================================================
-- DROP TABLE
-- =====================================================

DROP TABLE employee;

-- =====================================================
-- RENAME TABLE
-- =====================================================

RENAME department TO department_master;

-- =====================================================
-- INSERT
-- =====================================================

INSERT INTO department_master
VALUES (30,'Finance');

-- =====================================================
-- INSERT WITH SELECT
-- =====================================================

CREATE TABLE department_backup (
    dept_id NUMBER,
    dept_name VARCHAR2(50)
);

INSERT INTO department_backup
SELECT *
FROM department_master;

-- =====================================================
-- INSERT DATE COLUMN
-- =====================================================

CREATE TABLE student_date (
    student_id NUMBER PRIMARY KEY,
    student_name VARCHAR2(50),
    dob DATE
);

INSERT INTO student_date
VALUES (
    1,
    'Alice',
    TO_DATE('2005-03-15','YYYY-MM-DD')
);

-- =====================================================
-- COLUMN ALIAS
-- =====================================================

SELECT
    student_name Student_Name,
    dob Date_Of_Birth
FROM student_date;

-- =====================================================
-- UPDATE
-- =====================================================

UPDATE student_date
SET student_name = 'Alice Johnson'
WHERE student_id = 1;

-- =====================================================
-- DELETE
-- =====================================================

DELETE FROM student_date
WHERE student_id = 1;

-- =====================================================
-- DATA ENGINEERING EXAMPLE
-- =====================================================

CREATE TABLE machine_master (
    machine_id VARCHAR2(20) PRIMARY KEY,
    machine_name VARCHAR2(50),
    location VARCHAR2(50)
);

CREATE TABLE sensor_data (
    record_id NUMBER PRIMARY KEY,
    machine_id VARCHAR2(20),
    temperature NUMBER(5,2),

    FOREIGN KEY(machine_id)
    REFERENCES machine_master(machine_id)
);

INSERT INTO machine_master
VALUES ('M001','CNC Machine','Delhi');

INSERT INTO sensor_data
VALUES (1,'M001',35.5);

SELECT *
FROM sensor_data;