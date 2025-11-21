--JOINS
--* The purpose of a join is to combine the data across tables.
--* A join is actually performed by the where clause which combines the specified rows of tables.
--* If a join involves in more than two tables then oracle joins first two tables based on the joins condition
--and then compares the result with the next table and so on.

----------------------------------------------------------------------
-- CLEANUP (drop tables if exist)
----------------------------------------------------------------------
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE employees';
EXCEPTION WHEN OTHERS THEN NULL;
END;


BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE departments';
EXCEPTION WHEN OTHERS THEN NULL;
END;


BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE salary_band';
EXCEPTION WHEN OTHERS THEN NULL;
END;

----------------------------------------------------------------------
-- CREATE TABLES
----------------------------------------------------------------------
CREATE TABLE employees (
    emp_id NUMBER,
    emp_name VARCHAR2(50),
    dept_id NUMBER
);

CREATE TABLE departments (
    dept_id NUMBER,
    dept_name VARCHAR2(50)
);

-- Salary band table


CREATE TABLE salary_band (
    min_sal NUMBER,
    max_sal NUMBER,
    grade VARCHAR2(5)
);

----------------------------------------------------------------------
-- INSERT SAMPLE DATA WITH NULLs
----------------------------------------------------------------------
-- Employees
INSERT INTO employees VALUES (1, 'Ritu', 10);
INSERT INTO employees VALUES (2, 'Dushyant', 20);
INSERT INTO employees VALUES (3, 'Nitesh', NULL);
INSERT INTO employees VALUES (4, 'Mark', 30);
INSERT INTO employees VALUES (5, 'John', NULL);

-- Departments
INSERT INTO departments VALUES (10, 'HR');
INSERT INTO departments VALUES (20, 'IT');
INSERT INTO departments VALUES (30, 'Finance');
INSERT INTO departments VALUES (40, 'Admin');
INSERT INTO departments VALUES (NULL, 'Unknown');

INSERT INTO salary_band VALUES (0, 20000, 'C');
INSERT INTO salary_band VALUES (20001, 50000, 'B');
INSERT INTO salary_band VALUES (50001, 100000, 'A');
COMMIT;

----------------------------------------------------------------------
-- 1. EQUI JOIN (match equal dept_id)
----------------------------------------------------------------------
SELECT e.emp_name, e.dept_id, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;

----------------------------------------------------------------------
-- 2. NON-EQUI JOIN (join using ranges)
----------------------------------------------------------------------


-- Join employees with fake salaries (dept_id*10000)
SELECT e.emp_name, NVL(e.dept_id,0)*10000 AS salary, s.grade
FROM employees e
JOIN salary_band s
ON NVL(e.dept_id,0)*10000 BETWEEN s.min_sal AND s.max_sal;

----------------------------------------------------------------------
-- 3. SELF JOIN (employees with same dept)
----------------------------------------------------------------------
SELECT e1.emp_name AS emp1, e2.emp_name AS emp2, e1.dept_id
FROM employees e1
JOIN employees e2
ON e1.dept_id = e2.dept_id
WHERE e1.emp_id < e2.emp_id;

----------------------------------------------------------------------
-- 4. NATURAL JOIN (auto join on dept_id)
----------------------------------------------------------------------
SELECT emp_name, dept_name
FROM employees
NATURAL JOIN departments;

----------------------------------------------------------------------
-- 5. CROSS JOIN (Cartesian product)
----------------------------------------------------------------------
SELECT e.emp_name, d.dept_name
FROM employees e
CROSS JOIN departments d;

----------------------------------------------------------------------
-- 6. INNER JOIN (only matching rows)
----------------------------------------------------------------------
SELECT e.emp_name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

----------------------------------------------------------------------
-- 7. OUTER JOINS
----------------------------------------------------------------------

-- a) LEFT OUTER JOIN
SELECT e.emp_name, e.dept_id, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- b) RIGHT OUTER JOIN
SELECT e.emp_name, e.dept_id, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

-- c) FULL OUTER JOIN
SELECT e.emp_name, e.dept_id, d.dept_name
FROM employees e
FULL OUTER JOIN departments d
ON e.dept_id = d.dept_id;


| Join Type         | Definition                            | `NULL` Behavior                 |
| ----------------- | ------------------------------------- | ------------------------------- |
| **Equi Join**     | Match equal values in columns         | `NULL` never matches `NULL`     |
| **Non-Equi Join** | Join with range/inequality conditions | Must handle `NULL` with NVL     |
| **Self Join**     | Join table with itself                | `NULL` dept won’t match         |
| **Natural Join**  | Auto join by same column names        | `NULL` ignored                  |
| **Cross Join**    | Cartesian product                     | Includes all rows (with `NULL`) |
| **Inner Join**    | Matches only common rows              | Excludes `NULL`                 |
| **Left Outer**    | All left + matches from right         | Keeps `NULL` on right side      |
| **Right Outer**   | All right + matches from left         | Keeps `NULL` on left side       |
| **Full Outer**    | All rows from both                    | Preserves all `NULL` values     |

--Note: String 'null' (as text) : Treated as a normal string literal.