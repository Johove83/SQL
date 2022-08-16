DROP TABLE IF EXISTS employee_normalization;
DROP TABLE IF EXISTS first_nf_employee;
DROP TABLE IF EXISTS second_nf_employee;
DROP TABLE IF EXISTS second_nf_employee_email;
DROP TABLE IF EXISTS third_nf_employee;
DROP TABLE IF EXISTS third_nf_zipcode;

CREATE TABLE employee_normalization(employee_id INT
                                  , name VARCHAR(35)
                                  , age INT
                                  , address VARCHAR(50)
                                  , city VARCHAR(30)
                                  , state VARCHAR(20)
                                  , zip_code INT
                                  , email VARCHAR(60)
                                    );
                                    
CREATE TABLE first_nf_employee
(
	employee_id INT,
	name VARCHAR(35),
	age INT,
	address VARCHAR(50),
	city VARCHAR(30),
	state VARCHAR(20),
	zip_code INT,
	email VARCHAR(60)
);

CREATE TABLE second_nf_employee
(
	employee_id INT PRIMARY KEY,
	name VARCHAR(35),
	age INT,
	address VARCHAR(50),
	city VARCHAR(30),
	state VARCHAR(20),
	zip_code INT
);

CREATE TABLE second_nf_employee_email
(
	email_id INT PRIMARY KEY,
	employee_id INT,
	email VARCHAR(60)
);

CREATE TABLE third_nf_employee
(
	employee_id INT PRIMARY KEY,
	name VARCHAR(35),
	age INT,
	address VARCHAR(50),
	zip_code INT
);

CREATE TABLE third_nf_zipcode
(
	zip_code INT PRIMARY KEY,
	city VARCHAR(30),
	state VARCHAR(20)
);

INSERT INTO employee_normalization
(employee_id, name, age, address, city, state, zip_code, email)
VALUES
(123, 'Robert Bale', 32, '31 Pelham Drive', 'Houston', 'TX', 77002, 'robert.bale51231@gmail.com, robbieman512@gmail.com'),
(456, 'Anya Strensa', 25, '142 Sunshine Road', 'Miami', 'FL', 33101, 'anya.strensa1412@gmail.com, soccergirl4251@gmail.com'),
(789, 'Arnold Tolenski', 43, '15 Silicon Avenue', 'San Francisco', 'CA', 94016, 'arnold.tolenski5121@gmail.com');

INSERT INTO first_nf_employee
(employee_id, name, age, address, city, state, zip_code, email)
VALUES
(123, 'Robert Bale', 32, '31 Pelham Drive', 'Houston', 'TX', 77002, 'robert.bale51231@gmail.com'),
(123, 'Robert Bale', 32, '31 Pelham Drive', 'Houston', 'TX', 77002, 'robbieman512@gmail.com'),
(456, 'Anya Strensa', 25, '142 Sunshine Road', 'Miami', 'FL', 33101, 'anya.strensa1412@gmail.com'),
(456, 'Anya Strensa', 25, '142 Sunshine Road', 'Miami', 'FL', 33101, 'soccergirl4251@gmail.com'),
(789, 'Arnold Tolenski', 43, '15 Silicon Avenue', 'San Francisco', 'CA', 94016, 'arnold.tolenski5121@gmail.com');

INSERT INTO second_nf_employee
(employee_id, name, age, address, city, state, zip_code)
VALUES
(123, 'Robert Bale', 32, '31 Pelham Drive', 'Houston', 'TX', 77002),
(456, 'Anya Strensa', 25, '142 Sunshine Road', 'Miami',' FL', 33101),
(789, 'Arnold Tolenski', 43, '15 Silicon Avenue', 'San Francisco', 'CA', 94016);

INSERT INTO second_nf_employee_email
(email_id, employee_id, email)
VALUES
(1, 123, 'robert.bale51231@gmail.com'),
(2, 123, 'robbieman512@gmail.com'),
(3, 456, 'anya.strensa1412@gmail.com'),
(4, 456, 'soccergirl4251@gmail.com'),
(5, 789, 'arnold.tolenski5121@gmail.com');

INSERT INTO third_nf_employee
(employee_id, name, age, address, zip_code)
VALUES
(123, 'Robert Bale', 32, '31 Pelham Drive', 77002),
(456, 'Anya Strensa', 25, '142 Sunshine Road', 33101),
(789, 'Arnold Tolenski', 43, '15 Silicon Avenue', 94016);

INSERT INTO third_nf_zipcode
(zip_code, city, state)
VALUES
(77002, 'Houston', 'TX'),
(33101, 'Miami', 'FL'),
(94016, 'San Francisco', 'CA');


SELECT * FROM employee_normalization;
SELECT * FROM first_nf_employee;
SELECT * FROM second_nf_employee;
SELECT * FROM second_nf_employee_email;
SELECT * FROM third_nf_employee;
SELECT * FROM third_nf_zipcode;



SELECT *
FROM third_nf_employee AS a
LEFT JOIN second_nf_employee_email AS b ON a.employee_id = b.employee_id
LEFT JOIN third_nf_zipcode AS c ON a.zip_code = c.zip_code;
