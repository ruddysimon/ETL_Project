-- Table: public.nba_player_salary 

-- DROP TABLE public.nba_player_salary;

CREATE TABLE public.nba_player_salary
(
    year integer NOT NULL,
    player_name character varying(500) COLLATE pg_catalog."default" NOT NULL,
    "position" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    team character varying(100) COLLATE pg_catalog."default",
    avg_salary integer,
    CONSTRAINT nba_player_salary_pkey PRIMARY KEY (year, player_name, "position")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.nba_player_salary
    OWNER to postgres;