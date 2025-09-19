SQL Syllabus (Beginner → Advanced)
# 1. Introduction to Databases & SQL

What is a Database? (DBMS vs RDBMS)

SQL Categories:
DDL (Data Definition Language)
DML (Data Manipulation Language)
DCL (Data Control Language)
TCL (Transaction Control Language)
Installing & Using SQL Developer

# 2. Basic SQL (Beginner Level)

Creating Database & Tables (CREATE DATABASE, CREATE TABLE)
Data Types in Oracle (NUMBER, VARCHAR2, DATE, CLOB, BLOB, etc.)

Constraints:
PRIMARY KEY, FOREIGN KEY
NOT NULL, UNIQUE
CHECK, DEFAULT
Inserting Data (INSERT INTO)
Retrieving Data (SELECT)
Filtering (WHERE, BETWEEN, LIKE, IN, IS NULL)
Sorting (ORDER BY)
Limiting Results (ROWNUM, FETCH FIRST n ROWS)

# 3. Intermediate SQL

Functions
String Functions (UPPER, LOWER, SUBSTR, INSTR, TRIM)

Numeric Functions (ROUND, TRUNC, MOD)

Date Functions (SYSDATE, ADD_MONTHS, MONTHS_BETWEEN)

Conversion Functions (TO_CHAR, TO_DATE, CAST)

Operators

Arithmetic (+, -, *, /)
Logical (AND, OR, NOT)
Comparison (=, >, <, !=, <>)

Joins

INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL OUTER JOIN
CROSS JOIN
SELF JOIN
Equi & Non-Equi Joins
Natural Join

Set Operators

UNION, UNION ALL
INTERSECT
MINUS

# 4. Advanced SQL (Analytical Level)

Subqueries
Single Row Subquery
Multi Row Subquery (IN, ANY, ALL)
Correlated Subquery
EXISTS / NOT EXISTS
Nested Subqueries

GROUPING

GROUP BY
HAVING
Grouping Sets
ROLLUP, CUBE
Aggregate Functions
COUNT, SUM, AVG, MAX, MIN

# 5. Window / Analytical Functions

OVER() Clause
Ranking Functions: ROW_NUMBER(), RANK(), DENSE_RANK()
Aggregate Window Functions: SUM(), AVG(), MIN(), MAX() OVER()
LEAD(), LAG(), FIRST_VALUE(), LAST_VALUE()
PARTITION BY vs ORDER BY in window functions

# 6. Advanced Data Modeling Concepts

Normalization & Denormalization
Star Schema & Snowflake Schema (Data Warehousing)
Surrogate Keys vs Natural Keys

# 7. Advanced SQL Developer Features

SQL*Plus basics inside SQL Developer
SQL Scripts execution (@script.sql)
Bind Variables & Substitution Variables (&, :var)
Execution Plans & Indexes (EXPLAIN PLAN)
Performance Tuning Basics (Indexes, Hints, Optimizer)

# 8. Transactions & Security

Transactions (COMMIT, ROLLBACK, SAVEPOINT)
Isolation Levels
DCL Commands: GRANT, REVOKE
Roles & Privileges in Oracle

# 9. PL/SQL (Procedural SQL – Oracle Specific)

PL/SQL Basics: Block Structure
Variables, Constants, Data Types
Conditional Statements (IF-THEN-ELSE)
Loops (FOR, WHILE, LOOP)
Cursors (Implicit & Explicit)
Procedures & Functions
Triggers
Packages & Exception Handling

# 10. Real-World / Advanced Topics

Materialized Views

Synonyms
Sequences
Indexes (B-Tree, Bitmap, Function-based)
Partitioning (Range, List, Hash)
Common Table Expressions (CTEs) & Recursive Queries (WITH)
JSON & XML handling in Oracle SQL
Data Migration with SQL Loader (SQL*Loader)