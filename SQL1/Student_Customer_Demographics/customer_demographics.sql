CREATE TABLE customers(customer_id SERIAL PRIMARY KEY, first_name VARCHAR(30), last_name VARCHAR(30)
                      , gender VARCHAR(6), age INT, address VARCHAR(50), city VARCHAR(50)
                      , state CHAR(2), zip_code CHAR(5))
                      
-- query all self-identified, female customers

SELECT *
FROM customers
WHERE gender = 'Female'

SELECT *
FROM customers
WHERE gender = 'Male' AND state = 'NJ'

SELECT * 
FROM customers
WHERE gender = 'Male' AND state = 'NJ' OR state = 'OH'

SELECT *
FROM customers
WHERE gender = 'Female' AND state = 'MD' AND age < 30