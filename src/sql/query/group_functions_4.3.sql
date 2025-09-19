------------------------------------------------------------
-- SAMPLE TABLE
------------------------------------------------------------
CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    department VARCHAR2(20),
    salary NUMBER,
    age NUMBER
);

INSERT INTO employees VALUES (1, 'Ritu', 'HR', 50000, 30);
INSERT INTO employees VALUES (2, 'Dushyant', 'IT', 65000, 32);
INSERT INTO employees VALUES (3, 'Nitesh', 'Finance', 45000, 28);
INSERT INTO employees VALUES (4, 'Mark', 'HR', 70000, 35);
INSERT INTO employees VALUES (5, 'John', 'IT', NULL, 29);
COMMIT;

------------------------------------------------------------
-- 1️⃣ COUNT()
------------------------------------------------------------
-- Count all rows
SELECT COUNT(*) AS total_employees FROM employees;

-- Count only non-null salary values
SELECT COUNT(salary) AS employees_with_salary FROM employees;

------------------------------------------------------------
-- 2️⃣ SUM()
------------------------------------------------------------
-- Total salary (ignores NULL values)
SELECT SUM(salary) AS total_salary FROM employees;

-- Total salary by department
SELECT department, SUM(salary) AS dept_total_salary
FROM employees
GROUP BY department;

------------------------------------------------------------
-- 3️⃣ AVG()
------------------------------------------------------------
-- Average salary of all employees
SELECT AVG(salary) AS avg_salary FROM employees;

-- Average salary per department
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

------------------------------------------------------------
-- 4️⃣ MAX()
------------------------------------------------------------
-- Highest salary in the company
SELECT MAX(salary) AS highest_salary FROM employees;

-- Highest salary per department
SELECT department, MAX(salary) AS max_salary
FROM employees
GROUP BY department;

------------------------------------------------------------
-- 5️⃣ MIN()
------------------------------------------------------------
-- Lowest salary in the company
SELECT MIN(salary) AS lowest_salary FROM employees;

-- Youngest employee age per department
SELECT department, MIN(age) AS youngest_age
FROM employees
GROUP BY department;

------------------------------------------------------------
-- 6️⃣ COMBINING GROUP FUNCTIONS
------------------------------------------------------------
SELECT department,
       COUNT(*) AS emp_count,
       SUM(salary) AS total_salary,
       AVG(salary) AS avg_salary,
       MAX(salary) AS highest_salary,
       MIN(salary) AS lowest_salary
FROM employees
GROUP BY department;

------------------------------------------------------------
-- 7️⃣ USING GROUP FUNCTIONS WITH HAVING
------------------------------------------------------------
-- Departments with average salary > 55,000
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 55000;

------------------------------------------------------------
-- END
------------------------------------------------------------
