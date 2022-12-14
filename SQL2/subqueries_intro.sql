CREATE TABLE film (
  film_id integer NOT NULL,
  title character varying(255) NOT NULL,
  description text,
  release_year integer,
  language_id smallint NOT NULL,
  original_language_id smallint,
  rental_duration smallint DEFAULT 3 NOT NULL,
  rental_rate numeric(4,2) DEFAULT 4.99 NOT NULL,
  length smallint,
  replacement_cost numeric(5,2) DEFAULT 19.99 NOT NULL,
  rating TEXT,
  last_update timestamp without time zone DEFAULT now() NOT NULL,
  special_features text[],
  fulltext tsvector NOT NULL
);

CREATE TABLE inventory (
  inventory_id integer NOT NULL,
  film_id smallint NOT NULL,
  store_id smallint NOT NULL,
  last_update timestamp without time zone DEFAULT now() NOT NULL
);

SELECT title, film_id
FROM film
WHERE title = 'EARLY HOME'

SELECT *
FROM INVENTORY
WHERE film_id = 268

SELECT i.inventory_id, i.film_id, i.store_id
FROM inventory i
JOIN film f ON i.film_id = f.film_id
WHERE f.title = 'EARLY HOME'

SELECT inventory_id, film_id, store_id
FROM inventory
WHERE film_id IN
    ( 
    SELECT film_id
    FROM film
    WHERE title ='EARLY HOME')