--Star Schema

Definition: A schema where a central fact table is connected directly to multiple denormalized dimension tables.
Structure: Looks like a star — fact table in the center, dimensions radiating outward.
Dimension tables: Usually denormalized (store full descriptive data in a single table).
Performance: Faster query performance (less joins).
Storage: Requires more storage (duplicate data in dimensions).
Use case: Best for simple reporting & OLAP queries where speed is more important than storage efficiency.

       DIM_CUSTOMER
           |
DIM_PRODUCT - FACT_SALES - DIM_DATE
           |
       DIM_STORE

--Snowflake Schema

Definition: An extension of star schema where dimension tables are normalized into multiple related tables.
Structure: Looks like a snowflake — dimensions split into sub-dimensions.
Dimension tables: Normalized (avoid redundancy by splitting hierarchies).
Performance: More joins needed → slower queries.
Storage: Saves storage space (no data redundancy).
Use case: Best when storage optimization and data consistency are more important than query speed.

 FACT_SALES
     |
 DIM_PRODUCT  ---> DIM_CATEGORY ---> DIM_DEPARTMENT
     |
 DIM_CUSTOMER ---> DIM_CITY ---> DIM_STATE
     |
 DIM_DATE


--------------------------------------------------------
-- STAR SCHEMA EXAMPLE
--------------------------------------------------------

-- Drop old tables if exist
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE FACT_SALES CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE DIM_PRODUCT CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE DIM_CUSTOMER CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE DIM_DATE CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE DIM_STORE CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/

-- Dimension tables
CREATE TABLE DIM_PRODUCT (
    product_id INT PRIMARY KEY,
    product_name VARCHAR2(50),
    category VARCHAR2(30),
    brand VARCHAR2(30)
);

CREATE TABLE DIM_CUSTOMER (
    customer_id INT PRIMARY KEY,
    name VARCHAR2(50),
    gender VARCHAR2(10),
    city VARCHAR2(30)
);

CREATE TABLE DIM_DATE (
    date_id INT PRIMARY KEY,
    day_num INT,
    month_num INT,
    year_num INT
);

CREATE TABLE DIM_STORE (
    store_id INT PRIMARY KEY,
    store_name VARCHAR2(50),
    location VARCHAR2(30)
);

-- Fact table
CREATE TABLE FACT_SALES (
    sale_id INT PRIMARY KEY,
    date_id INT,
    product_id INT,
    customer_id INT,
    store_id INT,
    sales_amount NUMBER(10,2),
    quantity INT,
    FOREIGN KEY (date_id) REFERENCES DIM_DATE(date_id),
    FOREIGN KEY (product_id) REFERENCES DIM_PRODUCT(product_id),
    FOREIGN KEY (customer_id) REFERENCES DIM_CUSTOMER(customer_id),
    FOREIGN KEY (store_id) REFERENCES DIM_STORE(store_id)
);

-- Insert data
INSERT INTO DIM_PRODUCT VALUES (1, 'Laptop', 'Electronics', 'Dell');
INSERT INTO DIM_PRODUCT VALUES (2, 'Smartphone', 'Electronics', 'Samsung');
INSERT INTO DIM_PRODUCT VALUES (3, 'Shoes', 'Fashion', 'Nike');

INSERT INTO DIM_CUSTOMER VALUES (1, 'Alice', 'F', 'New York');
INSERT INTO DIM_CUSTOMER VALUES (2, 'Bob', 'M', 'Chicago');
INSERT INTO DIM_CUSTOMER VALUES (3, 'Carol', 'F', 'Los Angeles');

INSERT INTO DIM_DATE VALUES (1, 15, 3, 2023);
INSERT INTO DIM_DATE VALUES (2, 16, 3, 2023);
INSERT INTO DIM_DATE VALUES (3, 17, 3, 2023);

INSERT INTO DIM_STORE VALUES (1, 'BestBuy', 'New York');
INSERT INTO DIM_STORE VALUES (2, 'Target', 'Chicago');

INSERT INTO FACT_SALES VALUES (1, 1, 1, 1, 1, 1200.00, 1);
INSERT INTO FACT_SALES VALUES (2, 1, 2, 2, 2, 800.00, 1);
INSERT INTO FACT_SALES VALUES (3, 2, 3, 3, 1, 150.00, 2);
INSERT INTO FACT_SALES VALUES (4, 3, 2, 1, 2, 750.00, 1);

COMMIT;


--------------------------------------------------------
-- SNOWFLAKE SCHEMA EXAMPLE
--------------------------------------------------------

-- Drop old tables if exist
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE FACT_SALES_SF CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE DIM_PRODUCT_SF CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE DIM_CATEGORY_SF CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE DIM_DEPARTMENT_SF CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE DIM_CUSTOMER_SF CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE DIM_CITY_SF CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE DIM_STATE_SF CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE DIM_DATE_SF CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE DIM_STORE_SF CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/

-- Dimension hierarchy for Product
CREATE TABLE DIM_DEPARTMENT_SF (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR2(30)
);

CREATE TABLE DIM_CATEGORY_SF (
    category_id INT PRIMARY KEY,
    category_name VARCHAR2(30),
    dept_id INT REFERENCES DIM_DEPARTMENT_SF(dept_id)
);

CREATE TABLE DIM_PRODUCT_SF (
    product_id INT PRIMARY KEY,
    product_name VARCHAR2(50),
    category_id INT REFERENCES DIM_CATEGORY_SF(category_id)
);

-- Dimension hierarchy for Customer
CREATE TABLE DIM_STATE_SF (
    state_id INT PRIMARY KEY,
    state_name VARCHAR2(30)
);

CREATE TABLE DIM_CITY_SF (
    city_id INT PRIMARY KEY,
    city_name VARCHAR2(30),
    state_id INT REFERENCES DIM_STATE_SF(state_id)
);

CREATE TABLE DIM_CUSTOMER_SF (
    customer_id INT PRIMARY KEY,
    name VARCHAR2(50),
    gender VARCHAR2(10),
    city_id INT REFERENCES DIM_CITY_SF(city_id)
);

-- Date & Store
CREATE TABLE DIM_DATE_SF (
    date_id INT PRIMARY KEY,
    day_num INT,
    month_num INT,
    year_num INT
);

CREATE TABLE DIM_STORE_SF (
    store_id INT PRIMARY KEY,
    store_name VARCHAR2(50),
    location VARCHAR2(30)
);

-- Fact table
CREATE TABLE FACT_SALES_SF (
    sale_id INT PRIMARY KEY,
    date_id INT REFERENCES DIM_DATE_SF(date_id),
    product_id INT REFERENCES DIM_PRODUCT_SF(product_id),
    customer_id INT REFERENCES DIM_CUSTOMER_SF(customer_id),
    store_id INT REFERENCES DIM_STORE_SF(store_id),
    sales_amount NUMBER(10,2),
    quantity INT
);

-- Insert data (normalized)
INSERT INTO DIM_DEPARTMENT_SF VALUES (1, 'Electronics');
INSERT INTO DIM_DEPARTMENT_SF VALUES (2, 'Fashion');

INSERT INTO DIM_CATEGORY_SF VALUES (1, 'Computers', 1);
INSERT INTO DIM_CATEGORY_SF VALUES (2, 'Mobiles', 1);
INSERT INTO DIM_CATEGORY_SF VALUES (3, 'Footwear', 2);

INSERT INTO DIM_PRODUCT_SF VALUES (1, 'Laptop', 1);
INSERT INTO DIM_PRODUCT_SF VALUES (2, 'Smartphone', 2);
INSERT INTO DIM_PRODUCT_SF VALUES (3, 'Shoes', 3);

INSERT INTO DIM_STATE_SF VALUES (1, 'New York');
INSERT INTO DIM_STATE_SF VALUES (2, 'Illinois');
INSERT INTO DIM_STATE_SF VALUES (3, 'California');

INSERT INTO DIM_CITY_SF VALUES (1, 'New York', 1);
INSERT INTO DIM_CITY_SF VALUES (2, 'Chicago', 2);
INSERT INTO DIM_CITY_SF VALUES (3, 'Los Angeles', 3);

INSERT INTO DIM_CUSTOMER_SF VALUES (1, 'Alice', 'F', 1);
INSERT INTO DIM_CUSTOMER_SF VALUES (2, 'Bob', 'M', 2);
INSERT INTO DIM_CUSTOMER_SF VALUES (3, 'Carol', 'F', 3);

INSERT INTO DIM_DATE_SF VALUES (1, 15, 3, 2023);
INSERT INTO DIM_DATE_SF VALUES (2, 16, 3, 2023);
INSERT INTO DIM_DATE_SF VALUES (3, 17, 3, 2023);

INSERT INTO DIM_STORE_SF VALUES (1, 'BestBuy', 'New York');
INSERT INTO DIM_STORE_SF VALUES (2, 'Target', 'Chicago');

INSERT INTO FACT_SALES_SF VALUES (1, 1, 1, 1, 1, 1200.00, 1);
INSERT INTO FACT_SALES_SF VALUES (2, 1, 2, 2, 2, 800.00, 1);
INSERT INTO FACT_SALES_SF VALUES (3, 2, 3, 3, 1, 150.00, 2);
INSERT INTO FACT_SALES_SF VALUES (4, 3, 2, 1, 2, 750.00, 1);

COMMIT;


--------------------------------------------------------
-- QUERIES FOR STAR VS SNOWFLAKE
--------------------------------------------------------

-- 1. Total sales by product (Star)
SELECT p.product_name, SUM(f.sales_amount) AS total_sales
FROM FACT_SALES f
JOIN DIM_PRODUCT p ON f.product_id = p.product_id
GROUP BY p.product_name;

-- 1. Total sales by product (Snowflake)
SELECT p.product_name, SUM(f.sales_amount) AS total_sales
FROM FACT_SALES_SF f
JOIN DIM_PRODUCT_SF p ON f.product_id = p.product_id
GROUP BY p.product_name;


-- 2. Total sales by category (Star - directly in DIM_PRODUCT)
SELECT p.category, SUM(f.sales_amount) AS total_sales
FROM FACT_SALES f
JOIN DIM_PRODUCT p ON f.product_id = p.product_id
GROUP BY p.category;

-- 2. Total sales by category (Snowflake - needs join to DIM_CATEGORY_SF)
SELECT c.category_name, SUM(f.sales_amount) AS total_sales
FROM FACT_SALES_SF f
JOIN DIM_PRODUCT_SF p ON f.product_id = p.product_id
JOIN DIM_CATEGORY_SF c ON p.category_id = c.category_id
GROUP BY c.category_name;


-- 3. Total sales by state (Star - use customer.city directly)
SELECT c.city, SUM(f.sales_amount) AS total_sales
FROM FACT_SALES f
JOIN DIM_CUSTOMER c ON f.customer_id = c.customer_id
GROUP BY c.city;

-- 3. Total sales by state (Snowflake - normalized through city → state)
SELECT st.state_name, SUM(f.sales_amount) AS total_sales
FROM FACT_SALES_SF f
JOIN DIM_CUSTOMER_SF c ON f.customer_id = c.customer_id
JOIN DIM_CITY_SF ct ON c.city_id = ct.city_id
JOIN DIM_STATE_SF st ON ct.state_id = st.state_id
GROUP BY st.state_name;
