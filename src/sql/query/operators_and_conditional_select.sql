--Conditional Selections and Operators
--WHERE Clause (Filtering Rows)


--Example:
-- Create sample table
CREATE TABLE students (
    id     NUMBER(5) PRIMARY KEY,
    name   VARCHAR2(50),
    age    NUMBER(3),
    marks  NUMBER(3),
    city   VARCHAR2(50)
);

-- Insert sample data
INSERT INTO students VALUES (1, 'Alice', 22, 85, 'Delhi');
INSERT INTO students VALUES (2, 'Bob', 24, 70, 'Mumbai');
INSERT INTO students VALUES (3, 'Charlie', 23, 90, 'Delhi');
INSERT INTO students VALUES (4, 'David', 21, 60, 'Chennai');
INSERT INTO students VALUES (5, 'Eva', 22, 95, 'Bangalore');

-- Basic WHERE usage
SELECT * FROM students
WHERE age > 22;

-- Multiple conditions with AND
SELECT * FROM students
WHERE city = 'Delhi' AND marks > 80;

-- Using OR
SELECT * FROM students
WHERE city = 'Delhi' OR marks < 70;

-- Using BETWEEN
SELECT * FROM students
WHERE marks BETWEEN 70 AND 90;

-- Using IN
SELECT * FROM students
WHERE city IN ('Delhi', 'Mumbai');

-- Using LIKE (pattern matching)
SELECT * FROM students
WHERE name LIKE 'A%';   -- Names starting with A

-- 2. ORDER BY Clause (Sorting Rows)

--The ORDER BY clause sorts results in ascending (ASC) or descending (DESC) order.

--Example:
-- Order by marks (ascending - default)
SELECT * FROM students
ORDER BY marks;

-- Order by marks (descending)
SELECT * FROM students
ORDER BY marks DESC;

-- Order by city first, then marks
SELECT * FROM students
ORDER BY city ASC, marks DESC;