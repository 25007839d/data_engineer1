--HAVING

--Works like a WHERE clause for groups.
--You cannot use WHERE with aggregate functions, so we use HAVING.

------------------------------------------------------------
-- SAMPLE TABLE
------------------------------------------------------------
DROP TABLE employees PURGE;

CREATE TABLE employees (
    emp_id      NUMBER PRIMARY KEY,
    first_name  VARCHAR2(50),
    department  VARCHAR2(30),
    salary      NUMBER
);

------------------------------------------------------------
-- INSERTING SAMPLE DATA
------------------------------------------------------------
INSERT INTO employees VALUES (1, 'Ritu',     'HR',       50000);
INSERT INTO employees VALUES (2, 'Dushyant', 'IT',       65000);
INSERT INTO employees VALUES (3, 'Nitesh',   'Finance',  45000);
INSERT INTO employees VALUES (4, 'Mark',     'HR',       70000);
INSERT INTO employees VALUES (5, 'John',     'IT',       NULL);
INSERT INTO employees VALUES (6, 'Aman',     'Finance',  55000);
INSERT INTO employees VALUES (7, 'Simran',   'IT',       60000);
INSERT INTO employees VALUES (8, 'Pooja',    'Finance',  NULL);
COMMIT;

------------------------------------------------------------
-- 1. SIMPLE GROUP BY
-- Find average salary per department
------------------------------------------------------------
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

------------------------------------------------------------
-- 2. GROUP BY with COUNT
-- Count employees in each department
------------------------------------------------------------
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department;

------------------------------------------------------------
-- 3. GROUP BY with SUM
-- Total salary budget for each department
------------------------------------------------------------
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

------------------------------------------------------------
-- 4. USING WHERE with GROUP BY
-- WHERE filters ROWS before grouping
-- Find total salary for departments where salary is NOT NULL
------------------------------------------------------------
SELECT department, SUM(salary) AS total_salary
FROM employees
WHERE salary IS NOT NULL
GROUP BY department;

------------------------------------------------------------
-- 5. USING HAVING
-- HAVING filters GROUPS after grouping
-- Show departments having total salary > 100000
------------------------------------------------------------
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 100000;

------------------------------------------------------------
-- 6. COMBINING WHERE + GROUP BY + HAVING
-- Find departments where employees have salary > 40000 (row filter)
-- and total salary of department is greater than 120000 (group filter)
------------------------------------------------------------
SELECT department, SUM(salary) AS total_salary
FROM employees
WHERE salary > 40000
GROUP BY department
HAVING SUM(salary) > 120000;

------------------------------------------------------------
-- 7. GROUP BY Multiple Columns
-- Group employees by department and salary ranges
------------------------------------------------------------
SELECT department,
       CASE
         WHEN salary >= 60000 THEN 'High'
         WHEN salary BETWEEN 40000 AND 59999 THEN 'Medium'
         ELSE 'Low'
       END AS salary_band,
       COUNT(*) AS emp_count
FROM employees
WHERE salary IS NOT NULL
GROUP BY department,
         CASE
           WHEN salary >= 60000 THEN 'High'
           WHEN salary BETWEEN 40000 AND 59999 THEN 'Medium'
           ELSE 'Low'
         END;

------------------------------------------------------------
-- 8. NULL Handling in GROUP BY
-- NULL salaries are ignored by aggregates like AVG, SUM
------------------------------------------------------------
SELECT department,
       COUNT(*) AS total_employees,
       COUNT(salary) AS non_null_salaries,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

------------------------------------------------------------
-- END OF SCRIPT
------------------------------------------------------------
