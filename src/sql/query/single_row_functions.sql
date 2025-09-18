------------------------------------------------------------
-- FUNCTIONS IN SQL
-- Categories:
-- ? Single Row Functions (operate per row)
--    - Numeric, String, Date, Miscellaneous, Conversion
-- ? Group Functions (operate on sets of rows)
------------------------------------------------------------

------------------------------------------------------------
-- SAMPLE TABLE
------------------------------------------------------------
drop table employees;

CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    salary NUMBER,
    hire_date DATE,
    department VARCHAR2(20)
);

INSERT INTO employees VALUES (1, 'Ritu', 'Sharma', 50000, TO_DATE('2020-01-15','YYYY-MM-DD'),'HR');
INSERT INTO employees VALUES (2, 'Dushyant', 'Kumar', 65000, TO_DATE('2019-03-10','YYYY-MM-DD'),'IT');
INSERT INTO employees VALUES (3, 'Nitesh', 'Singh', 45000, TO_DATE('2021-07-25','YYYY-MM-DD'),'Finance');
INSERT INTO employees VALUES (4, 'Mark', 'Brown', 70000, TO_DATE('2018-05-05','YYYY-MM-DD'),'HR');
INSERT INTO employees VALUES (5, 'John', 'Doe', NULL, TO_DATE('2022-11-20','YYYY-MM-DD'),NULL);
COMMIT;

select * from employees
------------------------------------------------------------
-- NUMERIC FUNCTIONS
------------------------------------------------------------
-- ABS: Absolute value (removes sign)
SELECT salary, ABS(salary - 60000) AS salary_diff FROM employees;

-- CEIL: Smallest integer >= value
SELECT salary, CEIL(salary/10000) AS ceil_value FROM employees;

SELECT CEIL(25.75) AS result1,   -- 25
       CEIL(25.20) AS result2,   -- 25
       CEIL(-25.20) AS result3   -- -26
       from dual

-- FLOOR: Largest integer <= value
SELECT salary, FLOOR(salary/10000) AS floor_value FROM employees;

-- Simple values
SELECT FLOOR(25.75) AS result1,   -- 25
       FLOOR(25.20) AS result2,   -- 25
       FLOOR(-25.20) AS result3   -- -26 (rounds down towards negative infinity)
FROM dual;

-- On employees salary (in 1000s)
SELECT first_name, salary,salary/73,
       FLOOR(salary/73) AS salary_in_thousands
FROM employees;


-- ROUND: Round number
SELECT salary, ROUND(salary,-3) AS rounded_salary FROM employees;

SELECT ROUND(123.556) AS rounded0,       -- 123
       ROUND(123.556,2) AS rounded2,     -- 123.56
       ROUND(123.456,-1) AS rounded_tens -- 120
FROM dual;


-- TRUNC: Removes (truncates) digits after the decimal point without rounding.
SELECT salary, TRUNC(salary,-3) AS truncated_salary FROM employees;

SELECT TRUNC(123.456) AS no_decimals,      -- 123
       TRUNC(123.456,2) AS two_decimals,   -- 123.45
       TRUNC(123.456,-1) AS tens_place     -- 120
FROM dual;


-- MOD: Remainder of division
SELECT emp_id, MOD(salary, 20000) AS remainder FROM employees;

-- POWER & SQRT
SELECT salary, POWER(2,3) AS power_value, SQRT(16) AS sqrt_value FROM employees;

SELECT POWER(2,3) AS power_value, SQRT(16) AS sqrt_value FROM dual;
-- SIGN: Shows -1, 0, or 1
--Returns the sign of a number:

--if number is negative
--if number is zero
--if number is positive

SELECT salary, SIGN(salary-50000) AS sign_test FROM employees;


















------------------------------------------------------------
-- STRING FUNCTIONS
------------------------------------------------------------
select * from employees;

-- CONCAT / ||
SELECT CONCAT(first_name , last_name) AS fullname FROM employees;
select concat('a' , 'b') from dual;

SELECT  '*****' || first_name || ' ' || last_name || '*****' AS fullname FROM employees;

-- SUBSTR: Extract substring
SELECT first_name, SUBSTR(first_name,1,3) AS short_name FROM employees;

-- LENGTH: Count characters
SELECT last_name, LENGTH(last_name) AS name_length FROM employees;

-- INSTR: Position of substring
SELECT first_name, INSTR(first_name,'u',1,2) AS pos FROM employees;

-- UPPER / LOWER / INITCAP
SELECT UPPER(first_name), LOWER(last_name), INITCAP(last_name) FROM employees;

-- LPAD / RPAD: Padding
SELECT LPAD(first_name,10,'*'), RPAD(last_name,10,'#') FROM employees;

-- REPLACE
SELECT first_name, REPLACE(first_name,'u','oo') FROM employees;

-- TRIM / LTRIM / RTRIM
SELECT TRIM('   HR   ') AS trimmed FROM dual;
SELECT '###Hello', LTRIM('###Hello','#') AS ltrimmed FROM dual;
SELECT RTRIM('Hello***','*') AS rtrimmed FROM dual;




















------------------------------------------------------------
-- DATE FUNCTIONS
------------------------------------------------------------
-- SYSDATE: Current date
SELECT SYSDATE AS today FROM dual;

select * from employees
-- ADD_MONTHS
SELECT hire_date, ADD_MONTHS(hire_date, 6) AS after_6_months FROM employees;

-- MONTHS_BETWEEN
SELECT first_name, MONTHS_BETWEEN(SYSDATE, hire_date) AS months_worked FROM employees;

-- NEXT_DAY: Next Monday
SELECT hire_date, NEXT_DAY(hire_date, 'MONDAY') FROM employees;

-- LAST_DAY: End of month
SELECT hire_date, LAST_DAY(hire_date) AS last_day FROM employees;

-- ROUND (on date): Nearest month
SELECT hire_date, ROUND(hire_date,'MONTH') AS rounded_month FROM employees;

-- TRUNC (on date): Truncate to year start
SELECT hire_date, TRUNC(hire_date,'YEAR') AS trunc_year FROM employees;

SELECT TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI') AS formatted_date
FROM dual;

------------------------------------------------------------
-- CONVERSION FUNCTIONS
------------------------------------------------------------
-- TO_CHAR (Number formatting)
SELECT salary, TO_CHAR(salary,'$99,999') AS formatted_salary FROM employees;

-- TO_CHAR (Date formatting)
SELECT hire_date, TO_CHAR(hire_date,'DD-MON-YYYY') AS hire_date_char FROM employees;

-- TO_DATE (string to date)
SELECT TO_DATE('15-SEP-2025','DD-MON-YYYY') AS converted_date FROM dual;

-- TO_NUMBER (string to number)
SELECT '10' + 55 AS total FROM dual;








------------------------------------------------------------
-- MISCELLANEOUS FUNCTIONS
------------------------------------------------------------
-- NVL: Replace NULL with default
SELECT salary, NVL(salary, 30000) AS new_salary FROM employees;

-- NVL2: If not NULL ? expr2 else expr3
SELECT NVL2(salary, 'Has Salary','No Salary') AS salary_status FROM employees;

-- NULLIF: Return NULL if equal
SELECT NULLIF(10,10) AS result1, NULLIF(10,20) AS result2 FROM dual;

-- COALESCE: First non-null value
SELECT COALESCE(NULL,NULL,salary,10000) AS final_value FROM employees;

-- DECODE: Simple IF-THEN logic
SELECT first_name,
       DECODE(department,'HR','Human Resource','IT','Technology','Finance','Accounts','Other') AS dept_full
FROM employees;

-- CASE: Conditional logic
SELECT first_name, salary,
       CASE
         WHEN salary > 60000 THEN 'High'
         WHEN salary BETWEEN 45000 AND 60000 THEN 'Medium'
         ELSE 'Low'
       END AS salary_range
FROM employees;

-- GREATEST & LEAST
SELECT GREATEST(100,200,300), LEAST(100,200,300) FROM dual;


------------------------------------------------------------
-- GROUP FUNCTIONS
------------------------------------------------------------
-- COUNT
SELECT COUNT(*) AS total_employees, COUNT(salary) AS with_salary FROM employees;

-- SUM
SELECT SUM(salary) AS total_salary FROM employees;

-- AVG
SELECT AVG(salary) AS avg_salary FROM employees;

-- MAX / MIN
SELECT MAX(salary) AS max_salary, MIN(salary) AS min_salary FROM employees;

------------------------------------------------------------
-- END OF SCRIPT
------------------------------------------------------------
