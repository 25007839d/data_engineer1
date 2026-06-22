--DML (INSERT, UPDATE, DELETE)

------------------------------------------------------------------------
-- 1. Setup: Create a sample table
------------------------------------------------------------------------
DROP TABLE employees PURGE;

CREATE TABLE employees (
    emp_id    NUMBER(5) PRIMARY KEY,
    name      VARCHAR2(50),
    age       NUMBER(3),
    dept      VARCHAR2(20),
    salary    NUMBER(10,2),
    hire_date DATE
);

------------------------------------------------------------------------
-- 2. INSERT examples
------------------------------------------------------------------------

-- 2.1 Insert a single row
INSERT INTO employees (emp_id, name, age, dept, salary, hire_date)
VALUES (1, 'Alice', 25, 'IT', 50000, TO_DATE('2021-05-10','YYYY-MM-DD'));

-- 2.2 Insert multiple rows
INSERT INTO employees (emp_id, name, age, dept, salary, hire_date) VALUES
(2, 'Bob', 30, 'HR', 32000, TO_DATE('2020-07-01','YYYY-MM-DD'));
INSERT INTO employees (emp_id, name, age, dept, salary, hire_date) VALUES
(3, 'Charlie', 28, 'Finance', 45000, TO_DATE('2019-11-20','YYYY-MM-DD'));

-- 2.3 Insert from another table (copying data)
CREATE TABLE high_earners AS
SELECT emp_id, name, salary
FROM employees
WHERE salary > 40000;

------------------------------------------------------------------------
-- 3. UPDATE examples
------------------------------------------------------------------------

-- 3.1 Update a single row
UPDATE employees
SET age = 26
WHERE name = 'Alice';

-- 3.2 Update multiple rows (increase IT salaries by 10%)
UPDATE employees
SET salary = salary * 1.10
WHERE dept = 'IT';

-- 3.3 Update using subquery (Finance employees +2000)
UPDATE employees
SET salary = salary + 2000
WHERE dept = (SELECT dept FROM employees WHERE dept = 'Finance' AND ROWNUM = 1);

------------------------------------------------------------------------
-- 4. DELETE examples
------------------------------------------------------------------------

-- 4.1 Delete a single row
DELETE FROM employees
WHERE emp_id = 2;

-- 4.2 Delete multiple rows (age < 25)
DELETE FROM employees
WHERE age < 25;

-- 4.3 Delete all rows (but keep table structure)
TRUNCATE TABLE employees;

------------------------------------------------------------------------
-- 5. Extra: Transaction control
------------------------------------------------------------------------

-- Undo changes made after last COMMIT
ROLLBACK;

-- Save changes permanently
COMMIT;

------------------------------------------------------------------------
-- 6. Check final data
------------------------------------------------------------------------
SELECT * FROM employees;
