--A Window Function in SQL performs a calculation across a set of rows (a “window”)
--that are related to the current row, but without collapsing rows like GROUP BY.

| Function               | Purpose                                                                         | Example Usage                                                                                                             |
| ---------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| **ROW\_NUMBER()**      | Assigns a unique sequential number to each row (within partition if given).     | `ROW_NUMBER() OVER (PARTITION BY dept ORDER BY salary DESC)`                                                              |
| **RANK()**             | Ranks rows, but **with gaps** if there are ties.                                | `RANK() OVER (ORDER BY salary DESC)`                                                                                      |
| **DENSE\_RANK()**      | Ranks rows **without gaps** when ties exist.                                    | `DENSE_RANK() OVER (ORDER BY salary DESC)`                                                                                |
| **NTILE(n)**           | Divides rows into *n* nearly equal buckets. Useful for quartiles, deciles, etc. | `NTILE(4) OVER (ORDER BY salary DESC)` → quartiles                                                                        |
| **LAG(col, offset)**   | Returns the value from the **previous row** (based on ORDER BY).                | `LAG(salary,1) OVER (ORDER BY hire_date)`                                                                                 |
| **LEAD(col, offset)**  | Returns the value from the **next row** (based on ORDER BY).                    | `LEAD(salary,1) OVER (ORDER BY hire_date)`                                                                                |
| **FIRST\_VALUE(col)**  | Gets the **first value** in the window frame.                                   | `FIRST_VALUE(salary) OVER (PARTITION BY dept ORDER BY hire_date)`                                                         |
| **LAST\_VALUE(col)**   | Gets the **last value** in the window frame (requires proper frame clause).     | `LAST_VALUE(salary) OVER (PARTITION BY dept ORDER BY hire_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)` |
| **SUM(col), AVG(col)** | Performs aggregation across the window while keeping row detail.                | `SUM(salary) OVER (PARTITION BY dept)`<br>`AVG(salary) OVER (PARTITION BY dept)`                                          |


CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(20),
    dept VARCHAR(20),
    salary INT,
    hire_date DATE
);

INSERT INTO employees VALUES
(1, 'Alice', 'Sales', 90000, '2018-03-15'),
(2, 'Bob',   'Sales', 90000, '2017-06-10'),
(3, 'Carol', 'Sales', 70000, '2019-08-01'),
(4, 'David', 'HR',    60000, '2016-01-20'),
(5, 'Eve',   'HR',    60000, '2018-07-30'),
(6, 'Frank', 'HR',    50000, '2020-02-12'),
(7, 'Grace', 'Eng',   120000,'2015-12-09'),
(8, 'Heidi', 'Eng',   95000, '2019-11-05'),
(9, 'Ivan',  'Eng',   95000, '2020-05-17'),
(10,'Judy',  'Eng',   80000, '2018-09-23');

-- ==========================================
-- 1. ROW_NUMBER()
-- Gives unique sequential number to each row (per dept, ordered by salary desc)
-- ==========================================
SELECT
    emp_id, name, dept, salary,
    ROW_NUMBER() OVER (PARTITION BY dept ORDER BY salary DESC) AS row_num
FROM employees;


-- ==========================================
-- 2. RANK()
-- Assigns rank with gaps for ties
-- (if two salaries are equal → same rank, next rank skips)
-- ==========================================
SELECT
    emp_id, name, dept, salary,
    RANK() OVER (PARTITION BY dept ORDER BY salary DESC) AS rank_with_gap
FROM employees;


-- ==========================================
-- 3. DENSE_RANK()
-- Assigns rank without gaps for ties
-- (if two salaries are equal → same rank, next rank is consecutive)
-- ==========================================
SELECT
    emp_id, name, dept, salary,
    DENSE_RANK() OVER (PARTITION BY dept ORDER BY salary DESC) AS dense_rank
FROM employees;


-- ==========================================
-- 4. NTILE(3)
-- Divides rows into 3 buckets (per dept, ordered by salary)
-- Buckets are distributed as evenly as possible
-- ==========================================
SELECT
    emp_id, name, dept, salary,
    NTILE(3) OVER (PARTITION BY dept ORDER BY salary DESC) AS ntile_bucket
FROM employees;


-- ==========================================
-- 5. LAG()
-- Fetches the previous row’s salary (based on hire_date ordering)
-- Useful for comparing current row with previous row
-- ==========================================
SELECT
    emp_id, name, dept, salary, hire_date,
    LAG(salary, 1) OVER (ORDER BY hire_date) AS prev_salary
FROM employees;


-- ==========================================
-- 6. LEAD()
-- Fetches the next row’s salary (based on hire_date ordering)
-- Useful for comparing current row with following row
-- ==========================================
SELECT
    emp_id, name, dept, salary, hire_date,
    LEAD(salary, 1) OVER (ORDER BY hire_date) AS next_salary
FROM employees;


-- ==========================================
-- 7. FIRST_VALUE()
-- Gets the first salary in each dept (earliest hire_date)
-- Shows the same first value for all rows in that partition
-- ==========================================
SELECT
    emp_id, name, dept, salary, hire_date,
    FIRST_VALUE(salary) OVER (PARTITION BY dept ORDER BY hire_date) AS first_salary
FROM employees;


-- ==========================================
-- 8. LAST_VALUE()
-- Gets the last salary in each dept (latest hire_date)
-- Need full frame ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
-- Otherwise, it may return current row instead of true last
-- ==========================================
SELECT
    emp_id, name, dept, salary, hire_date,
    LAST_VALUE(salary) OVER (
        PARTITION BY dept
        ORDER BY hire_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS last_salary
FROM employees;


-- ==========================================
-- 9. SUM() OVER()
-- Calculates department total salary while keeping all rows
-- Unlike GROUP BY, does not collapse rows
-- ==========================================
SELECT
    emp_id, name, dept, salary,
    SUM(salary) OVER (PARTITION BY dept) AS dept_total
FROM employees;


-- ==========================================
-- 10. AVG() OVER()
-- Calculates department average salary while keeping all rows
-- ==========================================
SELECT
    emp_id, name, dept, salary,
    AVG(salary) OVER (PARTITION BY dept) AS dept_avg
FROM employees;
