--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    username character varying(30) NOT NULL,
    guess_count integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: usernames; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.usernames (
    username character varying(30) NOT NULL
);


ALTER TABLE public.usernames OWNER TO freecodecamp;

--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 'test1', 3);
INSERT INTO public.games VALUES (2, 'test2', 6);
INSERT INTO public.games VALUES (3, 'test2', 2);
INSERT INTO public.games VALUES (4, 'test2', 9);
INSERT INTO public.games VALUES (5, 'test2', 1);
INSERT INTO public.games VALUES (6, 'test2', 1);
INSERT INTO public.games VALUES (7, 'test2', 1);
INSERT INTO public.games VALUES (8, 'user_1668706381551', 209);
INSERT INTO public.games VALUES (9, 'user_1668706381550', 15);
INSERT INTO public.games VALUES (10, 'user_1668706381551', 926);
INSERT INTO public.games VALUES (11, 'user_1668706381551', 687);
INSERT INTO public.games VALUES (12, 'user_1668706381551', 59);
INSERT INTO public.games VALUES (13, 'test2', 1);


--
-- Data for Name: usernames; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.usernames VALUES ('test1');
INSERT INTO public.usernames VALUES ('test2');
INSERT INTO public.usernames VALUES ('user_1668703356169');
INSERT INTO public.usernames VALUES ('user_1668703356168');
INSERT INTO public.usernames VALUES ('user_1668703710512');
INSERT INTO public.usernames VALUES ('user_1668703710511');
INSERT INTO public.usernames VALUES ('user_1668704728512');
INSERT INTO public.usernames VALUES ('user_1668704728511');
INSERT INTO public.usernames VALUES ('user_1668706381551');
INSERT INTO public.usernames VALUES ('user_1668706381550');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 13, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: usernames usernames_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usernames
    ADD CONSTRAINT usernames_pkey PRIMARY KEY (username);


--
-- Name: games games_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_username_fkey FOREIGN KEY (username) REFERENCES public.usernames(username);


--
-- PostgreSQL database dump complete
--

