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

SELECT film_id, AVG(length) AS avg_length
FROM film
GROUP BY film_id
ORDER BY avg_length

SELECT * 
FROM film

SELECT film_id, round(avg(length), 2) as avg_length
FROM film
GROUP BY film_id
ORDER BY avg_length

SELECT film_id, round(avg(length), 2) as avg_length
FROM film
GROUP BY film_id
ORDER BY avg_length DESC

SELECT film_id, round(avg(length), 2) as avg_length
FROM film
GROUP BY film_id
ORDER BY avg_length DESC
limit 5

