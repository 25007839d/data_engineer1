/* Assignment 1 */

CREATE TABLE Salespeople (
    Snum INT PRIMARY KEY,
    Sname VARCHAR(50),
    City VARCHAR(50),
    Comm DECIMAL(3,2)
);

INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES
(1001, 'Peel', 'London', 0.12), (1002, 'Serres', 'San Jose', 0.13),
(1003, 'Axelrod', 'New York', 0.10), (1004, 'Monika', 'London', 0.11),
(1005, 'Franc', 'London', 0.26), (1007, 'Rifkin', 'Barcelona', 0.15);

CREATE TABLE Customers (
    Cnum INT PRIMARY KEY,
    Cname VARCHAR(50),
    City VARCHAR(50),
    Rating INT,
    Snum INT,
    FOREIGN KEY (Snum) REFERENCES Salespeople(Snum)
);

INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES
(2001, 'Hoffman', 'London', 100, 1001), (2002, 'Giovanni', 'Rome', 200, 1003),
(2003, 'Liu', 'San Jose', 200, 1002), (2004, 'Grass', 'Berlin', 300, 1002),
(2006, 'Clemens', 'London', 100, 1001), (2007, 'Pereira', 'Rome', 100, 1004),
(2008, 'Cisneros', 'San Jose', 300, 1007);

CREATE TABLE ORDERS (
    Onum INT PRIMARY KEY,
    Amt DECIMAL(10,2),
    Odate VARCHAR(20), 
    Cnum INT,
    Snum INT,
    FOREIGN KEY (Cnum) REFERENCES Customers(Cnum),
    FOREIGN KEY (Snum) REFERENCES Salespeople(Snum)
);

INSERT INTO ORDERS (Onum, Amt, Odate, Cnum, Snum) VALUES
(3001, 18.69, '03-Oct-96 12:30', 2008, 1007), (3002, 1900.10, '03-Oct-96 12:05', 2007, 1004),
(3003, 767.19, '03-Oct-96 13:45', 2001, 1001), (3005, 5160.45, '03-Oct-96 14:00', 2003, 1002),
(3006, 1098.16, '03-Oct-96 13:37', 2008, 1007), (3007, 75.75, '04-Oct-96 16:02', 2002, 1003),
(3008, 4723.00, '05-Oct-96 12:07', 2006, 1001), (3009, 1713.23, '04-Oct-96 15:21', 2002, 1003),
(3010, 1309.95, '06-Oct-96 13:12', 2004, 1002), (3011, 9891.88, '06-Oct-96 13:09', 2006, 1001),
(3012, 3455.78, '04-Oct-96 15:21', 2002, 1003), (3013, 1245.98, '04-Oct-96 16:32', 2002, 1003),
(3014, 3721.53, '05-Oct-96 12:45', 2006, 1001), (3015, 734.50, '06-Oct-96 13:16', 2004, 1002),
(3016, 1729.67, '06-Oct-96 13:07', 2006, 1001);

/* 2. List all customers with a rating of 100. */
SELECT * FROM Customers WHERE Rating = 100;

/* 3. Find all records in the Customer table with NULL values in the city column. */
SELECT * FROM Customers WHERE City IS NULL;

/* 4. Find the largest order taken by each salesperson on each date. */
SELECT Snum, Odate, MAX(Amt) AS Largest_Order FROM ORDERS GROUP BY Snum, Odate;

/* 5. Arrange the Orders table by descending customer number. */
SELECT * FROM ORDERS ORDER BY Cnum DESC;

/* 6. Find which salespeople currently have orders in the Orders table. */
SELECT DISTINCT Snum FROM ORDERS;

/* 7. List names of all customers matched with the salespeople serving them. */
SELECT c.Cname AS Customer_Name, s.Sname AS Salesperson_Name FROM Customers c JOIN Salespeople s ON c.Snum = s.Snum;

/* 8. Find the names and numbers of all salespeople who had more than one customer. */
SELECT s.Snum, s.Sname FROM Salespeople s JOIN Customers c ON s.Snum = c.Snum GROUP BY s.Snum, s.Sname HAVING COUNT(c.Cnum) > 1;

/* 9. Count the orders of each of the salespeople and output the results in descending order. */
SELECT Snum, COUNT(Onum) AS Total_Orders FROM ORDERS GROUP BY Snum ORDER BY Total_Orders DESC;

/* 10. List the Customer table if and only if one or more of the customers in the Customer tables are located in San Jose. */
SELECT * FROM Customers WHERE EXISTS (SELECT 1 FROM Customers WHERE City = 'San Jose');

/* 11. Match salespeople to customers according to what city they lived in. */
SELECT s.Sname AS Salesperson, c.Cname AS Customer, s.City FROM Salespeople s JOIN Customers c ON s.City = c.City;

/* 12. Find the largest order taken by each salesperson. */
SELECT Snum, MAX(Amt) AS Largest_Order FROM ORDERS GROUP BY Snum;

/* 13. Find customers in San Jose who has a rating above 200. */
SELECT * FROM Customers WHERE City = 'San Jose' AND Rating > 200;

/* 14. List the names and commissions of all salespeople in London. */
SELECT Sname, Comm FROM Salespeople WHERE City = 'London';

/* 15. List all the orders of salesperson Monika from the Orders table. */
SELECT * FROM ORDERS WHERE Snum = (SELECT Snum FROM Salespeople WHERE Sname = 'Monika');

/* 16. Find all customers with orders on October 3. */
SELECT DISTINCT c.Cname, c.Cnum FROM Customers c JOIN ORDERS o ON c.Cnum = o.Cnum WHERE o.Odate LIKE '03-Oct-96%';

/* 17. Give the sums of the amounts from the orders table, grouped by date, Eliminating all those dates where the SUM was not at least 2000.00 above the MAX amount. */
SELECT SUBSTRING(Odate, 1, 9) AS Order_Date, SUM(Amt) AS Total_Sum FROM ORDERS GROUP BY SUBSTRING(Odate, 1, 9) HAVING SUM(Amt) >= MAX(Amt) + 2000.00;

/* 18. Select all orders that had amounts that were greater than at least one of the orders from October 6. */
SELECT * FROM ORDERS WHERE Amt > ANY (SELECT Amt FROM ORDERS WHERE Odate LIKE '06-Oct-96%');

/* 19. Write a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300. */
SELECT * FROM Salespeople s WHERE EXISTS (SELECT 1 FROM Customers c WHERE c.Snum = s.Snum AND c.Rating = 300);

/* 20. Find all pairs of customers having the same rating. */
SELECT c1.Cname AS Customer_1, c2.Cname AS Customer_2, c1.Rating FROM Customers c1 JOIN Customers c2 ON c1.Rating = c2.Rating AND c1.Cnum < c2.Cnum;

/* 21. Find all customers with CNUM, 1000 above the SNUM of Serres. */
SELECT * FROM Customers WHERE Cnum = (SELECT Snum + 1000 FROM Salespeople WHERE Sname = 'Serres');

/* 22. Give the salespeople’s commissions as percentage instead of decimal numbers. */
SELECT Sname, Comm * 100 AS Commission_Percentage FROM Salespeople;

/* 23. Find the largest order taken by each salesperson on each date, eliminating those MAX orders, which are less than $3000.00 in value. */
SELECT Snum, SUBSTRING(Odate, 1, 9) AS Order_Date, MAX(Amt) AS Largest_Order FROM ORDERS GROUP BY Snum, SUBSTRING(Odate, 1, 9) HAVING MAX(Amt) >= 3000.00;

/* 24. List the largest orders on October 3, for each salesperson. */
SELECT Snum, MAX(Amt) AS Largest_Order FROM ORDERS WHERE Odate LIKE '03-Oct-96%' GROUP BY Snum;

/* 25. Find all customers located in cities where Serres (SNUM 1002) has customers. */
SELECT * FROM Customers WHERE City IN (SELECT City FROM Customers WHERE Snum = 1002);

/* 26. Select all customers with a rating above 200.00. */
SELECT * FROM Customers WHERE Rating > 200;

/* 27. Count the number of salespeople currently listing orders in the Orders table. */
SELECT COUNT(DISTINCT Snum) AS Active_Salespeople FROM ORDERS;

/* 28. Write a query that produces all customers serviced by salespeople with a commission above 12%. */
SELECT c.* FROM Customers c JOIN Salespeople s ON c.Snum = s.Snum WHERE s.Comm > 0.12;

/* 29. Output the customer’s name and the salesperson‘s rate of commission. */
SELECT c.Cname AS Customer_Name, s.Comm AS Commission_Rate FROM Customers c JOIN Salespeople s ON c.Snum = s.Snum;

/* 30. Find salespeople who have multiple customers. */
SELECT s.Snum, s.Sname FROM Salespeople s JOIN Customers c ON s.Snum = c.Snum GROUP BY s.Snum, s.Sname HAVING COUNT(c.Cnum) > 1;

/* 31. Find salespeople with customers located in their city. */
SELECT Snum, Sname, City FROM Salespeople s WHERE EXISTS (SELECT 1 FROM Customers c WHERE c.City = s.City);

/* 32. Find all salespeople whose name starts with ‘P’ and the fourth character is ‘I’. */
SELECT * FROM Salespeople WHERE Sname LIKE 'P__i%';

/* 33. Write a query that uses a sub query to obtain all orders for the customer named ‘Cisneros’. */
SELECT * FROM ORDERS WHERE Cnum = (SELECT Cnum FROM Customers WHERE Cname = 'Cisneros');

/* 34. Find the largest orders for ‘Serres’ and ‘Rifkin’. */
SELECT s.Sname, MAX(o.Amt) AS Largest_Order FROM Salespeople s JOIN ORDERS o ON s.Snum = o.Snum WHERE s.Sname IN ('Serres', 'Rifkin') GROUP BY s.Sname;

/* 35. Extract the Salespeople table in the following order: SNUM, SNAME, COMMISSION, CITY. */
SELECT Snum, Sname, Comm AS Commission, City FROM Salespeople;

/* 36. Select all customers whose names fall in between ‘A’ and ‘G’ alphabetical range. */
SELECT * FROM Customers WHERE Cname >= 'A' AND Cname < 'H';

/* 37. Select all the possible combinations of customers that you can assign. */
SELECT c1.Cname AS Customer_1, c2.Cname AS Customer_2 FROM Customers c1 CROSS JOIN Customers c2;

/* 38. Select all orders that are greater than the average for October 4. */
SELECT * FROM ORDERS WHERE Amt > (SELECT AVG(Amt) FROM ORDERS WHERE Odate LIKE '04-Oct-96%');

/* 39. Write a select command using a correlated sub query that selects the names and numbers of all customers with ratings equal to the maximum for their city. */
SELECT Cnum, Cname, City, Rating FROM Customers c1 WHERE Rating = (SELECT MAX(Rating) FROM Customers c2 WHERE c1.City = c2.City);

/* 40. Write a query that totals the orders for each day and places the results in descending order. */
SELECT SUBSTRING(Odate, 1, 9) AS Order_Date, SUM(Amt) AS Total_Amount FROM ORDERS GROUP BY SUBSTRING(Odate, 1, 9) ORDER BY Total_Amount DESC;

/* 41. Write a select command that produces the rating followed by the name of each customer in San Jose. */
SELECT Rating, Cname FROM Customers WHERE City = 'San Jose';

/* 42. Find all orders with amounts smaller than any amount for a customer in San Jose. */
SELECT * FROM ORDERS WHERE Amt < ANY (SELECT o.Amt FROM ORDERS o JOIN Customers c ON o.Cnum = c.Cnum WHERE c.City = 'San Jose');

/* 43. Find all orders with above average amounts for their customers. */
SELECT * FROM ORDERS o1 WHERE Amt > (SELECT AVG(Amt) FROM ORDERS o2 WHERE o1.Cnum = o2.Cnum);

/* 44. Write a query that selects the highest rating in each city. */
SELECT City, MAX(Rating) AS Highest_Rating FROM Customers GROUP BY City;

/* 45. Write a query that calculates the amount of the salesperson’s commission on order by a customer with a rating above 100.00. */
SELECT o.Onum, s.Sname, c.Cname, o.Amt, s.Comm, (o.Amt * s.Comm) AS Commission_Earned FROM ORDERS o JOIN Customers c ON o.Cnum = c.Cnum JOIN Salespeople s ON o.Snum = s.Snum WHERE c.Rating > 100;

/* 46. Count the customers with rating above San Jose’s average. */
SELECT COUNT(Cnum) AS Customer_Count FROM Customers WHERE Rating > (SELECT AVG(Rating) FROM Customers WHERE City = 'San Jose');

/* 47. Write a query that produces all pairs of salespeople with themselves as well as duplicate rows with the order reversed. */
SELECT s1.Sname AS Salesperson_1, s2.Sname AS Salesperson_2 FROM Salespeople s1 CROSS JOIN Salespeople s2;

/* 48. Find all salespeople that are located in either Barcelona or London. */
SELECT * FROM Salespeople WHERE City IN ('Barcelona', 'London');

/* 49. Find all salespeople with only one customer. */
SELECT s.Snum, s.Sname FROM Salespeople s JOIN Customers c ON s.Snum = c.Snum GROUP BY s.Snum, s.Sname HAVING COUNT(c.Cnum) = 1;

/* 50. Write a query that joins the Customer table to itself to find all pairs of customers served by a single salesperson. */
SELECT c1.Cname AS Customer_1, c2.Cname AS Customer_2, c1.Snum AS Shared_Salesperson FROM Customers c1 JOIN Customers c2 ON c1.Snum = c2.Snum AND c1.Cnum < c2.Cnum;

/* 51. Write a query that will give you all orders for more than $1000.00. */
SELECT * FROM ORDERS WHERE Amt > 1000.00;

/* 52. Write a query that lists each order number followed by the name of the customer who made that order. */
SELECT o.Onum, c.Cname FROM ORDERS o JOIN Customers c ON o.Cnum = c.Cnum;

/* 53. Write 2 queries that select all salespeople who have customers in their cities who they do not service. */
-- Query 1: Join
SELECT DISTINCT s.Snum, s.Sname FROM Salespeople s JOIN Customers c ON s.City = c.City AND s.Snum != c.Snum;
-- Query 2: Correlated Subquery
SELECT Snum, Sname FROM Salespeople s WHERE EXISTS (SELECT 1 FROM Customers c WHERE c.City = s.City AND c.Snum != s.Snum);

/* 54. Write a query that selects all customers whose ratings are equal than ANY (in the SQL sense) of Serres. */
SELECT * FROM Customers WHERE Rating = ANY (SELECT Rating FROM Customers WHERE Snum = (SELECT Snum FROM Salespeople WHERE Sname = 'Serres'));

/* 55. Write 2 queries that will produce all orders taken on October 3 or October 4. */
-- Query 1: LIKE
SELECT * FROM ORDERS WHERE Odate LIKE '03-Oct-96%' OR Odate LIKE '04-Oct-96%';
-- Query 2: IN
SELECT * FROM ORDERS WHERE SUBSTRING(Odate, 1, 9) IN ('03-Oct-96', '04-Oct-96');

/* 56. Write a query that produces all pairs of orders by a given customer. Name that customer and eliminate duplicates. */
SELECT c.Cname, o1.Onum AS Order_1, o2.Onum AS Order_2 FROM ORDERS o1 JOIN ORDERS o2 ON o1.Cnum = o2.Cnum AND o1.Onum < o2.Onum JOIN Customers c ON o1.Cnum = c.Cnum;

/* 57. Find only those customers whose ratings are higher than every customer in Rome. */
SELECT * FROM Customers WHERE Rating > ALL (SELECT Rating FROM Customers WHERE City = 'Rome');

/* 58. Write a query on the customers table whose output will exclude all customers with a rating < = 100.00, unless they are located in Rome. */
SELECT * FROM Customers WHERE Rating > 100 OR City = 'Rome';

/* 59. Find all rows from the Customer table for which the salesperson number is 1001. */
SELECT * FROM Customers WHERE Snum = 1001;

/* 60. Find the total amount in Orders for each salesperson for which this total is greater than the amount of the largest order in the table. */
SELECT Snum, SUM(Amt) AS Total_Amount FROM ORDERS GROUP BY Snum HAVING SUM(Amt) > (SELECT MAX(Amt) FROM ORDERS);

/* 61. Write a query that selects all orders that have Zeroes or NULL in the Amount field. */
SELECT * FROM ORDERS WHERE Amt = 0 OR Amt IS NULL;

/* 62. Produce all combinations of salespeople and customer names such that the former precedes the latter alphabetically, and the latter has a rating of less than 200. */
SELECT s.Sname AS Salesperson_Name, c.Cname AS Customer_Name FROM Salespeople s CROSS JOIN Customers c WHERE s.Sname < c.Cname AND c.Rating < 200;

/* 63. List all salespeople’s names and the commission they have earned. */
SELECT Sname, Comm FROM Salespeople;

/* 64. Write a query that produces the names and cities of all customers with the same rating as Hoffman. */
SELECT Cname, City FROM Customers WHERE Rating = (SELECT Rating FROM Customers WHERE Cname = 'Hoffman');

/* 65. Write the query using Hoffman’s CNUM rather than his rating. */
SELECT Cname, City FROM Customers WHERE Rating = (SELECT Rating FROM Customers WHERE Cnum = 2001);

/* 66. Find all salespeople for whom there are customers that follow them in alphabetical order. */
SELECT Snum, Sname FROM Salespeople s WHERE EXISTS (SELECT 1 FROM Customers c WHERE c.Cname > s.Sname);

/* 67. Write a query that produces the names and ratings of all customers who have above average orders. */
SELECT DISTINCT c.Cname, c.Rating FROM Customers c JOIN ORDERS o ON c.Cnum = o.Cnum WHERE o.Amt > (SELECT AVG(Amt) FROM ORDERS);

/* 68. Find the sum of all purchases from the Orders table. */
SELECT SUM(Amt) AS Total_Purchases FROM ORDERS;

/* 69. Write a select command that produces the order number, amount, and date for all rows in the Order table. */
SELECT Onum, Amt, Odate FROM ORDERS;

/* 70. Count the number of not null rating fields in the Customer table including duplicates. */
SELECT COUNT(Rating) AS Total_Ratings FROM Customers;

/* 71. Write a query that gives the names of both the salesperson and the customer for each order after the order number. */
SELECT o.Onum, s.Sname AS Salesperson_Name, c.Cname AS Customer_Name FROM ORDERS o JOIN Salespeople s ON o.Snum = s.Snum JOIN Customers c ON o.Cnum = c.Cnum;

/* 72. List the commissions of all salespeople servicing customers in London. */
SELECT DISTINCT s.Comm FROM Salespeople s JOIN Customers c ON s.Snum = c.Snum WHERE c.City = 'London';

/* 73. Write a query using ANY or ALL that will find all salespeople who have no customers located in their city. */
SELECT * FROM Salespeople s WHERE NOT (s.City = ANY (SELECT c.City FROM Customers c WHERE c.Snum = s.Snum));

/* 74. Write a query using the EXISTS operator that selects all salespeople with customers located in their cities who are not assigned to them. */
SELECT * FROM Salespeople s WHERE EXISTS (SELECT 1 FROM Customers c WHERE c.City = s.City AND c.Snum != s.Snum);

/* 75. Write a query that selects all customers serviced by Peel or Motika (Monika). */
SELECT c.* FROM Customers c JOIN Salespeople s ON c.Snum = s.Snum WHERE s.Sname IN ('Peel', 'Motika', 'Monika');

/* 76. Count the number of salespeople registering orders for each day. */
SELECT SUBSTRING(Odate, 1, 9) AS Order_Date, COUNT(DISTINCT Snum) AS Salespeople_Count FROM ORDERS GROUP BY SUBSTRING(Odate, 1, 9);

/* 77. Find all orders attributed to salespeople in London. */
SELECT o.* FROM ORDERS o JOIN Salespeople s ON o.Snum = s.Snum WHERE s.City = 'London';

/* 78. Find all orders by customers not located in the same cities as their salespeople. */
SELECT o.* FROM ORDERS o JOIN Customers c ON o.Cnum = c.Cnum JOIN Salespeople s ON o.Snum = s.Snum WHERE c.City != s.City;

/* 79. Find all salespeople who have customers with more than one current order. */
SELECT DISTINCT s.Snum, s.Sname FROM Salespeople s JOIN Customers c ON s.Snum = c.Snum JOIN ORDERS o ON c.Cnum = o.Cnum GROUP BY s.Snum, s.Sname, c.Cnum HAVING COUNT(o.Onum) > 1;

/* 80. Write a query that extracts from the Customer table every customer assigned to a salesperson who currently has at least one other customer with orders. */
SELECT c1.* FROM Customers c1 WHERE EXISTS (SELECT 1 FROM ORDERS o JOIN Customers c2 ON o.Cnum = c2.Cnum WHERE c2.Snum = c1.Snum AND c2.Cnum != c1.Cnum);

/* 81. Write a query that selects all customers whose name begins with ‘C’. */
SELECT * FROM Customers WHERE Cname LIKE 'C%';

/* 82. Write a query on the Customers table that will find the highest rating in each city. */
SELECT City, MAX(Rating) AS Highest_Rating FROM Customers GROUP BY City;

/* 83. Put the output in this form: for the city (city) the highest rating is : (rating). */
SELECT 'for the city ' || City || ' the highest rating is : ' || MAX(Rating) AS Formatted_Output FROM Customers GROUP BY City;

/* 84. Write a query that will produce the Snum values of all salespeople with orders currently in the Orders table without any repeats. */
SELECT DISTINCT Snum FROM ORDERS;

/* 85. Write a query that lists customers in descending order of rating. */
SELECT * FROM Customers ORDER BY Rating DESC;

/* 86. Output the rating field first, followed by the customers’ names and numbers. */
SELECT Rating, Cname, Cnum FROM Customers ORDER BY Rating DESC;

/* 87. Find the average commission for salespeople in London. */
SELECT AVG(Comm) AS Average_Commission FROM Salespeople WHERE City = 'London';

/* 88. Find all orders credited to the same salesperson that services Hoffman. */
SELECT * FROM ORDERS WHERE Snum = (SELECT Snum FROM Customers WHERE Cname = 'Hoffman');

/* 89. Find all salespeople whose commission is in between 0.10 and 0.12 both inclusive. */
SELECT * FROM Salespeople WHERE Comm BETWEEN 0.10 AND 0.12;

/* 90. Write a query that will give you the names and cities of all salespeople in London with commission above 0.10. */
SELECT Sname, City FROM Salespeople WHERE City = 'London' AND Comm > 0.10;

/* 91. What will be the output from the following query? (Assuming date is parsed as a string). Evaluates to TRUE for all rows. */
-- SELECT * FROM ORDERS WHERE (AMT < 1000 OR NOT (ODATE = '10/03/1996' AND CNUM > 2003)); 
-- Returns all rows.

/* 92. Write a query that selects each customer’s smallest order. */
SELECT Cnum, MIN(Amt) AS Smallest_Order FROM ORDERS GROUP BY Cnum;

/* 93. Write a query that selects the first customer in alphabetical order whose name begins with ‘G’. */
SELECT * FROM Customers WHERE Cname LIKE 'G%' ORDER BY Cname ASC LIMIT 1;

/* 94. Write a query that counts the number of different not NULL city values in the Customers table. */
SELECT COUNT(DISTINCT City) AS Distinct_Cities FROM Customers WHERE City IS NOT NULL;

/* 95. Find the average amount from the Orders table. */
SELECT AVG(Amt) AS Average_Amount FROM ORDERS;

/* 96. What would be the output from the following query? (Simplifies to Amt >= 1500) */
-- SELECT * FROM ORDERS WHERE NOT (Odate ='10/03/1996' OR Snum>1006) AND amt >=1500;
-- Returns orders 3002, 3005, 3009, 3008, 3011, 3012, 3014, 3016.

/* 97. Find all customers who are not located in San Jose & whose rating is above 200. */
SELECT * FROM Customers WHERE City != 'San Jose' AND Rating > 200;

/* 98. Give a simpler way to write this query: SELECT Snum, Sname, city, Comm FROM salespeople WHERE (Comm>0.12 and Comm <0.14); */
SELECT Snum, Sname, City, Comm FROM Salespeople WHERE Comm = 0.13;

/* 99. Evaluate the following query. (Simplifies to Amt <= 2000) */
-- SELECT * FROM orders WHERE NOT ((Odate = '10/03/1996' AND Snum>1002) OR amt>2000);
-- Returns all orders <= 2000.

/* 100. Which salespeople attend to customers not in the city they have been assigned to? */
SELECT DISTINCT s.Snum, s.Sname FROM Salespeople s JOIN Customers c ON s.Snum = c.Snum WHERE s.City != c.City;

/* 101. Which customers’ rating should be lowered? (Customers with no orders) */
SELECT * FROM Customers WHERE Cnum NOT IN (SELECT DISTINCT Cnum FROM ORDERS);

/* 102. Is there a case for assigning a salesperson to Berlin? */
SELECT c.Cname, c.City FROM Customers c WHERE c.City = 'Berlin' AND NOT EXISTS (SELECT 1 FROM Salespeople s WHERE s.City = 'Berlin');

/* 103. Is there any evidence linking the performance of a salesperson to commission? */
SELECT s.Sname, s.Comm, COUNT(o.Onum) AS Total_Orders, COALESCE(SUM(o.Amt), 0) AS Total_Sales FROM Salespeople s LEFT JOIN ORDERS o ON s.Snum = o.Snum GROUP BY s.Sname, s.Comm ORDER BY Total_Sales DESC;

/* 104. Does the total amount in orders by customer in Rome/London exceed commission paid in London/New York by 5x? */
SELECT (SELECT SUM(o.Amt) FROM ORDERS o JOIN Customers c ON o.Cnum = c.Cnum WHERE c.City IN ('Rome', 'London')) AS Rome_London_Sales, (SELECT SUM(o.Amt * s.Comm) FROM ORDERS o JOIN Salespeople s ON o.Snum = s.Snum WHERE s.City IN ('London', 'New York')) AS Lon_NY_Commission;

/* 105. Which is the date, order number, amt and city for each salesperson for the maximum order? */
SELECT s.Sname, o.Odate, o.Onum, o.Amt, s.City FROM Salespeople s JOIN ORDERS o ON s.Snum = o.Snum WHERE o.Amt = (SELECT MAX(Amt) FROM ORDERS o2 WHERE o2.Snum = s.Snum);

/* 106. Which salesperson(s) should be fired? (Zero sales) */
SELECT Snum, Sname FROM Salespeople WHERE Snum NOT IN (SELECT DISTINCT Snum FROM ORDERS);

/* 107. What is the total income for the company? (Net revenue after commission) */
SELECT SUM(o.Amt) - SUM(o.Amt * s.Comm) AS Net_Company_Income FROM ORDERS o JOIN Salespeople s ON o.Snum = s.Snum;

/* 108. Which salespeople get commission greater than 0.11 and serving customers rated less than 250? */
SELECT DISTINCT s.Snum, s.Sname FROM Salespeople s JOIN Customers c ON s.Snum = c.Snum WHERE s.Comm > 0.11 AND c.Rating < 250;

/* 109. Which salespeople have been assigned to the same city but get different commission percentages? */
SELECT s1.Sname AS Salesperson_1, s2.Sname AS Salesperson_2, s1.City FROM Salespeople s1 JOIN Salespeople s2 ON s1.City = s2.City WHERE s1.Comm != s2.Comm AND s1.Snum < s2.Snum;

/* 110. Which salesperson has earned the most by way of commission? */
SELECT s.Snum, s.Sname, SUM(o.Amt * s.Comm) AS Total_Commission_Earned FROM Salespeople s JOIN ORDERS o ON s.Snum = o.Snum GROUP BY s.Snum, s.Sname ORDER BY Total_Commission_Earned DESC LIMIT 1;

/* 111. Does the customer who has placed the maximum number of orders have the maximum rating? */
SELECT c.Cnum, c.Cname, c.Rating, COUNT(o.Onum) AS Total_Orders FROM Customers c JOIN ORDERS o ON c.Cnum = o.Cnum GROUP BY c.Cnum, c.Cname, c.Rating ORDER BY Total_Orders DESC LIMIT 1;

/* 112. Has the customer who has spent the largest amount of money been given the highest rating? */
SELECT c.Cnum, c.Cname, c.Rating, SUM(o.Amt) AS Total_Amount_Spent FROM Customers c JOIN ORDERS o ON c.Cnum = o.Cnum GROUP BY c.Cnum, c.Cname, c.Rating ORDER BY Total_Amount_Spent DESC LIMIT 1;

/* 113. List all customers in descending order of customer rating. */
SELECT * FROM Customers ORDER BY Rating DESC;

/* 114. On which days has Hoffman placed orders? */
SELECT SUBSTRING(o.Odate, 1, 9) AS Order_Date FROM ORDERS o JOIN Customers c ON o.Cnum = c.Cnum WHERE c.Cname = 'Hoffman';

/* 115. Do all salespeople have different commissions? */
SELECT COUNT(Snum) AS Total_Salespeople, COUNT(DISTINCT Comm) AS Distinct_Commissions FROM Salespeople;

/* 116. Which salespeople have no orders between 10/03/1996 and 10/05/1996? */
SELECT * FROM Salespeople WHERE Snum NOT IN (SELECT Snum FROM ORDERS WHERE SUBSTRING(Odate, 1, 9) IN ('03-Oct-96', '04-Oct-96', '05-Oct-96'));

/* 117. How many salespersons have succeeded in getting orders? */
SELECT COUNT(DISTINCT Snum) AS Successful_Salespersons FROM ORDERS;

/* 118. How many customers have placed orders? */
SELECT COUNT(DISTINCT Cnum) AS Customers_With_Orders FROM ORDERS;

/* 119. On which date has each salesperson booked an order of maximum value? */
SELECT s.Sname, o.Odate, o.Amt AS Max_Order_Amount FROM Salespeople s JOIN ORDERS o ON s.Snum = o.Snum WHERE o.Amt = (SELECT MAX(Amt) FROM ORDERS o2 WHERE o2.Snum = s.Snum);

/* 120. Who is the most successful salesperson? */
SELECT s.Snum, s.Sname, SUM(o.Amt) AS Total_Sales_Generated FROM Salespeople s JOIN ORDERS o ON s.Snum = o.Snum GROUP BY s.Snum, s.Sname ORDER BY Total_Sales_Generated DESC LIMIT 1;

/* 121. Who is the worst customer with respect to the company? */
SELECT c.Cnum, c.Cname, SUM(o.Amt) AS Total_Spent FROM Customers c JOIN ORDERS o ON c.Cnum = o.Cnum GROUP BY c.Cnum, c.Cname ORDER BY Total_Spent ASC LIMIT 1;

/* 122. Are all customers not having placed orders greater than 200 totally been serviced by salesperson Peel or Serres? */
SELECT c.Cname, s.Sname AS Assigned_Salesperson FROM Customers c JOIN Salespeople s ON c.Snum = s.Snum WHERE c.Cnum NOT IN (SELECT Cnum FROM ORDERS WHERE Amt > 200);

/* 123. Which customers have the same rating? */
SELECT c1.Cname AS Customer_1, c2.Cname AS Customer_2, c1.Rating FROM Customers c1 JOIN Customers c2 ON c1.Rating = c2.Rating AND c1.Cnum < c2.Cnum;

/* 124. Select the total amount in orders for each salesperson for which the total is greater than the amount of the largest order in the table. */
SELECT Snum, SUM(Amt) AS Total_Order_Amount FROM ORDERS GROUP BY Snum HAVING SUM(Amt) > (SELECT MAX(Amt) FROM ORDERS);

/* 125. Give names and numbers of all salesperson that have more than one customer. */
SELECT s.Snum, s.Sname FROM Salespeople s JOIN Customers c ON s.Snum = c.Snum GROUP BY s.Snum, s.Sname HAVING COUNT(c.Cnum) > 1;

