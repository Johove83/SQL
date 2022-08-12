CREATE TABLE actor
(
   actor_id integer NOT NULL,
   first_name character varying(45) NOT NULL,
   last_name character varying(45),
   last_update TIMESTAMP without time zone DEFAULT now() NOT NULL
);


