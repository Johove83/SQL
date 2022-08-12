CREATE TABLE payment (
  payment_id integer NOT NULL,
  customer_id smallint NOT NULL,
  staff_id smallint NOT NULL,
  rental_id integer NOT NULL,
  amount numeric(5,2) NOT NULL,
  payment_date timestamp without time zone NOT NULL
);

SELECT * FROM payment

-- What is the average monthly payment amount?

SELECT AVG(amount) as avg_monthly_pmt
FROM payment

-- What is the total payment amount?

SELECT SUM(amount) as total_pmt_amt
FROM payment

-- What is the minimum payment amount?

SELECT MIN(amount) as min_payment
FROM payment

-- What is the maximum payment amount?

SELECT MAX(amount) as max_payment
FROM payment

-- How many customers has each staff serviced?

SELECT staff_id, COUNT(customer_id) as customer_cnt
FROM payment
GROUP BY staff_id

-- What is the count of payments for each customer?

SELECT customer_id, COUNT(*) as payment_cnt
FROM payment
GROUP BY customer_id

-- Which customers have made over 40 payments?
SELECT customer_id, COUNT(*) as payment_cnt
FROM payment
GROUP BY customer_id
HAVING COUNT(*) > 40

