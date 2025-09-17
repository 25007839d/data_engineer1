-- Functions can be categorized as follows
--❑ Single row functions
--❑ Group functions

------------------------------------------------------------
-- SAMPLE TABLE
------------------------------------------------------------
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

------------------------------------------------------------
-- 1️⃣ NUMERIC FUNCTIONS
------------------------------------------------------------
-- ABS: Absolute value
SELECT salary, ABS(salary - 60000) AS salary_diff FROM employees;

-- CEIL: Next highest integer
SELECT salary, CEIL(salary/10000) AS ceil_value FROM employees;

-- FLOOR: Next lowest integer
SELECT salary, FLOOR(salary/10000) AS floor_value FROM employees;

-- ROUND: Round to nearest integer/decimal
SELECT salary, ROUND(salary,-3) AS rounded_salary FROM employees;

-- TRUNC: Truncate to specific decimal
SELECT salary, TRUNC(salary,-3) AS truncated_salary FROM employees;

-- MOD: Remainder
SELECT emp_id, MOD(salary, 20000) AS remainder FROM employees;

-- POWER & SQRT
SELECT salary, POWER(2,3) AS power_value, SQRT(16) AS sqrt_value FROM employees;

-- SIGN: -1,0,1 for negative/zero/positive
SELECT salary, SIGN(salary-50000) AS sign_test FROM employees;

------------------------------------------------------------
-- 2️⃣ STRING FUNCTIONS
------------------------------------------------------------
-- CONCAT / ||
SELECT CONCAT(first_name, last_name) AS fullname FROM employees;
SELECT first_name || ' ' || last_name AS fullname FROM employees;

-- SUBSTR
SELECT first_name, SUBSTR(first_name,1,3) AS short_name FROM employees;

-- LENGTH
SELECT last_name, LENGTH(last_name) AS name_length FROM employees;

-- INSTR: Position of substring
SELECT first_name, INSTR(first_name,'u') AS pos FROM employees;

-- UPPER / LOWER / INITCAP
SELECT UPPER(first_name), LOWER(last_name), INITCAP(last_name) FROM employees;

-- LPAD / RPAD
SELECT LPAD(first_name,10,'*'), RPAD(last_name,10,'#') FROM employees;

-- REPLACE
SELECT REPLACE(first_name,'u','oo') FROM employees;

-- TRIM / LTRIM / RTRIM
SELECT TRIM('   HR   ') AS trimmed FROM dual;
SELECT LTRIM('###Hello','#') AS ltrimmed FROM dual;
SELECT RTRIM('Hello***','*') AS rtrimmed FROM dual;

------------------------------------------------------------
-- 3️⃣ DATE FUNCTIONS
------------------------------------------------------------
-- SYSDATE
SELECT SYSDATE AS today FROM dual;

-- ADD_MONTHS
SELECT hire_date, ADD_MONTHS(hire_date, 6) AS after_6_months FROM employees;

-- MONTHS_BETWEEN
SELECT first_name, MONTHS_BETWEEN(SYSDATE, hire_date) AS months_worked FROM employees;

-- NEXT_DAY
SELECT hire_date, NEXT_DAY(hire_date, 'MONDAY') FROM employees;

-- LAST_DAY
SELECT hire_date, LAST_DAY(hire_date) AS last_day FROM employees;

-- ROUND (on date)
SELECT hire_date, ROUND(hire_date,'MONTH') AS rounded_month FROM employees;

-- TRUNC (on date)
SELECT hire_date, TRUNC(hire_date,'YEAR') AS trunc_year FROM employees;

------------------------------------------------------------
-- 4️⃣ MISCELLANEOUS FUNCTIONS
------------------------------------------------------------
-- NVL: Replace NULL
SELECT salary, NVL(salary, 30000) AS new_salary FROM employees;

-- NVL2: If not NULL then expr2 else expr3
SELECT NVL2(salary, 'Has Salary','No Salary') AS salary_status FROM employees;

-- NULLIF: Returns NULL if expr1=expr2 else expr1
SELECT NULLIF(10,10) AS result1, NULLIF(10,20) AS result2 FROM dual;

-- COALESCE: First non-null value
SELECT COALESCE(NULL,NULL,salary,10000) AS final_value FROM employees;

-- DECODE: IF-THEN logic
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

------------------------------------------------------------
-- 5️⃣ CONVERSION FUNCTIONS
------------------------------------------------------------
-- TO_CHAR (Number formatting)
SELECT TO_CHAR(salary,'$99,999') AS formatted_salary FROM employees;

-- TO_CHAR (Date formatting)
SELECT TO_CHAR(hire_date,'DD-MON-YYYY') AS hire_date_char FROM employees;

-- TO_DATE (string to date)
SELECT TO_DATE('15-SEP-2025','DD-MON-YYYY') AS converted_date FROM dual;

-- TO_NUMBER (string to number)
SELECT TO_NUMBER('12345') + 55 AS total FROM dual;

------------------------------------------------------------
-- END
------------------------------------------------------------
