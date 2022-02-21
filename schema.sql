CREATE TABLE IF NOT EXISTS public.athletes
(
    id integer NOT NULL,
    name character varying(150) COLLATE pg_catalog."default",
    gender character varying(100) COLLATE pg_catalog."default",
    dob date,
    CONSTRAINT athletes_pkey PRIMARY KEY (id)
)