------------------------------------------------------------
-- SUBQUERIES IN SQL (ALL TYPES)
-- 1. Single-row Subquery
-- 2. Multi-row Subquery
-- 3. Multiple Subqueries
-- 4. Correlated Subquery
-- 5. EXISTS & NOT EXISTS
------------------------------------------------------------

------------------------------------------------------------
-- SAMPLE TABLES
------------------------------------------------------------
DROP TABLE employees PURGE;
DROP TABLE departments PURGE;

CREATE TABLE departments (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50)
);

CREATE TABLE employees (
    emp_id      NUMBER PRIMARY KEY,
    emp_name    VARCHAR2(50),
    dept_id     NUMBER,
    salary      NUMBER,
    hire_date   DATE,
    CONSTRAINT fk_dept FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

------------------------------------------------------------
-- INSERT SAMPLE DATA
------------------------------------------------------------
INSERT INTO departments VALUES (1, 'HR');
INSERT INTO departments VALUES (2, 'IT');
INSERT INTO departments VALUES (3, 'Finance');
INSERT INTO departments VALUES (4, 'Marketing'); -- No employees for testing NOT EXISTS

INSERT INTO employees VALUES (101, 'Ritu',     1, 50000, TO_DATE('2020-01-15','YYYY-MM-DD'));
INSERT INTO employees VALUES (102, 'Dushyant', 2, 65000, TO_DATE('2019-03-10','YYYY-MM-DD'));
INSERT INTO employees VALUES (103, 'Nitesh',   3, 45000, TO_DATE('2021-07-25','YYYY-MM-DD'));
INSERT INTO employees VALUES (104, 'Mark',     1, 70000, TO_DATE('2018-05-05','YYYY-MM-DD'));
INSERT INTO employees VALUES (105, 'John',     2, NULL,   TO_DATE('2022-11-20','YYYY-MM-DD'));
INSERT INTO employees VALUES (106, 'Aman',     3, 55000, TO_DATE('2020-08-10','YYYY-MM-DD'));
INSERT INTO employees VALUES (107, 'Simran',   2, 60000, TO_DATE('2021-04-01','YYYY-MM-DD'));
COMMIT;

------------------------------------------------------------
-- 1. SINGLE-ROW SUBQUERY
-- Returns one value
------------------------------------------------------------
SELECT emp_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

------------------------------------------------------------
-- 2. MULTI-ROW SUBQUERY
-- Returns multiple rows
------------------------------------------------------------
SELECT emp_name, salary, dept_id
FROM employees
WHERE salary IN (SELECT MIN(salary) FROM employees GROUP BY dept_id);

------------------------------------------------------------
-- 3. MULTIPLE SUBQUERIES (NESTED)
------------------------------------------------------------
SELECT emp_name, salary, hire_date
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees WHERE dept_id = 2)
  AND hire_date < (SELECT MIN(hire_date) FROM employees WHERE dept_id = 3);

------------------------------------------------------------
-- 4. CORRELATED SUBQUERY
------------------------------------------------------------
SELECT emp_name, salary, dept_id
FROM employees e
WHERE salary > (SELECT AVG(salary)
                FROM employees
                WHERE dept_id = e.dept_id);

------------------------------------------------------------
-- 5. EXISTS SUBQUERY
-- Check if a department has employees
------------------------------------------------------------
SELECT dept_id, dept_name
FROM departments d
WHERE EXISTS (SELECT 1
              FROM employees e
              WHERE e.dept_id = d.dept_id);

-- Result → HR, IT, Finance (since they have employees)

------------------------------------------------------------
-- 6. NOT EXISTS SUBQUERY
-- Find departments with no employees
------------------------------------------------------------
SELECT dept_id, dept_name
FROM departments d
WHERE NOT EXISTS (SELECT 1
                  FROM employees e
                  WHERE e.dept_id = d.dept_id);

-- Result → Marketing (since no employees)

------------------------------------------------------------
-- 7. NULL HANDLING WITH SUBQUERIES
------------------------------------------------------------
-- Employees whose salary is less than ALL other non-null salaries
SELECT emp_name, salary
FROM employees
WHERE salary < ALL (SELECT salary FROM employees WHERE salary IS NOT NULL);

------------------------------------------------------------

------------------------------------------------------------
