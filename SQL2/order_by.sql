CREATE TABLE payment (
  payment_id integer NOT NULL,
  customer_id smallint NOT NULL,
  staff_id smallint NOT NULL,
  rental_id integer NOT NULL,
  amount numeric(5,2) NOT NULL,
  payment_date timestamp without time zone NOT NULL
);
SELECT * FROM payment
-- Total # of Payments by Customer

SELECT customer_id, COUNT(*) AS payment_cnt
FROM payment
GROUP BY customer_id
ORDER BY COUNT(*) DESC

-- Top 5 spenders

SELECT customer_id, SUM(amount) AS payment_sum
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5

-- Bottom 5 spenders

SELECT customer_id, SUM(amount) as payment_sum
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) 
LIMIT 5

-- Top 10 Customers with Highest Average Payment

SELECT customer_id, ROUND(AVG(amount), 2) AS average_payment
FROM payment
GROUP BY customer_id
ORDER BY AVG(amount) DESC
LIMIT 10

-- Staff Names and # of Customers Serviced

SELECT first_name, last_name, COUNT(customer_id) AS customer_count
FROM payment
JOIN staff ON payment.staff_id = staff.staff_id
GROUP BY first_name, last_name
ORDER BY COUNT(customer_id) DESC

SELECT CAST(payment_date AS DATE) as payment_date, COUNT(*)
FROM payment
GROUP BY CAST(payment_date AS DATE)
ORDER BY COUNT(*) DESC;
