DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS banks;
CREATE TABLE payments(payment_id SERIAL PRIMARY KEY, bank_number BIGINT, bank_routing_number BIGINT, customer_id BIGINT);
CREATE TABLE banks(bank_id SERIAL PRIMARY KEY, bank_name VARCHAR(50), bank_routing_number BIGINT);



-- return all records where routing number links tables

SELECT *
FROM payments
INNER JOIN banks ON payments.bank_routing_number = banks.bank_routing_number;

SELECT * FROM payments

-- return all records, even if unmatched (i'm keeping all info from the payments and the matches from banks)

SELECT *
FROM payments
LEFT JOIN banks ON payments.bank_routing_number = banks.bank_routing_number;

-- return all records, even if unmatched (keeping all info from banks and matches from payments)

SELECT *
FROM payments
RIGHT JOIN banks ON payments.bank_routing_number = banks.bank_routing_number;

-- return all records regardless of dependence status

SELECT *
FROM payments
FULL OUTER JOIN banks ON payments.bank_routing_number = banks.bank_routing_number;

-- Join like rows.. YIKES

SELECT * 
FROM payments
CROSS JOIN banks;

-- create customer table and import data

CREATE TABLE customer(customer_id SERIAL PRIMARY KEY, first_name VARCHAR(30), last_name VARCHAR(30)
                   , gender VARCHAR(6), age INT, address VARCHAR(50), city VARCHAR(30), state CHAR(2)
                   , zip_code CHAR(5));
                   
-- consolidate payment_id, bank_number, bank_routing_number, bank_name, first_name, last_name

SELECT 
   customer.last_name
 , customer.first_name
 , payments.bank_number
 , banks.bank_name
 , banks.bank_routing_number
 , payments.payment_id
FROM payments
INNER JOIN banks ON payments.bank_routing_number = banks.bank_routing_number
INNER JOIN customer ON payments.customer_id = customer.customer_id