-- =====================================================
-- SQL MODULE 5
-- DATE FUNCTIONS + MISC FUNCTIONS
-- =====================================================

-- =====================================================
-- DATE FORMAT SETTING
-- =====================================================

ALTER SESSION
SET NLS_DATE_FORMAT = 'DD-MON-YYYY';

-- =====================================================
-- SYSDATE
-- =====================================================

SELECT SYSDATE
FROM dual;

-- =====================================================
-- CURRENT_DATE
-- =====================================================

SELECT CURRENT_DATE
FROM dual;

-- =====================================================
-- CURRENT_TIMESTAMP
-- =====================================================

SELECT CURRENT_TIMESTAMP
FROM dual;

-- =====================================================
-- SYSTIMESTAMP
-- =====================================================

SELECT SYSTIMESTAMP
FROM dual;

-- =====================================================
-- LOCALTIMESTAMP
-- =====================================================

SELECT LOCALTIMESTAMP
FROM dual;

-- =====================================================
-- DBTIMEZONE
-- =====================================================

SELECT DBTIMEZONE
FROM dual;

-- =====================================================
-- SESSIONTIMEZONE
-- =====================================================

SELECT SESSIONTIMEZONE
FROM dual;

-- =====================================================
-- TO_CHAR
-- =====================================================

SELECT TO_CHAR(
       SYSDATE,
       'DD MONTH YYYY HH24:MI:SS'
       )
FROM dual;

SELECT TO_CHAR(
       SYSDATE,
       'DAY MONTH YYYY'
       )
FROM dual;

SELECT TO_CHAR(
       SYSDATE,
       'DDTH MONTH YYYY'
       )
FROM dual;

SELECT TO_CHAR(
       SYSDATE,
       'DDSPTH'
       )
FROM dual;

-- =====================================================
-- TO_DATE
-- =====================================================

SELECT TO_DATE(
       '24-DEC-2006',
       'DD-MON-YYYY'
       )
FROM dual;

SELECT TO_CHAR(
       TO_DATE('24-DEC-2006','DD-MON-YYYY'),
       'DD * MONTH * DAY'
       )
FROM dual;

-- =====================================================
-- ADD_MONTHS
-- =====================================================

SELECT ADD_MONTHS(
       TO_DATE('11-JAN-1990','DD-MON-YYYY'),
       5
       )
FROM dual;

SELECT ADD_MONTHS(
       TO_DATE('11-JAN-1990','DD-MON-YYYY'),
       -5
       )
FROM dual;

SELECT ADD_MONTHS(
       SYSDATE,
       12
       )
FROM dual;

-- =====================================================
-- MONTHS_BETWEEN
-- =====================================================

SELECT MONTHS_BETWEEN(
       TO_DATE('11-AUG-1990','DD-MON-YYYY'),
       TO_DATE('11-JAN-1990','DD-MON-YYYY')
       )
FROM dual;

-- =====================================================
-- NEXT_DAY
-- =====================================================

SELECT NEXT_DAY(
       TO_DATE('24-DEC-2006','DD-MON-YYYY'),
       'MONDAY'
       )
FROM dual;

SELECT NEXT_DAY(
       SYSDATE,
       'FRIDAY'
       )
FROM dual;

-- =====================================================
-- LAST_DAY
-- =====================================================

SELECT LAST_DAY(
       TO_DATE('24-DEC-2006','DD-MON-YYYY')
       )
FROM dual;

SELECT LAST_DAY(SYSDATE)
FROM dual;

-- =====================================================
-- EXTRACT
-- =====================================================

SELECT EXTRACT(
       YEAR FROM SYSDATE
       )
FROM dual;

SELECT EXTRACT(
       MONTH FROM SYSDATE
       )
FROM dual;

SELECT EXTRACT(
       DAY FROM SYSDATE
       )
FROM dual;

-- =====================================================
-- GREATEST DATE
-- =====================================================

SELECT GREATEST(
       DATE '1990-01-11',
       DATE '1990-03-11',
       DATE '1990-04-11'
       )
FROM dual;

-- =====================================================
-- LEAST DATE
-- =====================================================

SELECT LEAST(
       DATE '1990-01-11',
       DATE '1990-03-11',
       DATE '1990-04-11'
       )
FROM dual;

-- =====================================================
-- ROUND DATE
-- =====================================================

SELECT ROUND(
       DATE '2024-12-24',
       'YEAR'
       )
FROM dual;

SELECT ROUND(
       DATE '2024-01-18',
       'MONTH'
       )
FROM dual;

SELECT ROUND(
       SYSDATE,
       'DAY'
       )
FROM dual;

-- =====================================================
-- TRUNC DATE
-- =====================================================

SELECT TRUNC(
       DATE '2024-12-24',
       'YEAR'
       )
FROM dual;

SELECT TRUNC(
       DATE '2024-01-18',
       'MONTH'
       )
FROM dual;

SELECT TRUNC(
       SYSDATE
       )
FROM dual;

-- =====================================================
-- NEW_TIME
-- =====================================================

SELECT TO_CHAR(
       NEW_TIME(
           SYSDATE,
           'GMT',
           'PST'
       ),
       'DD-MON-YYYY HH:MI:SS AM'
       )
FROM dual;

-- =====================================================
-- COALESCE DATE
-- =====================================================

SELECT COALESCE(
       NULL,
       DATE '2025-01-01',
       DATE '2026-01-01'
       )
FROM dual;

-- =====================================================
-- MISC FUNCTIONS
-- =====================================================

-- UID

SELECT UID
FROM dual;

-- USER

SELECT USER
FROM dual;

-- VSIZE

SELECT VSIZE(123)
FROM dual;

SELECT VSIZE('COMPUTER')
FROM dual;

SELECT VSIZE(SYSDATE)
FROM dual;

-- =====================================================
-- SAMPLE EMP TABLE
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
INSERT INTO employee VALUES (6,'Riya','Finance',70000);

COMMIT;

-- =====================================================
-- RANK
-- =====================================================

SELECT emp_name,
       salary,
       RANK()
       OVER(
          ORDER BY salary DESC
       ) ranking
FROM employee;

-- =====================================================
-- DENSE_RANK
-- =====================================================

SELECT emp_name,
       salary,
       DENSE_RANK()
       OVER(
          ORDER BY salary DESC
       ) dense_ranking
FROM employee;

-- =====================================================
-- ROW_NUMBER
-- =====================================================

SELECT emp_name,
       salary,
       ROW_NUMBER()
       OVER(
          ORDER BY salary DESC
       ) row_num
FROM employee;

-- =====================================================
-- BIN_TO_NUM
-- =====================================================

SELECT BIN_TO_NUM(1,1,0)
FROM dual;

SELECT BIN_TO_NUM(1,0,1,0)
FROM dual;

-- =====================================================
-- DATA ENGINEERING EXAMPLES
-- =====================================================

CREATE TABLE sensor_data (
    machine_id VARCHAR2(20),
    event_timestamp DATE,
    temperature NUMBER(5,2)
);

INSERT INTO sensor_data
VALUES ('M001',SYSDATE,35.5);

INSERT INTO sensor_data
VALUES ('M002',SYSDATE-1,42.5);

-- FORMAT DATE

SELECT machine_id,
       TO_CHAR(
          event_timestamp,
          'DD-MON-YYYY HH24:MI:SS'
       )
FROM sensor_data;

-- DAYS OLD DATA

SELECT machine_id,
       TRUNC(SYSDATE - event_timestamp)
       AS days_old
FROM sensor_data;

-- TOP TEMPERATURE MACHINE

SELECT machine_id,
       temperature,
       RANK()
       OVER(
          ORDER BY temperature DESC
       ) temp_rank
FROM sensor_data;