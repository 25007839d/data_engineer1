/*********************************************************************
🎓 SQL INTERVIEW QUESTIONS & SCENARIOS – ORACLE SQL DEVELOPER VERSION
📘 Author: DK | Playlist: SQL Interview Questions | 2025 Edition
*********************************************************************/

-- Clean up existing objects
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE employees';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE departments';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

/*********************************************************************
📌 SCENARIO SETUP
*********************************************************************/
CREATE TABLE departments (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(30)
);

CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    department VARCHAR2(30),
    salary NUMBER(10,2),
    manager_id NUMBER,
    join_date DATE
);

INSERT INTO departments VALUES (1,'IT');
INSERT INTO departments VALUES (2,'HR');
INSERT INTO departments VALUES (3,'Finance');

INSERT INTO employees VALUES (1,'Amit','IT',80000,NULL,DATE '2020-01-10');
INSERT INTO employees VALUES (2,'Rita','IT',60000,1,DATE '2021-03-14');
INSERT INTO employees VALUES (3,'Sohan','HR',50000,NULL,DATE '2019-06-20');
INSERT INTO employees VALUES (4,'Meena','HR',40000,3,DATE '2021-02-01');
INSERT INTO employees VALUES (5,'John','Finance',70000,NULL,DATE '2018-09-12');
INSERT INTO employees VALUES (6,'Sara','Finance',50000,5,DATE '2020-10-25');

COMMIT;


/*********************************************************************
🧩 QUESTION 1: What is SQL?
*********************************************************************/
-- SQL (Structured Query Language) is used to communicate with databases.
-- It allows you to CREATE, READ, UPDATE, and DELETE data (CRUD operations).
SELECT * FROM employees;


/*********************************************************************
🧩 QUESTION 2: Difference Between DDL, DML, DCL, and TCL
*********************************************************************/
-- DDL: Data Definition Language → Defines structure
CREATE TABLE demo (id NUMBER, name VARCHAR2(20));

-- DML: Data Manipulation Language → Manages data
INSERT INTO demo VALUES (1,'Test');

-- DCL: Data Control Language → Grants/revokes access
-- GRANT SELECT ON employees TO user_name;

-- TCL: Transaction Control Language → Manages transactions
COMMIT;
ROLLBACK;


/*********************************************************************
🧩 QUESTION 3: PRIMARY KEY vs FOREIGN KEY
*********************************************************************/
-- PRIMARY KEY → uniquely identifies each record.
-- FOREIGN KEY → creates relationship between tables.
ALTER TABLE employees ADD CONSTRAINT fk_dept
FOREIGN KEY (department)
REFERENCES departments(dept_name);


/*********************************************************************
🧩 QUESTION 4: Explain Different Types of JOINS
*********************************************************************/
-- INNER JOIN → returns records that have matching values in both tables
SELECT e.emp_name, e.department, d.dept_name
FROM employees e
JOIN departments d
ON e.department = d.dept_name;

-- LEFT JOIN → all from left table + matched from right
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.department = d.dept_name;


/*********************************************************************
🧩 QUESTION 5: SUBQUERY Example
*********************************************************************/
-- Subquery = Query inside another query.
-- Example: Get employees earning more than average salary.
SELECT emp_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);


/*********************************************************************
🧩 QUESTION 6: WHERE vs HAVING
*********************************************************************/
-- WHERE filters rows before aggregation.
-- HAVING filters groups after aggregation.
SELECT department, SUM(salary) AS total_salary
FROM employees
WHERE salary > 40000
GROUP BY department
HAVING SUM(salary) > 100000;


/*********************************************************************
🧩 QUESTION 7: WINDOW FUNCTIONS (RANK, DENSE_RANK, ROW_NUMBER)
*********************************************************************/
-- These perform calculations across a set of rows without collapsing them.
SELECT emp_name, department, salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_rank,
       DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rank,
       ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS row_num
FROM employees;


/*********************************************************************
🧩 QUESTION 8: What is CTE (WITH Clause)?
*********************************************************************/
-- Common Table Expression simplifies complex queries.
WITH high_salary AS (
  SELECT * FROM employees WHERE salary > 60000
)
SELECT emp_name, department FROM high_salary;


/*********************************************************************
🧩 QUESTION 9: Find SECOND HIGHEST SALARY
*********************************************************************/
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);


/*********************************************************************
🧩 QUESTION 10: How to Find DUPLICATE RECORDS
*********************************************************************/
SELECT emp_name, COUNT(*) AS cnt
FROM employees
GROUP BY emp_name
HAVING COUNT(*) > 1;


/*********************************************************************
🧩 QUESTION 11: How to DELETE DUPLICATE RECORDS
*********************************************************************/
-- Use ROWID to identify duplicates in Oracle.
DELETE FROM employees a
WHERE ROWID > (
  SELECT MIN(ROWID)
  FROM employees b
  WHERE a.emp_name = b.emp_name
);


/*********************************************************************
🧩 QUESTION 12: What is NORMALIZATION vs DENORMALIZATION
*********************************************************************/
-- NORMALIZATION: Split data to reduce redundancy.
-- Example: Separate employee and department tables.
-- DENORMALIZATION: Combine for faster queries.


/*********************************************************************
🧩 QUESTION 13: OLTP vs OLAP
*********************************************************************/
-- OLTP: Transactional (e.g. banking, inserts/updates).
-- OLAP: Analytical (e.g. dashboards, aggregations).


/*********************************************************************
🧩 QUESTION 14: What are INDEXES and why used?
*********************************************************************/
-- Index improves query performance (like a book index).
CREATE INDEX idx_salary ON employees(salary);


/*********************************************************************
🧩 QUESTION 15: UNION vs UNION ALL
*********************************************************************/
-- UNION removes duplicates.
-- UNION ALL keeps all duplicates.
SELECT emp_name FROM employees WHERE department='IT'
UNION
SELECT emp_name FROM employees WHERE department='HR';


/*********************************************************************
🧩 QUESTION 16: Find EMPLOYEES Without DEPARTMENT
*********************************************************************/
SELECT emp_name
FROM employees
WHERE department NOT IN (SELECT dept_name FROM departments);


/*********************************************************************
🧩 QUESTION 17: Difference Between IS NULL and = NULL
*********************************************************************/
-- “= NULL” always returns false. Use IS NULL instead.
SELECT * FROM employees WHERE manager_id IS NULL;


/*********************************************************************
🧩 QUESTION 18: Running Total using WINDOW FUNCTION
*********************************************************************/
-- Cumulative salary order by emp_id.
SELECT emp_id, emp_name, salary,
       SUM(salary) OVER (ORDER BY emp_id) AS running_total
FROM employees;


/*********************************************************************
🧩 QUESTION 19: Query Optimization Tips
*********************************************************************/
-- ✅ Avoid SELECT * (use column names)
-- ✅ Use proper indexes
-- ✅ Filter early (use WHERE)
-- ✅ Use EXISTS instead of IN for subqueries
-- ✅ Use EXPLAIN PLAN to analyze performance


/*********************************************************************
🧩 QUESTION 20: TOP 3 SALARIES PER DEPARTMENT
*********************************************************************/
-- Use DENSE_RANK() to fetch top N salaries.
SELECT emp_name, department, salary
FROM (
  SELECT emp_name, department, salary,
         DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rnk
  FROM employees
)
WHERE rnk <= 3;


/*********************************************************************
🎯 END OF SCRIPT
✅ Ready-to-run in Oracle SQL Developer.
✅ Ideal for Interview Demos & Practical Learning.
*********************************************************************/
