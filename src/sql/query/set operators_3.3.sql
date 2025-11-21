--SQL SET OPERATORS

--Set operators are used to combine the results of two or more SELECT queries.
--or
--combine the records of multiple tables having the same structure.
 select * from student1
  union
 select * from student2;SET OPERATORS



-- Create sample tables
CREATE TABLE emp_hr (
    emp_id NUMBER,
    emp_name VARCHAR2(50)
);

CREATE TABLE emp_it (
    emp_id NUMBER,
    emp_name VARCHAR2(50)
);

-- Insert data into HR Department
INSERT INTO emp_hr VALUES (1, 'Ritu');
INSERT INTO emp_hr VALUES (2, 'Dushyant');
INSERT INTO emp_hr VALUES (3, NULL);
INSERT INTO emp_hr VALUES (4, 'Mark');
INSERT INTO emp_hr VALUES (5, NULL);

-- Insert data into IT Department
INSERT INTO emp_it VALUES (2, 'Dushyant');
INSERT INTO emp_it VALUES (3, NULL);
INSERT INTO emp_it VALUES (4, NULL);
INSERT INTO emp_it VALUES (6, 'John');

COMMIT;

--------------------------------------------------------------------------------
-- 1. UNION - removes duplicates, keeps only one NULL
--------------------------------------------------------------------------------
PROMPT ====== UNION Example ======
SELECT emp_name FROM emp_hr
UNION
SELECT emp_name FROM emp_it;

--------------------------------------------------------------------------------
-- 2. UNION ALL - keeps duplicates, including all NULLs
--------------------------------------------------------------------------------
PROMPT ====== UNION ALL Example ======
SELECT emp_name FROM emp_hr
UNION ALL
SELECT emp_name FROM emp_it;

--------------------------------------------------------------------------------
-- 3. INTERSECT - common rows only, NULL appears once if present in both
--------------------------------------------------------------------------------
PROMPT ====== INTERSECT Example ======
SELECT emp_name FROM emp_hr
INTERSECT
SELECT emp_name FROM emp_it;

--------------------------------------------------------------------------------
-- 4. MINUS - rows in HR not in IT, NULL from HR may remain
--------------------------------------------------------------------------------
PROMPT ====== MINUS Example ======
SELECT emp_name FROM emp_hr
MINUS
SELECT emp_name FROM emp_it;
