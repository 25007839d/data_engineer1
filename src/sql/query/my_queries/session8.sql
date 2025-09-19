EXPLAIN PLAN









SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR 

WITH cte AS (
  SELECT a.*, dense_rank() OVER (partition by dept ORDER BY salary desc) AS d_rank FROM employees a  ),

final as (
SELECT * FROM cte where d_rank = 3),

final1 as (
select  name,dept, salary from final where dept = 'HR')


select name,dept, salary from final1 where ROWNUM = 1




-------------------------------sub-query----------

EXPLAIN PLAN FOR 
select name,dept, salary from (
select name,dept, salary, dense_rank() over(partition by dept order by salary desc) as row_rank from employees
)
where row_rank = 3


SELECT * FROM employees FETCH FIRST 5 ROWS ONLY;


------------------view---------------------------

select * from emp


Create view v_emp as select * from emp;


select * from v_emp




SELECT * 
FROM employees 
WHERE ROWNUM <= 1;
















EXPLAIN PLAN FOR 
SELECT emp_id, name, salary, LEAD(salary) OVER (ORDER BY emp_id) AS next_salary FROM employees; 


SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);


---------------------------------


Index

create index stud_ind on employees(salary);

select * from employees where salary = 60000


select salary, rank() over(order by salary desc ) from employees;


----------------join plan---------------

LEFT OUTER JOIN
This will display the all matching records and the records which are in left hand side table
those that are not in right hand side table.
Ex:
SQL> 
EXPLAIN PLAN FOR 
select e.id, d.id from emp1 e left outer join dept d on e.id = d.id;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);


INNER JOIN
This will display all the records that have matched.
Ex:
SQL>
EXPLAIN PLAN FOR 
select e.id, d.id  from emp1 e inner join dept d on  e.id = d.id;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
