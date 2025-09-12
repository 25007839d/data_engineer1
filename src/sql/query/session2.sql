
--Create table <table_name> (col1 datatype1, col2 datatype2 …coln datatypen);
--table created

 create table emp (emp_id number (10), e_Name varchar2 (100), age number (3), salary number (6),DOB date);
 
 
 select emp_id as e_id, e_name as name from emp
 

  where emp_id = 1
 
 delete emp where emp_id = 1
 
INSERT INTO emp (emp_id, e_name,age,salary, dob)
VALUES (2, 'Mark',30,50000, TO_DATE('2002-03-15', 'YYYY-MM-DD'));


alter table emp add check(salary>15000);

alter table emp add primary key(emp_id);

select * from emp

update emp set age = 35 where emp_id = 3

--------------------------------------------

ADDING COLUMN :  alter table emp add mobile number(10);
REMOVING COLUMN : 
-- validate
alter table emp drop column mobile
-- This will cause ORA-12988 if you're using SYS
ALTER TABLE SYS.emp DROP COLUMN mobile;

----The SYS schema is reserved for Oracle's internal data dictionary tables. 
--You cannot (and should not) drop columns or make structural changes to tables owned by SYS.
CREATE USER dush IDENTIFIED BY dush;
GRANT CONNECT, RESOURCE TO dush;

CONNECT dush/dush;


INCREASING OR DECREASING PRECISION OF A COLUMN:
alter table <table_name> modify <col datatype>;
DROPPING UNUSED COLUMNS: 

RENAMING COLUMN : alter table emp rename column mobile to mobile_number;


truncate table emp;








-- query the table

select * from student;

select name,age from student

INSERT INTO student (Name, age, marks)
VALUES ('Nitesh', 25, 90);



-- for creating table from old table
create table student_test(name, age, marks) as select * from student:

select * from student_test

-----Salespeople---
Snum (PK)	Sname	City	Comm
1001	Peel	London 	.12
1002	Serres	San Jose	.13

 create table Salespeople (Snum number (100), age number (3), marks number (3),DOB date);
