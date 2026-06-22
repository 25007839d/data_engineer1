
-- =========================================

-- A Common Table Expression (CTE) is a temporary result set that can be referenced
-- within a SELECT, INSERT, UPDATE, or DELETE statement. 
-- It is defined using the WITH clause and exists only for the duration of the query.

-- =========================================
-- Syntax
-- =========================================
-- WITH cte_name (optional_columns) AS (
--     SELECT ...
-- )
-- SELECT ...
-- FROM cte_name;

-- =========================================
-- Example 1: Simple CTE
-- =========================================
-- Find employees who earn more than the average salary.

WITH avg_salary_cte AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT first_name, salary
FROM employees, avg_salary_cte
WHERE employees.salary > avg_salary_cte.avg_salary;


-- =========================================
-- Example 2: Multiple CTEs
-- =========================================
-- Find departments where the average salary is greater than 60000
-- and list employees in those departments.

WITH dept_avg AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
),
high_paid_depts AS (
    SELECT department_id
    FROM dept_avg
    WHERE avg_salary > 60000
)
SELECT e.first_name, e.department_id, e.salary
FROM employees e
JOIN high_paid_depts h ON e.department_id = h.department_id;


-- =========================================
-- Example 3: Recursive CTE
-- =========================================
-- Display employee hierarchy (manager -> subordinate).

WITH RECURSIVE emp_hierarchy AS (
    -- Anchor member
    SELECT emp_id, emp_name, manager_id, 1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive member
    SELECT e.emp_id, e.emp_name, e.manager_id, h.level + 1
    FROM employees e
    JOIN emp_hierarchy h ON e.manager_id = h.emp_id
)
SELECT * FROM emp_hierarchy;


-- =========================================
-- Example 4: CTE with Window Function
-- =========================================
-- Find top 3 earning employees from each department.

WITH ranked_employees AS (
    SELECT
        first_name,
        department_id,
        salary,
        DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rank
    FROM employees
)
SELECT first_name, department_id, salary
FROM ranked_employees
WHERE rank <= 3;


-- =========================================
-- Advantages of CTE
-- =========================================
-- 1. Improves query readability.
-- 2. Allows reuse of temporary result sets.
-- 3. Enables recursion (hierarchical queries).
-- 4. Easier to maintain and debug complex queries.

-- Supported by: SQL Server, PostgreSQL, Oracle, MySQL 8.0+, Snowflake, BigQuery.
--============================================
--What we learned today:
--============================================
--What a procedure is
--Syntax and structure
--Procedure with parameters
--Handling exceptions
--Returning values with OUT parameters