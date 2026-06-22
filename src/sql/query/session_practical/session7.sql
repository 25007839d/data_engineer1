-- =====================================================
-- SQL MODULE 7
-- GROUP BY, HAVING, SUBQUERIES, WINDOW FUNCTIONS
-- =====================================================

-- =====================================================
-- SAMPLE TABLE
-- =====================================================

CREATE TABLE employee (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    dept VARCHAR2(30),
    salary NUMBER,
    manager_id NUMBER
);

INSERT INTO employee VALUES (1,'Rahul','IT',50000,NULL);
INSERT INTO employee VALUES (2,'Amit','IT',60000,1);
INSERT INTO employee VALUES (3,'Priya','HR',45000,1);
INSERT INTO employee VALUES (4,'Neha','HR',55000,3);
INSERT INTO employee VALUES (5,'Karan','Finance',70000,2);

COMMIT;

-- =====================================================
-- NULL HANDLING
-- =====================================================

SELECT *
FROM employee
WHERE manager_id IS NULL;

SELECT *
FROM employee
WHERE manager_id IS NOT NULL;

-- NVL
SELECT emp_name,
       NVL(manager_id,0) manager
FROM employee;

-- NVL2
SELECT emp_name,
       NVL2(manager_id,'Manager Assigned','No Manager')
FROM employee;

-- COALESCE
SELECT emp_name,
       COALESCE(manager_id,999)
FROM employee;

-- =====================================================
-- GROUP BY
-- =====================================================

SELECT dept,
       COUNT(*) employee_count
FROM employee
GROUP BY dept;

SELECT dept,
       SUM(salary) total_salary
FROM employee
GROUP BY dept;

SELECT dept,
       AVG(salary) avg_salary
FROM employee
GROUP BY dept;

-- MULTIPLE COLUMN GROUP BY

SELECT dept,
       manager_id,
       SUM(salary)
FROM employee
GROUP BY dept, manager_id;

-- =====================================================
-- HAVING
-- =====================================================

SELECT dept,
       AVG(salary) avg_salary
FROM employee
GROUP BY dept
HAVING AVG(salary) > 50000;

SELECT dept,
       COUNT(*) emp_count
FROM employee
GROUP BY dept
HAVING COUNT(*) >= 2;

-- GROUP BY + HAVING + ORDER BY

SELECT dept,
       SUM(salary) total_salary
FROM employee
GROUP BY dept
HAVING SUM(salary) > 100000
ORDER BY total_salary DESC;

-- =====================================================
-- SINGLE ROW SUBQUERY
-- =====================================================

SELECT *
FROM employee
WHERE salary >
(
   SELECT salary
   FROM employee
   WHERE emp_name = 'Rahul'
);

-- =====================================================
-- MULTI ROW SUBQUERY - IN
-- =====================================================

SELECT *
FROM employee
WHERE dept IN
(
   SELECT dept
   FROM employee
   WHERE salary > 50000
);

-- =====================================================
-- MULTI ROW SUBQUERY - ANY
-- =====================================================

SELECT *
FROM employee
WHERE salary > ANY
(
   SELECT salary
   FROM employee
   WHERE dept = 'HR'
);

-- =====================================================
-- MULTI ROW SUBQUERY - ALL
-- =====================================================

SELECT *
FROM employee
WHERE salary > ALL
(
   SELECT salary
   FROM employee
   WHERE dept = 'HR'
);

-- =====================================================
-- MULTIPLE SUBQUERY
-- SECOND HIGHEST SALARY
-- =====================================================

SELECT *
FROM employee
WHERE salary =
(
    SELECT MAX(salary)
    FROM employee
    WHERE salary <
    (
        SELECT MAX(salary)
        FROM employee
    )
);

-- =====================================================
-- CORRELATED SUBQUERY
-- EMPLOYEE EARNING ABOVE DEPT AVG
-- =====================================================

SELECT *
FROM employee e1
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee e2
    WHERE e1.dept = e2.dept
);

-- =====================================================
-- EXISTS
-- =====================================================

CREATE TABLE department (
    dept_name VARCHAR2(30)
);

INSERT INTO department VALUES ('IT');
INSERT INTO department VALUES ('HR');

SELECT *
FROM department d
WHERE EXISTS
(
   SELECT 1
   FROM employee e
   WHERE e.dept = d.dept_name
);

-- =====================================================
-- NOT EXISTS
-- =====================================================

SELECT *
FROM department d
WHERE NOT EXISTS
(
   SELECT 1
   FROM employee e
   WHERE e.dept = d.dept_name
);

-- =====================================================
-- WINDOW FUNCTIONS
-- =====================================================

CREATE TABLE employees_window (
  emp_id NUMBER PRIMARY KEY,
  emp_name VARCHAR2(50),
  dept VARCHAR2(50),
  salary NUMBER
);

INSERT INTO employees_window VALUES (1,'Alice','HR',50000);
INSERT INTO employees_window VALUES (2,'Bob','HR',55000);
INSERT INTO employees_window VALUES (3,'Charlie','Sales',60000);
INSERT INTO employees_window VALUES (4,'Diana','Sales',62000);
INSERT INTO employees_window VALUES (5,'Edward','HR',50000);
INSERT INTO employees_window VALUES (6,'Frank','Sales',65000);

-- =====================================================
-- ROW_NUMBER
-- =====================================================

SELECT emp_id,
       emp_name,
       salary,
       ROW_NUMBER()
       OVER(ORDER BY salary DESC) rn
FROM employees_window;

-- =====================================================
-- RANK
-- =====================================================

SELECT emp_id,
       emp_name,
       salary,
       RANK()
       OVER(PARTITION BY dept
            ORDER BY salary DESC) ranking
FROM employees_window;

-- =====================================================
-- DENSE_RANK
-- =====================================================

SELECT emp_id,
       emp_name,
       salary,
       DENSE_RANK()
       OVER(PARTITION BY dept
            ORDER BY salary DESC) dense_rank
FROM employees_window;

-- =====================================================
-- NTILE
-- =====================================================

SELECT emp_id,
       emp_name,
       salary,
       NTILE(3)
       OVER(ORDER BY salary DESC) salary_group
FROM employees_window;

-- =====================================================
-- LAG
-- =====================================================

SELECT emp_id,
       emp_name,
       salary,
       LAG(salary)
       OVER(ORDER BY emp_id) prev_salary
FROM employees_window;

-- =====================================================
-- LEAD
-- =====================================================

SELECT emp_id,
       emp_name,
       salary,
       LEAD(salary)
       OVER(ORDER BY emp_id) next_salary
FROM employees_window;

-- =====================================================
-- FIRST_VALUE
-- =====================================================

SELECT emp_id,
       emp_name,
       salary,
       FIRST_VALUE(salary)
       OVER(PARTITION BY dept
            ORDER BY salary DESC) top_salary
FROM employees_window;

-- =====================================================
-- LAST_VALUE
-- =====================================================

SELECT emp_id,
       emp_name,
       salary,
       LAST_VALUE(salary)
       OVER(
         PARTITION BY dept
         ORDER BY salary DESC
         ROWS BETWEEN UNBOUNDED PRECEDING
         AND UNBOUNDED FOLLOWING
       ) bottom_salary
FROM employees_window;

-- =====================================================
-- RUNNING TOTAL
-- =====================================================

SELECT emp_id,
       emp_name,
       salary,
       SUM(salary)
       OVER(ORDER BY emp_id) running_total
FROM employees_window;

-- =====================================================
-- MOVING AVERAGE
-- =====================================================

SELECT emp_id,
       emp_name,
       salary,
       AVG(salary)
       OVER(
          ORDER BY emp_id
          ROWS BETWEEN 1 PRECEDING
          AND 1 FOLLOWING
       ) moving_avg
FROM employees_window;

-- =====================================================
-- DATA ENGINEERING EXAMPLE
-- TOP MACHINE TEMPERATURE PER LOCATION
-- =====================================================

CREATE TABLE sensor_data (
    machine_id VARCHAR2(20),
    location VARCHAR2(30),
    temperature NUMBER(5,2)
);

INSERT INTO sensor_data VALUES ('M001','Delhi',35.5);
INSERT INTO sensor_data VALUES ('M002','Delhi',40.5);
INSERT INTO sensor_data VALUES ('M003','Mumbai',42.5);

SELECT machine_id,
       location,
       temperature,
       RANK()
       OVER(
           PARTITION BY location
           ORDER BY temperature DESC
       ) temp_rank
FROM sensor_data;