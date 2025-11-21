--------------------------------------------------------
-- 1. DDL (Data Definition Language)
--------------------------------------------------------

-- Create employees table
CREATE TABLE employees (
    emp_id     NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name  VARCHAR2(50),
    salary     NUMBER(10,2),
    hire_date  DATE
);

-- Add a new column
ALTER TABLE employees ADD department VARCHAR2(30);

-- Modify salary column to allow bigger values
ALTER TABLE employees MODIFY salary NUMBER(12,2);

-- (Optional) Rename table
-- RENAME employees TO staff;

-- (Optional) Drop column
-- ALTER TABLE employees DROP COLUMN department;

--------------------------------------------------------
-- 2. DML (Data Manipulation Language)
--------------------------------------------------------

-- Insert rows
INSERT INTO employees (emp_id, first_name, last_name, salary, hire_date, department)
VALUES (101, 'John', 'Doe', 60000, SYSDATE, 'HR');

INSERT INTO employees (emp_id, first_name, last_name, salary, hire_date, department)
VALUES (102, 'Rita', 'Sharma', 55000, SYSDATE, 'Finance');

INSERT INTO employees (emp_id, first_name, last_name, salary, hire_date, department)
VALUES (103, 'Amit', 'Kumar', 45000, SYSDATE, 'IT');


select * from employees;
-- Update salary for John

UPDATE employees
SET salary = 70000
WHERE emp_id = 101;

-- Delete Amit
DELETE FROM employees
WHERE emp_id = 103;

-- Merge (update if exists, else insert new)
MERGE INTO employees e
USING (SELECT 104 AS emp_id, 'Sneha' AS first_name, 'Patel' AS last_name, 
              75000 AS salary, 'Marketing' AS department FROM dual) src
ON (e.emp_id = src.emp_id)
WHEN MATCHED THEN
   UPDATE SET e.salary = src.salary
WHEN NOT MATCHED THEN
   INSERT (emp_id, first_name, last_name, salary, hire_date, department)
   VALUES (src.emp_id, src.first_name, src.last_name, src.salary, SYSDATE, src.department);

--------------------------------------------------------
-- 3. DQL (Data Query Language)
--------------------------------------------------------

-- See all data
SELECT * FROM employees;

-- Select specific columns
SELECT emp_id, first_name, salary FROM employees;

-- Show unique departments
SELECT DISTINCT department FROM employees;

-- Employees with salary above 60,000
SELECT * FROM employees
WHERE salary > 60000;

-- Employees in HR
SELECT first_name, department FROM employees
WHERE department = 'HR';

-- Sort employees by salary (high to low)
SELECT emp_id, first_name, salary, department
FROM employees
ORDER BY salary DESC;

-- Count total employees
SELECT COUNT(*) AS total_employees
FROM employees;

--------------------------------------------------------
-- 4. Cleanup (Optional)
--------------------------------------------------------

-- Remove all rows but keep structure
-- TRUNCATE TABLE employees;

-- Drop table permanently
-- DROP TABLE employees;
