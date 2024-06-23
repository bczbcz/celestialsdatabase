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
-- Name: constelation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constelation (
    constelation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    english_name character varying(40)
);


ALTER TABLE public.constelation OWNER TO freecodecamp;

--
-- Name: constelation_constelation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constelation_constelation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constelation_constelation_id_seq OWNER TO freecodecamp;

--
-- Name: constelation_constelation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constelation_constelation_id_seq OWNED BY public.constelation.constelation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    designations character varying(60),
    constelation_id integer,
    constelation character varying(30),
    name_meaning text,
    isit boolean
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
    name character varying(30) NOT NULL,
    parent_planet character varying(30) NOT NULL,
    name_meaning text,
    discovery_year integer,
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass numeric(10,4),
    diameter numeric(10,4),
    density integer,
    gravity numeric(3,1),
    rotation_period numeric(7,2),
    dist_from_sun numeric(7,2),
    number_of_moons integer,
    has_moons boolean,
    star_id integer
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
    name character varying(30) NOT NULL,
    constelation character varying(30),
    designation character varying(30),
    approval_date date,
    constelation_id integer,
    galaxy_id integer
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
-- Name: constelation constelation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constelation ALTER COLUMN constelation_id SET DEFAULT nextval('public.constelation_constelation_id_seq'::regclass);


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
-- Data for Name: constelation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constelation VALUES (1, 'Andromeda', 'Princess of Ethiopia');
INSERT INTO public.constelation VALUES (2, 'Antlia', 'Air pump');
INSERT INTO public.constelation VALUES (3, 'Apus', 'Bird of Paradise');
INSERT INTO public.constelation VALUES (4, 'Aquarius', 'Water bearer');
INSERT INTO public.constelation VALUES (5, 'Aquila', 'Eagle');
INSERT INTO public.constelation VALUES (6, 'Ara', 'Altar');
INSERT INTO public.constelation VALUES (7, 'Aries', 'Ram');
INSERT INTO public.constelation VALUES (8, 'Auriga', 'Charioteer');
INSERT INTO public.constelation VALUES (9, 'Bootes', 'Herdsman');
INSERT INTO public.constelation VALUES (10, 'Caelum', 'Graving tool');
INSERT INTO public.constelation VALUES (11, 'Camelopardalis', 'Giraffe');
INSERT INTO public.constelation VALUES (12, 'Cancer', 'Crab');
INSERT INTO public.constelation VALUES (13, 'Canes Venatici', 'Hunting dogs');
INSERT INTO public.constelation VALUES (14, 'Canis Major', 'Big dog');
INSERT INTO public.constelation VALUES (15, 'Canis Minor', 'Little dog');
INSERT INTO public.constelation VALUES (16, 'Capricornus', 'Sea goat');
INSERT INTO public.constelation VALUES (17, 'Carina', 'Keel of Argonauts ship');
INSERT INTO public.constelation VALUES (18, 'Cassiopeia', 'Queen of Ethiopia');
INSERT INTO public.constelation VALUES (19, 'Centaurus', 'Centaur');
INSERT INTO public.constelation VALUES (20, 'Cepheus', 'King of Ethiopia');
INSERT INTO public.constelation VALUES (21, 'Cetus', 'Sea monster (whale)');
INSERT INTO public.constelation VALUES (22, 'Chamaeleon', 'Chameleon');
INSERT INTO public.constelation VALUES (23, 'Circinus', 'Compasses');
INSERT INTO public.constelation VALUES (24, 'Columba', 'Dove');
INSERT INTO public.constelation VALUES (25, 'Coma Berenices', 'Berenices hair');
INSERT INTO public.constelation VALUES (26, 'Corona Australis', 'Southern crown');
INSERT INTO public.constelation VALUES (27, 'Corona Borealis', 'Northern crown');
INSERT INTO public.constelation VALUES (28, 'Corvus', 'Crow');
INSERT INTO public.constelation VALUES (29, 'Crater', 'Cup');
INSERT INTO public.constelation VALUES (30, 'Crux', 'Cross (southern)');
INSERT INTO public.constelation VALUES (31, 'Cygnus', 'Swan');
INSERT INTO public.constelation VALUES (32, 'Delphinus', 'Porpoise');
INSERT INTO public.constelation VALUES (33, 'Dorado', 'Swordfish');
INSERT INTO public.constelation VALUES (34, 'Draco', 'Dragon');
INSERT INTO public.constelation VALUES (35, 'Equuleus', 'Little horse');
INSERT INTO public.constelation VALUES (36, 'Eridanus', 'River');
INSERT INTO public.constelation VALUES (37, 'Fornax', 'Furnace');
INSERT INTO public.constelation VALUES (38, 'Gemini', 'Twins');
INSERT INTO public.constelation VALUES (39, 'Grus', 'Crane');
INSERT INTO public.constelation VALUES (40, 'Hercules', 'Hercules, son of Zeus');
INSERT INTO public.constelation VALUES (41, 'Horologium', 'Clock');
INSERT INTO public.constelation VALUES (42, 'Hydra', 'Sea serpent');
INSERT INTO public.constelation VALUES (43, 'Hydrus', 'Water snake');
INSERT INTO public.constelation VALUES (44, 'Indus', 'Indian');
INSERT INTO public.constelation VALUES (45, 'Lacerta', 'Lizard');
INSERT INTO public.constelation VALUES (46, 'Leo', 'Lion');
INSERT INTO public.constelation VALUES (47, 'Leo Minor', 'Little lion');
INSERT INTO public.constelation VALUES (48, 'Lepus', 'Hare');
INSERT INTO public.constelation VALUES (49, 'Libra', 'Balance');
INSERT INTO public.constelation VALUES (50, 'Lupus', 'Wolf');
INSERT INTO public.constelation VALUES (51, 'Lynx', 'Lynx');
INSERT INTO public.constelation VALUES (52, 'Lyra', 'Lyre or harp');
INSERT INTO public.constelation VALUES (53, 'Mensa', 'Table mountain');
INSERT INTO public.constelation VALUES (54, 'Microscopium', 'Microscope');
INSERT INTO public.constelation VALUES (55, 'Monoceros', 'Unicorn');
INSERT INTO public.constelation VALUES (56, 'Musca', 'Fly');
INSERT INTO public.constelation VALUES (57, 'Norma', 'Carpenters Level');
INSERT INTO public.constelation VALUES (58, 'Octans', 'Octant');
INSERT INTO public.constelation VALUES (59, 'Ophiuchus', 'Holder of serpent');
INSERT INTO public.constelation VALUES (60, 'Orion', 'Orion, the hunter');
INSERT INTO public.constelation VALUES (61, 'Pavo', 'Peacock');
INSERT INTO public.constelation VALUES (62, 'Pegasus', 'Pegasus, the winged horse');
INSERT INTO public.constelation VALUES (63, 'Perseus', 'Perseus, hero who saved Andromeda');
INSERT INTO public.constelation VALUES (64, 'Phoenix', 'Phoenix');
INSERT INTO public.constelation VALUES (65, 'Pictor', 'Easel');
INSERT INTO public.constelation VALUES (66, 'Pisces', 'Fishes');
INSERT INTO public.constelation VALUES (67, 'Piscis Austrinus', 'Southern fish');
INSERT INTO public.constelation VALUES (68, 'Puppis', 'Stern of the Argonauts ship');
INSERT INTO public.constelation VALUES (69, 'Pyxis', 'Compass on the Argonauts ship');
INSERT INTO public.constelation VALUES (70, 'Reticulum', 'Net');
INSERT INTO public.constelation VALUES (71, 'Sagitta', 'Arrow');
INSERT INTO public.constelation VALUES (72, 'Sagittarius', 'Archer');
INSERT INTO public.constelation VALUES (73, 'Scorpius', 'Scorpion');
INSERT INTO public.constelation VALUES (74, 'Sculptor', 'Sculptors tools');
INSERT INTO public.constelation VALUES (75, 'Scutum', 'Shield');
INSERT INTO public.constelation VALUES (76, 'Serpens', 'Serpent');
INSERT INTO public.constelation VALUES (77, 'Sextans', 'Sextant');
INSERT INTO public.constelation VALUES (78, 'Taurus', 'Bull');
INSERT INTO public.constelation VALUES (79, 'Telescopium', 'Telescope');
INSERT INTO public.constelation VALUES (80, 'Triangulum', 'Triangle');
INSERT INTO public.constelation VALUES (81, 'Triangulum Australe', 'Southern triangle');
INSERT INTO public.constelation VALUES (82, 'Tucana', 'Toucan');
INSERT INTO public.constelation VALUES (83, 'Ursa Major', 'Big bear');
INSERT INTO public.constelation VALUES (84, 'Ursa Minor', 'Little bear');
INSERT INTO public.constelation VALUES (85, 'Vela', 'Sail of the Argonauts ship');
INSERT INTO public.constelation VALUES (86, 'Virgo', 'Virgin');
INSERT INTO public.constelation VALUES (87, 'Volans', 'Flying fish');
INSERT INTO public.constelation VALUES (88, 'Vulpecula', 'Fox');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'M31, NGC 224, UGC 454, PGC 2557', 1, 'Andromeda', 'In mythology, Andromeda is the daughter of the kings of Ethiopia and is said to be more beautiful than the Nereids. She becomes queen of Greece when she marries Perseus.', NULL);
INSERT INTO public.galaxy VALUES (2, 'Antennae Galaxy', 'NGC 4038 & 4039', 28, 'Corvus', 'This is a dual galaxy. It gets its name because it is said to look like a pair of insect antennae.', NULL);
INSERT INTO public.galaxy VALUES (3, 'Backward Galaxy', 'PGC 37967 & 37969', 28, 'Corvus', '', NULL);
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 'NGC 4622, PGC 42701', 19, 'Centaurus', 'It seems to rotate in the opposite direction to what it should according to its shape.', NULL);
INSERT INTO public.galaxy VALUES (5, 'Bode’s Galaxy', 'Evil Eye Galaxy, M64, NGC 4826, PGC 44182', 25, 'Coma Berenices', 'It looks like an eye with a dark stripe underneath', NULL);
INSERT INTO public.galaxy VALUES (6, 'Butterfly Galaxies', 'M81, NGC 3031, UGC 5318, PGC 28630', 83, 'Ursa Major', 'Named after the astronomer who discovered it, Johann Elert Bode', NULL);
INSERT INTO public.galaxy VALUES (7, 'Cartwheel Galaxy', 'NGC 4567 & 4568, UGC 7776 & 7777, PGC 42064 & 42069', 86, 'Virgo', 'Binary galaxies. It looks like a pair of butterfly wings.', NULL);
INSERT INTO public.galaxy VALUES (8, 'Centaurus A', 'PGC 2248', 74, 'Sculptor', 'It looks a bit like a cartwheel', NULL);
INSERT INTO public.galaxy VALUES (9, 'Cigar Galaxy', 'NGC 5128, Arp 153, PGC 46957', 19, 'Centaurus', 'Named because it’s located in the Centaurus constellation', NULL);
INSERT INTO public.galaxy VALUES (10, 'Circinus', 'M82, NGC 3034, UGC 5322, PGC 28655', 83, 'Ursa Major', 'It is shaped like a cigar', NULL);
INSERT INTO public.galaxy VALUES (11, 'Coma Pinwheel Galaxy', 'ESO 97-G13', 23, 'Circinus', 'Latin for compass. Named after the constellation of the same name.', NULL);
INSERT INTO public.galaxy VALUES (12, 'Comet Galaxy', 'NGC 4254, PGC 39578', 25, 'Coma Berenices', 'It looks like a paper pinwheel', NULL);
INSERT INTO public.galaxy VALUES (13, 'Cosmos Redshift 7', 'VCC 1217, IC 3418', 74, 'Sculptor', 'It’s unusually shaped like a comet', NULL);
INSERT INTO public.galaxy VALUES (14, 'Eye of Sauron', 'CCCP', 77, 'Sextans', 'It’s the brightest of the distant galaxies. It contains some of the oldest stars we know of.', NULL);
INSERT INTO public.galaxy VALUES (15, 'Fireworks Galaxy', 'NGC 4151, UGC 7166, PGC 38739', 13, 'Canes Venatici', 'Looks like the eye of Sauron, from Lord of the rings.', NULL);
INSERT INTO public.galaxy VALUES (16, 'Hockey stick galaxy', 'NGC 6946, UGC 11597, PGC 65001', 31, 'Cygnus', 'It is extremely bright and has lots of colors.', NULL);
INSERT INTO public.galaxy VALUES (17, 'Hoag’s Galaxy', 'UGC 7907, PGC 42863', 13, 'Canes Venatici', 'Looks like a hockey stick. It might be 3 galaxies.', NULL);
INSERT INTO public.galaxy VALUES (18, 'Large Magellanic Cloud', 'PGC 54559', 76, 'Serpens', 'Named after its discoverer, Art Hoag', NULL);
INSERT INTO public.galaxy VALUES (19, 'Lindsay-Shapley Ring', 'ESO 56- G 115, PGC 17223', 33, 'Dorado', 'Named after Ferdinand Magellan', NULL);
INSERT INTO public.galaxy VALUES (20, 'Little Sombrero Galaxy', 'PGC 19481, AM 0644-741, ESO 34-11', 87, 'Volans', 'Ring galaxy, named after its discoverer Eric Lindsay', NULL);
INSERT INTO public.galaxy VALUES (21, 'Malin 1', 'NGC 7814, UGC 8, PGC 218', 62, 'Pegasus', 'It looks like a sombrero, but it’s smaller than the Sombrero Galaxy', NULL);
INSERT INTO public.galaxy VALUES (22, 'Medusa Merger', 'PGC 42102, LEDA 42102, VPC 1091', 25, 'Coma Berenices', 'Named after its discoverer, David Malin', NULL);
INSERT INTO public.galaxy VALUES (23, 'Sculptor Dwarf Galaxy', 'NGC 4194, UGC 7241, PGC 39068', 83, 'Ursa Major', 'Named after the snakes in the Greek myth of Medusa', NULL);
INSERT INTO public.galaxy VALUES (24, 'Mice Galaxies', 'PGC 3589', 74, 'Sculptor', 'Named because it’s located in the Sculptor constellation', NULL);
INSERT INTO public.galaxy VALUES (25, 'Small Magellanic Cloud', 'NGC 4676, UGC 7938 / 7939, PGC 43062 / 43065', 25, 'Coma Berenices', 'Two galaxies with long tails that look like a mouse', NULL);
INSERT INTO public.galaxy VALUES (26, 'Mayall’s Object', 'NGC 292, PGC 3085', 82, 'Tucana', 'Named after Ferdinand Magellan', NULL);
INSERT INTO public.galaxy VALUES (27, 'Needle Galaxy', 'APG 148, VV 032', 83, 'Ursa Major', 'Named after its discoverer, Nicholas Mayall', NULL);
INSERT INTO public.galaxy VALUES (28, 'Wolf-Lundmark-Melotte', 'NGC 4565, UGC 7772, PGC 42038', 25, 'Coma Berenices', 'Named because of its thin appearance', NULL);
INSERT INTO public.galaxy VALUES (29, 'Pinwheel Galaxy', 'UGCA 444, PGC 143', 21, 'Cetus', 'Named after the astronomers that co-discovered it', NULL);
INSERT INTO public.galaxy VALUES (30, 'Sculptor Galaxy', 'M101, NGC 5457, UGC 8981, PGC 50063', 83, 'Ursa Major', 'It looks like a paper pinwheel', NULL);
INSERT INTO public.galaxy VALUES (31, 'Sombrero Galaxy', 'NGC 253, UGCA 13, PGC 2789', 74, 'Sculptor', 'Named because it’s located in the Sculptor constellation', NULL);
INSERT INTO public.galaxy VALUES (32, 'Southern Pinwheel Galaxy', 'M104, NGC 4594, UGC 293, PGC 42407', 86, 'Virgo', 'Looks like a sombrero', NULL);
INSERT INTO public.galaxy VALUES (33, 'Sunflower Galaxy', 'M83, NGC 5236, PGC 48082', 42, 'Hydra', 'Named because it looks similar to the Pinwheel Galaxy', NULL);
INSERT INTO public.galaxy VALUES (34, 'Tadpole Galaxy', 'M63, NGC 5055, PGC 46153, UGC 8334', 13, 'Canes Venatici', 'Named because it looks a bit a sunflower', NULL);
INSERT INTO public.galaxy VALUES (35, 'Triangulum Galaxy', 'UGC 10214, Arp 188, PGC 57129', 34, 'Draco', 'It has a long tail, like a tadpole', NULL);
INSERT INTO public.galaxy VALUES (36, 'Whirlpool Galaxy', 'NGC 0598, UGC 1117, PGC 5818', 80, 'Triangulum', 'It’s located in the Triangulum Constellation', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth', 'month', 1111, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars', 'Greek god of fear and panic', 1112, 5);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars', 'Greek god of dread and terror', 1113, 5);
INSERT INTO public.moon VALUES (4, 'Io', 'Jupiter', 'Ancestor to Perseus, Cadmus, Heracles, and Minos', 1114, 6);
INSERT INTO public.moon VALUES (5, 'Europa', 'Jupiter', 'Mother of king Minos of Crete', 1115, 6);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Jupiter', 'Male hero of Troy. Served as Zeus cup-bearer in Olympus', 1116, 6);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Jupiter', 'One of the nymphs. Daughter of king Lycaon and one of Artemis followers', 1117, 6);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'Jupiter', 'Foster-mother of Zeus', 1118, 6);
INSERT INTO public.moon VALUES (9, 'Himalia', 'Jupiter', 'Nymph of the island of Rhodes. Had three sons with Zeus: Sparteus, Kronios and Kytos', 1119, 6);
INSERT INTO public.moon VALUES (10, 'Elara', 'Jupiter', 'Mortal princess, daughter of king Orchomenus and mother of the giant Tytios.', 1120, 6);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 'Jupiter', 'Queen of Crete. Daughter of Helios and mother of the minotaur.', 1121, 6);
INSERT INTO public.moon VALUES (12, 'Sinope', 'Jupiter', 'Daughter of Ares and one of the Amazons. It is believed the Turkish city of Sinop is named after her.', 1122, 6);
INSERT INTO public.moon VALUES (13, 'Lysithea', 'Jupiter', 'Mother of Heracles and Zeus. Daughter of the titan Oceanus.', 1123, 6);
INSERT INTO public.moon VALUES (14, 'Carme', 'Jupiter', 'Mother of Britomartis, goddess of mountains and hunting', 1124, 6);
INSERT INTO public.moon VALUES (15, 'Ananke', 'Jupiter', 'Personification of necessity. It also means “constrain” or “force”.', 1125, 6);
INSERT INTO public.moon VALUES (16, 'Leda', 'Jupiter', 'Aetolian princess and later Spartan queen.', 1126, 6);
INSERT INTO public.moon VALUES (17, 'Thebe', 'Jupiter', 'Name used by a few of Zeus’ daughters. It is also the name of a city in central Greece.', 1127, 6);
INSERT INTO public.moon VALUES (18, 'Adrastea', 'Jupiter', 'Goddess of “inevitable fate”. Was in charge of nurturing and protecting Zeus.', 1128, 6);
INSERT INTO public.moon VALUES (19, 'Metis', 'Jupiter', 'First wife of Zeus and mother of Athena.', 1129, 6);
INSERT INTO public.moon VALUES (20, 'Callirrhoe', 'Jupiter', 'One of the Oceanids (daughters of the titan Oceanus)', 1130, 6);
INSERT INTO public.moon VALUES (21, 'Themisto', 'Jupiter', 'Daughter of the river god Inachus.', 1131, 6);
INSERT INTO public.moon VALUES (22, 'Megaclite', 'Jupiter', 'Princess of the Locris region.', 1132, 6);
INSERT INTO public.moon VALUES (23, 'Taygete', 'Jupiter', 'One of the Pleiades, daughter of the titan Atlas.', 1133, 6);
INSERT INTO public.moon VALUES (24, 'Chaldene', 'Jupiter', 'Mother of the hero Solymos.', 1134, 6);
INSERT INTO public.moon VALUES (25, 'Harpalyke', 'Jupiter', 'Princess of Arcadia.', 1135, 6);
INSERT INTO public.moon VALUES (26, 'Kalyke', 'Jupiter', 'Alternatively written as Calyce. Thessalian princess. It is also the name of one of the nymphs.', 1136, 6);
INSERT INTO public.moon VALUES (27, 'Iocaste', 'Jupiter', 'Named after Jocasta, daughter of king Menoeceus and wife of Oedipus.', 1137, 6);
INSERT INTO public.moon VALUES (28, 'Erinome', 'Jupiter', 'In her story, Venus compelled her to fall in love with Jupiter to ruin her.', 1138, 6);
INSERT INTO public.moon VALUES (29, 'Isonoe', 'Jupiter', 'One of the Danaides. Zeus turned her into a spring after her death.', 1139, 6);
INSERT INTO public.moon VALUES (30, 'Praxidike', 'Jupiter', 'Greek goddess of punishment.', 1140, 6);
INSERT INTO public.moon VALUES (31, 'Autonoe', 'Jupiter', 'Theban princess and eldest daughter of Cadmus.', 1141, 6);
INSERT INTO public.moon VALUES (32, 'Thyone', 'Jupiter', 'Also known as Semele. Youngest daughter of Cadmus.', 1142, 6);
INSERT INTO public.moon VALUES (33, 'Hermippe', 'Jupiter', 'Daughter of Boetus. Had a son with Poseidon.', 1143, 6);
INSERT INTO public.moon VALUES (34, 'Aitne', 'Jupiter', 'The personification of mount Etna', 1144, 6);
INSERT INTO public.moon VALUES (35, 'Eurydome', 'Jupiter', 'Also known as Eurynome or Euanthe. Mother of the Graces, goddesses of charm, beauty, goodwill, and creativity', 1145, 6);
INSERT INTO public.moon VALUES (36, 'Euanthe', 'Jupiter', 'See above', 1146, 6);
INSERT INTO public.moon VALUES (37, 'Euporie', 'Jupiter', 'Also known as Euporia. Greek goddess of abundance.', 1147, 6);
INSERT INTO public.moon VALUES (38, 'Orthosie', 'Jupiter', 'Greek goddess of prosperity and one of the Horae.', 1148, 6);
INSERT INTO public.moon VALUES (39, 'Sponde', 'Jupiter', 'One of the Horae (goddesses of seasons and time periods)', 1149, 6);
INSERT INTO public.moon VALUES (40, 'Kale', 'Jupiter', 'One of the Graces or Charities (goddesses of charm, beauty, goodwill, and creativity)', 1150, 6);
INSERT INTO public.moon VALUES (41, 'Pasithee', 'Jupiter', 'One of the Graces or Charities (goddesses of charm, beauty, goodwill, and creativity)', 1151, 6);
INSERT INTO public.moon VALUES (42, 'Hegemone', 'Jupiter', 'One of the Graces or Charities (goddesses of charm, beauty, goodwill, and creativity)', 1152, 6);
INSERT INTO public.moon VALUES (43, 'Mneme', 'Jupiter', 'One of the three original muses (goddesses of literature, science, and arts)', 1153, 6);
INSERT INTO public.moon VALUES (44, 'Aoede', 'Jupiter', 'One of the three original muses (goddesses of literature, science, and arts)', 1154, 6);
INSERT INTO public.moon VALUES (45, 'Thelxinoe', 'Jupiter', 'One of the three original muses (goddesses of literature, science, and arts)', 1155, 6);
INSERT INTO public.moon VALUES (46, 'Arche', 'Jupiter', 'One of the muses', 1156, 6);
INSERT INTO public.moon VALUES (47, 'Kallichore', 'Jupiter', 'One of the nymphs', 1157, 6);
INSERT INTO public.moon VALUES (48, 'Helike', 'Jupiter', 'One of the nymphs', 1158, 6);
INSERT INTO public.moon VALUES (49, 'Carpo', 'Jupiter', 'Daughter of Zeus and one of the Horae (goddesses of the seasons)', 1159, 6);
INSERT INTO public.moon VALUES (50, 'Eukelade', 'Jupiter', 'Also written as Eucelade. One of the muses', 1160, 6);
INSERT INTO public.moon VALUES (51, 'Cyllene', 'Jupiter', 'A naiad (a spirit or nymph that hangs in rivers, lakes, streams or other water bodies)', 1161, 6);
INSERT INTO public.moon VALUES (52, 'Kore', 'Jupiter', 'Alternativve name for Persephone, daughter of Zeus and wife to Hades which made her queen of the underworld.', 1162, 6);
INSERT INTO public.moon VALUES (53, 'Herse', 'Jupiter', 'Personification of dew. Daughter of Zeus and the Moon (Selene). Also known as Ersa.', 1163, 6);
INSERT INTO public.moon VALUES (54, 'S/2010 J 1', 'Jupiter', '', 1164, 6);
INSERT INTO public.moon VALUES (55, 'S/2010 J 2', 'Jupiter', '', 1165, 6);
INSERT INTO public.moon VALUES (56, 'Dia', 'Jupiter', 'Daughter of Deioneus, wife of Ixion.', 1166, 6);
INSERT INTO public.moon VALUES (57, 'S/2016 J 1', 'Jupiter', '', 1167, 6);
INSERT INTO public.moon VALUES (58, 'S/2003 J 18', 'Jupiter', '', 1168, 6);
INSERT INTO public.moon VALUES (59, 'S/2011 J 2', 'Jupiter', '', 1169, 6);
INSERT INTO public.moon VALUES (60, 'Eirene', 'Jupiter', 'Personification of Peace. One of the Horae.', 1170, 6);
INSERT INTO public.moon VALUES (61, 'Philophrosyne', 'Jupiter', 'Spirit of friendliness and kindness. One of the Charities or Graces.', 1171, 6);
INSERT INTO public.moon VALUES (62, 'S/2017 J 1', 'Jupiter', '', 1172, 6);
INSERT INTO public.moon VALUES (63, 'Eupheme', 'Jupiter', 'Greek spirit of words of good omen, praise, and acclaims.', 1173, 6);
INSERT INTO public.moon VALUES (64, 'S/2003 J 19', 'Jupiter', '', 1174, 6);
INSERT INTO public.moon VALUES (65, 'Valetudo', 'Jupiter', 'Roman goddess of health and hygiene', 1175, 6);
INSERT INTO public.moon VALUES (66, 'S/2017 J 2', 'Jupiter', '', 1176, 6);
INSERT INTO public.moon VALUES (67, 'S/2017 J 3', 'Jupiter', '', 1177, 6);
INSERT INTO public.moon VALUES (68, 'Pandia', 'Jupiter', 'Greek representation of the Moon. Daughter of Zeus and Selene.', 1178, 6);
INSERT INTO public.moon VALUES (69, 'S/2017 J 5', 'Jupiter', '', 1179, 6);
INSERT INTO public.moon VALUES (70, 'S/2017 J 6', 'Jupiter', '', 1180, 6);
INSERT INTO public.moon VALUES (71, 'S/2017 J 7', 'Jupiter', '', 1181, 6);
INSERT INTO public.moon VALUES (72, 'S/2017 J 8', 'Jupiter', '', 1182, 6);
INSERT INTO public.moon VALUES (73, 'S/2017 J 9', 'Jupiter', '', 1183, 6);
INSERT INTO public.moon VALUES (74, 'Ersa', 'Jupiter', 'Personification of dew. Daughter of Zeus and the Moon (Selene). Also known as Herse.', 1184, 6);
INSERT INTO public.moon VALUES (75, 'S/2011 J 1', 'Jupiter', '', 1185, 6);
INSERT INTO public.moon VALUES (76, 'S/2003 J 2', 'Jupiter', '', 1186, 6);
INSERT INTO public.moon VALUES (77, 'S/2003 J 4', 'Jupiter', '', 1187, 6);
INSERT INTO public.moon VALUES (78, 'S/2003 J 9', 'Jupiter', '', 1188, 6);
INSERT INTO public.moon VALUES (79, 'S/2003 J 10', 'Jupiter', '', 1189, 6);
INSERT INTO public.moon VALUES (80, 'S/2003 J 12', 'Jupiter', '', 1190, 6);
INSERT INTO public.moon VALUES (81, 'S/2003 J 16', 'Jupiter', '', 1191, 6);
INSERT INTO public.moon VALUES (82, 'S/2003 J 23', 'Jupiter', '', 1192, 6);
INSERT INTO public.moon VALUES (83, 'S/2003 J 24', 'Jupiter', '', 1193, 6);
INSERT INTO public.moon VALUES (84, 'S/2016 J 4', 'Jupiter', '', 1194, 6);
INSERT INTO public.moon VALUES (85, 'S/2016 J 3', 'Jupiter', '', 1195, 6);
INSERT INTO public.moon VALUES (86, 'S/2018 J 3', 'Jupiter', '', 1196, 6);
INSERT INTO public.moon VALUES (87, 'S/2018 J 4', 'Jupiter', '', 1197, 6);
INSERT INTO public.moon VALUES (88, 'S/2021 J 1', 'Jupiter', '', 1198, 6);
INSERT INTO public.moon VALUES (89, 'S/2021 J 2', 'Jupiter', '', 1199, 6);
INSERT INTO public.moon VALUES (90, 'S/2021 J 3', 'Jupiter', '', 1200, 6);
INSERT INTO public.moon VALUES (91, 'S/2021 J 4', 'Jupiter', '', 1201, 6);
INSERT INTO public.moon VALUES (92, 'S/2021 J 5', 'Jupiter', '', 1202, 6);
INSERT INTO public.moon VALUES (93, 'S/2021 J 6', 'Jupiter', '', 1203, 6);
INSERT INTO public.moon VALUES (94, 'Mimas', 'Saturn', 'One of the Gigantes (giants). Son of Gaia (Earth)', 1204, 7);
INSERT INTO public.moon VALUES (95, 'Enceladus', 'Saturn', 'One of the Gigantes (giants). Son of Gaia (Earth) and Uranus (Sky)', 1205, 7);
INSERT INTO public.moon VALUES (96, 'Tethys', 'Saturn', 'One of the Titans. Mother of the Oceanids.', 1206, 7);
INSERT INTO public.moon VALUES (97, 'Dione', 'Saturn', 'One of the Titans', 1207, 7);
INSERT INTO public.moon VALUES (98, 'Rhea', 'Saturn', 'One of the Titans. Older sister of Cronus.', 1208, 7);
INSERT INTO public.moon VALUES (99, 'Titan', 'Saturn', 'Named after the Greek Titans', 1209, 7);
INSERT INTO public.moon VALUES (100, 'Hyperion', 'Saturn', 'Titan god of observation. Father of Helios, Eos, and Selene (the Moon)', 1210, 7);
INSERT INTO public.moon VALUES (101, 'Iapetus', 'Saturn', 'One of the Titans. Father of Atlas and Prometheus. Also written as Japetus', 1211, 7);
INSERT INTO public.moon VALUES (102, 'Phoebe', 'Saturn', 'One of the first generation Titaness. It means “shining” or “bright”. Original owner of the oracle of Delphi.', 1212, 7);
INSERT INTO public.moon VALUES (103, 'Janus', 'Saturn', 'Roman god of beginnings, duality, time, and doorways.', 1213, 7);
INSERT INTO public.moon VALUES (104, 'Epimetheus', 'Saturn', 'One of the Titans. Brother of Prometheus', 1214, 7);
INSERT INTO public.moon VALUES (105, 'Helene', 'Saturn', 'Named after Helen of Troy. Granddaughter of Cronus.', 1215, 7);
INSERT INTO public.moon VALUES (106, 'Telesto', 'Saturn', 'Personification of divine blessing and success. One of the Oceanids.', 1216, 7);
INSERT INTO public.moon VALUES (107, 'Calypso', 'Saturn', 'A nymph who lived in the island of Ogygia', 1217, 7);
INSERT INTO public.moon VALUES (108, 'Atlas', 'Saturn', 'One of the Titans. Condemned to hold up the sky for eternity after the Titanomachy', 1218, 7);
INSERT INTO public.moon VALUES (109, 'Prometheus', 'Saturn', 'One of the Titans. Known for stealing the fire of the gods and gifting it to humanity', 1219, 7);
INSERT INTO public.moon VALUES (110, 'Pandora', 'Saturn', 'Also known as Anesidora.It means “she who sends up gifts”', 1220, 7);
INSERT INTO public.moon VALUES (111, 'Pan', 'Saturn', 'God of the wild, sheperds, and flocks.', 1221, 7);
INSERT INTO public.moon VALUES (112, 'Ymir', 'Saturn', 'Ancestor to all the frost giants in Norse mythology. Also known as Aurgelmir, Brimir, or Bláinn', 1222, 7);
INSERT INTO public.moon VALUES (113, 'Paaliaq', 'Saturn', 'Named after after a fictional shaman in the book The Curse of the Shaman', 1223, 7);
INSERT INTO public.moon VALUES (114, 'Tarvos', 'Saturn', 'A divine figure of a bulle with thre cranes perched on its back', 1224, 7);
INSERT INTO public.moon VALUES (115, 'Ijiraq', 'Saturn', 'Shapeshifting creature in Inuit mythology', 1225, 7);
INSERT INTO public.moon VALUES (116, 'Suttungr', 'Saturn', 'A Jötunn (giant) in Norse mythlogy', 1226, 7);
INSERT INTO public.moon VALUES (117, 'Kiviuq', 'Saturn', 'A hero in Inuit mythology', 1227, 7);
INSERT INTO public.moon VALUES (118, 'Mundilfari', 'Saturn', 'Father of the Sun and the Moon in Norse mythology', 1228, 7);
INSERT INTO public.moon VALUES (119, 'Albiorix', 'Saturn', 'Named after a Gallic giant who was said to be “king of the world”', 1229, 7);
INSERT INTO public.moon VALUES (120, 'Skathi', 'Saturn', 'Also known as Skadi or Skaði. A goddess associated with bowhunting, skiing, winter, and the mountains', 1230, 7);
INSERT INTO public.moon VALUES (121, 'Erriapus', 'Saturn', 'A giant in Gaulish (Celtic) mythology', 1231, 7);
INSERT INTO public.moon VALUES (122, 'Siarnaq', 'Saturn', 'Inuit goddess of the sea. Also kown as Sedna', 1232, 7);
INSERT INTO public.moon VALUES (123, 'Thrymr', 'Saturn', 'King of the Jǫtnar in Norse mythology', 1233, 7);
INSERT INTO public.moon VALUES (124, 'Narvi', 'Saturn', 'Named after Narfi, a Jötunn (giant) in Norse mythlogy', 1234, 7);
INSERT INTO public.moon VALUES (125, 'Methone', 'Saturn', 'One of the Alkyonides, the seven beatiful daughters of Alkyoneus', 1235, 7);
INSERT INTO public.moon VALUES (126, 'Pallene', 'Saturn', 'One of the Alkyonides, the seven beatiful daughters of Alkyoneus', 1236, 7);
INSERT INTO public.moon VALUES (127, 'Polydeuces', 'Saturn', 'Alternative name for Pollux, son of Zeus and Leda', 1237, 7);
INSERT INTO public.moon VALUES (128, 'Daphnis', 'Saturn', 'A Sicilian sheperd, descendant of the Titans', 1238, 7);
INSERT INTO public.moon VALUES (129, 'Aegir', 'Saturn', 'Personification of the tranquil seas in Norse mythology', 1239, 7);
INSERT INTO public.moon VALUES (130, 'Bebhionn', 'Saturn', 'Irish goddess of birth', 1240, 7);
INSERT INTO public.moon VALUES (131, 'Bergelmir', 'Saturn', 'A giant of Norse mythology. Grandsonof Ymir', 1241, 7);
INSERT INTO public.moon VALUES (132, 'Bestla', 'Saturn', 'Mother of Odin', 1242, 7);
INSERT INTO public.moon VALUES (133, 'Farbauti', 'Saturn', 'Father of Loki', 1243, 7);
INSERT INTO public.moon VALUES (134, 'Fenrir', 'Saturn', 'Giant wolf from Norse mythology', 1244, 7);
INSERT INTO public.moon VALUES (135, 'Fornjot', 'Saturn', 'A giant of Norse mythology', 1245, 7);
INSERT INTO public.moon VALUES (136, 'Hati', 'Saturn', 'Giant wolf from Norse mythology. Son of Fenrir', 1246, 7);
INSERT INTO public.moon VALUES (137, 'Hyrrokkin', 'Saturn', 'A female Jötunn (giant)', 1247, 7);
INSERT INTO public.moon VALUES (138, 'Kari', 'Saturn', 'Personification of wind in Norse mythology', 1248, 7);
INSERT INTO public.moon VALUES (139, 'Loge', 'Saturn', 'Also named Logi. A fire Jötunn (giant)', 1249, 7);
INSERT INTO public.moon VALUES (140, 'Skoll', 'Saturn', 'Giant wolf from Norse mythology. Son of Fenrir', 1250, 7);
INSERT INTO public.moon VALUES (141, 'Surtur', 'Saturn', 'Also known as Surt. Leader of the fire fire Jötunn (giants)', 1251, 7);
INSERT INTO public.moon VALUES (142, 'Anthe', 'Saturn', 'It means “flowery”. One of the Alkyonides, the seven beatiful daughters of Alkyoneus', 1252, 7);
INSERT INTO public.moon VALUES (143, 'Jarnsaxa', 'Saturn', 'A female Jötunn (giant)', 1253, 7);
INSERT INTO public.moon VALUES (144, 'Greip', 'Saturn', 'A female Jötunn (giant)', 1254, 7);
INSERT INTO public.moon VALUES (145, 'Tarqeq', 'Saturn', 'A lunar (moon) deity in Inuit mythology', 1255, 7);
INSERT INTO public.moon VALUES (146, 'Aegaeon', 'Saturn', 'One of the hekatonkheires, three giants of Greek mythology', 1256, 7);
INSERT INTO public.moon VALUES (147, 'Gridr', 'Saturn', 'A female Jötunn (giant)', 1257, 7);
INSERT INTO public.moon VALUES (148, 'Angrboda', 'Saturn', 'A female Jötunn (giant)', 1258, 7);
INSERT INTO public.moon VALUES (149, 'Skrymir', 'Saturn', 'Master of illusions and master of castle ruler of the castle Útgarðr in Norse mythology', 1259, 7);
INSERT INTO public.moon VALUES (150, 'Gerd', 'Saturn', 'Wife of the god Freyr', 1260, 7);
INSERT INTO public.moon VALUES (151, 'S/2004 S 26', 'Saturn', '', 1261, 7);
INSERT INTO public.moon VALUES (152, 'Eggther', 'Saturn', 'A Jötunn (giant) who raises wolves', 1262, 7);
INSERT INTO public.moon VALUES (153, 'S/2004 S 29', 'Saturn', '', 1263, 7);
INSERT INTO public.moon VALUES (154, 'Beli', 'Saturn', 'A Jötunn (giant)', 1264, 7);
INSERT INTO public.moon VALUES (155, 'Gunnlod', 'Saturn', 'A female Jötunn (giant)', 1265, 7);
INSERT INTO public.moon VALUES (156, 'Thiazzi', 'Saturn', 'A Jötunn (giant). Father of Skadi', 1266, 7);
INSERT INTO public.moon VALUES (157, 'S/2004 S 34', 'Saturn', '', 1267, 7);
INSERT INTO public.moon VALUES (158, 'Alvaldi', 'Saturn', 'A Jötunn (giant). Father of Thiazzi', 1268, 7);
INSERT INTO public.moon VALUES (159, 'Geirrod', 'Saturn', 'A Jötunn (giant) who was killed by Thor', 1269, 7);
INSERT INTO public.moon VALUES (160, 'S/2004 S 7', 'Saturn', '', 1270, 7);
INSERT INTO public.moon VALUES (161, 'S/2004 S 12', 'Saturn', '', 1271, 7);
INSERT INTO public.moon VALUES (162, 'S/2004 S 13', 'Saturn', '', 1272, 7);
INSERT INTO public.moon VALUES (163, 'S/2004 S 17', 'Saturn', '', 1273, 7);
INSERT INTO public.moon VALUES (164, 'S/2004 S 21', 'Saturn', '', 1274, 7);
INSERT INTO public.moon VALUES (165, 'S/2004 S 24', 'Saturn', '', 1275, 7);
INSERT INTO public.moon VALUES (166, 'S/2004 S 28', 'Saturn', '', 1276, 7);
INSERT INTO public.moon VALUES (167, 'S/2004 S 31', 'Saturn', '', 1277, 7);
INSERT INTO public.moon VALUES (168, 'S/2004 S 36', 'Saturn', '', 1278, 7);
INSERT INTO public.moon VALUES (169, 'S/2004 S 37', 'Saturn', '', 1279, 7);
INSERT INTO public.moon VALUES (170, 'S/2004 S 39', 'Saturn', '', 1280, 7);
INSERT INTO public.moon VALUES (171, 'S/2006 S 1', 'Saturn', '', 1281, 7);
INSERT INTO public.moon VALUES (172, 'S/2006 S 3', 'Saturn', '', 1282, 7);
INSERT INTO public.moon VALUES (173, 'S/2007 S 2', 'Saturn', '', 1283, 7);
INSERT INTO public.moon VALUES (174, 'S/2007 S 3', 'Saturn', '', 1284, 7);
INSERT INTO public.moon VALUES (175, 'S/2009 S 1', 'Saturn', '', 1285, 7);
INSERT INTO public.moon VALUES (176, 'S/2019 S 1', 'Saturn', '', 1286, 7);
INSERT INTO public.moon VALUES (177, 'Ariel', 'Uranus', 'Named after a character in Alexander Pope’s works.', 1287, 8);
INSERT INTO public.moon VALUES (178, 'Umbriel', 'Uranus', 'Named after the “dusky melancholy sprite” in Alexander Pope’s works.', 1288, 8);
INSERT INTO public.moon VALUES (179, 'Titania', 'Uranus', 'Named after a charcter in Shakespeare’s play A Midsummer Night’s Dream', 1289, 8);
INSERT INTO public.moon VALUES (180, 'Oberon', 'Uranus', 'Named after a charcter in Shakespeare’s play A Midsummer Night’s Dream', 1290, 8);
INSERT INTO public.moon VALUES (181, 'Miranda', 'Uranus', 'Named after a charcter in Shakespeare’s play The Tempest', 1291, 8);
INSERT INTO public.moon VALUES (182, 'Cordelia', 'Uranus', 'Named after a charcter in Shakespeare’s play King Lear', 1292, 8);
INSERT INTO public.moon VALUES (183, 'Ophelia', 'Uranus', 'Named after a charcter in Shakespeare’s play Hamlet', 1293, 8);
INSERT INTO public.moon VALUES (184, 'Bianca', 'Uranus', 'Named after a charcter in Shakespeare’s play The Taming of the Shrew', 1294, 8);
INSERT INTO public.moon VALUES (185, 'Cressida', 'Uranus', 'Named after a charcter in Shakespeare’s play Troilus and Cressida', 1295, 8);
INSERT INTO public.moon VALUES (186, 'Desdemona', 'Uranus', 'Named after a charcter in Shakespeare’s play Othello', 1296, 8);
INSERT INTO public.moon VALUES (187, 'Juliet', 'Uranus', 'Named after a charcter in Shakespeare’s play Romeo and Juliet', 1297, 8);
INSERT INTO public.moon VALUES (188, 'Portia', 'Uranus', 'Named after a charcter in Shakespeare’s play The Merchant of Venice', 1298, 8);
INSERT INTO public.moon VALUES (189, 'Rosalind', 'Uranus', 'Named after a charcter in Shakespeare’s play As You Like It', 1299, 8);
INSERT INTO public.moon VALUES (190, 'Belinda', 'Uranus', 'Named after a character in Alexander Pope’s works.', 1300, 8);
INSERT INTO public.moon VALUES (191, 'Puck', 'Uranus', 'Named after a charcter in Shakespeare’s play A Midsummer Night’s Dream', 1301, 8);
INSERT INTO public.moon VALUES (192, 'Caliban', 'Uranus', 'Named after a charcter in Shakespeare’s play The Tempest', 1302, 8);
INSERT INTO public.moon VALUES (193, 'Sycorax', 'Uranus', 'Named after a charcter in Shakespeare’s play The Tempest', 1303, 8);
INSERT INTO public.moon VALUES (194, 'Prospero', 'Uranus', 'Named after a charcter in Shakespeare’s play The Tempest', 1304, 8);
INSERT INTO public.moon VALUES (195, 'Setebos', 'Uranus', 'Named after a charcter in Shakespeare’s play The Tempest', 1305, 8);
INSERT INTO public.moon VALUES (196, 'Stephano', 'Uranus', 'Named after a charcter in Shakespeare’s play The Tempest', 1306, 8);
INSERT INTO public.moon VALUES (197, 'Trinculo', 'Uranus', 'Named after a charcter in Shakespeare’s play The Tempest', 1307, 8);
INSERT INTO public.moon VALUES (198, 'Francisco', 'Uranus', 'Named after a charcter in Shakespeare’s play The Tempest', 1308, 8);
INSERT INTO public.moon VALUES (199, 'Margaret', 'Uranus', 'Named after a charcter in Shakespeare’s play Much Ado About Nothing', 1309, 8);
INSERT INTO public.moon VALUES (200, 'Ferdinand', 'Uranus', 'Named after a charcter in Shakespeare’s play The Tempest', 1310, 8);
INSERT INTO public.moon VALUES (201, 'Perdita', 'Uranus', 'Named after a charcter in Shakespeare’s play The Winter’s Tale', 1311, 8);
INSERT INTO public.moon VALUES (202, 'Mab', 'Uranus', 'Named after a charcter in Shakespeare’s play Romeo and Juliet', 1312, 8);
INSERT INTO public.moon VALUES (203, 'Cupid', 'Uranus', 'Named after a charcter in Shakespeare’s play Timon of Athens', 1313, 8);
INSERT INTO public.moon VALUES (204, 'Triton', 'Neptune', 'Greek god of the sea. Son of Poseidon', 1314, 9);
INSERT INTO public.moon VALUES (205, 'Nereid', 'Neptune', 'Named after the Nereids, the sea-nymphs of Greek mythology', 1315, 9);
INSERT INTO public.moon VALUES (206, 'Naiad', 'Neptune', 'Named after the Naiads, spirts or nymphs of rivers, seas, fountains, etc.', 1316, 9);
INSERT INTO public.moon VALUES (207, 'Thalassa', 'Neptune', 'Pre-Greek word for “sea” and its representation in mythology', 1317, 9);
INSERT INTO public.moon VALUES (208, 'Despina', 'Neptune', 'Also known as Despoina. One of Poseidon’s daughter', 1318, 9);
INSERT INTO public.moon VALUES (209, 'Galatea', 'Neptune', 'One of the Nereids in Greek mythology', 1319, 9);
INSERT INTO public.moon VALUES (210, 'Larissa', 'Neptune', 'Nymph from Thelassy in Greek mythology', 1320, 9);
INSERT INTO public.moon VALUES (211, 'Proteus', 'Neptune', 'Shape-changing sea god in Greek mythology', 1321, 9);
INSERT INTO public.moon VALUES (212, 'Halimede', 'Neptune', 'One of the Nereids in Greek mythology', 1322, 9);
INSERT INTO public.moon VALUES (213, 'Psamathe', 'Neptune', 'One of the Nereids in Greek mythology', 1323, 9);
INSERT INTO public.moon VALUES (214, 'Sao', 'Neptune', 'One of the Nereids. Associated with “safety” and “rescue” at sea.', 1324, 9);
INSERT INTO public.moon VALUES (215, 'Laomedeia', 'Neptune', 'One of the Nereids in Greek mythology', 1325, 9);
INSERT INTO public.moon VALUES (216, 'Neso', 'Neptune', 'One of the Nereids in Greek mythology', 1326, 9);
INSERT INTO public.moon VALUES (217, 'Hippocamp', 'Neptune', 'Named after the mythological sea-horse creature', 1327, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.3300, 4879.0000, 5429, 3.7, 1407.60, 57.90, 0, false, 32);
INSERT INTO public.planet VALUES (2, 'Venus', 4.8700, 12.1040, 5243, 8.9, -5832.50, 108.20, 0, false, 62);
INSERT INTO public.planet VALUES (3, 'Earth', 5.9700, 12.7560, 5514, 9.8, 45558.00, 149.60, 1, true, 7);
INSERT INTO public.planet VALUES (4, 'Moon', 0.0730, 3475.0000, 3340, 1.6, 655.70, 0.38, 0, false, 37);
INSERT INTO public.planet VALUES (5, 'Mars', 0.6420, 6792.0000, 3934, 3.7, 24.60, 228.00, 2, true, 27);
INSERT INTO public.planet VALUES (6, 'Jupiter', 1898.0000, 142.9840, 1326, 23.1, 9.90, 778.50, 95, true, 22);
INSERT INTO public.planet VALUES (7, 'Saturn', 568.0000, 120.5360, 687, 9.0, 10.70, 1432.00, 146, true, 52);
INSERT INTO public.planet VALUES (8, 'Uranus', 86.8000, 51.1180, 1270, 8.7, -17.20, 2867.00, 28, true, 57);
INSERT INTO public.planet VALUES (9, 'Neptune', 102.0000, 49.5280, 1638, 11.0, 16.10, 4515.00, 16, true, 42);
INSERT INTO public.planet VALUES (10, 'Pluto', 0.0130, 2376.0000, 1850, 0.7, -153.30, 5906.40, 5, true, 47);
INSERT INTO public.planet VALUES (11, 'Judo', 44896.0000, 3545.0000, 2347, 2.4, 11.00, 7648.00, 12, true, 17);
INSERT INTO public.planet VALUES (12, 'Ikto', 685.0000, 7111.0000, 2344, 5.6, -45.00, 9726.00, 56, true, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Acamar', 'Eridanus', 'HR 897', '2016-07-20', 36, 13);
INSERT INTO public.star VALUES (2, 'Achernar', 'Eridanus', 'HR 472', '2016-06-30', 36, 13);
INSERT INTO public.star VALUES (3, 'Achird', 'Cassiopeia', 'HR 219', '2017-09-05', 18, 13);
INSERT INTO public.star VALUES (4, 'Acrab', 'Scorpius', 'HR 5984', '2016-08-21', 73, 13);
INSERT INTO public.star VALUES (5, 'Acrux', 'Crux', 'HR 4730', '2016-07-20', 30, 13);
INSERT INTO public.star VALUES (6, 'Acubens', 'Cancer', 'HR 3572', '2016-07-20', 12, 13);
INSERT INTO public.star VALUES (7, 'Adhafera', 'Leo', 'HR 4031', '2016-07-20', 46, 13);
INSERT INTO public.star VALUES (8, 'Adhara', 'Canis Major', 'HR 2618', '2016-08-21', 14, 13);
INSERT INTO public.star VALUES (9, 'Adhil', 'Andromeda', 'HR 390', '2016-08-21', 1, 13);
INSERT INTO public.star VALUES (10, 'Ain', 'Taurus', 'HR 1409', '2015-12-15', 78, 13);
INSERT INTO public.star VALUES (11, 'Ainalrami', 'Sagittarius', 'HR 7116', '2017-09-05', 72, 13);
INSERT INTO public.star VALUES (12, 'Aladfar', 'Lyra', 'HR 7298', '2017-09-05', 52, 13);
INSERT INTO public.star VALUES (13, 'Albaldah', 'Sagittarius', 'HR 7264', '2017-09-05', 72, 13);
INSERT INTO public.star VALUES (14, 'Albali', 'Aquarius', 'HR 7950', '2016-09-12', 4, 13);
INSERT INTO public.star VALUES (15, 'Albireo', 'Cygnus', 'HR 7417', '2016-07-20', 31, 13);
INSERT INTO public.star VALUES (16, 'Alchiba', 'Corvus', 'HR 4623', '2016-09-12', 28, 13);
INSERT INTO public.star VALUES (17, 'Alcor', 'Ursa Major', 'HR 5062', '2016-06-30', 83, 13);
INSERT INTO public.star VALUES (18, 'Alcyone', 'Taurus', 'HR 1165', '2016-06-30', 78, 13);
INSERT INTO public.star VALUES (19, 'Aldebaran', 'Taurus', 'HR 1457', '2016-06-30', 78, 13);
INSERT INTO public.star VALUES (20, 'Alderamin', 'Cepheus', 'HR 8162', '2016-07-20', 20, 13);
INSERT INTO public.star VALUES (21, 'Aldhanab', 'Grus', 'HR 8353', '2017-09-05', 39, 13);
INSERT INTO public.star VALUES (22, 'Aldhibah', 'Draco', 'HR 6396', '2017-09-05', 34, 13);
INSERT INTO public.star VALUES (23, 'Aldulfin', 'Delphinus', 'HR 7852', '2017-09-05', 32, 13);
INSERT INTO public.star VALUES (24, 'Alfirk', 'Cepheus', 'HR 8238', '2016-08-21', 20, 13);
INSERT INTO public.star VALUES (25, 'Algedi', 'Capricornus', 'HR 7754', '2016-08-21', 16, 13);
INSERT INTO public.star VALUES (26, 'Algenib', 'Pegasus', 'HR 39', '2016-06-30', 62, 13);
INSERT INTO public.star VALUES (27, 'Algieba', 'Leo', 'HR 4057', '2016-07-20', 46, 13);
INSERT INTO public.star VALUES (28, 'Algol', 'Perseus', 'HR 936', '2016-06-30', 63, 13);
INSERT INTO public.star VALUES (29, 'Algorab', 'Corvus', 'HR 4757', '2016-07-20', 28, 13);
INSERT INTO public.star VALUES (30, 'Alhena', 'Gemini', 'HR 2421', '2016-07-20', 38, 13);
INSERT INTO public.star VALUES (31, 'Alioth', 'Ursa Major', 'HR 4905', '2016-06-30', 83, 13);
INSERT INTO public.star VALUES (32, 'Aljanah', 'Cygnus', 'HR 7949', '2017-06-30', 31, 13);
INSERT INTO public.star VALUES (33, 'Alkaid', 'Ursa Major', 'HR 5191', '2016-06-30', 83, 13);
INSERT INTO public.star VALUES (34, 'Alkalurops', 'Boötes', 'HR 5733', '2016-08-21', 9, 13);
INSERT INTO public.star VALUES (35, 'Alkaphrah', 'Ursa Major', 'HR 3594', '2017-09-05', 83, 13);
INSERT INTO public.star VALUES (36, 'Alkarab', 'Pegasus', 'HR 8905', '2017-09-05', 62, 13);
INSERT INTO public.star VALUES (37, 'Alkes', 'Crater', 'HR 4287', '2016-09-12', 29, 13);
INSERT INTO public.star VALUES (38, 'Almaaz', 'Auriga', 'HR 1605', '2017-02-01', 8, 13);
INSERT INTO public.star VALUES (39, 'Almach', 'Andromeda', 'HR 603', '2016-07-20', 1, 13);
INSERT INTO public.star VALUES (40, 'Alnair', 'Grus', 'HR 8425', '2016-07-20', 39, 13);
INSERT INTO public.star VALUES (41, 'Alnasl', 'Sagittarius', 'HR 6746', '2016-08-21', 72, 13);
INSERT INTO public.star VALUES (42, 'Alnilam', 'Orion', 'HR 1903', '2016-07-20', 60, 13);
INSERT INTO public.star VALUES (43, 'Alnitak', 'Orion', 'HR 1948', '2016-07-20', 60, 13);
INSERT INTO public.star VALUES (44, 'Alniyat', 'Scorpius', 'HR 6084', '2017-02-01', 73, 13);
INSERT INTO public.star VALUES (45, 'Alphard', 'Hydra', 'HR 3748', '2016-07-20', 42, 13);
INSERT INTO public.star VALUES (46, 'Alphecca', 'Corona Borealis', 'HR 5793', '2016-07-20', 27, 13);
INSERT INTO public.star VALUES (47, 'Alpheratz', 'Andromeda', 'HR 15', '2016-06-30', 1, 13);
INSERT INTO public.star VALUES (48, 'Alpherg', 'Pisces', 'HR 437', '2018-06-01', 66, 13);
INSERT INTO public.star VALUES (49, 'Alrakis', 'Draco', 'HR 6370', '2017-02-01', 34, 13);
INSERT INTO public.star VALUES (50, 'Alrescha', 'Pisces', 'HR 596', '2016-08-21', 66, 13);
INSERT INTO public.star VALUES (51, 'Alruba', 'Draco', 'HR 6618', '2018-06-01', 34, 13);
INSERT INTO public.star VALUES (52, 'Alsafi', 'Draco', 'HR 7462', '2017-06-30', 34, 13);
INSERT INTO public.star VALUES (53, 'Alsciaukat', 'Lynx', 'HR 3275', '2017-06-30', 51, 13);
INSERT INTO public.star VALUES (54, 'Alsephina', 'Vela', 'HR 3485', '2017-09-05', 85, 13);
INSERT INTO public.star VALUES (55, 'Alshain', 'Aquila', 'HR 7602', '2016-08-21', 5, 13);
INSERT INTO public.star VALUES (56, 'Alshat', 'Capricornus', 'HR 7773', '2017-06-30', 16, 13);
INSERT INTO public.star VALUES (57, 'Altair', 'Aquila', 'HR 7557', '2016-06-30', 5, 13);
INSERT INTO public.star VALUES (58, 'Altais', 'Draco', 'HR 7310', '2016-08-21', 34, 13);
INSERT INTO public.star VALUES (59, 'Alterf', 'Leo', 'HR 3773', '2017-02-01', 46, 13);
INSERT INTO public.star VALUES (60, 'Aludra', 'Canis Major', 'HR 2827', '2016-07-20', 14, 13);
INSERT INTO public.star VALUES (61, 'Alula Australis', 'Ursa Major', 'HR 4375', '2016-07-20', 83, 13);
INSERT INTO public.star VALUES (62, 'Alula Borealis', 'Ursa Major', 'HR 4377', '2016-07-20', 83, 13);
INSERT INTO public.star VALUES (63, 'Alya', 'Serpens', 'HR 7141', '2016-08-21', 76, 13);
INSERT INTO public.star VALUES (64, 'Alzirr', 'Gemini', 'HR 2484', '2017-06-30', 38, 13);
INSERT INTO public.star VALUES (65, 'Ancha', 'Aquarius', 'HR 8499', '2016-09-12', 4, 13);
INSERT INTO public.star VALUES (66, 'Angetenar', 'Eridanus', 'HR 850', '2017-06-30', 36, 13);
INSERT INTO public.star VALUES (67, 'Ankaa', 'Phoenix', 'HR 99', '2016-07-20', 64, 13);
INSERT INTO public.star VALUES (68, 'Anser', 'Vulpecula', 'HR 7405', '2017-06-30', 88, 13);
INSERT INTO public.star VALUES (69, 'Antares', 'Scorpius', 'HR 6134', '2016-06-30', 73, 13);
INSERT INTO public.star VALUES (70, 'Arcturus', 'Boötes', 'HR 5340', '2016-06-30', 9, 13);
INSERT INTO public.star VALUES (71, 'Arkab Posterior', 'Sagittarius', 'HR 7343', '2016-10-05', 72, 13);
INSERT INTO public.star VALUES (72, 'Arkab Prior', 'Sagittarius', 'HR 7337', '2016-10-05', 72, 13);
INSERT INTO public.star VALUES (73, 'Arneb', 'Lepus', 'HR 1865', '2016-07-20', 48, 13);
INSERT INTO public.star VALUES (74, 'Ascella', 'Sagittarius', 'HR 7194', '2016-09-12', 72, 13);
INSERT INTO public.star VALUES (75, 'Asellus Australis', 'Cancer', 'HR 3461', '2016-11-06', 12, 13);
INSERT INTO public.star VALUES (76, 'Asellus Borealis', 'Cancer', 'HR 3449', '2016-11-06', 12, 13);
INSERT INTO public.star VALUES (77, 'Ashlesha', 'Hydra', 'HR 3482', '2018-06-01', 42, 13);
INSERT INTO public.star VALUES (78, 'Aspidiske', 'Carina', 'HR 3699', '2016-07-20', 17, 13);
INSERT INTO public.star VALUES (79, 'Asterope', 'nan', 'HR 1151', '2016-08-21', 56, 13);
INSERT INTO public.star VALUES (80, 'Athebyne', 'Draco', 'HR 6132', '2017-09-05', 34, 13);
INSERT INTO public.star VALUES (81, 'Atik', 'Perseus', 'HR 1131', '2016-09-12', 63, 13);
INSERT INTO public.star VALUES (82, 'Atlas', 'Taurus', 'HR 1178', '2016-08-21', 78, 13);
INSERT INTO public.star VALUES (83, 'Atria', 'Triangulum Australe', 'HR 6217', '2016-07-20', 81, 13);
INSERT INTO public.star VALUES (84, 'Avior', 'Carina', 'HR 3307', '2016-07-20', 17, 13);
INSERT INTO public.star VALUES (85, 'Azelfafage', 'Cygnus', 'HR 8301', '2016-09-12', 31, 13);
INSERT INTO public.star VALUES (86, 'Azha', 'Eridanus', 'HR 874', '2016-09-12', 36, 13);
INSERT INTO public.star VALUES (87, 'Azmidi', 'Puppis', 'HR 3045', '2018-06-01', 68, 13);


--
-- Name: constelation_constelation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constelation_constelation_id_seq', 88, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 36, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 217, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 89, true);


--
-- Name: constelation constelation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constelation
    ADD CONSTRAINT constelation_name_key UNIQUE (name);


--
-- Name: constelation constelation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constelation
    ADD CONSTRAINT constelation_pkey PRIMARY KEY (constelation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_constelation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constelation_id_fkey FOREIGN KEY (constelation_id) REFERENCES public.constelation(constelation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_constelation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constelation_id_fkey FOREIGN KEY (constelation_id) REFERENCES public.constelation(constelation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

