-- =====================================================
-- SQL MODULE 8
-- CTE, VIEWS, INDEXES, EXPLAIN PLAN
-- =====================================================

-- =====================================================
-- SAMPLE EMPLOYEE TABLE
-- =====================================================

CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    dept VARCHAR2(30),
    salary NUMBER
);

INSERT INTO employees VALUES (1,'Alice','HR',50000);
INSERT INTO employees VALUES (2,'Bob','HR',55000);
INSERT INTO employees VALUES (3,'Charlie','Sales',60000);
INSERT INTO employees VALUES (4,'Diana','Sales',62000);
INSERT INTO employees VALUES (5,'Edward','HR',50000);
INSERT INTO employees VALUES (6,'Frank','Sales',65000);

COMMIT;

-- =====================================================
-- CTE (COMMON TABLE EXPRESSION)
-- =====================================================

WITH high_paid_emps AS
(
    SELECT *
    FROM employees
    WHERE salary > 55000
)
SELECT emp_name,
       dept,
       salary
FROM high_paid_emps;

-- =====================================================
-- CTE + WINDOW FUNCTION
-- =====================================================

WITH ranked_emps AS
(
    SELECT emp_id,
           emp_name,
           dept,
           salary,
           RANK() OVER
           (
              PARTITION BY dept
              ORDER BY salary DESC
           ) dept_rank
    FROM employees
)
SELECT *
FROM ranked_emps
WHERE dept_rank = 1;

-- =====================================================
-- MULTIPLE CTE
-- =====================================================

WITH hr_emps AS
(
    SELECT *
    FROM employees
    WHERE dept = 'HR'
),
sales_emps AS
(
    SELECT *
    FROM employees
    WHERE dept = 'Sales'
)
SELECT h.emp_name hr_employee,
       s.emp_name sales_employee
FROM hr_emps h
JOIN sales_emps s
ON h.salary = s.salary;

-- =====================================================
-- VIEWS
-- =====================================================

CREATE VIEW employee_view AS
SELECT emp_id,
       emp_name,
       salary
FROM employees;

SELECT *
FROM employee_view;

-- =====================================================
-- SIMPLE VIEW
-- =====================================================

CREATE VIEW hr_employee_view AS
SELECT *
FROM employees
WHERE dept = 'HR';

-- =====================================================
-- COMPLEX VIEW
-- =====================================================

CREATE VIEW dept_salary_summary AS
SELECT dept,
       SUM(salary) total_salary,
       AVG(salary) avg_salary
FROM employees
GROUP BY dept;

SELECT *
FROM dept_salary_summary;

-- =====================================================
-- MATERIALIZED VIEW
-- =====================================================

CREATE MATERIALIZED VIEW mv_salary_summary
BUILD IMMEDIATE
REFRESH COMPLETE
ON DEMAND
AS
SELECT dept,
       SUM(salary) total_salary
FROM employees
GROUP BY dept;

SELECT *
FROM mv_salary_summary;

-- =====================================================
-- UNIQUE INDEX
-- =====================================================

CREATE UNIQUE INDEX idx_emp_id
ON employees(emp_id);

-- =====================================================
-- NON UNIQUE INDEX
-- =====================================================

CREATE INDEX idx_dept
ON employees(dept);

-- =====================================================
-- BTREE INDEX
-- Default Oracle Index
-- =====================================================

CREATE INDEX idx_salary
ON employees(salary);

-- =====================================================
-- BITMAP INDEX
-- Low Cardinality Columns
-- =====================================================

CREATE BITMAP INDEX idx_dept_bitmap
ON employees(dept);

-- =====================================================
-- COMPOSITE INDEX
-- =====================================================

CREATE INDEX idx_dept_salary
ON employees(dept,salary);

-- =====================================================
-- REVERSE KEY INDEX
-- =====================================================

CREATE INDEX idx_reverse_empid
ON employees(emp_id)
REVERSE;

-- =====================================================
-- FUNCTION BASED INDEX
-- =====================================================

CREATE INDEX idx_upper_name
ON employees(UPPER(emp_name));

-- =====================================================
-- DESCENDING INDEX
-- =====================================================

CREATE INDEX idx_salary_desc
ON employees(salary DESC);

-- =====================================================
-- INDEX USAGE EXAMPLE
-- =====================================================

SELECT *
FROM employees
WHERE emp_id = 3;

SELECT *
FROM employees
WHERE dept = 'HR';

-- =====================================================
-- MONITOR INDEX USAGE
-- =====================================================

ALTER INDEX idx_salary
MONITORING USAGE;

-- =====================================================
-- CHECK INDEX USAGE
-- =====================================================

SELECT *
FROM V$OBJECT_USAGE;

-- =====================================================
-- TEXT INDEX EXAMPLE
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
-- NORMALIZATION EXAMPLE
-- =====================================================

-- UNNORMALIZED TABLE

CREATE TABLE student_raw (
    student_id NUMBER,
    student_name VARCHAR2(50),
    course1 VARCHAR2(50),
    course2 VARCHAR2(50)
);

-- 1NF

CREATE TABLE student (
    student_id NUMBER,
    student_name VARCHAR2(50)
);

CREATE TABLE course (
    course_id NUMBER,
    course_name VARCHAR2(50)
);

CREATE TABLE student_course (
    student_id NUMBER,
    course_id NUMBER
);

-- =====================================================
-- EXPLAIN PLAN
-- =====================================================

EXPLAIN PLAN FOR

SELECT *
FROM employees
WHERE salary > 50000;

SELECT *
FROM TABLE(DBMS_XPLAN.DISPLAY);

-- =====================================================
-- EXPLAIN PLAN WITH JOIN
-- =====================================================

EXPLAIN PLAN FOR

SELECT e.emp_name,
       e.salary
FROM employees e
WHERE e.dept = 'Sales';

SELECT *
FROM TABLE(DBMS_XPLAN.DISPLAY);

-- =====================================================
-- TOP 5 ROWS
-- =====================================================

SELECT *
FROM employees
FETCH FIRST 5 ROWS ONLY;

-- =====================================================
-- TOP 3 HIGHEST SALARIES
-- =====================================================

SELECT *
FROM employees
ORDER BY salary DESC
FETCH FIRST 3 ROWS ONLY;

-- =====================================================
-- DATA ENGINEERING EXAMPLE
-- =====================================================

CREATE TABLE sensor_data (
    machine_id VARCHAR2(20),
    location VARCHAR2(30),
    temperature NUMBER(5,2)
);

INSERT INTO sensor_data VALUES ('M001','Delhi',35.5);
INSERT INTO sensor_data VALUES ('M002','Delhi',40.2);
INSERT INTO sensor_data VALUES ('M003','Mumbai',42.8);

-- CTE FOR HIGH TEMPERATURE

WITH high_temp AS
(
    SELECT *
    FROM sensor_data
    WHERE temperature > 40
)
SELECT *
FROM high_temp;

-- VIEW FOR REPORTING

CREATE VIEW sensor_report AS
SELECT location,
       AVG(temperature) avg_temp
FROM sensor_data
GROUP BY location;

SELECT *
FROM sensor_report;

-- MATERIALIZED VIEW FOR DASHBOARD

CREATE MATERIALIZED VIEW mv_sensor_dashboard
BUILD IMMEDIATE
REFRESH COMPLETE
ON DEMAND
AS
SELECT location,
       AVG(temperature) avg_temp,
       MAX(temperature) max_temp
FROM sensor_data
GROUP BY location;