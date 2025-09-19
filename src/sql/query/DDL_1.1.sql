--DDL (Data Definition Language)
--�CREATE � Used to create a new database object (like a table, view, or database).
--�ALTER � Modifies an existing database object, such as adding or deleting columns in a table.
--�DROP � Deletes an existing database object permanently.
--�TRUNCATE � Removes all rows from a table, but keeps the table structure intact.
--�RENAME � Changes the name of an existing database object.



-- SQL CONSTRAINTS (rules to enforce data integrity)

-- 1. PRIMARY KEY  uniquely identifies each row
-- 2. FOREIGN KEY  links to another table's primary key
-- 3. UNIQUE  ensures all values are different
-- 4. NOT NULL  column cannot have NULL values
-- 5. CHECK ensures condition is true for values
-- 6. DEFAULT assigns a value if none provided
-- 7. AUTO INCREMENT  generates sequence numbers

-- Example: Department & Employee tables
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,                 -- PRIMARY KEY
    DeptName VARCHAR(50) UNIQUE NOT NULL    -- UNIQUE + NOT NULL
);

select * from department;

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,   -- PRIMARY KEY 
    EmpName VARCHAR(50) NOT NULL,           -- NOT NULL
    Age INT CHECK (Age >= 18),              -- CHECK
    Salary DECIMAL(10,2)  30000,     -- DEFAULT
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID) -- FOREIGN KEY
);

select * from Employee
-- Insert data
INSERT INTO Department (DeptID, DeptName) VALUES (1,'HR')
INSERT INTO Department (DeptID, DeptName) VALUES  (2,'IT');

select * from department;


INSERT INTO Employee (EmpID,EmpName, Age, Salary, DeptID)
VALUES (101,'Alice',25,50000,2);

INSERT INTO Employee (EmpID,EmpName, Age, Salary, DeptID) values (102,'Bob',30,DEFAULT,1);

INSERT INTO Employee (EmpID,EmpName, Age, Salary, DeptID) values (103,'Sunny',18,DEFAULT,2);




-- DDL (Data Definition Language)

-- 1. CREATE → create new database objects
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Age INT
);

select * from Staff;

drop table Employee;

-- 2. ALTER → modify existing objects
ALTER TABLE Employee ADD Salary DECIMAL(10,2);

-- 3. DROP → permanently delete objects
DROP TABLE Employee;

-- 4. TRUNCATE → remove all rows, keep structure
TRUNCATE TABLE Employee;

-- 5. RENAME → change name of objects
ALTER TABLE Employee RENAME TO Staff;



--  CREATE TABLE
CREATE TABLE emp (
    emp_id   NUMBER(10),
    e_name   VARCHAR2(100),
    age      NUMBER(3),
    salary   NUMBER(6),
    dob      DATE
);

INSERT INTO emp (emp_id, e_name, age, salary, dob)
VALUES (1, 'Robi', 30, 50000, TO_DATE('2001-03-15','YYYY-MM-DD'));


--  SELECT (with alias)
select * from emp;

select emp_id, salary from emp

SELECT emp_id AS e_id, e_name AS name
FROM emp
WHERE emp_id = 1;

--USING ALTER

--  ALTER (add constraint)
ALTER TABLE emp ADD CHECK (salary > 15000);
ALTER TABLE emp ADD PRIMARY KEY (emp_id);

--  ADDING / REMOVING COLUMN
ALTER TABLE emp ADD mobile NUMBER(10);
ALTER TABLE emp DROP COLUMN mobile;

--  RENAME COLUMN
ALTER TABLE emp RENAME COLUMN mobile TO mobile_number;

--  MODIFY COLUMN (increase/decrease precision)
ALTER TABLE emp MODIFY salary NUMBER(8);

--  TRUNCATE
TRUNCATE TABLE emp;

---------------------------------------------------

-- CREATE USER (Oracle specific)
CREATE USER dush IDENTIFIED BY dush;
GRANT CONNECT, RESOURCE TO dush;
CONNECT dush/dush;


---------------------------------------------------
