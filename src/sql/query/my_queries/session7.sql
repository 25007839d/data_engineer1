CREATE TABLE employees (
  emp_id   NUMBER PRIMARY KEY,
  name     VARCHAR2(50),
  dept     VARCHAR2(50),
  salary   NUMBER
);

select * from employees

INSERT INTO employees (emp_id, name, dept, salary) VALUES (1, 'Alice', 'HR', 50000);
INSERT INTO employees (emp_id, name, dept, salary) VALUES (2, 'Bob', 'HR', 55000);
INSERT INTO employees (emp_id, name, dept, salary) VALUES (3, 'Charlie', 'Sales', 60000);
INSERT INTO employees (emp_id, name, dept, salary) VALUES (4, 'Diana', 'Sales', 62000);
INSERT INTO employees (emp_id, name, dept, salary) VALUES (5, 'Edward', 'HR', 50000);
INSERT INTO employees (emp_id, name, dept, salary) VALUES (6, 'Frank', 'Sales', 65000);


SELECT emp_id, name, dept, salary,
  ROW_NUMBER() OVER (PARTITION BY dept ORDER BY salary DESC) AS row_num
FROM employees;
