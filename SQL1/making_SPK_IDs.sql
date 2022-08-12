DROP TABLE IF EXISTS banks;

-- create table for bank data

CREATE TABLE banks(bank_id SERIAL PRIMARY KEY
                  , bank_name VARCHAR(50)
                  , bank_routing_number BIGINT
                  );
                  
-- INSERT data INTO banks table

INSERT INTO banks(bank_name, bank_routing_number)

VALUES
   ('Bank of America', 198491827)
,  ('Wells Fargo', 629873495)
,  ('JPMorgan Chase', 2340903984)
,  ('Citigroup', 890123900)
,  ('TD Bank', 905192010)
,  ('Capital One', 184619239)
,  ('Capital One', 184619239)
;

SELECT * 
FROM banks

SELECT *
FROM banks
WHERE bank_name = 'Capital One'

-- delete duplicate line item

DELETE FROM banks
WHERE bank_id = 7;

-- add my bank

INSERT INTO banks(bank_name, bank_routing_number)

VALUES ('Aphelion Conglomerate', 17785454);

-- Change a bank_name and bank_routing_number value

UPDATE banks
SET bank_name = 'PNC Bank'
WHERE bank_name = 'Citigroup'

UPDATE banks
SET bank_routing_number = 1995826182
WHERE bank_id = 2


