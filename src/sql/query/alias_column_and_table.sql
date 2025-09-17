--------------Column Aliases and Table Aliases------------------------------------
-- Sample Table
--------------------------------------------------
CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    salary NUMBER,
    department VARCHAR2(50)
);

-- Insert sample data
INSERT INTO employees VALUES (1, 'Ritu', 'Sharma', 50000, 'HR');
INSERT INTO employees VALUES (2, 'Dushyant', 'Kumar', 60000, 'IT');
INSERT INTO employees VALUES (3, 'Nitesh', 'Singh', 45000, 'Finance');
INSERT INTO employees VALUES (4, 'Mark', 'Brown', 70000, 'IT');
INSERT INTO employees VALUES (5, 'John', 'Doe', 40000, 'HR');
COMMIT;

--------------------------------------------------
-- COLUMN ALIASES
--------------------------------------------------
-- Using "AS" keyword
SELECT first_name AS fname, last_name AS lname, salary AS monthly_salary
FROM employees;

-- Without "AS" (just space)
SELECT first_name fname, last_name lname, salary monthly_salary
FROM employees;

-- Alias with spaces (must use double quotes "")
SELECT first_name || ' ' || last_name AS "Full Name"
FROM employees;

--------------------------------------------------
-- TABLE ALIASES
--------------------------------------------------
-- Assign alias "e" to employees
SELECT e.emp_id, e.first_name, e.salary
FROM employees e;

-- Join with another table using table aliases
CREATE TABLE departments (
    dept_name VARCHAR2(50) PRIMARY KEY,
    location VARCHAR2(50)
);

INSERT INTO departments VALUES ('HR', 'Delhi');
INSERT INTO departments VALUES ('IT', 'Mumbai');
INSERT INTO departments VALUES ('Finance', 'Pune');
COMMIT;

-- Join employees (alias e) with departments (alias d)
SELECT e.first_name || ' ' || e.last_name AS employee_name,
       e.salary,
       d.location
FROM employees e
JOIN departments d
ON e.department = d.dept_name;
