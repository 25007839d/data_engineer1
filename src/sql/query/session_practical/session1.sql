-- =====================================================
-- DDL COMMANDS
-- =====================================================

-- CREATE
CREATE TABLE employee (
    emp_id NUMBER(5),
    emp_name VARCHAR2(50),
    salary NUMBER(10,2)
);

-- ALTER ADD COLUMN
ALTER TABLE employee
ADD department VARCHAR2(30);

-- ALTER MODIFY COLUMN
ALTER TABLE employee
MODIFY emp_name VARCHAR2(100);

-- ALTER DROP COLUMN
ALTER TABLE employee
DROP COLUMN department;

-- RENAME TABLE
RENAME employee TO employee_master;

-- TRUNCATE TABLE
TRUNCATE TABLE employee_master;

-- DROP TABLE
DROP TABLE employee_master;

-- =====================================================
-- DML COMMANDS
-- =====================================================

CREATE TABLE employee_master (
    emp_id NUMBER(5),
    emp_name VARCHAR2(50),
    salary NUMBER(10,2),
    department VARCHAR2(30)
);

-- INSERT SINGLE RECORD
INSERT INTO employee_master
VALUES (101,'Rahul',50000,'IT');

-- INSERT MULTIPLE RECORDS
INSERT INTO employee_master
VALUES (102,'Amit',60000,'HR');

INSERT INTO employee_master
VALUES (103,'Priya',70000,'Finance');

-- UPDATE
UPDATE employee_master
SET salary = 80000
WHERE emp_id = 103;

-- DELETE
DELETE FROM employee_master
WHERE emp_id = 102;

-- =====================================================
-- DRL COMMANDS
-- =====================================================

-- SELECT ALL
SELECT * FROM employee_master;

-- SELECT SPECIFIC COLUMNS
SELECT emp_name,salary
FROM employee_master;

-- WHERE
SELECT *
FROM employee_master
WHERE salary > 50000;

-- DISTINCT
SELECT DISTINCT department
FROM employee_master;

-- ORDER BY ASC
SELECT *
FROM employee_master
ORDER BY salary ASC;

-- ORDER BY DESC
SELECT *
FROM employee_master
ORDER BY salary DESC;

-- =====================================================
-- AGGREGATE FUNCTIONS
-- =====================================================

-- COUNT
SELECT COUNT(*) total_records
FROM employee_master;

-- SUM
SELECT SUM(salary) total_salary
FROM employee_master;

-- AVG
SELECT AVG(salary) average_salary
FROM employee_master;

-- MAX
SELECT MAX(salary) highest_salary
FROM employee_master;

-- MIN
SELECT MIN(salary) lowest_salary
FROM employee_master;

-- =====================================================
-- GROUP BY
-- =====================================================

SELECT department,
       COUNT(*) employee_count,
       AVG(salary) avg_salary
FROM employee_master
GROUP BY department;

-- =====================================================
-- HAVING
-- =====================================================

SELECT department,
       AVG(salary) avg_salary
FROM employee_master
GROUP BY department
HAVING AVG(salary) > 55000;

-- =====================================================
-- STRING FUNCTIONS
-- =====================================================

SELECT UPPER('dushyant') FROM dual;

SELECT LOWER('DUSHYANT') FROM dual;

SELECT INITCAP('dushyant kumar') FROM dual;

SELECT LENGTH('PYTHON') FROM dual;

SELECT SUBSTR('DATAENGINEERING',1,4) FROM dual;

SELECT REPLACE('BIGQUERY','BIG','SMALL')
FROM dual;

-- =====================================================
-- NUMBER FUNCTIONS
-- =====================================================

SELECT ROUND(123.567,2) FROM dual;

SELECT CEIL(12.1) FROM dual;

SELECT FLOOR(12.9) FROM dual;

SELECT MOD(10,3) FROM dual;

-- =====================================================
-- DATE FUNCTIONS
-- =====================================================

SELECT SYSDATE FROM dual;

SELECT ADD_MONTHS(SYSDATE,2)
FROM dual;

SELECT MONTHS_BETWEEN(
    DATE '2026-12-31',
    DATE '2026-01-01'
)
FROM dual;

-- =====================================================
-- JOINS
-- =====================================================

CREATE TABLE department (
    dept_id NUMBER,
    dept_name VARCHAR2(30)
);

INSERT INTO department VALUES (1,'IT');
INSERT INTO department VALUES (2,'HR');

ALTER TABLE employee_master
ADD dept_id NUMBER;

UPDATE employee_master
SET dept_id = 1
WHERE emp_id = 101;

-- INNER JOIN
SELECT e.emp_name,
       d.dept_name
FROM employee_master e
INNER JOIN department d
ON e.dept_id = d.dept_id;

-- LEFT JOIN
SELECT e.emp_name,
       d.dept_name
FROM employee_master e
LEFT JOIN department d
ON e.dept_id = d.dept_id;

-- RIGHT JOIN
SELECT e.emp_name,
       d.dept_name
FROM employee_master e
RIGHT JOIN department d
ON e.dept_id = d.dept_id;

-- =====================================================
-- TCL COMMANDS
-- =====================================================

SAVEPOINT before_update;

UPDATE employee_master
SET salary = salary + 5000;

ROLLBACK TO before_update;

COMMIT;

-- =====================================================
-- DCL COMMANDS
-- =====================================================

GRANT SELECT, INSERT
ON employee_master
TO trainee_user;

REVOKE INSERT
ON employee_master
FROM trainee_user;

-- =====================================================
-- DATA ENGINEERING EXAMPLE
-- =====================================================

CREATE TABLE sensor_data (
    machine_id VARCHAR2(20),
    event_date DATE,
    temperature NUMBER(5,2),
    location VARCHAR2(50)
);

INSERT INTO sensor_data
VALUES ('M001',SYSDATE,35.5,'Delhi');

INSERT INTO sensor_data
VALUES ('M002',SYSDATE,42.1,'Mumbai');

SELECT location,
       COUNT(*) total_records,
       AVG(temperature) avg_temperature
FROM sensor_data
GROUP BY location;