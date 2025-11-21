create table emp1 (id varchar2(10) )
select * from emp1 for update

insert into emp1 values(null)

create table dept (id varchar2(10) )
select * from dept


insert into dept values(null)


SUM
This will give the sum of the values of the specified column.
Syntax: sum (column)
Ex:
SQL> select sum(bonus) from students;

select * from students

AVG
This will give the average of the values of the specified column.
Syntax: avg (column)
Ex:
SQL>  select avg(bonus) from students;


MAX
This will give the maximum of the values of the specified column.
Syntax: max (column)
Ex:
SQL>  select max(bonus) from students;


MIN
This will give the minimum of the values of the specified column.
Syntax: min (column)
Ex:
SQL>  select min(bonus) from students;


COUNT
This will give the count of the values of the specified column.
Syntax: count (column)
Ex:
SQL>  select count(bonus) from students;

select * from students

SET OPERATORS
Union
Union all
Intersect
Minus

UNION
This will combine the records of multiple tables having the same structure.
duplicate records will not allow. Null ?
Ex:
SQL> select * from students union select * from students;


UNION ALL
This will combine the records of multiple tables having the same structure but including
duplicates.
Ex:
SQL> select * from students union all select * from students;



INTERSECT
This will give the common records of multiple tables having the same structure.
Ex:
SQL> select * from students intersect select * from students;


MINUS
This will give the records of a table whose records are not in other tables having the same
structure.
Ex:
SQL> select * from students minus select * from students;


The purpose of a join is to combine the data across tables.
A join is actually performed by the where clause which combines the specified rows of tables.
If a join involves in more than two tables then oracle joins first two tables based on the joins
condition and then compares the result with the next table and so on.


EQUI JOIN
A join which contains an ‘=’ operator in the joins condition.
Ex:
SQL> select e.id,d.id from emp1 e,dept d where e.id=d.id;



ON CLAUSE
SQL> select e.id,d.id from emp1 e,dept d on e.id=d.id;


NON-EQUI JOIN
A join which contains an operator other than ‘=’ in the joins condition.
Ex:
select e.id,d.id from emp1 e,dept d where e.id != d.id;


SELF JOIN
Joining the table itself is called self join.
Ex:
SQL> select e.id from emp1 e,emp1 e1 where e.id = e1.id;


NATURAL JOIN
Natural join compares all the common columns.

Ex:
SQL> select id from emp1 natural join dept


CROSS JOIN
This will gives the cross product.
Ex:
SQL> select empno,ename,job,dname,loc from emp cross join dept;


OUTER JOIN
Outer join gives the non-matching records along with matching records.

LEFT OUTER JOIN
This will display the all matching records and the records which are in left hand side table
those that are not in right hand side table.
Ex:
SQL> select e.id, d.id from emp1 e left outer join dept d on e.id = d.id;

-------------------------------
RIGHT OUTER JOIN
This will display the all matching records and the records which are in right hand side table
those that are not in left hand side table.
Ex:
SQL> select e.id from emp1 e right outer join dept d on  e.id = d.id;


FULL OUTER JOIN
This will display the all matching records and the non-matching records from both tables.
Ex:
SQL>select e.id from emp1 e full outer join dept d on  e.id = d.id;


INNER JOIN
This will display all the records that have matched.
Ex:
SQL> select e.id from emp1 e inner join dept d on  e.id = d.id;


SUBQUERIES
Nesting of queries, one within the other is termed as a subquery.
A statement containing a subquery is called a parent query.
Subqueries are used to retrieve data from tables that depend on the values in the table itself.


Single row subqueries
Multi row subqueries
Multiple subqueries
Correlated subqueries


SINGLE ROW SUBQUERIES
In single row subquery, it will return one value.
Ex:
SQL> select * from emp where sal > (select sal from emp where empno = 7566);


MULTI ROW SUBQUERIES
In multi row subquery, it will return more than one value. In such cases we should include
operators like any, all, in or not in between the comparision operator and the subquery.

select * from emp where sal > any (select sal from emp where sal between 2500 and
4000);
select * from emp where sal > all (select sal from emp where sal between 2500 and
4000);


MULTIPLE SUBQUERIES
There is no limit on the number of subqueries included in a where clause. It allows nesting of a
query within a subquery.
Ex:
SQL> select * from emp where sal = (select max(sal) from emp where sal < (select
max(sal) from emp));


CORRELATED SUBQUERIES
A subquery is evaluated once for the entire parent statement where as a correlated subquery is
evaluated once for every row processed by the parent statement.
118
Ex:
SQL> select distinct deptno from emp e where 5 <= (select count(ename) from emp where
e.deptno = deptno);


EXISTS
Exists function is a test for existence. This is a logical test for the return of rows from a query.
Ex:
Suppose we want to display the department numbers which has more than 4 employees.
SQL> select deptno,count(*) from emp group by deptno having count(*) > 4;


NOT EXISTS
SQL> select deptno,ename from emp e1 where not exists (select * from emp e2
where e1.deptno=e2.deptno group by e2.deptno having count(e2.ename) > 4) order by
deptno,ename;


