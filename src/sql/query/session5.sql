--Oracle default date format is DD-MON-YY.
--We can change the default format to our desired format by using the following command.
--SQL> alter session set nls_date_format = ‘DD-MONTH-YYYY’;
--But this will expire once the session was closed.

--SYSDATE
--This will give the current date and time.
--Ex:
SQL> select sysdate from dual;

--CURRENT_DATE
--This will returns the current date in the session’s timezone.
--Ex:
SQL> select current_date from dual;


--CURRENT_TIMESTAMP
--This will returns the current timestamp with the active time zone information.
--Ex:
SQL> select current_timestamp from dual;

--SYSTIMESTAMP
--This will returns the system date, including fractional seconds and time zone of the
--database.
--Ex:
SQL> select systimestamp from dual;
12-07-25 12:36:11.209000000 PM ASIA/CALCUTTA
12-07-25 12:36:45.535000000 PM +05:30
--
--TO_CHAR
--This will be used to extract various date formats.
--The available date formats as follows.
--Syntax: to_char (date, format)


DATE FORMATS
D -- No of days in week
DD -- No of days in month
DDD -- No of days in year
MM -- No of month
MON -- Three letter abbreviation of month
MONTH -- Fully spelled out month
RM -- Roman numeral month
DY -- Three letter abbreviated day
DAY -- Fully spelled out day
Y -- Last one digit of the year
YY -- Last two digits of the year
IW -- No of weeks in year from ISO standard
HH -- Hours
MI -- Minutes

--Ex:
SQL> select to_char(sysdate,'dd month yyyy hh:mi:ss am dy') from dual;

SQL> select to_char(sysdate,'dd month yyyy hh:mi:ss am dy') from dual;
--TO_CHAR(SYSDATE,'DD MONTH YYYYHH:MI

SQL> select odate,to_char(odate,'dd month year') as d from orders;
--TO_CHAR(SYSDATE,'DDMONTHYEAR’)

SQL> select to_char(sysdate,'dd fmmonth year') from dual;
--TO_CHAR(SYSDATE,'DD FMMONTH YEAR’)

SQL> select to_char(sysdate,'ddth DDTH') from dual;


SQL> select to_char(sysdate,'ddspth DDSPTH') from dual;
--TO_CHAR(SYSDATE,'DDSPTHDDSPTH

SQL> select to_char(sysdate,'ddsp Ddsp DDSP ') from dual;
--TO_CHAR(SYSDATE,'DDSPDDSPDDSP’)



--TO_DATE
--
--This will be used to convert the string into data format.
--Syntax: to_date (date)
--Ex:
select to_date('24/dec/2006','dd/mon/yyyy') from
dual;

SQL> select to_char(to_date('24/dec/2006','dd/mon/yyyy'), 'dd * month * day') from
dual;

'DD-Mon-YYYY HH24:MI')

select odate,add_months(odate,2) from orders

select odate,add_months(odate,2) from orders1

select add_months(to_date(odate,'DD-Mon-YYYY HH24:MI'),2) from
orders1;
Note-- If you are not using to_char oracle will display output in default date format.


--ADD_MONTHS
--This will add the specified months to the given date.
--
--Syntax: add_months (date, no_of_months)
--Ex:
SQL> select add_months(to_date('11-jan-1990','dd-mon-yyyy'), 5) from dual;

select add_months(odate,2) from orders


CREATE TABLE orders1 (
    Onum    NUMBER(10, 2) ,
    Odate  VARCHAR2(100));

INSERT INTO orders1 (Onum, Odate) VALUES (3001,'03-Oct-1996 12:30');
INSERT INTO orders1 (Onum,  Odate) VALUES (3003,'03-Oct-1996 12:30');
INSERT INTO orders1 (Onum, Odate) VALUES (3002, '03-Oct-1996 12:30');
INSERT INTO orders (Onum, Amt, Odate, Cnum, Snum) VALUES (3005, 5160.45, TO_DATE('03-Oct-1996 14:00', 'DD-Mon-YYYY HH24:MI'), 2003, 1002);
INSERT INTO orders (Onum, Amt, Odate, Cnum, Snum) VALUES (3006, 1098.16, TO_DATE('03-Oct-1996 13:37', 'DD-Mon-YYYY HH24:MI'), 2008, 1007);

select * from orders1
--ADD_MONTHS
--This will add the specified months to the given date.
--
--Syntax: add_months (date, no_of_months)
--Ex:
SQL> select add_months(to_date('11-jan-1990','dd-mon-yyyy'), 5) from dual;
select add_months(to_date(odate,'dd-mm-yy'), 5) from orders;

SQL> select add_months(to_date('11-jan-1990','dd-mon-yyyy'), -5) from dual;
--ADD_MONTH
--
--If no_of_months is zero then it will display the same date.
--If no_of_months is null then it will display nothing.


--MONTHS_BETWEEN
--This will give difference of months between two dates.
--Syntax: months_between (date1, date2)
--Ex:
SQL> select months_between(to_date('11-aug-1990','dd-mon-yyyy'), to_date('11-jan-
1990','dd-mon-yyyy')) from dual;


--Next day 

SELECT TO_DATE('24-dec-2006', 'dd-mon-yyyy')+ 1  AS next_day
FROM dual;


--NEXT_DAY
--This will produce next day of the given day from the specified date.
--Syntax: next_day (date, day)
--Ex:
SQL> select next_day(to_date('12-jul-2025','dd-mon-yyyy'),'sun') from dual;


--LAST_DAY
--This will produce last day of the month.
--Syntax: last_day (date)
--Ex:
SELECT LAST_DAY(TO_DATE('24-dec-2006','dd-mon-yyyy')) FROM dual;


--EXTRACT
--This is used to extract a portion of the date value.
--Syntax: extract ((year | month | day | hour | minute | second), date)
--Ex:
SQL> select extract(year from sysdate) from dual;
select extract(year from sysdate) from dual;

select extract(month from sysdate) from dual;

select extract(day from sysdate) from dual;

select extract(hour from current_timestamp) from dual;
select extract(minute from current_timestamp) from dual;
select extract(second from current_timestamp) from dual;


Note-- You can extract only one value at a time.


--GREATEST
--This will give the greatest date.
--Syntax: greatest (date1, date2, date3 … daten)
--Ex:
SELECT GREATEST(
  TO_DATE('11-jan-90','dd-mon-yy'),
  TO_DATE('11-mar-90','dd-mon-yy'),
  TO_DATE('11-apr-90','dd-mon-yy')
) AS latest_date
FROM dual;



--LEAST
--This will give the least date.
--Syntax: least (date1, date2, date3 … daten)
--Ex:
SELECT LEAST(
  TO_DATE('11-jan-90','dd-mon-yy'),
  TO_DATE('11-mar-90','dd-mon-yy'),
  TO_DATE('11-apr-90','dd-mon-yy')
) AS latest_date
FROM dual;



--ROUND
--Round will rounds the date to which it was equal to or greater than the given date.
--Syntax: round (date, (day | month | year))

SQL> select round(to_date('24-dec-04','dd-mon-yy'),'year'), round(to_date('11-mar-
06','dd-mon-yy'),'year') from dual;
SQL> select round(to_date('11-jan-04','dd-mon-yy'),'month'), round(to_date('18-jan-
04','dd-mon-yy'),'month') from dual;
SQL> select round(to_date('26-dec-06','dd-mon-yy'),'day'), round(to_date('29-dec-
06','dd-mon-yy'),'day') from dual;
select to_char(round(to_date('24-dec-06','dd-mon-yy')), 'dd mon yyyy hh:mi:ss am')
from dual;


--TRUNC
--Trunc will chops off the date to which it was equal to or less than the given date.
--Syntax: trunc (date, (day | month | year))


SQL> select trunc(to_date('24-dec-04','dd-mon-yy'),'year'), trunc(to_date('11-mar-
06','dd-mon-yy'),'year') from dual;

SQL> select trunc(to_date('11-jan-04','dd-mon-yy'),'month'), trunc(to_date('18-jan-
04','dd-mon-yy'),'month') from dual;



 SELECT
  TRUNC(TO_DATE('26-dec-06','dd-mon-yy'),'day'),
  TRUNC(TO_DATE('29-dec-06','dd-mon-yy'),'day')
FROM dual;



SQL> select to_char(trunc(to_date('24-dec-06','dd-mon-yy')), 'dd mon yyyy hh:mi:ss am')
from dual;


--NEW_TIME
--This will give the desired timezone’s date and time.
--Syntax: new_time (date, current_timezone, desired_timezone)

SQL> select new_time(sysdate,'gmt','yst') from dual;



--COALESCE
--This will give the first non-null date.
--Syntax: coalesce (date1, date2, date3 … daten)
--Ex:
SQL> select coalesce('12-jan-90','13-jan-99'), coalesce(null,null,null,'na')
from dual;

select to_date('24-dec-04','dd-mon-yy') - to_date('24-jan-04','dd-mon-yy') from dual
--UID
--This will returns the integer value corresponding to the user currently logged in.
--Ex:
SQL> select uid from dual;


--USER
--This will returns the login’s user name.
--Ex:
SQL> select user from dual;


VSIZE
This will returns the number of bytes in the expression.
Ex:
SQL> select vsize(123), vsize('computer'), vsize('12-jan-90') from dual;


--RANK
--This will give the non-sequential ranking.
--Ex:
SQL> SELECT rownum, onum, odate
FROM (
  SELECT onum, odate
  FROM orders
) ;

SELECT 
  RANK() OVER ( ORDER BY onum DESC) AS rank,
  onum,
  odate
FROM orders;


--DENSE_RANK
--This will give the sequential ranking.
--Ex:
SELECT 
  DENSE_RANK() OVER (ORDER BY odate DESC) AS rank,
  onum,
  odate
FROM orders;



--BIN_TO_NUM
--This will convert the binary value to its numerical equivalent.
--Syntax: bin_to_num( binary_bits)
--Ex:
SQL> select bin_to_num(1,1,0) from dual;
