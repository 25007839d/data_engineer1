-- =====================================================
-- SQL MODULE 6
-- GROUP FUNCTIONS + SET OPERATORS + JOINS
-- =====================================================

-- =====================================================
-- SAMPLE EMPLOYEE TABLE
-- =====================================================

CREATE TABLE employee (
    emp_id NUMBER,
    emp_name VARCHAR2(50),
    department VARCHAR2(30),
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
-- GROUP FUNCTIONS
-- =====================================================

-- SUM

SELECT SUM(salary) total_salary
FROM employee;

-- AVG

SELECT AVG(salary) average_salary
FROM employee;

-- MAX

SELECT MAX(salary) highest_salary
FROM employee;

-- MIN

SELECT MIN(salary) lowest_salary
FROM employee;

-- COUNT COLUMN

SELECT COUNT(salary)
FROM employee;

-- COUNT ALL ROWS

SELECT COUNT(*)
FROM employee;

-- =====================================================
-- GROUP FUNCTIONS WITH GROUP BY
-- =====================================================

SELECT department,
       COUNT(*) employee_count,
       SUM(salary) total_salary,
       AVG(salary) average_salary,
       MAX(salary) highest_salary,
       MIN(salary) lowest_salary
FROM employee
GROUP BY department;

-- =====================================================
-- SET OPERATORS
-- =====================================================

CREATE TABLE student1 (
    student_id NUMBER,
    student_name VARCHAR2(50)
);

CREATE TABLE student2 (
    student_id NUMBER,
    student_name VARCHAR2(50)
);

INSERT INTO student1 VALUES (1,'Rahul');
INSERT INTO student1 VALUES (2,'Amit');
INSERT INTO student1 VALUES (3,'Priya');

INSERT INTO student2 VALUES (2,'Amit');
INSERT INTO student2 VALUES (3,'Priya');
INSERT INTO student2 VALUES (4,'Neha');

COMMIT;

-- =====================================================
-- UNION
-- Removes duplicates
-- =====================================================

SELECT *
FROM student1

UNION

SELECT *
FROM student2;

-- =====================================================
-- UNION ALL
-- Keeps duplicates
-- =====================================================

SELECT *
FROM student1

UNION ALL

SELECT *
FROM student2;

-- =====================================================
-- INTERSECT
-- Common records
-- =====================================================

SELECT *
FROM student1

INTERSECT

SELECT *
FROM student2;

-- =====================================================
-- MINUS
-- Records present in first table only
-- =====================================================

SELECT *
FROM student1

MINUS

SELECT *
FROM student2;

-- =====================================================
-- JOINS
-- =====================================================

CREATE TABLE department (
    dept_id NUMBER,
    dept_name VARCHAR2(50)
);

CREATE TABLE employee_join (
    emp_id NUMBER,
    emp_name VARCHAR2(50),
    dept_id NUMBER,
    salary NUMBER,
    manager_id NUMBER
);

INSERT INTO department VALUES (10,'IT');
INSERT INTO department VALUES (20,'HR');
INSERT INTO department VALUES (30,'Finance');

INSERT INTO employee_join VALUES (101,'Rahul',10,50000,NULL);
INSERT INTO employee_join VALUES (102,'Amit',10,60000,101);
INSERT INTO employee_join VALUES (103,'Priya',20,45000,101);
INSERT INTO employee_join VALUES (104,'Neha',NULL,55000,103);

COMMIT;

-- =====================================================
-- EQUI JOIN
-- =====================================================

SELECT e.emp_name,
       d.dept_name
FROM employee_join e,
     department d
WHERE e.dept_id = d.dept_id;

-- =====================================================
-- INNER JOIN
-- =====================================================

SELECT e.emp_name,
       d.dept_name
FROM employee_join e
INNER JOIN department d
ON e.dept_id = d.dept_id;

-- =====================================================
-- NON EQUI JOIN
-- =====================================================

CREATE TABLE salary_grade (
    grade VARCHAR2(10),
    min_salary NUMBER,
    max_salary NUMBER
);

INSERT INTO salary_grade VALUES ('A',0,50000);
INSERT INTO salary_grade VALUES ('B',50001,70000);

SELECT e.emp_name,
       e.salary,
       s.grade
FROM employee_join e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary
                   AND s.max_salary;

-- =====================================================
-- SELF JOIN
-- =====================================================

SELECT e.emp_name employee,
       m.emp_name manager
FROM employee_join e
LEFT JOIN employee_join m
ON e.manager_id = m.emp_id;

-- =====================================================
-- NATURAL JOIN
-- =====================================================

CREATE TABLE department_natural (
    dept_id NUMBER,
    dept_name VARCHAR2(50)
);

INSERT INTO department_natural VALUES (10,'IT');
INSERT INTO department_natural VALUES (20,'HR');

SELECT *
FROM employee_join
NATURAL JOIN department_natural;

-- =====================================================
-- CROSS JOIN
-- =====================================================

SELECT e.emp_name,
       d.dept_name
FROM employee_join e
CROSS JOIN department d;

-- =====================================================
-- LEFT OUTER JOIN
-- =====================================================

SELECT e.emp_name,
       d.dept_name
FROM employee_join e
LEFT OUTER JOIN department d
ON e.dept_id = d.dept_id;

-- =====================================================
-- RIGHT OUTER JOIN
-- =====================================================

SELECT e.emp_name,
       d.dept_name
FROM employee_join e
RIGHT OUTER JOIN department d
ON e.dept_id = d.dept_id;

-- =====================================================
-- FULL OUTER JOIN
-- =====================================================

SELECT e.emp_name,
       d.dept_name
FROM employee_join e
FULL OUTER JOIN department d
ON e.dept_id = d.dept_id;

-- =====================================================
-- DATA ENGINEERING EXAMPLE
-- =====================================================

CREATE TABLE machine_master (
    machine_id VARCHAR2(20),
    machine_name VARCHAR2(50),
    location VARCHAR2(50)
);

CREATE TABLE sensor_data (
    machine_id VARCHAR2(20),
    temperature NUMBER(5,2)
);

INSERT INTO machine_master
VALUES ('M001','CNC Machine','Delhi');

INSERT INTO machine_master
VALUES ('M002','Lathe Machine','Mumbai');

INSERT INTO sensor_data
VALUES ('M001',35.5);

INSERT INTO sensor_data
VALUES ('M002',42.1);

-- JOIN MACHINE MASTER WITH SENSOR DATA

SELECT m.machine_id,
       m.machine_name,
       m.location,
       s.temperature
FROM machine_master m
INNER JOIN sensor_data s
ON m.machine_id = s.machine_id;

-- AGGREGATION

SELECT location,
       AVG(temperature) avg_temp
FROM machine_master m
INNER JOIN sensor_data s
ON m.machine_id = s.machine_id
GROUP BY location;