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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    diameter_km double precision,
    orbital_period_days double precision,
    distance_from_sun_au double precision,
    discovery_year integer,
    has_moons boolean,
    star_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type text,
    distance_light_years numeric(15,2),
    discovery_year integer,
    num_of_stars bigint,
    is_active boolean
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km double precision,
    orbital_period_days double precision,
    distance_from_planet_km double precision,
    discovery_year integer
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    type text,
    mass_earth double precision,
    radius_km double precision,
    orbital_period_days double precision,
    distance_from_star_au double precision,
    has_life_potential boolean,
    discovery_method text,
    is_habitable boolean
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    type text,
    solar_mass double precision,
    radius_km double precision,
    luminosity double precision,
    tempreture_k integer,
    age_billion_years double precision
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 940, 1681, 2.77, 1801, false, 1);
INSERT INTO public.asteroid VALUES (2, 'Pallas', 512, 1681, 2.77, 1802, false, 2);
INSERT INTO public.asteroid VALUES (3, 'Vesta', 525, 1325, 2.36, 1807, false, 3);
INSERT INTO public.asteroid VALUES (4, 'Juno', 234, 413, 2.67, 1804, true, 4);
INSERT INTO public.asteroid VALUES (5, 'Eros', 16.8, 1.74, 1.46, 1898, true, 5);
INSERT INTO public.asteroid VALUES (6, 'Gaspra', 19.6, 3.3, 2.53, 1916, false, 6);
INSERT INTO public.asteroid VALUES (7, 'Icarus', 1.4, 0.5, 1.12, 1949, true, 7);
INSERT INTO public.asteroid VALUES (8, 'Itokawa', 0.3, 0.1, 1.31, 1998, false, 8);
INSERT INTO public.asteroid VALUES (9, 'Hygiea', 430, 2331, 3.14, 1849, true, 9);
INSERT INTO public.asteroid VALUES (10, 'Euphrosyne', 280, 1763, 3.17, 1850, false, 10);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0.00, 10000, 200000000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2500000.00, 961, 1000000000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000.00, 1900, 40000000, true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 28000000.00, 1936, 150000000, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 23000000.00, 1845, 400000000, true);
INSERT INTO public.galaxy VALUES (6, 'Virgo A', 'Elliptical', 53000000.00, 1990, 500000000, true);
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 'Elliptical', 53000000.00, 1781, 500000000, true);
INSERT INTO public.galaxy VALUES (8, 'NGC 2244', 'Open Cluster', 4000.00, 1985, 10000, true);
INSERT INTO public.galaxy VALUES (9, 'NGC 253', 'Spiral', 13000000.00, 1783, 100000000, true);
INSERT INTO public.galaxy VALUES (10, 'IC 1101', 'Elliptical', 1000000000.00, 1833, 1000000000, true);
INSERT INTO public.galaxy VALUES (11, 'NGC 1300', 'Barred Spiral', 67000000.00, 1826, 100000000, true);
INSERT INTO public.galaxy VALUES (12, 'NGC 1566', 'Spiral', 69000000.00, 1834, 200000000, true);
INSERT INTO public.galaxy VALUES (13, 'NGC 2623', 'Irregular', 42000000.00, 1835, 20000000, true);
INSERT INTO public.galaxy VALUES (14, 'NGC 300', 'Spiral', 6000000.00, 1826, 50000000, true);
INSERT INTO public.galaxy VALUES (15, 'NGC 4414', 'Spiral', 60000000.00, 1785, 200000000, true);
INSERT INTO public.galaxy VALUES (16, 'NGC 6946', 'Spiral', 22000000.00, 1826, 200000000, true);
INSERT INTO public.galaxy VALUES (17, 'NGC 6822', 'Irregular', 1600000.00, 1826, 20000000, true);
INSERT INTO public.galaxy VALUES (18, 'NGC 7331', 'Spiral', 45000000.00, 1787, 100000000, true);
INSERT INTO public.galaxy VALUES (19, 'NGC 3379', 'Elliptical', 40000000.00, 1787, 500000000, true);
INSERT INTO public.galaxy VALUES (20, 'NGC 7052', 'Elliptical', 50000000.00, 1846, 200000000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474.8, 27.3, 384400, 0);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22.4, 0.3, 9377, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12.4, 1.3, 23460, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643.2, 1.8, 421800, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3121.6, 3.5, 670900, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268.2, 7.2, 1070400, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821.6, 16.7, 1882700, 1610);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, 15.9, 1221870, 1610);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 1527.6, 4.5, 527108, 1672);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 396, 0.9, 185000, 1789);
INSERT INTO public.moon VALUES (11, 'Enceladus', 6, 504, 1.4, 237950, 1789);
INSERT INTO public.moon VALUES (12, 'Triton', 7, 2706.8, 5.9, 354760, 1846);
INSERT INTO public.moon VALUES (13, 'Charon', 8, 1212, 6.4, 195900, 1978);
INSERT INTO public.moon VALUES (14, 'Ariel', 9, 1157.8, 2.5, 191020, 1851);
INSERT INTO public.moon VALUES (15, 'Umbriel', 9, 1169.4, 4.1, 266300, 1851);
INSERT INTO public.moon VALUES (16, 'Miranda', 9, 471.6, 1.4, 129000, 1948);
INSERT INTO public.moon VALUES (17, 'Titania', 9, 1578, 8.7, 436300, 1787);
INSERT INTO public.moon VALUES (18, 'Oberon', 9, 1522.4, 13.5, 583200, 1787);
INSERT INTO public.moon VALUES (19, 'Rings', 9, 2000, 30, 0, 0);
INSERT INTO public.moon VALUES (21, 'Hypothetica', 10, 1500, 12.5, 500000, 2025);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 0.055, 2439.7, 87.97, 0.39, false, 'Direct Observation', false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 0.815, 6051.8, 225, 0.72, false, 'Direct Observation', false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 1, 6371, 365.25, 1, true, 'Direct Observation', true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 0.107, 3389.5, 687, 1.52, true, 'Direct Observation', true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 2, 'Gas Giant', 317.8, 69911, 4331, 5.2, false, 'Telescopic Observation', false);
INSERT INTO public.planet VALUES (6, 'Saturn', 2, 'Gas Giant', 95.2, 58232, 10747, 9.58, false, 'Telescopic Observation', false);
INSERT INTO public.planet VALUES (7, 'Uranus', 2, 'Ice Giant', 14.5, 25362, 30589, 19.18, false, 'Telescopic Observation', false);
INSERT INTO public.planet VALUES (8, 'Neptune', 2, 'Ice Giant', 17.1, 24622, 60190, 30.07, false, 'Telescopic Observation', false);
INSERT INTO public.planet VALUES (9, 'Proxima b', 3, 'Exoplanet', 1.17, 11800, 11.2, 0.0485, true, 'Radial Velocity', true);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 4, 'Exoplanet', 1.6, 12500, 384, 1.04, true, 'Transit Method', true);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', 4, 'Exoplanet', 2.4, 15500, 290, 0.85, true, 'Transit Method', true);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 5, 'Exoplanet', 0.41, 12200, 12.4, 0.022, true, 'Transit Method', true);
INSERT INTO public.planet VALUES (13, 'HD 209458 b', 6, 'Hot Jupiter', 0.69, 13700, 3.5, 0.048, false, 'Transit Method', false);
INSERT INTO public.planet VALUES (14, 'WASP-12b', 6, 'Hot Jupiter', 1.7, 18900, 1.1, 0.022, false, 'Transit Method', false);
INSERT INTO public.planet VALUES (15, 'Kepler-16b', 7, 'Exoplanet', 0.33, 14000, 228, 0.693, false, 'Transit Method', false);
INSERT INTO public.planet VALUES (16, 'LHS 1140 b', 8, 'Super Earth', 6.6, 16000, 24.7, 0.08, true, 'Radial Velocity', true);
INSERT INTO public.planet VALUES (17, 'GJ 667 Cc', 9, 'Exoplanet', 4, 11000, 28, 0.12, true, 'Radial Velocity', true);
INSERT INTO public.planet VALUES (18, 'HD 40307 g', 10, 'Super Earth', 5, 13000, 200, 0.08, true, 'Radial Velocity', true);
INSERT INTO public.planet VALUES (19, 'WASP-19b', 11, 'Hot Jupiter', 1, 20000, 0.79, 0.02, false, 'Transit Method', false);
INSERT INTO public.planet VALUES (20, 'K2-18b', 12, 'Super Earth', 8.6, 18500, 33.4, 0.15, true, 'Transit Method', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1, 696340000, 1, 5778, 4.6);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 2, 'G2V', 1.1, 1392000000, 1.5, 5790, 5.5);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 3, 'K1V', 0.9, 1200000000, 0.5, 5260, 6.5);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 4, 'M1-M2Iab', 20, 950000000, 100000, 3500, 8);
INSERT INTO public.star VALUES (5, 'Sirius A', 5, 'A1V', 2, 1500000000, 25.4, 9940, 0.2);
INSERT INTO public.star VALUES (6, 'Sirius B', 6, 'DA2', 1, 5000000, 0.001, 25000, 0.12);
INSERT INTO public.star VALUES (7, 'Rigel', 7, 'B8Ia', 21, 570000000, 120000, 12000, 8);
INSERT INTO public.star VALUES (8, 'Proxima Centauri', 8, 'M5.5Vc', 0.12, 193000000, 5e-05, 3050, 4.8);
INSERT INTO public.star VALUES (9, 'Altair', 9, 'A7V', 1.8, 1890000000, 10.6, 7550, 1.1);
INSERT INTO public.star VALUES (10, 'Antares', 10, 'M1.5Iab', 12, 800000000, 100000, 3500, 12);
INSERT INTO public.star VALUES (11, 'Vega', 11, 'A0V', 2.1, 2830000000, 40, 9600, 0.45);
INSERT INTO public.star VALUES (12, 'Spica', 12, 'B1III-IV', 11, 640000000, 26000, 22000, 9);
INSERT INTO public.star VALUES (13, 'Arcturus', 13, 'K1.5III', 1.2, 2500000000, 160, 4300, 7);
INSERT INTO public.star VALUES (14, 'Capella', 14, 'G8III', 2.5, 1060000000, 2.5, 4900, 10);
INSERT INTO public.star VALUES (15, 'Aldebaran', 15, 'K5III', 1.5, 4500000000, 155, 4200, 6.5);
INSERT INTO public.star VALUES (16, 'Alkaid', 16, 'B3V', 3, 670000000, 420, 12500, 7);
INSERT INTO public.star VALUES (17, 'Deneb', 17, 'A2Ia', 19, 1420000000, 160000, 8500, 10);
INSERT INTO public.star VALUES (18, 'Mimosa', 18, 'B1III', 6.5, 1140000000, 45000, 23000, 7);
INSERT INTO public.star VALUES (19, 'Polaris', 19, 'F7Ib', 5.4, 2400000000, 12000, 5200, 2);
INSERT INTO public.star VALUES (20, 'Betelgeuse A', 20, 'M1-M2Iab', 20, 950000000, 100000, 3500, 8);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 20, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

