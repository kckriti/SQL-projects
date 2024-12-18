show databases;

CREATE database star;
USE star;

CREATE TABLE fact_sales (
sale_id INT PRIMARY KEY,
product_id INT,
customer_id INT,
date_id INT,
sales_amount DECIMAL(10,2)
);

CREATE TABLE dim_product (
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
category VARCHAR(50)
);

CREATE TABLE dim_customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    region VARCHAR(50)
);

CREATE TABLE dim_date (
date_int INT PRIMARY KEY,
date DATE,
year INT,
month INT
);

CREATE TABLE dim_category (
category_id INT PRIMARY KEY,
category_name VARCHAR(50)
);

ALTER TABLE dim_product
ADD COLUMN category_id INT;

ALTER TABLE dim_product
ADD CONSTRAINT fk_category
FOREIGN KEY (category_id) REFERENCES
dim_category(category_id);

INSERT INTO fact_sales (sale_id, product_id, customer_id, date_id, sales_amount)
VALUES(1, 101, 201, 301, 150.50),
(2, 102, 202, 302, 250.75),
(3, 103, 203, 303, 99.99);

INSERT INTO dim_category (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Mobile Devices'),
(3, 'Tablets');

INSERT INTO dim_product (product_id, product_name, category_id) 
VALUES(101, 'Laptop', 1),
(102, 'Smartphone', 2),
(103, 'Tablet', 3);

INSERT INTO dim_customer (customer_id, customer_name, region) VALUES
(201, 'John Doe', 'North America'),
(202, 'Jane Smith', 'Europe'),
(203, 'Alice Johnson', 'Asia');

INSERT INTO dim_date (date_int, date, year, month) VALUES
(301, '2024-10-01', 2024, 10),
(302, '2024-10-02', 2024, 10),
(303, '2024-10-03', 2024, 10);