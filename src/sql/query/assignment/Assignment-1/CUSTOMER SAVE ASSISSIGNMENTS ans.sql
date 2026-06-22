
select * from SALESPEOPLE
SELECT * FROM customers
SELECT * FROM orders;

alter table SALESPEOPLE rename column snum_pk to snum
alter table CUSTUMERS rename column cnum_pk to cnum
alter table customers rename column snumm to snum
alter table ORDERS_1 rename column onum_pk to onum
alter table ORDERS_1 rename column cnum_fk to cnum
alter table ORDERS_1 rename column snum_fk to snum
alter table ORDERS rename column amount to amt

 rename ORDERS_1 to ordersi
rename CUSTUMERS to customers
customers
select * from orders where amt > any (select amt from orders where odate ='06-OCT-96') order by odate

--1.  List all customers with a rating of 100.
SELECT * FROM CUSTUMERS WHERE RATING =100
--2.  Find all records in the Customer table with NULL values in the city column.
SELECT * FROM CUSTUMERS WHERE CITY = NULL
--3.  Find the largest order taken by each salesperson on each date.
SELECT O.ONUM_PK,O.ODATE,S.SNAME FROM ORDERS O,SALESPEOPLE S WHERE O.SNUM_FK=S.SNUM_PK ORDER BY O.SNUM_FK,S.SNUM_PK

SELECT MAX(ONUM_PK) O FROM ORDERS_1 O,SALESPEOPLE S WHERE O.ONUM_PK= S.SNUM_FK

--4.  Arrange the Orders table by descending customer number.
select CNUM_FK FROM ORDERS_1 ORDER BY CNUM_FK DESC
--5.  Find which salespeople currently have orders in the Orders tabl
SELECT SNAME, SNUM FROM SALESPEOPLE WHERE SNUM IN (SELECT SNUM FROM ORDERS);

--6.  List names of all customers matched with the salespeople serving them.
SELECT CNAME,SNUM FROM CUSTOMERS WHERE SNUM IN (SELECT SNUM FROM SALESPEOPLE)

--7.  Find the names and numbers of all salespeople who had more than one customer.
SELECT SNAME,SNUM FROM SALESPEOPLE WHERE SNUM IN
(SELECT SNUM FROM CUSTOMERS GROUP BY SNUM HAVING COUNT (SNUM) >1) 

--8.  Count the orders of each of the salespeople and output the results in descending order.
SELECT COUNT(ONUM),SNUM FROM ORDERS GROUP BY SNUM ORDER BY COUNT(ONUM)DESC

--9.  List the Customer table if and only if one or more of the customers
 --in the Customer tables are located in San Jose.
 
 SELECT CNAME,CITY,RATING FROM CUSTOMERS WHERE CITY ='SANJOSE'
 
 --10. Match salespeople to customers according to what city they lived in.
 SELECT * FROM SALESPEOPLE S JOIN CUSTOMERS C ON S.CITY=C.CITY
 SELECT SNAME,CNAME,S.CITY FROM SALESPEOPLE S, CUSTOMERS C WHERE S.CITY =C.CITY
 
--1. Find the largest order taken by each salesperson.
SELECT SNUM, MAX (AMT) FROM ORDERS GROUP BY SNUM
SELECT SNUM,AMT FROM ORDERS
--12. Find customers in San Jose who has a rating above 200.
SELECT CNAME,CITY,RATING FROM CUSTOMERS WHERE RATING >'200'

--W. List the names and commissions of all salespeople in London.
SELECT SNAME,COMM,CITY FROM SALESPEOPLE WHERE CITY ='LONDON' 

--14. List all the orders of salesperson Monika from the Orders table.  
SELECT ONUM FROM ORDERS WHERE SNUM IN(SELECT SNUM FROM SALESPEOPLE WHERE SNAME='MONIKA')

--15. Find all customers with orders on October 3.
SELECT * FROM CUSTOMERS WHERE SNUM IN(SELECT SNUM FROM ORDERS WHERE ODATE='03-OCT-96');
select * from orders
--16. Give the sums of the amounts from the orders table, grouped by date, 
SELECT SUM(AMOUNT),ODATE FROM ORDERS_1 GROUP BY ODATE

--17. Eliminating all those dates where the SUM was not 
--least 2000.00 above the MAX amount.
SELECT ODATE,AMT FROM ORDERS A WHERE  AMT IN(SELECT MAX(AMT)FROM ORDERS B GROUP BY ODATE 
HAVING SUM(AMT)>2000)


SELECT ODATE,SUM(AMT) FROM ORDERS GROUP BY ODATE


--18. Select all orders that had amounts that were greater than at least one of the orders from October 6.
  SELECT * FROM ORDERS WHERE AMT>ANY(SELECT AMT FROM ORDERS WHERE ODATE='06-OCT-96')
--19. W*rite a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300.
select * from salespeople s where exists(select * from customers c where c.snum=s.snum and c.rating=300)


--20. Find all pairs of customers having the same rating.
select * from customers order by rating;
--21. Find all customers with CNUM, 1000 above the SNUM of Serres.
select cnum,cname from customers where cnum>(select snum from salespeople where sname='serres');
--22. Give the salespeople’s commissions as percentage instead of decimal numbers.
select comm*100 from salespeople; 

--23. Find the largest order taken by each salesperson on each date, eliminating those MAX orders,
-- which are less than $3000.00 in value.
select snum,odate,max(amt) from orders group by odate,snum having max(amt)>3000;

--24. List the largest orders on October 3, for each salesperson.
select snum,odate,max(amt) from orders group by odate,snum having ODATE='03-OCT-96'

--25. Find all customers located in cities where Serres (SNUM 1002) has customers.
 select CNAME,CITY from customers where city in(select city from salespeople where SNUM='1002')
 SELECT CNAME,CITY FROM CUSTOMERS WHERE CITY IN(SELECT CITY FROM SALESPEOPLE WHERE SNAME='Serees')
--26. Select all customers with a rating above 200.00.

select * from customers where rating>2000

--27. Count the number of salespeople currently listing orders in the Orders table.

select count(distinct snum) from orders


--*28. Write a query that produces all customers serviced by salespeople with a commission above 12%. Output the customer’s name and the salesperson‘s rate of commission.
select c.cname,s.comm from customers c join salespeople s on c.snum= s.snum and s.comm>12;

--29. Find salespeople who have multiple customers.

select snum,count(snum) from customers group by snum having count(snum)>1
   select * from customers
--30. Find salespeople with customers located in their city.


select s.sname,c.cname,s.city from salespeople s join customers c on s.city=c.city order by city;
--31. Find all salespeople whose name starts with ‘P’ and the fourth character is ‘I’.
select sname from salespeople where sname like 'P%'

--32. Write a query that uses a sub query to obtain all orders for the customer named ‘Cisneros’. Assume you do not know his customer number.
select onum from orders  where Cnum in(select Cnum from customers where cname='CISNEROS');
select * from customers
--33. Find the largest orders for ‘Serres’ and ‘Rifkin’.
select snum,max(amt) from orders group by snum  having snum in
(select snum from salespeople where sname='SERRES' or sname='RIFKIN');

--34. Extract the Salespeople table in the following order: SNUM, SNAME, COMMISSION, CITY.

select snum,max(amt) from orders group by snum 2 having snum in(select snum from salespeople1 where sname='Serres' or sname='Rifkin');
--35. Select all customers whose names fall in between ‘A’ and ‘G’ alphabetical range.
 select cname from customers where cname between 'A' and 'G' order by cname asc
--36. Select all the possible combinations of customers that you can assign.
select c.cname,s.sname from customers c join salespeople s on c.snum=s.snum

--37. Select all orders that are greater than the average for October 4.

select ONUM,AMT from orders where AMT=
 (select avg(amt) from orders GROUP BY ODATE) HAVING ODATE='04-OCT-96') in(select odate from orders group by odate having odate='04-OCT-96'))


--38. Write a select command using a correlated sub query that selects the names and numbers of all customers with ratings equal to the maximum for their city.
select cnum,cname,rating,CITY from customers where rating in(select max(rating)from customers group by city)

--39. Write a query that totals the orders for each day and places the results in descending order.

select sum(amt) from orders group by odate order by sum(amt) desc

--40. Write a select command that produces the rating followed by the name of each customer in San Jose.
select rating,cname from customers where city in(select city from salespeople where city='SAN JOSE')


--41. Find all orders with amounts smaller than any amount for a customer in San Jose.
 select onum from orders where amt >(select avg(amt) from orders);


--42. Find all orders with above average amounts for their customers.

select city,max(rating) from customers group by city;

--43. Write a query that selects the highest rating in each city.
select city,max(rating) from customers group by city;


--44. Write a query that calculates the amount of the salesperson’s commission on order by a customer with a rating above 100.00.
select sname,comm*amt from salespeople,ORDERS where snum in(select snum from customers where rating > 100)

--45. Count the customers with rating above San Jose’s average.


select count(city) from customers where rating >(select avg(rating) from customers where city='San Jose')
--46. Write a query that produces all pairs of salespeople with themselves as well as duplicate rows with the order reversed.
select count(city) from customers where rating >(select avg(rating) from customers where city='San Jose')


--47. Find all salespeople that are located in either Barcelona or London.

 select sname from salespeople1 where city='Barcelona' or city='London';
 
--48. Find all salespeople with only one customer.

select snum,sname from salespeople1 where snum in (select snum from customers where cnum in(select cnum from orders having count(cnum)=1 group by cnum));
--49. Write a query that joins the Customer table to itself to find all pairs of customers served by a single salesperson.

select c1.cname,c2.cname from customers c,customers c2 where c.snum=c2.snum and c.cname!=c2.cname;

---50. Write a query that will give you all orders for more than $1000.00.

select onum from orders where amt>1000;
--51. Write a query that lists each order number followed by the name of the customer who made that order.
select orders.onum,customers.cname from customers,orders where customers.cnum=orders.cnum;

--52. Write 2 queries that select all salespeople (by name and number) who have customers in their cities who they do not service, one using a join and one a correlated subquery. Which solution is more elegant?
select c.snum,s.snum from salespeople s,customers c where s.city=c.city group by c.snum,s.snum having c.snum!=s.snum

--53. Write a query that selects all customers whose ratings are equal than ANY (in the SQL sense) of Serres.
select cname from customers where rating >= ANY (select rating from customers where snum =(select snum from salespeople) where sname='Serres'))


--54. Write2 queries that will produce all orders taken on October3 or October 4.

select onum from orders where odate='03-oct-96' or odate='04-oct-96';


--55. Write a query that produces all pairs of orders by a given customer. Name that customer and eliminate duplicates.

select c.cname,o.onum from customers c,orders o where c.cnum=o.cnum group by c.cname,o.onum;

--56. Find only those customers whose ratings are higher than every customer in Rome.

select cname from customers where rating >(select max(rating) from customers where city='Rome');

--57. Write a query on the customers table whose output will exclude all customers with a rating < = 100.00, unless they are located in Rome.

select cname from customers where city='ROM' intersect select cname from customers where rating>=100;
SELECT CNAME FROM CUSTOMERS WHERE RATING>=100 AND CITY='ROME'
--58. Find all rows from the Customer table for which the salesperson number is 1001.
select * from customers where snum=1001;
SELECT SNAME,SNUM FROM SALESPEOPLE WHERE SNUM IN (
SELECT SNUM FROM ORDERS )
--59. Find the total amount in Orders for each salesperson for which this total is greater than 
--the amount of the largest order in the table.

select sum(amt),snum from orders having sum(amt)>max(amt) group by snum;
--60. Write a query that selects all orders that have Zeroes or NULL in the Amount field.
select onum from orders where amt is NULL or amt>0;

--61. Produce all combinations of salespeople and customer names such that
-- the former precedes the latter alphabetically, and the latter has a rating of less than 200.
select s.sname,c.cname,c.rating from customers c,salespeople s where c.rating<200 group by s.sname,c.cname,c.rating
 having c.cname>=s.sname;
select s.sname,c.cname from customers c,salespeople s where s.snum=c.snum group by s.s

--62. List all salespeople’s names and the commission they have earned.

select salespeople1.sname,sum(comm*amt*0.01) from salespeople1,orders where salespeople1.snum=orders.snum group by sname;


--63. Write a query that produces the names and cities of all customers with the same rating as Hoffman. Write the query using Hoffman’s CNUM rather than his rating, so that it would still be usable if his rating changed.
select cname,city from customers where rating in(select rating from customers where snum = (select snum from customers where cname='Hoffman'));

--64. Find all salespeople for whom there are customers that follow them in alphabetical order.

select s.sname,c.cname from customers c,salespeople1 s where s.snum=c.snum group by s.sname,c.cname having c.cname >= s.sname;

---65. Write a query that produces the names and ratings of all customers of all who have above average orders.
select cname,rating from customers where rating > (select avg(rating) from customers);

--66. Find the sum of all purchases from the Orders table.
 select sum(amt) from orders;

--67. Write a select command that produces the order number, amount, and date for all rows in the Order table. 
select onum,amt,odate from orders;

--68. Count the number of not null rating fields in the Customer table including duplicates.

select count(DISTINCT rating) from customers;

--69. Write a query that gives the names of both the salesperson and the customer for each order after the order number.

 select cname,sname,odate from salespeople1,customers,orders where salespeople1.snum=orders.snum and customers.cnum=orders.cnum;

--70. List the commissions of all salespeople servicing customers in London.
select sname,COMM from salespeople where snum in(select snum from customers where city='LONDON');

--71. Write a query using ANY or ALL that will find all salespeople who have no customers located in their city.
 select snum,sname from salespeople where sname not in(select sname from salespeople 
 where city = any (select city from customers));

--72. Write a query using the EXISTS operator that selects all salespeople with customers located in their cities 
--who are not assigned to them.
 select s.sname,city from salespeople s where exists(select * from customers c where c.snum!=s.snum and c.city=s.city);

--73. Write a query that selects all customers serviced by Peel or Motika.
select cname from customers where snum in (select snum from salespeople where sname='MONIKA'or sname='PEEL');

--74. Count the number of salespeople registering orders for each day. 
--(If a salesperson has more than one order on a given day, he or she should be counted only once.).
select count(distinct snum),odate from orders group by odate;

--75. Find all orders attributed to salespeople in London.
Select onum from orders where snum in(select snum from salespeople l where city ='London');

--76. Find all orders by customers not located in the same cities as their salespeople.
select onum from orders where cnum in(select distinct cnum from customers,salespeople 
where customers.city not in(select salespeople.city from salespeople ))

*--77. Find all salespeople who have customers with more than one current order.
select distinct snum from orders where cnum in(select cnum from orders group by cnum having count(cnum)>1);  

--78. Write a query that extracts from the Customer table every customer assigned to a salesperson 
--who currently has at least one other customer (besides the customer being selected) with orders in the Orders table.
select snum from customers group by snum having count(snum)>1;

---79. Write a query that selects all customers whose name begins with ‘C’.
select cname from customers where cname like 'C%';

----80. Write a query on the Customers table that will find the highest rating in each city.
-- Put the output in this form:  for the city (city) the highest rating is : (rating).
SELECT CITY, MAX(RATING)FROM CUSTOMERS GROUP BY CITY;

--81. Write a query that will produce the Snum values of all salespeople with orders currently in the Orders table 
--without any repeats.
SELECT DISTINCT SNUM FROM ORDERS ORDER BY AMT DESC

SELECT RATING,CNAME,CNUM FROM CUSTOMERS ORDER BY RATING DESC

--83. Find the average commission for salespeople in London.
SELECT AVG(COMM*amt*0.01) from SALESPEOPLE,ORDERS Where CITY='LONDON';

--84. Find all orders credited to the same salesperson that services Hoffman.
SELECT ONUM FROM ORDERS WHERE SNUM IN(SELECT SNUM FROM CUSTOMERS WHERE CNAME='HOFFMAN')

--85. Find all salespeople whose commission is in between 0.10 and 0.12 both inclusive.
SELECT SNAME FROM SALESPEOPLE WHERE COMM>=10 AND COMM<=12;

--. Write a query that will give you the names and cities of all salespeople in London with commission above 0.10
SELECT SNAME,CITY FROM SALESPEOPLE WHERE CITY='LONDON' AND COMM>10

--87. What will be the output from the following query? 
SELECT * FROM ORDERS WHERE (AMT < 1000 OR NOT (ODATE = 10/03/1996 AND CNUM > 2003));
--. Write a query that selects each customer’s smallest order  
SELECT CNUM,MIN(AMT)FROM ORDERS GROUP BY CNUM

--. Write a query that selects the first customer in alphabetical order whose name begins with ‘G’.
SELECT CNAME FROM CUSTOMERS WHERE CNAME LIKE 'G%' AND ROWNUM='1'

--. Write a query that counts the number of different not NULL city values in the Customers table.
SELECT COUNT (DISTINCT CITY)FROM CUSTOMERS 

--. Find the average amount from the Orders table.
SELECT AVG(AMT) FROM ORDERS 

--. What would be the output from the following query?



--93. Find all customers who are not located in San Jose & whose rating is above 200.

select * from customers where city not in ('Sanjose')
and rating>'200'


--94. Give a simpler way to write this query:
SELECT Snum, Sname, city, Comm FROM salespeople WHERE (Comm>12 and Comm <14);

--95. Evaluate the following query:
SELECT * FROM orders WHERE NOT ((Odate = '10-oct-96' AND Snum>1002) OR amt>2000);

--96. Which salespeople attend to customers not in the city they have been assigned to?

select s.*,c.* from salespeople s,customers c where
c.city!=s.city and s.snum=c.snum;---! to not

--97. Which salespeople get commission greater than 0.11 and serving customers rated less than 250?
select * from salespeople where comm>11 and snum in (select snumm from customers where rating <250)

--98. Which salespeople have been assigned to the same city but get different commission percentages?
select sname,comm,city from salespeople where city in(
select city from salespeople
group by city having count(city)!1 2);--->1
---99. Which salesperson has earned the most by way of commission?
SELECT SNAME,COMM FROM SALESPEOPLE WHERE COMM=(
select max(comm)from salespeople)


--100.  Does the customer who has placed the maximum number of orders have the maximum rating?
select max(rating) from customers where cnum in (select cnum from orders
 having count(onum) in (select max(count(onum))
  from orders group by cnum)group by CNUM);
cnum);
SELECT CNAME,ONUM,RATING FROM ORDERS,CUSTOMERS 
WHERE  RATING=(SELECT MAX(RATING)FROM CUSTOMERS WHERE ONUM=
(SELECT MAX(ONUM)FROM ORDERS))


--101.  Has the customer who has spent the largest amount of money been given the highest rating?
SELECT CNAME,AMT,RATING FROM ORDERS,CUSTOMERS WHERE AMT=
(SELECT MAX(AMT)FROM ORDERS WHERE RATING=(SELECT MAX(RATING)FROM CUSTOMERS))


--102.  List all customers in descending order of customer rating.
SELECT * FROM CUSTOMERS ORDER BY RATING DESC

--103.  On which days has Hoffman placed orders? 
SELECT O.ODATE,O.ONUM,C.CNAME FROM CUSTOMERS C JOIN ORDERS O ON C.CNUM=O.CNUM WHERE C.CNAME
= 'HOFFMAN'

--104.  Do all salespeople have different commissions?
SELECT COUNT ( SNAME),COUNT( COMM) FROM SALESPEOPLE
 
--105.  Which salespeople have no orders between 10/03/1996 and 10/05/1996?
 select sname from salespeople where snum in(select snum from orders where odate not in 
 (select odate from orders where odate between '10-oct-96' and '10-oct-96'))
 
--106.  How many salespersons have succeeded in getting orders?
select sname from salespeople where snum in(select snum from orders group by snum);

--107.  How many customers have placed orders?
select cname from customers where cnum in (select cnum from orders group by cnum)

--108.  On which date has each salesperson booked an order of maximum valuSe? 
select odate,snum,amt from orders where amt in(select max(amt)from orders group by snum)

--109.  Who is the most successful salesperson?
select * from (select sum(comm*amt*0.01)as amt,sname from salespeople,orders group by sname 
order by amt desc) where rownum<2

--110.  Who is the worst customer with respect to the company?
select a,c from(select sum(amt) as a,cnum as c from orders 
group by cnum order by a)where rownum=1;

--111.  Are all customers not having placed orders greater than 200 totally been serviced by salesperson Peel or Serres?
select sname,snum from salespeople where snum in(select snum from customers 
where rating>200) and sname!='peel' and sname!='serres';

--112.  Which customers have the same rating?
select c1.cname,c2.cname,c1.rating from customers c1,customers c2 where c1
.rating=c2.rating and c1.cname!=c2.cname order by c1.rating;

--113.  Find all orders greater than the average for October 4th.
select onum from orders where amt > (select avg(amt) from orders
 where odate='04-OCT-96');
 
 --114.  Which customers have above average orders? 
 select avg(count(cnum)) from orders group by cnum;
 
 --115.  List all customers with ratings above San Jose’s average.
 select cname from customers where rating >(select avg(rating) from customer
s where city='San Jose');
 
--116.  Select the total amount in orders for each salesperson for which the total is greater than the amount of the largest order in the table.

select cname from customers where rating >(select avg(rating) from customers
s where city='SAN JOSE');

--117.  Give names and numbers of all salesperson that have more than one customer.
select snum,sname from salespeople where snum in(select snum from customers
s group by snum having count(snum)>1);

--118.  Select all salesperson by name and numbers who have customers in their city whom they don’s the service. 
select s.sname,s.snum from salespeople s,customers c where s.city=c.city and s.snum!=c.snum;

--119.  Which customers’ rating should be lowered?
SELECT * FROM CUSTOMERS ORDER BY RATING ASC
select cname,rating from customers where rating =(select min(rating)from customers)
--120.  Is there a case for assigning a salesperson to Berlin?
select sname,SNUM from salespeople where snum in(select snum from customers where city='BERLIN');

--121.  Is there any evidence linking the performance of a salesperson to commission that he or she is being paid?
 select o.snum,(o.amt*s.comm)as total from salespeople s,orders o
where o.snum=s.snum group by o.snum;

--122.  Dose the total amount in orders by customer in Rome and London exceeds the commission paid to salesperson in London and New York by more than 5 times?


--123.  Which is the date, order number, amt and city for each salesperson (byname) for   the maximum order he has obtained?
select o.onum,o.snum,s.city,o.odate,o.amt from orders o,salespeople s 
where o.snum=s.snum and amt in(select max(amt) from orders group by snum) order by amt desc;


--124.  Which salesperson(s) should be fired?
select sname ,sum(amt) from salespeople c,orders o where c.snum=o.snum
 group by sname having sum(amt)=(select min(amt) from orders group by snum)

--125.  What is the total income for the company? 
select sum(amt)-sum(comm*amt*0.01) from salespeople join orders on salespeople.snum=orders.snum;

 Delete emp where rowid in (select max(rowid) from emp group by
empno,ename,mgr,job,hiredate,sal,comm,deptno);
select * from customer_tab
delete customer_tab where rowid in(select max(rowid) from customer_tab
 group by cname,cadd,c_creditdays,cj_date,sex)
 select *from employee_tab5 where (rowid,0) in (select rowid,mod(rownum,2) from employee_tab5);
 select mod(7,4), mod(1,5), mod(null,null), mod(0,0), mod(-7,4) from dual;
  select * from student; -- here for 3rd row marks value is null
 -- select nvl(0,0), nvl(1,1), nvl(null,null), nvl(4,4) from dual;
  --select ceil(5), ceil(5.1), ceil(-5), ceil( -5.1), ceil(0), ceil(null) from dual;
 -- select floor(5), floor(5.1), floor(-5), floor( -5.1), floor(0), floor(null) from dual;
-- select round(123.2345), round(123.2345,2), round(123.2354,2) from dual;
select round(123.2345), round(123.2345,2), round(123.2354,2) from dual;
select trunc(123.2345), trunc(123.2345,2), trunc(123.2354,2) from dual;
select upper('computer') from dual;
 select rpad('computer',15,'*'), rpad('computer',15,'*#') from dual;
select ltrim('computer','co'), ltrim('computer','com') from dual;
select rtrim('computer','er'), rtrim('computer','ter') from dual;
 select trim( 'i' from 'indiani') from dual;
 select replace('india','in','xy'), replace(‘india’,’in’,'xy') from dual;
 select replace('india','in','xy') from dual;
 select concat('computer',' operator') from dual;
 select 'how' || ' are' || ' you' from dual;
 
 select substr('computer',2), substr('computer',2,5), substr('computer',3,7) from
dual;
 
 
select greatest('a', 'b', 'c'), greatest('satish','srinu','saketh') from dual;
 
 select to_char(sysdate,'dd month yyyy hh:mi:ss am dy') from dual;
 
 select to_char(sysdate,'ddspth DDSPTH') from dual;
 
 select add_months(to_date('11-jan-1990','dd-mon-yyyy'), 5) from dual;
 select months_between(to_date('11-aug-1990','dd-mon-yyyy'), to_date('11-jan-
1990','dd-mon-yyyy')) from dual;
 
 select next_day(to_date('24-dec-2006','dd-mon-yyyy'),'sun') from dual;
 
select greatest(to_date('11-jan-99','dd-mon-yy'),to_date('11-mar-99','dd-monyy'),
to_date('11-apr-99','dd-mon-yy')) from dual; 
 Select sal,
Case sal
When 500 then ‘low’
When 5000 then ‘high’
Else ‘medium’
End case
From emp;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
