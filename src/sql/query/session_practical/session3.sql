-- =====================================================
-- SQL MODULE 3
-- WHERE, OPERATORS, ORDER BY, ALIASES, FUNCTIONS
-- =====================================================

-- =====================================================
-- SAMPLE TABLE
-- =====================================================

CREATE TABLE student (
    student_id NUMBER,
    student_name VARCHAR2(50),
    marks NUMBER,
    bonus NUMBER,
    city VARCHAR2(30)
);

INSERT INTO student VALUES (1,'Alice',70,5,'Delhi');
INSERT INTO student VALUES (2,'Bob',60,0,'Mumbai');
INSERT INTO student VALUES (3,'Charlie',90,10,'Delhi');
INSERT INTO student VALUES (4,'Diana',50,2,'Pune');
INSERT INTO student VALUES (5,'Ethan',75,3,'Mumbai');
INSERT INTO student VALUES (6,'Fiona',NULL,0,'Delhi');

COMMIT;

-- =====================================================
-- ARITHMETIC OPERATORS
-- =====================================================

SELECT student_name,
       marks + bonus total_marks
FROM student;

SELECT *
FROM student
WHERE marks + bonus > 80;

SELECT *
FROM student
WHERE marks * 2 > 150;

SELECT *
FROM student
WHERE marks - bonus > 60;

SELECT *
FROM student
WHERE marks / 2 > 30;

-- =====================================================
-- COMPARISON OPERATORS
-- =====================================================

-- EQUAL TO (=)

SELECT *
FROM student
WHERE student_id = 2;

-- GREATER THAN (>)

SELECT *
FROM student
WHERE marks > 70;

-- LESS THAN (<)

SELECT *
FROM student
WHERE marks < 70;

-- GREATER THAN EQUAL (>=)

SELECT *
FROM student
WHERE marks >= 75;

-- LESS THAN EQUAL (<=)

SELECT *
FROM student
WHERE marks <= 60;

-- NOT EQUAL (!=)

SELECT *
FROM student
WHERE student_id != 2;

-- NOT EQUAL (<>)

SELECT *
FROM student
WHERE student_id <> 2;

-- =====================================================
-- BETWEEN
-- =====================================================

SELECT *
FROM student
WHERE marks BETWEEN 60 AND 80;

-- =====================================================
-- NOT BETWEEN
-- =====================================================

SELECT *
FROM student
WHERE marks NOT BETWEEN 60 AND 80;

-- =====================================================
-- IN
-- =====================================================

SELECT *
FROM student
WHERE student_id IN (1,3,5);

-- =====================================================
-- NOT IN
-- =====================================================

SELECT *
FROM student
WHERE student_id NOT IN (1,3,5);

-- =====================================================
-- NULL
-- =====================================================

SELECT *
FROM student
WHERE marks IS NULL;

-- =====================================================
-- NOT NULL
-- =====================================================

SELECT *
FROM student
WHERE marks IS NOT NULL;

-- =====================================================
-- LIKE
-- =====================================================

-- Starts with A

SELECT *
FROM student
WHERE student_name LIKE 'A%';

-- Ends with a

SELECT *
FROM student
WHERE student_name LIKE '%a';

-- Second character = i

SELECT *
FROM student
WHERE student_name LIKE '_i%';

-- Third character = a

SELECT *
FROM student
WHERE student_name LIKE '__a%';

-- Contains "li"

SELECT *
FROM student
WHERE student_name LIKE '%li%';

-- =====================================================
-- LOGICAL OPERATORS
-- =====================================================

-- AND

SELECT *
FROM student
WHERE city = 'Delhi'
AND marks > 70;

-- OR

SELECT *
FROM student
WHERE city = 'Delhi'
OR city = 'Mumbai';

-- NOT

SELECT *
FROM student
WHERE NOT city = 'Delhi';

-- =====================================================
-- ORDER BY
-- =====================================================

-- ASCENDING

SELECT *
FROM student
ORDER BY marks;

-- DESCENDING

SELECT *
FROM student
ORDER BY marks DESC;

-- MULTIPLE COLUMN ORDER BY

SELECT *
FROM student
ORDER BY city, marks DESC;

-- =====================================================
-- COLUMN ALIAS
-- =====================================================

SELECT student_name Student_Name,
       marks Total_Marks
FROM student;

SELECT student_name AS Student_Name,
       marks AS Total_Marks
FROM student;

-- =====================================================
-- TABLE ALIAS
-- =====================================================

SELECT s.student_id,
       s.student_name,
       s.marks
FROM student s;

-- =====================================================
-- NUMERIC FUNCTIONS
-- =====================================================

SELECT ROUND(123.456,2) FROM dual;

SELECT CEIL(123.1) FROM dual;

SELECT FLOOR(123.9) FROM dual;

SELECT MOD(10,3) FROM dual;

SELECT ABS(-100) FROM dual;

SELECT POWER(2,4) FROM dual;

-- =====================================================
-- STRING FUNCTIONS
-- =====================================================

SELECT UPPER('dushyant') FROM dual;

SELECT LOWER('DUSHYANT') FROM dual;

SELECT INITCAP('dushyant kumar') FROM dual;

SELECT LENGTH('PYTHON') FROM dual;

SELECT SUBSTR('DATAENGINEERING',1,4)
FROM dual;

SELECT REPLACE('BIGQUERY','BIG','SMALL')
FROM dual;

SELECT TRIM('   SQL   ')
FROM dual;

SELECT INSTR('DATAENGINEERING','ENG')
FROM dual;

-- =====================================================
-- DATE FUNCTIONS
-- =====================================================

SELECT SYSDATE FROM dual;

SELECT ADD_MONTHS(SYSDATE,3)
FROM dual;

SELECT MONTHS_BETWEEN(
       DATE '2026-12-31',
       DATE '2026-01-01'
)
FROM dual;

SELECT LAST_DAY(SYSDATE)
FROM dual;

SELECT NEXT_DAY(SYSDATE,'MONDAY')
FROM dual;

-- =====================================================
-- CONVERSION FUNCTIONS
-- =====================================================

SELECT TO_CHAR(SYSDATE,'DD-MON-YYYY')
FROM dual;

SELECT TO_DATE('2026-06-22','YYYY-MM-DD')
FROM dual;

SELECT TO_NUMBER('100')
FROM dual;

-- =====================================================
-- MISC FUNCTIONS
-- =====================================================

SELECT NVL(NULL,0)
FROM dual;

SELECT NVL2(NULL,'YES','NO')
FROM dual;

SELECT COALESCE(NULL,NULL,100)
FROM dual;

-- =====================================================
-- GROUP FUNCTIONS
-- =====================================================

-- COUNT

SELECT COUNT(*)
FROM student;

-- COUNT NON NULL

SELECT COUNT(marks)
FROM student;

-- SUM

SELECT SUM(marks)
FROM student;

-- AVG

SELECT AVG(marks)
FROM student;

-- MAX

SELECT MAX(marks)
FROM student;

-- MIN

SELECT MIN(marks)
FROM student;

-- =====================================================
-- DATA ENGINEERING EXAMPLES
-- =====================================================

CREATE TABLE sensor_data (
    machine_id VARCHAR2(20),
    location VARCHAR2(30),
    temperature NUMBER(5,2)
);

INSERT INTO sensor_data VALUES ('M001','Delhi',35.5);
INSERT INTO sensor_data VALUES ('M002','Delhi',40.2);
INSERT INTO sensor_data VALUES ('M003','Mumbai',42.8);

-- FILTERING

SELECT *
FROM sensor_data
WHERE temperature > 40;

-- ORDERING

SELECT *
FROM sensor_data
ORDER BY temperature DESC;

-- AGGREGATION

SELECT location,
       AVG(temperature) avg_temp
FROM sensor_data
GROUP BY location;