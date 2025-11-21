--create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    unit_price INT,
    quantity INT,
    discount INT
);

-- insert data
INSERT INTO orders (order_id, unit_price, quantity, discount) VALUES (1, 50, 2, 5);
INSERT INTO orders (order_id, unit_price, quantity, discount) VALUES (2, 100, 1, 10);
INSERT INTO orders (order_id, unit_price, quantity, discount) VALUES (3, 20, 10, 0);
INSERT INTO orders (order_id, unit_price, quantity, discount) VALUES (4, 30, 3, 2);


Select * from orders

---where clause 
select * from orders where order_id = 1;


--Arithmetic operators 

SELECT a.*, unit_price * quantity - discount as cost
FROM orders a
WHERE unit_price * quantity - discount > 50;

--drop table
drop table orders

--create table for student
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR2(50),
    marks1 INT,
    marks2 INT,
    bonus INT
);
 
--insert data
INSERT INTO student (student_id, name, marks1, marks2, bonus) VALUES (1, 'Alice', 70, 80, 5);
INSERT INTO student (student_id, name, marks1, marks2, bonus) VALUES (2, 'Bob', 60, 65, 0);
INSERT INTO student (student_id, name, marks1, marks2, bonus) VALUES (3, 'Charlie', 90, 85, 10);
INSERT INTO student (student_id, name, marks1, marks2, bonus) VALUES (4, 'Diana', 50, 45, 2);
INSERT INTO student (student_id, name, marks1, marks2, bonus) VALUES (5, 'Diana', null,null , 2);

INSERT INTO student (student_id, name, marks1, marks2, bonus) VALUES (8, 'Neha tarkar', 20,50 , 2);

INSERT INTO student (student_id, name, marks1, marks2, bonus) VALUES (9, 'Ravi Pandey', 20,50 , 2);


select substr(name,1,instr(name,' ',1,1)) as f_name,
substr(name,instr(name,' ',1,1)+1,length(name)-instr(name,' ',1,1)) as l_name
 from student----name split 

select * from student for update

truncate table student
--Comparison operators =, !=, >, <, >=, <=, <>:-
select * from student where student_id = 2;
select * from student where student_id <> 2
select * from student where student_id != 2
select * from student where student_id >= 2
select * from student where student_id <= 2



--USING BETWEEN

select * from student where marks1 between 60 and 80; 

--USING NOT BETWEEN
select * from student where student_id not between 2 and 4;


--USING IN
select * from student where student_id in (1,3,10);

select * from student where student_id = 1 or student_id = 2 or student_id = 3 or student_id = 4

--USING NOT IN
select * from <table_name> where <col> not in ( value1, value2, value3 … valuen);


--USING NULL

select * from student where marks1 is null;





 select abs(marks1) from student


--USING NOT NULL

select * from student where marks1 is not null;


--USING LIKE
select * from <table_name> where <col> like <pattern>;

--This will give the rows whose name start with ‘S’.
select * from student where name like 'B%';

--This will give the rows whose name ends with ‘h’

select * from student where name like '%e';

--This will give the rows whose name’s second letter start with ‘a’.
select * from student where name like '_o%';


--This will give the rows whose name’s third letter start with ‘d’.
 select * from student where name like '__i%';

--This will give the rows whose name’s second letter start with ‘t’ from ending.
select * from student where name like '%_t%’;

--This will give the rows whose name’s third letter start with ‘e’ from ending.
 select * from student where name like '%e__%';
 
 --This will give the rows whose name cotains 2 a’s.
 select * from student where name like '%a%a%';
 
 
 --USING AND
select * from student where student_id != 2 and marks1 >=60 and bonus >2;


--USING AND
select * from <table_name> where <condition1> and <condition2> and .. <conditionn>;


--USING OR
select * from student where student_id = 2 or marks1 >=60 or bonus >2;


--USING ORDER BY
Select STUDENT_ID,NAME, MARKS1 as m1, MARKS2 as m2, BONUS  from student order by bonus , name;


--COLUMN ALIASES
Select <orginal_col> <alias_name> from <table_name>;


--TABLE ALIASES
Select <alias_name>.<col1>, <alias_name>.<col2> … <alias_name>.<coln> from
<table_name> <alias_name>;


drop table student






