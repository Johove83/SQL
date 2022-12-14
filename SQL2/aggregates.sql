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

SELECT COUNT(film_id) AS "Total films"
FROM film

SELECT COUNT(film_id) as total_films
FROM film;

SELECT COUNT(film_id) as total_films, rating
FROM film
GROUP BY rating;

SELECT COUNT(film_id) as total_films, rating
FROM film
GROUP BY rating
ORDER BY rating

