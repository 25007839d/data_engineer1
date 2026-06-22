-- =====================================================
-- SQL MODULE 4
-- BUILT-IN FUNCTIONS
-- =====================================================

-- =====================================================
-- NUMERIC FUNCTIONS
-- =====================================================

-- ABS

SELECT ABS(10) positive_value FROM dual;
SELECT ABS(-10) absolute_value FROM dual;

-- SIGN

SELECT SIGN(10) FROM dual;
SELECT SIGN(-10) FROM dual;
SELECT SIGN(0) FROM dual;

-- SQRT

SELECT SQRT(25) square_root
FROM dual;

-- MOD

SELECT MOD(10,3)
FROM dual;

SELECT MOD(25,4)
FROM dual;

-- NVL

SELECT NVL(NULL,100)
FROM dual;

SELECT NVL(NULL,'NO DATA')
FROM dual;

-- POWER

SELECT POWER(2,5)
FROM dual;

SELECT POWER(10,2)
FROM dual;

-- EXP

SELECT EXP(1)
FROM dual;

SELECT EXP(2)
FROM dual;

-- LN

SELECT LN(10)
FROM dual;

SELECT LN(100)
FROM dual;

-- LOG

SELECT LOG(10,100)
FROM dual;

SELECT LOG(10,1000)
FROM dual;

-- CEIL

SELECT CEIL(12.1)
FROM dual;

SELECT CEIL(12.9)
FROM dual;

-- FLOOR

SELECT FLOOR(12.9)
FROM dual;

SELECT FLOOR(12.1)
FROM dual;

-- ROUND

SELECT ROUND(123.456)
FROM dual;

SELECT ROUND(123.456,2)
FROM dual;

SELECT ROUND(123.456,-1)
FROM dual;

-- TRUNC

SELECT TRUNC(123.456)
FROM dual;

SELECT TRUNC(123.456,2)
FROM dual;

SELECT TRUNC(123.456,-1)
FROM dual;

-- BITAND

SELECT BITAND(6,3)
FROM dual;

-- GREATEST

SELECT GREATEST(10,20,30,40)
FROM dual;

-- LEAST

SELECT LEAST(10,20,30,40)
FROM dual;

-- COALESCE

SELECT COALESCE(NULL,NULL,100,200)
FROM dual;

-- =====================================================
-- STRING FUNCTIONS
-- =====================================================

-- INITCAP

SELECT INITCAP('dushyant kumar')
FROM dual;

-- UPPER

SELECT UPPER('oracle sql')
FROM dual;

-- LOWER

SELECT LOWER('ORACLE SQL')
FROM dual;

-- LENGTH

SELECT LENGTH('DATAENGINEERING')
FROM dual;

-- RPAD

SELECT RPAD('SQL',10,'*')
FROM dual;

-- LPAD

SELECT LPAD('SQL',10,'*')
FROM dual;

-- LTRIM

SELECT LTRIM('###SQL','#')
FROM dual;

-- RTRIM

SELECT RTRIM('SQL###','#')
FROM dual;

-- TRIM

SELECT TRIM('#' FROM '#SQL#')
FROM dual;

-- TRANSLATE

SELECT TRANSLATE('INDIA','IN','XY')
FROM dual;

-- REPLACE

SELECT REPLACE('BIGQUERY','BIG','SMALL')
FROM dual;

-- SOUNDEX

SELECT SOUNDEX('SMITH')
FROM dual;

SELECT SOUNDEX('SMYTH')
FROM dual;

-- CONCAT

SELECT CONCAT('DATA','ENGINEERING')
FROM dual;

-- CONCATENATION OPERATOR

SELECT 'DATA' || ' ' || 'ENGINEERING'
FROM dual;

-- ASCII

SELECT ASCII('A')
FROM dual;

-- CHR

SELECT CHR(65)
FROM dual;

-- SUBSTR

SELECT SUBSTR('DATAENGINEERING',1,4)
FROM dual;

SELECT SUBSTR('DATAENGINEERING',5,7)
FROM dual;

-- INSTR

SELECT INSTR('DATAENGINEERING','ENG')
FROM dual;

-- DECODE

SELECT DECODE(
          1,
          1,'ONE',
          2,'TWO',
          'OTHER'
       )
FROM dual;

-- GREATEST STRING

SELECT GREATEST(
        'APPLE',
        'MANGO',
        'BANANA'
       )
FROM dual;

-- LEAST STRING

SELECT LEAST(
        'APPLE',
        'MANGO',
        'BANANA'
       )
FROM dual;

-- COALESCE STRING

SELECT COALESCE(
        NULL,
        NULL,
        'PYTHON',
        'SQL'
       )
FROM dual;

-- =====================================================
-- DATE FUNCTIONS
-- =====================================================

-- SYSDATE

SELECT SYSDATE
FROM dual;

-- CURRENT_DATE

SELECT CURRENT_DATE
FROM dual;

-- CURRENT_TIMESTAMP

SELECT CURRENT_TIMESTAMP
FROM dual;

-- SYSTIMESTAMP

SELECT SYSTIMESTAMP
FROM dual;

-- LOCALTIMESTAMP

SELECT LOCALTIMESTAMP
FROM dual;

-- DBTIMEZONE

SELECT DBTIMEZONE
FROM dual;

-- SESSIONTIMEZONE

SELECT SESSIONTIMEZONE
FROM dual;

-- TO_CHAR

SELECT TO_CHAR(
       SYSDATE,
       'DD-MON-YYYY'
       )
FROM dual;

SELECT TO_CHAR(
       SYSDATE,
       'DAY MONTH YYYY'
       )
FROM dual;

SELECT TO_CHAR(
       SYSDATE,
       'DD-MON-YYYY HH24:MI:SS'
       )
FROM dual;

-- TO_DATE

SELECT TO_DATE(
       '22-06-2026',
       'DD-MM-YYYY'
       )
FROM dual;

-- ADD_MONTHS

SELECT ADD_MONTHS(
       SYSDATE,
       6
       )
FROM dual;

-- MONTHS_BETWEEN

SELECT MONTHS_BETWEEN(
       DATE '2026-12-31',
       DATE '2026-01-01'
       )
FROM dual;

-- NEXT_DAY

SELECT NEXT_DAY(
       SYSDATE,
       'MONDAY'
       )
FROM dual;

-- LAST_DAY

SELECT LAST_DAY(
       SYSDATE
       )
FROM dual;

-- EXTRACT

SELECT EXTRACT(
       YEAR FROM SYSDATE
       )
FROM dual;

SELECT EXTRACT(
       MONTH FROM SYSDATE
       )
FROM dual;

-- ROUND DATE

SELECT ROUND(
       SYSDATE,
       'MONTH'
       )
FROM dual;

-- TRUNC DATE

SELECT TRUNC(
       SYSDATE
       )
FROM dual;

SELECT TRUNC(
       SYSDATE,
       'MONTH'
       )
FROM dual;

-- COALESCE DATE

SELECT COALESCE(
       NULL,
       SYSDATE
       )
FROM dual;

-- =====================================================
-- GROUP FUNCTIONS
-- =====================================================

CREATE TABLE employee (
    emp_id NUMBER,
    emp_name VARCHAR2(50),
    department VARCHAR2(30),
    salary NUMBER
);

INSERT INTO employee VALUES (1,'Rahul','IT',50000);
INSERT INTO employee VALUES (2,'Amit','IT',60000);
INSERT INTO employee VALUES (3,'Priya','HR',45000);
INSERT INTO employee VALUES (4,'Neha','HR',55000);
INSERT INTO employee VALUES (5,'Karan','Finance',70000);

-- COUNT

SELECT COUNT(*)
FROM employee;

-- SUM

SELECT SUM(salary)
FROM employee;

-- AVG

SELECT AVG(salary)
FROM employee;

-- MAX

SELECT MAX(salary)
FROM employee;

-- MIN

SELECT MIN(salary)
FROM employee;

-- GROUP FUNCTION + GROUP BY

SELECT department,
       COUNT(*) employee_count,
       AVG(salary) avg_salary,
       MAX(salary) highest_salary
FROM employee
GROUP BY department;

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

-- AVG TEMPERATURE

SELECT location,
       AVG(temperature)
FROM sensor_data
GROUP BY location;

-- MAX TEMPERATURE

SELECT MAX(temperature)
FROM sensor_data;

-- FORMAT CURRENT DATE

SELECT TO_CHAR(
       SYSDATE,
       'DD-MON-YYYY HH24:MI:SS'
       )
FROM dual;