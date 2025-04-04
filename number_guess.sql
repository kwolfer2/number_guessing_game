--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    user_id integer NOT NULL,
    games_played integer,
    best_guess integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1743791216563', 2, 0, 0);
INSERT INTO public.users VALUES ('user_1743791216562', 3, 0, 0);
INSERT INTO public.users VALUES ('user_1743792068536', 4, 0, 0);
INSERT INTO public.users VALUES ('user_1743792068535', 5, 0, 0);
INSERT INTO public.users VALUES ('TEST5', 6, 0, 0);
INSERT INTO public.users VALUES ('kurt1', 21, 1, NULL);
INSERT INTO public.users VALUES ('KURT2', 22, 0, NULL);
INSERT INTO public.users VALUES ('user_1743793226023', 8, 2, 0);
INSERT INTO public.users VALUES ('kurt2', 23, 1, 9);
INSERT INTO public.users VALUES ('user_1743793226024', 7, 5, 0);
INSERT INTO public.users VALUES ('user_1743793472753', 11, 2, 0);
INSERT INTO public.users VALUES ('user_1743793472754', 10, 5, 0);
INSERT INTO public.users VALUES ('user_1743795235648', 25, 2, 323);
INSERT INTO public.users VALUES ('user_1743793587734', 13, 2, 0);
INSERT INTO public.users VALUES ('user_1743793587735', 12, 5, 0);
INSERT INTO public.users VALUES ('user_1743795235649', 24, 5, 356);
INSERT INTO public.users VALUES ('user_1743793640549', 15, 2, 0);
INSERT INTO public.users VALUES ('user_1743796778057', 49, 2, 4);
INSERT INTO public.users VALUES ('user_1743793640550', 14, 5, 0);
INSERT INTO public.users VALUES ('user_1743797230844', 69, 2, 643);
INSERT INTO public.users VALUES ('test5', 1, 4, 0);
INSERT INTO public.users VALUES ('test6', 9, 1, 0);
INSERT INTO public.users VALUES ('user_1743795993991', 36, 2, 351);
INSERT INTO public.users VALUES ('user_1743796778058', 48, 5, 126);
INSERT INTO public.users VALUES ('user_1743795266267', 27, 2, 67);
INSERT INTO public.users VALUES ('test7', 16, 5, 2);
INSERT INTO public.users VALUES ('user_1743795266268', 26, 5, 199);
INSERT INTO public.users VALUES ('user_1743795993992', 35, 5, 94);
INSERT INTO public.users VALUES ('user_1743796094865', 37, 0, NULL);
INSERT INTO public.users VALUES ('user_1743794765402', 18, 2, 373);
INSERT INTO public.users VALUES ('user_1743796094864', 38, 0, NULL);
INSERT INTO public.users VALUES ('user_1743794765403', 17, 5, 201);
INSERT INTO public.users VALUES ('KURT3', 39, 1, 7);
INSERT INTO public.users VALUES ('user_1743795476359', 29, 2, 654);
INSERT INTO public.users VALUES ('user_1743797230845', 68, 5, 13);
INSERT INTO public.users VALUES ('user_1743794791861', 20, 2, 323);
INSERT INTO public.users VALUES ('kurt3', 34, 3, 7);
INSERT INTO public.users VALUES ('user_1743795476360', 28, 5, 136);
INSERT INTO public.users VALUES ('user_1743794791862', 19, 5, 76);
INSERT INTO public.users VALUES ('user_1743796856183', 51, 2, 228);
INSERT INTO public.users VALUES ('user_1743795756738', 31, 2, 134);
INSERT INTO public.users VALUES ('user_1743796384602', 41, 2, 3);
INSERT INTO public.users VALUES ('user_1743795756739', 30, 5, 22);
INSERT INTO public.users VALUES ('user_1743796384603', 40, 5, 317);
INSERT INTO public.users VALUES ('user_1743796856184', 50, 5, 225);
INSERT INTO public.users VALUES ('user_1743796966242', 52, 0, NULL);
INSERT INTO public.users VALUES ('user_1743796966241', 53, 0, NULL);
INSERT INTO public.users VALUES ('user_1743797057378', 54, 0, NULL);
INSERT INTO public.users VALUES ('user_1743795842180', 33, 2, 703);
INSERT INTO public.users VALUES ('user_1743797057377', 55, 0, NULL);
INSERT INTO public.users VALUES ('user_1743797084985', 56, 0, NULL);
INSERT INTO public.users VALUES ('user_1743795842181', 32, 5, 67);
INSERT INTO public.users VALUES ('user_1743797084984', 57, 0, NULL);
INSERT INTO public.users VALUES ('user_1743796403613', 43, 2, 80);
INSERT INTO public.users VALUES ('user_1743797093305', 58, 0, NULL);
INSERT INTO public.users VALUES ('user_1743797093304', 59, 0, NULL);
INSERT INTO public.users VALUES ('user_1743796403614', 42, 5, 58);
INSERT INTO public.users VALUES ('user_1743797100500', 60, 0, NULL);
INSERT INTO public.users VALUES ('user_1743797100499', 61, 0, NULL);
INSERT INTO public.users VALUES ('user_1743796487695', 45, 2, 441);
INSERT INTO public.users VALUES ('user_1743797267669', 71, 2, 8);
INSERT INTO public.users VALUES ('user_1743796487696', 44, 5, 33);
INSERT INTO public.users VALUES ('user_1743797114396', 63, 2, 428);
INSERT INTO public.users VALUES ('user_1743797267670', 70, 5, 275);
INSERT INTO public.users VALUES ('user_1743796729871', 47, 2, 215);
INSERT INTO public.users VALUES ('user_1743797114397', 62, 5, 281);
INSERT INTO public.users VALUES ('user_1743796729872', 46, 5, 67);
INSERT INTO public.users VALUES ('user_1743797171859', 65, 2, 467);
INSERT INTO public.users VALUES ('user_1743797171860', 64, 5, 113);
INSERT INTO public.users VALUES ('user_1743797191575', 67, 2, 81);
INSERT INTO public.users VALUES ('user_1743797191576', 66, 5, 57);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 71, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

