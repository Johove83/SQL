DROP TABLE IF EXISTS owners CASCADE;
DROP TABLE IF EXISTS estates CASCADE;
DROP TABLE IF EXISTS estate_type CASCADE;
DROP TABLE IF EXISTS estates_new CASCADE;

-- Create owners table and insert values
CREATE TABLE owners (
  owner_id INT PRIMARY KEY NOT NULL,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

-- Create estates table and insert values
CREATE TABLE estates (
  estate_id INT NOT NULL PRIMARY KEY,
  owner_id INT NOT NULL,
  FOREIGN KEY (owner_id) REFERENCES owners(owner_id),
  address VARCHAR(255),
  city VARCHAR (255),
  state VARCHAR(255),
  zip_code VARCHAR(255)
);

-- Create estate_type table and insert data
CREATE TABLE estate_type (
  estate_type_id INT NOT NULL PRIMARY KEY,
  estate_type VARCHAR(255)
);

-- Create new estates table and insert values
CREATE TABLE estates_new (
  estate_id INT NOT NULL PRIMARY KEY,
  owner_id INT NOT NULL,
  FOREIGN KEY (owner_id) REFERENCES owners(owner_id),
  address VARCHAR(255),
  city VARCHAR (255),
  state VARCHAR(255),
  zip_code VARCHAR(255),
  estate_type_id INT,
  FOREIGN KEY (estate_type_id) REFERENCES estate_type(estate_type_id)
);



SELECT * FROM owners;
SELECT * FROM estates;

-- Attempt to insert data without referential integrity
INSERT INTO estates
(estate_id, owner_id, address, city, state, zip_code)
VALUES
(9, 10, '23 Delafield Avenue', 'New Brunswick', 'NJ', 08901);

-- Insert new record into owner table
INSERT INTO owners
(owner_id, first_name, last_name)
VALUES
(10, 'David', 'Stone');

-- Re-attempt to insert data with referential integrity from previous code


-- Select all columns from joined table
SELECT *
FROM owners
INNER JOIN estates ON owners.owner_id = estates.owner_id;

-- select explicit columns from joined table
SELECT
  owners.first_name,
  owners.last_name,
  estates.address,
  estates.city,
  estates.state,
  estates.zip_code
FROM owners
INNER JOIN estates ON owners.owner_id = estates.owner_id;

-- BONUS
SELECT * FROM estate_type;
SELECT * FROM estates_new;

-- Join all three tables
SELECT *
FROM owners
INNER JOIN estates_new ON owners.owner_id = estates_new.owner_id
INNER JOIN estate_type ON estates_new.estate_type_id = estate_type.estate_type_id;
