DROP TABLE IF EXISTS family_children;
DROP TABLE IF EXISTS first_nf_family_children;
DROP TABLE IF EXISTS second_nf_family;
DROP TABLE IF EXISTS second_nf_child;
DROP TABLE IF EXISTS owner_store;
DROP TABLE IF EXISTS third_nf_owner CASCADE;
DROP TABLE IF EXISTS third_nf_store CASCADE;

CREATE TABLE family_children(family VARCHAR(50), children VARCHAR(50));

-- 1st normal form

CREATE TABLE first_nf_family_children(family VARCHAR(50), children VARCHAR(50));

-- second normal form

CREATE TABLE second_nf_family(family_id INT PRIMARY KEY, family VARCHAR(50));

CREATE TABLE second_nf_child(child_id INT PRIMARY KEY, family_id INT, children VARCHAR(50));

CREATE TABLE owner_store(owner_id INT, owner_name VARCHAR(50), owner_address VARCHAR(100), store_name VARCHAR(50));

-- third normal form 'owner' table

CREATE TABLE third_nf_owner(owner_id INT PRIMARY KEY, owner_name VARCHAR(50), owner_address VARCHAR(100));

-- third normal form 'store' table

CREATE TABLE third_nf_store(store_id SERIAL PRIMARY KEY, store_name VARCHAR(50), owner_id INT
                           , CONSTRAINT fk_owner
                                FOREIGN KEY(owner_id)
                                  REFERENCES third_nf_owner(owner_id));

INSERT INTO family_children(family, children)

VALUES('Smith', 'Chris, Abby, Susy')
    , ('Jones', 'Steve, Mary, Dillion');

SELECT * 
FROM family_children

-- first normalization

INSERT INTO first_nf_family_children(family, children)

VALUES('Smith', 'Abby')
    , ('Smith', 'Susy')
    , ('Jones', 'Mary')
    , ('Smith', 'Chris')
    , ('Jones', 'Dillion')
    , ('Jones', 'Mary');

SELECT *
FROM first_nf_family_children

-- second normalization family

INSERT INTO second_nf_family(family_id, family)

VALUES(1, 'Smith')
    , (2, 'Jones')
    
-- second normalization child

INSERT INTO second_nf_child(child_id, family_id, children)

VALUES(11, 1, 'Chris')
    , (22, 1, 'Abby')
    , (33, 1, 'Susy')
    , (44, 2, 'Steve')
    , (55, 2, 'Mary')
    , (66, 2, 'Dillion');
    
SELECT * 
FROM second_nf_child

INSERT INTO owner_store(owner_id, owner_name, owner_address, store_name)

VALUES(11, 'Marshall', '123, Fake Street', 'Soups and Stuff')
    , (22, 'Susan', '44, New Drive', 'Sink Emporium')
    , (33, 'Molly', '99, Old Lane', 'Tasty Burgers');

SELECT *
FROM owner_store

INSERT INTO third_nf_owner(owner_id, owner_name, owner_address)

VALUES(11, 'Marshall', '123, Fake Street')
    , (22, 'Susan', '44, New Drive')
    , (33, 'Molly', '92, Old Lane');
    
SELECT * 
FROM third_nf_owner

INSERT INTO third_nf_store(store_name, owner_id)

VALUES('Soups and Stuff', 11)
    , ('Sink Emporium', 22)
    , ('Tasty Burgers', 33);
    
SELECT *
FROM third_nf_store
    