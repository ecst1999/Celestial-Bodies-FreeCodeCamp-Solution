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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50),
    description text NOT NULL,
    n_black_holes integer NOT NULL,
    diameter numeric(100,2) NOT NULL,
    has_water boolean NOT NULL,
    star_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50),
    description text NOT NULL,
    "position" integer NOT NULL,
    diameter numeric(100,2) NOT NULL,
    has_water boolean NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    fk_id integer NOT NULL,
    name character varying(50),
    description text NOT NULL
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50),
    description text NOT NULL,
    "position" integer NOT NULL,
    diameter numeric(100,2) NOT NULL,
    has_water boolean NOT NULL,
    star_id integer,
    moon_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    description text NOT NULL,
    quantity_light integer NOT NULL,
    diameter numeric(100,2) NOT NULL,
    has_water boolean NOT NULL,
    galaxy_id integer,
    planet_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'GALAXY 1', 'GALAXY DESCRIPTION', 1, 10.25, true, 1);
INSERT INTO public.galaxy VALUES (2, 'GALAXY 2', 'GALAXY DESCRIPTION', 2, 10.25, true, 1);
INSERT INTO public.galaxy VALUES (3, 'GALAXY 3', 'GALAXY DESCRIPTION', 3, 10.25, true, 1);
INSERT INTO public.galaxy VALUES (4, 'GALAXY 4', 'GALAXY DESCRIPTION', 4, 10.25, true, 1);
INSERT INTO public.galaxy VALUES (5, 'GALAXY 5', 'GALAXY DESCRIPTION', 5, 10.25, true, 1);
INSERT INTO public.galaxy VALUES (6, 'GALAXY 6', 'GALAXY DESCRIPTION', 6, 10.25, true, 1);
INSERT INTO public.galaxy VALUES (7, 'GALAXY 7', 'GALAXY DESCRIPTION', 7, 10.25, true, 1);
INSERT INTO public.galaxy VALUES (8, 'GALAXY 8', 'GALAXY DESCRIPTION', 8, 10.25, true, 1);
INSERT INTO public.galaxy VALUES (9, 'GALAXY 9', 'GALAXY DESCRIPTION', 9, 10.25, true, 1);
INSERT INTO public.galaxy VALUES (10, 'GALAXY 10', 'GALAXY DESCRIPTION', 10, 10.25, true, 1);
INSERT INTO public.galaxy VALUES (11, 'GALAXY 11', 'GALAXY DESCRIPTION', 11, 10.25, true, 1);
INSERT INTO public.galaxy VALUES (12, 'GALAXY 12', 'GALAXY DESCRIPTION', 12, 10.25, true, 1);
INSERT INTO public.galaxy VALUES (13, 'GALAXY 13', 'GALAXY DESCRIPTION', 13, 10.25, true, 1);
INSERT INTO public.galaxy VALUES (14, 'GALAXY 14', 'GALAXY DESCRIPTION', 14, 10.25, true, 1);
INSERT INTO public.galaxy VALUES (15, 'GALAXY 15', 'GALAXY DESCRIPTION', 15, 10.25, true, 1);
INSERT INTO public.galaxy VALUES (16, 'GALAXY 16', 'GALAXY DESCRIPTION', 16, 10.25, true, 1);
INSERT INTO public.galaxy VALUES (17, 'GALAXY 17', 'GALAXY DESCRIPTION', 17, 10.25, true, 1);
INSERT INTO public.galaxy VALUES (18, 'GALAXY 18', 'GALAXY DESCRIPTION', 18, 10.25, true, 1);
INSERT INTO public.galaxy VALUES (19, 'GALAXY 19', 'GALAXY DESCRIPTION', 19, 10.25, true, 1);
INSERT INTO public.galaxy VALUES (20, 'GALAXY 20', 'GALAXY DESCRIPTION', 20, 10.25, true, 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'MOON 1', 'MOON DESCRIPTION', 1, 99.25, true, 1);
INSERT INTO public.moon VALUES (2, 'MOON 2', 'MOON DESCRIPTION', 2, 99.25, true, 1);
INSERT INTO public.moon VALUES (3, 'MOON 3', 'MOON DESCRIPTION', 3, 99.25, true, 1);
INSERT INTO public.moon VALUES (4, 'MOON 4', 'MOON DESCRIPTION', 4, 99.25, true, 1);
INSERT INTO public.moon VALUES (5, 'MOON 5', 'MOON DESCRIPTION', 5, 99.25, true, 1);
INSERT INTO public.moon VALUES (6, 'MOON 6', 'MOON DESCRIPTION', 6, 99.25, true, 1);
INSERT INTO public.moon VALUES (7, 'MOON 7', 'MOON DESCRIPTION', 7, 99.25, true, 1);
INSERT INTO public.moon VALUES (8, 'MOON 8', 'MOON DESCRIPTION', 8, 99.25, true, 1);
INSERT INTO public.moon VALUES (9, 'MOON 9', 'MOON DESCRIPTION', 9, 99.25, true, 1);
INSERT INTO public.moon VALUES (10, 'MOON 10', 'MOON DESCRIPTION', 10, 99.25, true, 1);
INSERT INTO public.moon VALUES (11, 'MOON 11', 'MOON DESCRIPTION', 11, 99.25, true, 1);
INSERT INTO public.moon VALUES (12, 'MOON 12', 'MOON DESCRIPTION', 12, 99.25, true, 1);
INSERT INTO public.moon VALUES (13, 'MOON 13', 'MOON DESCRIPTION', 13, 99.25, true, 1);
INSERT INTO public.moon VALUES (14, 'MOON 14', 'MOON DESCRIPTION', 14, 99.25, true, 1);
INSERT INTO public.moon VALUES (15, 'MOON 15', 'MOON DESCRIPTION', 15, 99.25, true, 1);
INSERT INTO public.moon VALUES (16, 'MOON 16', 'MOON DESCRIPTION', 16, 99.25, true, 1);
INSERT INTO public.moon VALUES (17, 'MOON 17', 'MOON DESCRIPTION', 17, 99.25, true, 1);
INSERT INTO public.moon VALUES (18, 'MOON 18', 'MOON DESCRIPTION', 18, 99.25, true, 1);
INSERT INTO public.moon VALUES (19, 'MOON 19', 'MOON DESCRIPTION', 19, 99.25, true, 1);
INSERT INTO public.moon VALUES (20, 'MOON 20', 'MOON DESCRIPTION', 20, 99.25, true, 1);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 1, 'MORE INFO 1', 'DESCRIPTION');
INSERT INTO public.more_info VALUES (2, 1, 'MORE INFO 2', 'DESCRIPTION');
INSERT INTO public.more_info VALUES (3, 1, 'MORE INFO 3', 'DESCRIPTION');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'PLANTET 1', 'PLANTET DESCRIPTION', 1, 99.25, true, 1, 1);
INSERT INTO public.planet VALUES (2, 'PLANTET 2', 'PLANTET DESCRIPTION', 2, 99.25, true, 1, 1);
INSERT INTO public.planet VALUES (3, 'PLANTET 3', 'PLANTET DESCRIPTION', 3, 99.25, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'PLANTET 4', 'PLANTET DESCRIPTION', 4, 99.25, true, 1, 1);
INSERT INTO public.planet VALUES (5, 'PLANTET 5', 'PLANTET DESCRIPTION', 5, 99.25, true, 1, 1);
INSERT INTO public.planet VALUES (6, 'PLANTET 6', 'PLANTET DESCRIPTION', 6, 99.25, true, 1, 1);
INSERT INTO public.planet VALUES (7, 'PLANTET 7', 'PLANTET DESCRIPTION', 7, 99.25, true, 1, 1);
INSERT INTO public.planet VALUES (8, 'PLANTET 8', 'PLANTET DESCRIPTION', 8, 99.25, true, 1, 1);
INSERT INTO public.planet VALUES (9, 'PLANTET 9', 'PLANTET DESCRIPTION', 9, 99.25, true, 1, 1);
INSERT INTO public.planet VALUES (10, 'PLANTET 10', 'PLANTET DESCRIPTION', 10, 99.25, true, 1, 1);
INSERT INTO public.planet VALUES (11, 'PLANTET 11', 'PLANTET DESCRIPTION', 11, 99.25, true, 1, 1);
INSERT INTO public.planet VALUES (12, 'PLANTET 12', 'PLANTET DESCRIPTION', 12, 99.25, true, 1, 1);
INSERT INTO public.planet VALUES (13, 'PLANTET 13', 'PLANTET DESCRIPTION', 13, 99.25, true, 1, 1);
INSERT INTO public.planet VALUES (14, 'PLANTET 14', 'PLANTET DESCRIPTION', 14, 99.25, true, 1, 1);
INSERT INTO public.planet VALUES (15, 'PLANTET 15', 'PLANTET DESCRIPTION', 15, 99.25, true, 1, 1);
INSERT INTO public.planet VALUES (16, 'PLANTET 16', 'PLANTET DESCRIPTION', 16, 99.25, true, 1, 1);
INSERT INTO public.planet VALUES (17, 'PLANTET 17', 'PLANTET DESCRIPTION', 17, 99.25, true, 1, 1);
INSERT INTO public.planet VALUES (18, 'PLANTET 18', 'PLANTET DESCRIPTION', 18, 99.25, true, 1, 1);
INSERT INTO public.planet VALUES (19, 'PLANTET 19', 'PLANTET DESCRIPTION', 19, 99.25, true, 1, 1);
INSERT INTO public.planet VALUES (20, 'PLANTET 20', 'PLANTET DESCRIPTION', 20, 99.25, true, 1, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'STAR 1', 'STAR DESCRIPTION', 1, 10.25, true, 1, 1);
INSERT INTO public.star VALUES (2, 'STAR 2', 'STAR DESCRIPTION', 2, 10.25, true, 1, 1);
INSERT INTO public.star VALUES (3, 'STAR 3', 'STAR DESCRIPTION', 3, 10.25, true, 1, 1);
INSERT INTO public.star VALUES (4, 'STAR 4', 'STAR DESCRIPTION', 4, 10.25, true, 1, 1);
INSERT INTO public.star VALUES (5, 'STAR 5', 'STAR DESCRIPTION', 5, 10.25, true, 1, 1);
INSERT INTO public.star VALUES (6, 'STAR 6', 'STAR DESCRIPTION', 6, 10.25, true, 1, 1);
INSERT INTO public.star VALUES (7, 'STAR 7', 'STAR DESCRIPTION', 7, 10.25, true, 1, 1);
INSERT INTO public.star VALUES (8, 'STAR 8', 'STAR DESCRIPTION', 8, 10.25, true, 1, 1);
INSERT INTO public.star VALUES (9, 'STAR 9', 'STAR DESCRIPTION', 9, 10.25, true, 1, 1);
INSERT INTO public.star VALUES (10, 'STAR 10', 'STAR DESCRIPTION', 10, 10.25, true, 1, 1);
INSERT INTO public.star VALUES (11, 'STAR 11', 'STAR DESCRIPTION', 11, 10.25, true, 1, 1);
INSERT INTO public.star VALUES (12, 'STAR 12', 'STAR DESCRIPTION', 12, 10.25, true, 1, 1);
INSERT INTO public.star VALUES (13, 'STAR 13', 'STAR DESCRIPTION', 13, 10.25, true, 1, 1);
INSERT INTO public.star VALUES (14, 'STAR 14', 'STAR DESCRIPTION', 14, 10.25, true, 1, 1);
INSERT INTO public.star VALUES (15, 'STAR 15', 'STAR DESCRIPTION', 15, 10.25, true, 1, 1);
INSERT INTO public.star VALUES (16, 'STAR 16', 'STAR DESCRIPTION', 16, 10.25, true, 1, 1);
INSERT INTO public.star VALUES (17, 'STAR 17', 'STAR DESCRIPTION', 17, 10.25, true, 1, 1);
INSERT INTO public.star VALUES (18, 'STAR 18', 'STAR DESCRIPTION', 18, 10.25, true, 1, 1);
INSERT INTO public.star VALUES (19, 'STAR 19', 'STAR DESCRIPTION', 19, 10.25, true, 1, 1);
INSERT INTO public.star VALUES (20, 'STAR 20', 'STAR DESCRIPTION', 20, 10.25, true, 1, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


--
-- Name: galaxy name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: moon name_unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_unique_moon UNIQUE (name);


--
-- Name: more_info name_unique_more_info; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT name_unique_more_info UNIQUE (name);


--
-- Name: planet name_unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_unique_planet UNIQUE (name);


--
-- Name: star name_unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_unique_star UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

