-- =====================================================
-- SQL MODULE 10
-- VIEWS, INDEXES, NORMALIZATION, CONSTRAINTS
-- =====================================================

-- =====================================================
-- SAMPLE TABLES
-- =====================================================

CREATE TABLE department (
    deptno NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50)
);

CREATE TABLE employee (
    empno NUMBER PRIMARY KEY,
    ename VARCHAR2(50),
    deptno NUMBER,
    salary NUMBER,
    FOREIGN KEY (deptno)
    REFERENCES department(deptno)
);

INSERT INTO department VALUES (10,'IT');
INSERT INTO department VALUES (20,'HR');
INSERT INTO department VALUES (30,'Finance');

INSERT INTO employee VALUES (101,'Rahul',10,50000);
INSERT INTO employee VALUES (102,'Amit',10,60000);
INSERT INTO employee VALUES (103,'Priya',20,45000);
INSERT INTO employee VALUES (104,'Neha',30,70000);

COMMIT;

-- =====================================================
-- SIMPLE VIEW
-- =====================================================

CREATE VIEW employee_view AS
SELECT empno,
       ename,
       salary
FROM employee;

SELECT *
FROM employee_view;

-- =====================================================
-- VIEW WITH ROWNUM
-- =====================================================

CREATE VIEW employee_seq_view AS
SELECT ROWNUM serial_no,
       ename,
       salary
FROM employee;

-- =====================================================
-- VIEW WITH DISTINCT
-- =====================================================

CREATE VIEW department_view AS
SELECT DISTINCT deptno
FROM employee;

-- =====================================================
-- COMPLEX VIEW
-- =====================================================

CREATE VIEW department_salary_view AS
SELECT deptno,
       SUM(salary) total_salary
FROM employee
GROUP BY deptno;

SELECT *
FROM department_salary_view;

-- =====================================================
-- VIEW USING UNION
-- =====================================================

CREATE TABLE employee_archive
AS
SELECT *
FROM employee
WHERE 1=2;

INSERT INTO employee_archive
VALUES (105,'Karan',20,55000);

CREATE VIEW employee_union_view AS
SELECT * FROM employee
UNION
SELECT * FROM employee_archive;

-- =====================================================
-- MATERIALIZED VIEW
-- =====================================================

CREATE MATERIALIZED VIEW mv_department_salary
BUILD IMMEDIATE
REFRESH COMPLETE
ON DEMAND
AS
SELECT deptno,
       SUM(salary) total_salary
FROM employee
GROUP BY deptno;

SELECT *
FROM mv_department_salary;

-- =====================================================
-- UNIQUE INDEX
-- =====================================================

CREATE UNIQUE INDEX idx_empno
ON employee(empno);

-- =====================================================
-- NON UNIQUE INDEX
-- =====================================================

CREATE INDEX idx_deptno
ON employee(deptno);

-- =====================================================
-- BTREE INDEX
-- Default Oracle Index
-- =====================================================

CREATE INDEX idx_salary
ON employee(salary);

-- =====================================================
-- BITMAP INDEX
-- Best for Low Cardinality Columns
-- =====================================================

CREATE BITMAP INDEX idx_department_bitmap
ON employee(deptno);

-- =====================================================
-- COMPOSITE INDEX
-- =====================================================

CREATE INDEX idx_dept_salary
ON employee(deptno,salary);

-- =====================================================
-- REVERSE KEY INDEX
-- =====================================================

CREATE INDEX idx_reverse_emp
ON employee(empno)
REVERSE;

-- =====================================================
-- FUNCTION BASED INDEX
-- =====================================================

CREATE INDEX idx_upper_name
ON employee(UPPER(ename));

-- =====================================================
-- DESCENDING INDEX
-- =====================================================

CREATE INDEX idx_salary_desc
ON employee(salary DESC);

-- =====================================================
-- TEXT INDEX
-- =====================================================

CREATE TABLE books (
    book_id NUMBER,
    title VARCHAR2(100),
    author VARCHAR2(100),
    info CLOB
);

CREATE INDEX book_index
ON books(info)
INDEXTYPE IS CTXSYS.CONTEXT;

-- =====================================================
-- MONITOR INDEX USAGE
-- =====================================================

ALTER INDEX idx_salary
MONITORING USAGE;

SELECT *
FROM V$OBJECT_USAGE;

-- =====================================================
-- NORMALIZATION
-- =====================================================

-- NOT NORMALIZED

CREATE TABLE student_raw (
    student_id NUMBER,
    student_name VARCHAR2(50),
    courses VARCHAR2(200)
);

-- Example Data

INSERT INTO student_raw
VALUES (1,'Alice','Math,Science');

-- =====================================================
-- FIRST NORMAL FORM (1NF)
-- =====================================================

CREATE TABLE student_course (
    student_id NUMBER,
    student_name VARCHAR2(50),
    course_name VARCHAR2(50)
);

INSERT INTO student_course VALUES (1,'Alice','Math');
INSERT INTO student_course VALUES (1,'Alice','Science');

-- =====================================================
-- SECOND NORMAL FORM (2NF)
-- =====================================================

CREATE TABLE students (
    student_id NUMBER PRIMARY KEY,
    student_name VARCHAR2(50)
);

CREATE TABLE courses (
    course_id NUMBER PRIMARY KEY,
    course_name VARCHAR2(50)
);

CREATE TABLE enrollments (
    student_id NUMBER,
    course_id NUMBER
);

-- =====================================================
-- THIRD NORMAL FORM (3NF)
-- =====================================================

CREATE TABLE departments (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50)
);

CREATE TABLE employees_3nf (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    dept_id NUMBER
);

-- =====================================================
-- BCNF
-- =====================================================

CREATE TABLE professor_department (
    professor_name VARCHAR2(50),
    department VARCHAR2(50)
);

CREATE TABLE professor_subject (
    professor_name VARCHAR2(50),
    subject_name VARCHAR2(50)
);

-- =====================================================
-- NOT NULL CONSTRAINT
-- =====================================================

CREATE TABLE student_notnull (
    student_id NUMBER NOT NULL,
    student_name VARCHAR2(50)
);

-- =====================================================
-- CHECK CONSTRAINT
-- =====================================================

CREATE TABLE student_check (
    student_id NUMBER,
    marks NUMBER,
    CHECK (marks BETWEEN 0 AND 100)
);

-- =====================================================
-- UNIQUE CONSTRAINT
-- =====================================================

CREATE TABLE student_unique (
    student_id NUMBER UNIQUE,
    student_name VARCHAR2(50)
);

-- =====================================================
-- PRIMARY KEY
-- =====================================================

CREATE TABLE student_pk (
    student_id NUMBER PRIMARY KEY,
    student_name VARCHAR2(50)
);

-- =====================================================
-- FOREIGN KEY
-- =====================================================

CREATE TABLE student_fk (
    student_id NUMBER PRIMARY KEY,
    deptno NUMBER,
    FOREIGN KEY (deptno)
    REFERENCES department(deptno)
);

-- =====================================================
-- ALTER TABLE ADD COLUMN
-- =====================================================

ALTER TABLE employee
ADD email VARCHAR2(100);

-- =====================================================
-- ALTER TABLE MODIFY COLUMN
-- =====================================================

ALTER TABLE employee
MODIFY ename VARCHAR2(100);

-- =====================================================
-- ALTER TABLE DROP COLUMN
-- =====================================================

ALTER TABLE employee
DROP COLUMN email;

-- =====================================================
-- ALTER TABLE RENAME COLUMN
-- =====================================================

ALTER TABLE employee
RENAME COLUMN ename TO employee_name;

-- =====================================================
-- DROP UNUSED COLUMNS
-- =====================================================

ALTER TABLE employee
SET UNUSED(employee_name);

ALTER TABLE employee
DROP UNUSED COLUMNS;

-- =====================================================
-- JOINS WITH ALIAS
-- =====================================================

SELECT e.empno,
       e.employee_name,
       d.dept_name
FROM employee e
INNER JOIN department d
ON e.deptno = d.deptno;

-- =====================================================
-- EXPLAIN PLAN
-- =====================================================

EXPLAIN PLAN FOR

SELECT empno,
       employee_name,
       salary,
       LEAD(salary)
       OVER(ORDER BY empno)
       AS next_salary
FROM employee;

SELECT *
FROM TABLE(DBMS_XPLAN.DISPLAY());

-- =====================================================
-- DATA ENGINEERING EXAMPLE
-- =====================================================

CREATE TABLE machine_master (
    machine_id VARCHAR2(20) PRIMARY KEY,
    machine_name VARCHAR2(50),
    location VARCHAR2(50)
);

CREATE TABLE sensor_data (
    machine_id VARCHAR2(20),
    temperature NUMBER(5,2),
    FOREIGN KEY(machine_id)
    REFERENCES machine_master(machine_id)
);

CREATE VIEW sensor_dashboard AS
SELECT machine_id,
       AVG(temperature) avg_temp
FROM sensor_data
GROUP BY machine_id;

CREATE MATERIALIZED VIEW mv_sensor_dashboard
BUILD IMMEDIATE
REFRESH COMPLETE
ON DEMAND
AS
SELECT machine_id,
       AVG(temperature) avg_temp
FROM sensor_data
GROUP BY machine_id;