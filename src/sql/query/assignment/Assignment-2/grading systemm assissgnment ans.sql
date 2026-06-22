SELECT * FROM CUSTOMER_TAB
SELECT * FROM VENDOR_TAB 
--SELECT * FROM EMPLOYEE_TAB4 
SELECT * FROM EMPLOYEE_TAB1
SELECT * FROM EMPLOYEE_TAB2
SELECT * FROM EMPLOYEE_TAB3
SELECT * FROM EMPLOYEE_TAB3
SELECT * FROM EMPLOYEE_TAB5--
---
SELECT * FROM SPAREPART_TAB;
SELECT * FROM PURCHASE_TAB
select * from ser_det_tab
alter  table ser_det_tab rename column eid_fk to eid_pk;


--Q.1  List all the customers serviced. 
select * FROM SER_DET_TAB
SELECT * FROM CUSTOMER_TAB

--Q.2  Customers who are not serviced.
select cid, ser_date from ser_det_tab where ser_date is NOT null;
SELECT * FROM CUSTOMER_TAB WHERE CID NOT IN (SELECT CID FROM ser_det_tab )
SELECT * FROM CUSTOMER_TAB,ser_det_tab where ser_date is not null;

--Q.3  Employees w have not received the commission.

select * from EMPLOYEE_TAB5 where eid_pk in ( select eid_pk from ser_det_tab  group by eid_pk having 0=SUM(comm));

select * from EMPLOYEE_TAB5 where eid_pk in ( select eid_pK from ser_det_tab  group by eid_pk,comm having 150>max(comm));


--Q.4  Name the employee who have maximum Commission....ccccc 
SELECT ENAME FROM EMPLOYEE_TAB5 WHERE EID_PK IN(SELECT EID_PK FROM SER_DET_TAB GROUP BY EID_PK HAVING 150> MAX(COMM))
 
--Q.5  Show employee name and minimum commission amount received by an employee.ccc

SELECT ENAME FROM EMPLOYEE_TAB5 WHERE EID_PK IN
(SELECT EID_PK FROM SER_DET_TAB GROUP BY EID_PK HAVING 0=MIN(COMM)) ORDER BY COMM ASC;

--Q.6  Display the Middle record from any table.
SELECT * FROM ser_det_tab WHERE ROWNUM <>(SELECT COUNT(*)/2 FROM SER_DET_TAB)
MINUS
SELECT * FROM SER_DET_TAB WHERE ROWNUM<=(SELECT COUNT(*)/2 FROM SER_DET_TAB)

SELECT * FROM ser_det_tab WHERE SID_PK NOT IN (6007,6001);
---ODD---

select * from ser_det_tab where rownum<(
select max(rownum) from ser_det_tab)
minus
select * from ser_det_tab where rownum<2





--Q.7  Display last 4 records of any table.
SELECT * FRom(select *from ser_det_tab order by sid_pk asc) f where rownum<3 order by
rownum asc

select * from 

(SELECT * FRom(select *from ser_det_tab order by sid_pk desc) f where  rownum <6 order by
rownum asc) where rownum<1 order by rownum desc
-------------------------------------------------------------
--Q.8  Count the number of records without count function from any table.ccc
SELECT C1.CNAME,C2.CID FROM CUSTOMER_TAB C1 INNER JOIN CUSTOMER_TAB C2 ON C1.CID=C2.CID 
SELECT * FROM CUSTOMER_TAB
--Q.9  Delete duplicate records from "Ser_det" table on cid.(note Please rollback after execution).------------------------------------------
DELETE FROM SER_DET_TAB WHERE CID IN(SELECT MAX(CID)FROM SER_DET_TAB GROUP BY SID_PK)
SELECT * FROM SER_DET_TAB

--Q.10 Show the name of Customer who have paid maximum amount   ccc
SELECT CNAME,CID FROM CUSTOMER_TAB WHERE  CID IN(SELECT CID FROM SER_DET_TAB WHERE TOTAL=
 (SELECT MAX(TOTAL) FROM SER_DET_TAB))

--Q.11 Display Employees who are not currently working.

select ENAME,EDOL_DATE from employee_tab5 where edol_date is  null;
----------------------------------------------------------
--Q.12 How many customers serviced their two wheelers.
 
select cid from ser_det_taB where typ_veh= 'TWO WHEELER' and ser_date is not null;


--Q.13 List the Purchased Items which are used for Customer Service with Unit of that Item.
--1st
select p.spid_pk, s.spname from 
SPAREPART_TAB s join PURCHASE_TAB p 
on s.spid_pk=p.spid_pk where p.pdate is not null; 
--2nd
select * FROM PURCHASE_TAB 

--Q.14 Customers who have Colored their vehicle

select c.cname,s.cid,s.typ_ser from ser_det_tab s inner join customer_tab c on s.cid=c.cid where s. typ_ser='COLOR';

select c.cname,s.cid,s.typ_ser from ser_det_tab s inner join customer_tab c on s.cid=c.cid where s. typ_ser='COLOR';

--Q.15 Find the annual income of each employee inclusive of Commission
select * from ser_det_tab;
select * from customer_tab
SELECT * FROM EMPLOYEE_TAB5

select e.ename,( e.esal+nvl(s.comm,0))income from  EMPLOYEE_TAB5 e LEFT JOIN ser_det_tab s on e.eid_pk=s.eid_pk 

--Q.16 Vendor Names who provides the engine oil;
SELECT * FROM PURCHASE_TAB
SELECT * FROM SER_DET_TAB
SELECT * FROM SPAREPART_TAB
SELECT * FROM VENDOR_TAB
select v.vname,P.spid_pk from VENDOR_TAB v inner join PURCHASE_TAB P on v.vid_pk=p.vid_fk
 
where Pqty='TWO WHEELER ENGINE OIL';

--Q.17 Total Cost to purchase the Color and name the color purchased

select s.total,s.cid,c.cname from ser_det_tab s join 
customer_tab c on s.cid=c.cid where s.typ_ser = 'COLOR';
--window function

WITH R AS (
SELECT SPID_PK, SUM(TOTAL) AS P_AMOUNT FROM PURCHASE_TAB WHERE SPID_PK IN (

SELECT SPID_PK FROM SPAREPART_TAB WHERE SPNAME LIKE '%UR' ) GROUP BY SPID_PK
)

SELECT S.SPID_PK,S.SPNAME,R.P_AMOUNT FROM SPAREPART_TAB S JOIN R
 ON R.SPID_PK=S.SPID_PK

WITH R AS(

E AS (
SELECT SPID_PK,SUM(TOTAL)AS AMOUNT FROM PURCHASE_TAB WHERE SPID_PK IN (


SELECT SPID_PK FROM SPAREPART_TAB WHERE SPNAME LIKE '%UR') GROUP BY SPID_PK

)
SELECT S.SPID_PK,S.SPNAME,R.AMOUNT FROM SPAREPART_TAB S 
JOIN R ON S.SPID_PK=R.SPID_PK 
)
SELECT VID_FK FROM SER_DET_TAB WHERE SPID_PK IN (SELECT SPID_PK FROM Rselect cid,eid_pk,total ,rank()  over(partition by eid_pk
 order by total desc) as total_amount from ser_det_tab 




--Q.18 Purchased Items which are not used in "Ser_det".

SELECT * FROM SPAREPART_TAB WHERE SPID_PK NOT IN  (
SELECT SPID_FK FROM ser_det_tab)

--Q.19 Spare Parts Not Purchased but existing in Sparepart
SELECT * FROM SPAREPART_TAB
SELECT * FROM PURCHASE_TAB
SELECT SPNAME FROM SPAREPART_TAB WHERE SPID_PK NOT IN (SELECT SPID_PK FROM PURCHASE_TAB)





--Q.20 Calculate the Profit/Loss of the Firm. Consider one month salary of each employee for Calculation.
SELECT * FROM EMPLOYEE_TAB5
SELECT ENAME,ESAL/12 AS "MONTHLY" FROM EMPLOYEE_TAB5
  

--Q.21 Specify the names of customers who have serviced their vehicles more than one time.
SELECT CNAME FROM CUSTOMER_TAB WHERE CID IN (SELECT CID FROM SER_DET_TAB WHERE TYP_VEH IN 
(SELECT TYP_VEH FROM SER_DET_TAB WHERE TYP_SER >=1))
SELECT *FROM SER_DET_TAB
SELECT *FROM CUSTOMER_TAB

---Q.22 List the Items purchased from vendors locationwise.

 


SELECT *FROM SPAREPART_TAB
SELECT *FROM VENDOR_TAB
--Q.23 Display count of two wheeler and four wheeler from ser_details
SELECT TYP_VEH,COUNT( TYP_VEH) FROM SER_DET_TAB GROUP BY TYP_VEH  

----Q24 Display name of customers who paid highest SPGST and for which it
WITH R AS( 
 
 SELECT C.CID,MAX (S.SP_G)AS GST FROM CUSTOMER_TAB C JOIN SER_DET_TAB S
  ON C.CID=S.CID GROUP BY C.CID )
 SELECT C.CNAME ,R.CID,GST FROM CUSTOMER_TAB C 
 JOIN R ON C.CID=R.CID
 ----
 WITH R AS( 
 
 SELECT C.CID,MAX (S.SP_G)AS GST FROM CUSTOMER_TAB C JOIN SER_DET_TAB S
  ON C.CID=S.CID GROUP BY C.CID )
 SELECT C.CNAME ,R.CID,GST FROM CUSTOMER_TAB C 
 JOIN R ON C.CID=R.CID
 
--Q25 Display vendors name who have charged highest SPGST rate  for which item 
SELECT MAX(SPGST),VID_FK FROM PURCHASE_TAB GROUP BY VID_FK

---Q26   list name of item and employee name who have received item 
SELECT PQTY,EID FROM PURCHASE_TAB 







 --Q27 Display the Name and Vehicle Number of Customer who serviced his vehicle, And Name the Item used for Service,
 -- And specify the purchase date of that Item with his vendor and Item Unit and Location, 
  +--And employee Name who serviced the vehicle. for Vehicle NUMBER "MH-14PA335".'
  SELECT CID,VEH_NO,EID_PK,SER_DATE FROM SER_DET_TAB WHERE VEH_NO='MH-14PA335'
SELECT CNAME FROM CUSTOMER_TAB WHERE CID=1004  
SELECT ENAME FROM EMPLOYEE_TAB5 WHERE EID_PK=3001

--Q28 who belong this vehicle  MH-14PA335" Display the customer name 

SELECT CNAME FROM CUSTOMER_TAB WHERE CID IN
(SELECT CID FROM SER_DET_TAB WHERE VEH_NO ='MH-14PA335')

--Q29 Display the name of customer who belongs to New York and when 
--he /she service their  vehicle on which date 
SELECT C.CNAME,S.CID,S.SER_DATE FROM CUSTOMER_TAB C JOIN SER_DET_TAB S
 ON C.CID=S.CID
AND(SELECT SER_DATE FROM SER_DET_TAB)
   
--Q 30 from whom we have purchased items having maximum cost
  select sid_pk,typ_veh,sp_rate from ser_det_tab where sp_rate in
   (select max(sp_rate)from ser_det_tab group by sid_pk)
  
   
--31 Display the names of employees who are not working as Mechanic and that employee done services 
select ename from employee_tab5 where Ejob not in ('MECHANIC')
  .
--Q32 Display the various jobs along with total number of employees in each job. The output should
SELECT EJOB,COUNT(ENAME) FROM EMPLOYEE_TAB5 GROUP BY EJOB HAVING COUNT(EJOB)>2

contain only those jobs with more than two employees.
---Q33 Display the details of employees who done service  and give them rank according to their no. of services .
SELECT EID_PK FROM SER_DET_TAB ORDER BY EID_PK DESC
SELECT ENAME,EID_pK,EJOB,EADD,ESAL FROM EMPLOYEE_TAB5 ORDER BY ESAL DESC
--Q 34 Display those employees who are working as Painter and fitter and who provide service and total count of service done by fitter and painter 
SELECT EJOB,COUNT(EJOB) FROM EMPLOYEE_TAB5 GROUP BY EJOB HAVING COUNT(EJOB)>1
 
  
--Q35 Display employee salary and as per highest  salary provide Grade to employee 
SELECT ENAME,ESAL FROM EMPLOYEE_TAB5 WHERE ESAL IN(SELECT MAX(ESAL)FROM EMPLOYEE_TAB5)

--Q36  display the 4th record of emp table without using group by and rowid
SELECT ENAME, ESAL,EID_PK FROM EMPLOYEE_TAB5 ORDER BY EID_PK ASC

---Q37 Provide a commission 100 to employees who are not earning any commission. 
SELECT ENAME,((ESAL*COMM)/100)AS TOTAL FROM EMPLOYEE_TAB5 WHERE COMM IS NULL

---Q38 write a query that totals no. of services  for each day and place the results
SELECT SER_DATE,COUNT(SID_PK),SUM(QTY) FROM SER_DET_TAB GROUP BY SER_DATE ORDER BY SER_DATE DESC

in descending order
--Q39 Display the service details of those customer who belong from same city 
SELECT  C1.CNAME,C2,C2.CADD FROM CUSTOMER_TAB C1,CUSTOMER_TAB C2 WHERE C1.CADD =C2.CADD 


Q40 write a query join customers table to itself to find all pairs of
customers service by a single employee



---Q41 List each service number follow by name of the customer who
--made  that service
SELECT CNAME FROM CUSTOMER_TAB WHERE CID IN
(SELECT CID FROM SER_DET_TAB WHERE SID_PK IN (SELECT SID_PK FROM SER_DET_TAB))

--Q42 Write a query to get details of employee and provide rating on basis of 
-- maximum services provide by employee  .Note (rating should be like A,B,C,D)
SELECT 


--Q43 Write a query to get maximum service amount of each customer with their customer details ?
SELECT C. CNAME,S.SER_AMT,C.CID FROM CUSTOMER_TAB C,SER_DET_TAB S WHERE C.CID=S.CID
SELECT CID, SER_AMT FROM SER_DET_TAB ORDER BY SER_AMT DESC 


--Q44 Get the details of customers with his total no of services ?
SELECT CID,COUNT(QTY)FROM SER_DET_TAB GROUP BY CID 
SELECT CID,QTY FROM SER_DET_TAB


--Q45 From which location sparpart purchased  with highest cost ?  

SELECT E.EID_pK,E.EADD,S.SP_RATE FROM EMPLOYEE_TAB5 E JOIN SER_DET_TAB S ON E.EID_PK=S.EID_PK


--Q46 Get the details of employee with their service details who has salary is null
SELECT ENAME,EJOB,ESAL FROM EMPLOYEE_TAB5 WHERE ESAL IS NULL

--Q47 find the sum of purchase location wise
SELECT * FROM ORDERS
SELECT * FROM CUSTOMER_TAB
SELECT *FROM PURCHASE_TAB

 SELECT CADD,AMT FROM CUSTOMER_TAB,ORDERS WHERE CNUM IN (SELECT CNUM FROM ORDERS WHERE AMT IN 
 (SELECT SUM(AMT) FROM ORDERS ))
----Q48 write a query sum of purchase amount in word location wise ? 

SELECT 

---Q49 Has the customer who has spent the largest amount money hasbeen give highest rating
SELECT CNUM,MAX(AMT)FROM ORDERS GROUP BY CNUM HAVING MAX(RATING)WHERE CID IN (SELECT CID FROM SER_DET_TAB  )

SELECT *FROM SER_DET_TAB


Q50 select the total amount in service for each customer for which
the total is greater than the amount of the largest service amount in the table
Q51  List the customer name and sparepart name used for their vehicle and  vehicle type
Q52 Write a query to get spname ,ename,cname quantity ,rate ,service amount for record exist in service table 
Q53 specify the vehicles owners who’s tube damaged.
Q.54 Specify the details who have taken full service.
Q.55 Select the employees who have not worked yet and left the job.
Q.56  Select employee who have worked first ever.
Q.57 Display all records falling in odd date
Q.58 Display all records falling in even date
Q.59 Display the vendors whose material is not yet used.
Q.60 Difference between purchase date and used date of spare part
SELECT TO_CHAR BETWEEN 01-01-2011 AND
