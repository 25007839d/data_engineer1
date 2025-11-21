CREATE TABLE salespeople (
    Snum INT PRIMARY KEY,
    Sname VARCHAR2(50),
    City VARCHAR2(50),
    Comm NUMBER(4, 2)  -- Commission as a decimal (e.g., .12)
);

INSERT INTO salespeople (Snum, Sname, City, Comm) VALUES (1001, 'Peel', 'London', 0.12);
INSERT INTO salespeople (Snum, Sname, City, Comm) VALUES (1002, 'Serres', 'San Jose', 0.13);
INSERT INTO salespeople (Snum, Sname, City, Comm) VALUES (1004, 'Monika', 'London', 0.11);
INSERT INTO salespeople (Snum, Sname, City, Comm) VALUES (1007, 'Rifkin', 'Barcelona', 0.15);
INSERT INTO salespeople (Snum, Sname, City, Comm) VALUES (1003, 'Axelrod', 'New York', 0.10);
INSERT INTO salespeople (Snum, Sname, City, Comm) VALUES (1005, 'Franc', 'London', 0.26);


CREATE TABLE customers (
    Cnum   INT PRIMARY KEY,
    Cname  VARCHAR2(50),
    City   VARCHAR2(50),
    Rating INT,
    Snum   INT,
    CONSTRAINT fk_salesperson_customers FOREIGN KEY (Snum) REFERENCES salespeople(Snum)
);

INSERT INTO customers (Cnum, Cname, City, Rating, Snum) VALUES (2001, 'Hoffman', 'London', 100, 1001);
INSERT INTO customers (Cnum, Cname, City, Rating, Snum) VALUES (2002, 'Giovanni', 'Rome', 200, 1003);
INSERT INTO customers (Cnum, Cname, City, Rating, Snum) VALUES (2003, 'Liu', 'San Jose', 200, 1002);
INSERT INTO customers (Cnum, Cname, City, Rating, Snum) VALUES (2004, 'Grass', 'Berlin', 300, 1002);
INSERT INTO customers (Cnum, Cname, City, Rating, Snum) VALUES (2006, 'Clemens', 'London', 100, 1001);
INSERT INTO customers (Cnum, Cname, City, Rating, Snum) VALUES (2008, 'Cisneros', 'San Jose', 300, 1007);
INSERT INTO customers (Cnum, Cname, City, Rating, Snum) VALUES (2007, 'Pereira', 'Rome', 100, 1004);


CREATE TABLE orders (
    Onum   INT PRIMARY KEY,
    Amt    NUMBER(10, 2),
    Odate  DATE,
    Cnum   INT,
    Snum   INT,
    CONSTRAINT fk_customer FOREIGN KEY (Cnum) REFERENCES customers(Cnum),
    CONSTRAINT fk_salesperson FOREIGN KEY (Snum) REFERENCES salespeople(Snum)
);

drop table orders

INSERT INTO orders (Onum, Amt, Odate, Cnum, Snum) VALUES (3001, 18.69, TO_DATE('03-Oct-1996 12:30', 'DD-Mon-YYYY HH24:MI'), 2008, 1007);
INSERT INTO orders (Onum, Amt, Odate, Cnum, Snum) VALUES (3003, 767.19, TO_DATE('03-Oct-1996 13:45', 'DD-Mon-YYYY HH24:MI'), 2001, 1001);
INSERT INTO orders (Onum, Amt, Odate, Cnum, Snum) VALUES (3002, 1900.10, TO_DATE('03-Oct-1996 12:05', 'DD-Mon-YYYY HH24:MI'), 2007, 1004);
INSERT INTO orders (Onum, Amt, Odate, Cnum, Snum) VALUES (3005, 5160.45, TO_DATE('03-Oct-1996 14:00', 'DD-Mon-YYYY HH24:MI'), 2003, 1002);
INSERT INTO orders (Onum, Amt, Odate, Cnum, Snum) VALUES (3006, 1098.16, TO_DATE('03-Oct-1996 13:37', 'DD-Mon-YYYY HH24:MI'), 2008, 1007);
INSERT INTO orders (Onum, Amt, Odate, Cnum, Snum) VALUES (3009, 1713.23, TO_DATE('04-Oct-1996 15:21', 'DD-Mon-YYYY HH24:MI'), 2002, 1003);
INSERT INTO orders (Onum, Amt, Odate, Cnum, Snum) VALUES (3007, 75.75,  TO_DATE('04-Oct-1996 16:02', 'DD-Mon-YYYY HH24:MI'), 2002, 1003);
INSERT INTO orders (Onum, Amt, Odate, Cnum, Snum) VALUES (3008, 4723.00, TO_DATE('05-Oct-1996 12:07', 'DD-Mon-YYYY HH24:MI'), 2006, 1001);
INSERT INTO orders (Onum, Amt, Odate, Cnum, Snum) VALUES (3010, 1309.95, TO_DATE('06-Oct-1996 13:12', 'DD-Mon-YYYY HH24:MI'), 2004, 1002);
INSERT INTO orders (Onum, Amt, Odate, Cnum, Snum) VALUES (3011, 9891.88, TO_DATE('06-Oct-1996 13:09', 'DD-Mon-YYYY HH24:MI'), 2006, 1001);
INSERT INTO orders (Onum, Amt, Odate, Cnum, Snum) VALUES (3012, 3455.78, TO_DATE('04-Oct-1996 15:21', 'DD-Mon-YYYY HH24:MI'), 2002, 1003);
INSERT INTO orders (Onum, Amt, Odate, Cnum, Snum) VALUES (3013, 1245.98, TO_DATE('04-Oct-1996 16:32', 'DD-Mon-YYYY HH24:MI'), 2002, 1003);
INSERT INTO orders (Onum, Amt, Odate, Cnum, Snum) VALUES (3014, 3721.53, TO_DATE('05-Oct-1996 12:45', 'DD-Mon-YYYY HH24:MI'), 2006, 1001);
INSERT INTO orders (Onum, Amt, Odate, Cnum, Snum) VALUES (3015, 734.50,  TO_DATE('06-Oct-1996 13:16', 'DD-Mon-YYYY HH24:MI'), 2004, 1002);
INSERT INTO orders (Onum, Amt, Odate, Cnum, Snum) VALUES (3016, 1729.67, TO_DATE('06-Oct-1996 13:07', 'DD-Mon-YYYY HH24:MI'), 2006, 1001);


select * from orders

---------------------------

--Absolute value is the measure of the magnitude of value.
--Absolute value is always a positive number.
--Syntax: abs (value)
--Ex:--
SQL> select abs(5), abs(-5), abs(0), abs(null) from dual;

--SIGN
--Sign gives the sign of a value.
--Syntax: sign (value)
--Ex:
SQL> select sign(5), sign(-5), sign(0), sign(null) from dual;

--MOD
--This will give the remainder.
--Syntax: mod (value, divisor)
--Ex:
SQL> select mod(7,4), mod(1,5), mod(null,null), mod(0,0), mod(-7,4) from dual;

--NVL
--This will substitutes the specified value in the place of null values.
--Syntax: nvl (null_col, replacement_value)
--Ex:
SQL> select * from student; 
SQL> select nvl(1,2), nvl(2,3), nvl(4,3), nvl(5,4) from dual;
SQL> select nvl(0,0), nvl(1,1), nvl(null,null), nvl(4,4) from dual;


--POWER
--Power is the ability to raise a value to a given exponent.
--Syntax: power (value, exponent)
--Ex:
SQL> select power(2,5), power(0,0), power(1,1), power(null,null), power(2,-5) from
dual;


---EXP
--This will raise e value to the give power.
--Syntax: exp (value)
--Ex:
SQL> select exp(1), exp(2), exp(0), exp(null), exp(-2) from dual;


--LN
--This is based on natural or base e logarithm.
--Syntax: ln (value) -- here value must be greater than zero which is positive only.
--Ex:
SQL> select ln(1), ln(2), ln(null) from dual;

--LOG
--This is based on 10 based logarithm.
--Syntax: log (10, value) -- here value must be greater than zero which is positive only.
--Ex:
SQL> select log(10,100), log(10,2), log(10,1), log(10,null) from dual;
SQL> select ln(3), log(exp(1),3) from dual;

--CEIL
--This will produce a whole number that is greater than or equal to the specified value.
--Syntax: ceil (value)
--Ex:
SQL> select ceil(5), ceil(5.1), ceil(-5), ceil( -5.1), ceil(0), ceil(null) from dual;

--FLOOR
---This will produce a whole number that is less than or equal to the specified value.
--Syntax: floor (value)
--Ex:
SQL> select floor(5), floor(5.1), floor(-5), floor( -5.1), floor(0), floor(null) from dual;

--ROUND
--This will rounds numbers to a given number of digits of precision.
--Syntax: round (value, precision)
--Ex:
SQL> select round(123.2345), round(123.2345,2), round(123.2354,2) from dual;
SQL> select round(123.2345,-1), round(123.2345,-2), round(123.2345,-3),
round(123.2345,-4) from dual;
SQL> select round(123,0), round(123,1), round(123,2) from dual;
select round(123,-1), round(123,-2), round(123,-3), round(-123,-1), round(-123,-
2), round(-123,-3) from dual;

--TRUNC
--This will truncates or chops off digits of precision from a number.
--Syntax: trunc (value, precision)
--Ex:
SQL> select trunc(123.2345), trunc(123.2345,2), trunc(123.2354,2) from dual;
SQL> select trunc(123.2345,-1), trunc(123.2345,-2), trunc(123.2345,-3),
trunc(123.2345,-4) from dual;
SQL> select trunc(123,0), trunc(123,1), trunc(123,2) from dual;



--GREATEST
--This will give the greatest number.
--Syntax: greatest (value1, value2, value3 … valuen)
--Ex:
SQL> select greatest(1, 2, 3), greatest(-1, -2, -3) from dual;

--LEAST
--This will give the least number.
--Syntax: least (value1, value2, value3 … valuen)
--Ex:
SQL> select least(1, 2, 3), least(-1, -2, -3) from dual;

--COALESCE
--This will return first non-null value.
--Syntax: coalesce (value1, value2, value3 … valuen)
--Ex:
SQL> select coalesce(1,2,3), coalesce(null,2,null,5) from dual;


-----------------------"""STRING FUNCTIONS"""-------------------
--INITCAP
--This will capitalize the initial letter of the string.
--Syntax: initcap (string)
--Ex:
SQL> select initcap('computer') from dual;

--UPPER
--This will convert the string into uppercase.
--Syntax: upper (string)
--Ex:
SQL> select upper('computer') from dual;

---LOWER
--This will convert the string into lowercase.
--Syntax: lower (string)
--Ex:
SQL> select lower('COMPUTER') from dual;

--LENGTH
--This will give length of the string.
--Syntax: length (string)
--Ex:
SQL> select length('computer') from dual;

--RPAD
--This will allows you to pad the right side of a column with any set of characters.
--Syntax: rpad (string, length [, padding_char])
--Ex:
SQL> select rpad('computer',15,'*'), rpad('computer',15,'*#') from dual;

--LPAD
--This will allows you to pad the left side of a column with any set of characters.
--Syntax: lpad (string, length [, padding_char])
--Ex:
SQL> select lpad('computer',15,'*'), lpad('computer',15,'*#') from dual;

--LTRIM
--This will trim off unwanted characters from the left end of string.
--Syntax: ltrim (string [,unwanted_chars])
--Ex:
SQL> select ltrim('computer','co'), ltrim('computer','com') from dual;

--RTRIM
--This will trim off unwanted characters from the right end of string.
--Syntax: rtrim (string [, unwanted_chars])
--Ex:
SQL> select rtrim('computer','er'), rtrim('computer','ter') from dual;

--TRIM
--This will trim off unwanted characters from the both sides of string.
--Syntax: trim (unwanted_chars from string)
--Ex:
SQL> select trim( 'i' from 'indiani') from dual;
select trim( leading'i' from 'indiani') from dual; -- this will work as LTRIM
SQL> select trim( trailing'i' from 'indiani') from dual; -- this will work as RTRIM


--TRANSLATE
--This will replace the set of characters, character by character.
--Syntax: translate (string, old_chars, new_chars)
--Ex:
SQL> select translate('india','in','xy') from dual;

--REPLACE
--This will replace the set of characters, string by string.
--Syntax: replace (string, old_chars [, new_chars])
--Ex:
SQL> select replace('india','in','xy'), replace(‘india’,’in’) from dual;


--SOUNDEX
--This will be used to find words that sound like other words, exclusively used in where clause.
--Syntax: soundex (string)
--Ex:
SQL> select * from emp where soundex(ename) = soundex('SMIT');


--CONCAT
--This will be used to combine two strings only.
--Syntax: concat (string1, string2)
--Ex:
SQL> select concat('computer',' operator') from dual;
--If you want to combine more than two strings you have to use concatenation operator (||).
SQL> select 'how' || ' are' || ' you' from dual;

--ASCII
--This will return the decimal representation in the database character set of the first
--character of the string.
--Syntax: ascii (string)
--Ex:
SQL> select ascii('a'), ascii('apple') from dual;

--CHR
--This will return the character having the binary equivalent to the string in either the
--database character set or the national character set.
--Syntax: chr (number)
--Ex:
SQL> select chr(97) from dual;

--SUBSTR
--This will be used to extract substrings.
--Syntax: substr (string, start_chr_count [, no_of_chars])
--Ex:
SQL> select substr('computer',2), substr('computer',2,5), substr('computer',3,7) from
dual;

--INSTR
--This will allows you for searching through a string for set of characters.
--Syntax: instr (string, search_str [, start_chr_count [, occurrence] ])
--Ex:
SQL> select instr('information','o',4,1), instr('information','o',4,2) from dual;

--DECODE
--Decode will act as value by value substitution.
--For every value of field, it will checks for a match in a series of if/then tests.
--Syntax: decode (value, if1, then1, if2, then2, ……. else);
--Ex:
SQL> select sal, decode(sal,500,'Low',5000,'High','Medium') from emp;


--GREATEST
--This will give the greatest string.
--Syntax: greatest (strng1, string2, string3 … stringn)
--Ex:
SQL> select greatest('a', 'b', 'c'), greatest('satish','srinu','saketh') from dual;

--LEAST
--This will give the least string.
--Syntax: greatest (strng1, string2, string3 … stringn)
--Ex:
SQL> select least('a', 'b', 'c'), least('satish','srinu','saketh') from dual;

--COALESCE
---This will gives the first non-null string.
--Syntax: coalesce (strng1, string2, string3 … stringn)
--Ex:
SQL> select coalesce('a','b','c'), coalesce(null,'a',null,'b') from dual;

------------------"""DATE FUNCTIONS"""----------------
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

--TO_CHAR
--This will be used to extract various date formats.
--The available date formats as follows.
--Syntax: to_char (date, format)

