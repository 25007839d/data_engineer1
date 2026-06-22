-- Create table
CREATE TABLE students (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    age NUMBER,
    marks NUMBER,
    city VARCHAR2(50)
);

-- Insert sample data
INSERT INTO students VALUES (1, 'Ritu', 22, 85, 'Delhi');
INSERT INTO students VALUES (2, 'Dushyant', 24, 92, 'Mumbai');
INSERT INTO students VALUES (3, 'Nitesh', 21, 76, 'Delhi');
INSERT INTO students VALUES (4, 'Mark', 23, 60, 'Pune');
INSERT INTO students VALUES (5, 'John', 25, 45, 'Delhi');
COMMIT;

--------------------------------------------------
-- 1. Arithmetic Operators
--------------------------------------------------
SELECT name, marks FROM students WHERE marks + 5 >= 90;     -- Addition
SELECT name, age FROM students WHERE age - 2 = 22;          -- Subtraction
SELECT name, marks FROM students WHERE marks * 2 > 150;     -- Multiplication
SELECT name, marks FROM students WHERE marks / 2 < 50;      -- Division

--------------------------------------------------
-- 2. Comparison Operators
--------------------------------------------------
SELECT * FROM students WHERE city = 'Delhi';     -- Equal
SELECT * FROM students WHERE city <> 'Delhi';    -- Not Equal
SELECT * FROM students WHERE marks > 80;         -- Greater Than
SELECT * FROM students WHERE marks < 50;         -- Less Than
SELECT * FROM students WHERE age >= 23;          -- Greater Than or Equal
SELECT * FROM students WHERE marks <= 60;        -- Less Than or Equal

--------------------------------------------------
-- 3. Logical Operators
--------------------------------------------------
SELECT * FROM students WHERE city = 'Delhi' AND marks > 80;   -- AND
SELECT * FROM students WHERE city = 'Delhi' OR marks > 80;    -- OR
SELECT * FROM students WHERE NOT city = 'Delhi';              -- NOT

--------------------------------------------------
-- 4. Special Operators
--------------------------------------------------
-- BETWEEN
SELECT * FROM students WHERE marks BETWEEN 70 AND 90;

-- IN
SELECT * FROM students WHERE city IN ('Delhi', 'Pune');

-- LIKE
SELECT * FROM students WHERE name LIKE 'R%';    -- Starts with R
SELECT * FROM students WHERE name LIKE '%h';    -- Ends with h
SELECT * FROM students WHERE name LIKE '%it%';  -- Contains "it"

-- IS NULL / IS NOT NULL
SELECT * FROM students WHERE marks IS NULL;
SELECT * FROM students WHERE marks IS NOT NULL;
