--
-- PostgreSQL database cluster dump
--

-- Started on 2024-04-16 20:10:52

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-04-16 20:10:52

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

-- Completed on 2024-04-16 20:10:53

--
-- PostgreSQL database dump complete
--

--
-- Database "binar_car" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-04-16 20:10:53

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

--
-- TOC entry 4878 (class 1262 OID 24747)
-- Name: binar_car; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE binar_car WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';


ALTER DATABASE binar_car OWNER TO postgres;

\connect binar_car

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

--
-- TOC entry 861 (class 1247 OID 24857)
-- Name: enum_members_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_members_role AS ENUM (
    'member',
    'admin',
    'superAdmin'
);


ALTER TYPE public.enum_members_role OWNER TO postgres;

--
-- TOC entry 855 (class 1247 OID 24836)
-- Name: enum_users_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_users_role AS ENUM (
    'user',
    'admin',
    'superAdmin'
);


ALTER TYPE public.enum_users_role OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 24748)
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24793)
-- Name: cars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cars (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    image text,
    detail_id integer NOT NULL,
    "rentPerDay" integer NOT NULL,
    size character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone
);


ALTER TABLE public.cars OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24792)
-- Name: cars_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cars_id_seq OWNER TO postgres;

--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 218
-- Name: cars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cars_id_seq OWNED BY public.cars.id;


--
-- TOC entry 217 (class 1259 OID 24786)
-- Name: details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.details (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone
);


ALTER TABLE public.details OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24785)
-- Name: details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.details_id_seq OWNER TO postgres;

--
-- TOC entry 4880 (class 0 OID 0)
-- Dependencies: 216
-- Name: details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.details_id_seq OWNED BY public.details.id;


--
-- TOC entry 221 (class 1259 OID 24846)
-- Name: members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.members (
    id integer NOT NULL,
    email character varying(255),
    password text,
    name character varying(255),
    photo text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone,
    role public.enum_members_role DEFAULT 'member'::public.enum_members_role NOT NULL
);


ALTER TABLE public.members OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24845)
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.members_id_seq OWNER TO postgres;

--
-- TOC entry 4881 (class 0 OID 0)
-- Dependencies: 220
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.members_id_seq OWNED BY public.members.id;


--
-- TOC entry 4709 (class 2604 OID 24796)
-- Name: cars id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars ALTER COLUMN id SET DEFAULT nextval('public.cars_id_seq'::regclass);


--
-- TOC entry 4708 (class 2604 OID 24789)
-- Name: details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.details ALTER COLUMN id SET DEFAULT nextval('public.details_id_seq'::regclass);


--
-- TOC entry 4710 (class 2604 OID 24849)
-- Name: members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members ALTER COLUMN id SET DEFAULT nextval('public.members_id_seq'::regclass);


--
-- TOC entry 4866 (class 0 OID 24748)
-- Dependencies: 215
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SequelizeMeta" (name) FROM stdin;
20240327073444-create-detail.js
20240327074526-create-car.js
20240327092901-cars_details_deletedAt.js
20240411122708-create-user.js
20240411124223-users_add_column_role.js
\.


--
-- TOC entry 4870 (class 0 OID 24793)
-- Dependencies: 219
-- Data for Name: cars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cars (id, name, image, detail_id, "rentPerDay", size, "createdAt", "updatedAt", "deletedAt") FROM stdin;
8	yaris	https://res.cloudinary.com/dyypdddve/image/upload/v1711693515/796997fc4aa546a15e134aaa8fed3542.jpg	1	190000	small	2024-03-29 13:25:15.972+07	2024-03-29 13:25:15.972+07	\N
9	mustang	https://res.cloudinary.com/dyypdddve/image/upload/v1711785485/3f1f2550d32c276dde3ca73de6c0934f.jpg	1	175000	medium	2024-03-30 14:58:05.685+07	2024-03-30 14:58:05.685+07	\N
1	toyota corola	https://res.cloudinary.com/dyypdddve/image/upload/v1711786634/b779dc29caea0270005a17302d33bf3e.jpg	4	150000	small	2024-03-27 16:45:25.982+07	2024-03-30 15:17:14.245+07	\N
5	suzuki grand vitara	https://res.cloudinary.com/dyypdddve/image/upload/v1711786674/8faa02f28a2f2016bb3d0996de295764.jpg	2	180000	large	2024-03-27 19:43:26.852+07	2024-03-30 15:17:55.046+07	\N
2	mitsubishi colt l300	https://res.cloudinary.com/dyypdddve/image/upload/v1711786728/911d86e06fbba7452e53a9a98f92f8c6.jpg	1	80000	medium	2024-03-27 17:08:00.235+07	2024-03-30 15:18:48.503+07	\N
7	daihatsu xenia	https://res.cloudinary.com/dyypdddve/image/upload/v1711786792/b60af98759b86623925e9274b1116637.jpg	3	170000	medium	2024-03-27 19:48:11.941+07	2024-03-30 15:19:52.541+07	\N
3	mitsubishi pajero sport	https://res.cloudinary.com/dyypdddve/image/upload/v1711787019/76321b116a0e20ec8f98b0c3e6d6f87c.jpg	2	400000	large	2024-03-27 19:40:37.096+07	2024-03-30 15:23:39.35+07	\N
4	honda civic 90	https://res.cloudinary.com/dyypdddve/image/upload/v1711787064/12b64cc76e2cf4a8887875ee3002c35f.jpg	1	900000	small	2024-03-27 19:42:56.304+07	2024-03-30 15:24:24.688+07	\N
6	suzuki ertiga	https://res.cloudinary.com/dyypdddve/image/upload/v1711787369/0e8bf707769ce2e5a6fbe162bba12785.png	3	250000	medium	2024-03-27 19:47:59.578+07	2024-03-30 15:29:30.12+07	\N
10	hyundai palisade	https://res.cloudinary.com/dyypdddve/image/upload/v1713234229/1fe811e314f4f96a02cd29bb7810b332.jpg	2	450000	large	2024-04-16 09:23:50.288+07	2024-04-16 09:23:50.288+07	\N
\.


--
-- TOC entry 4868 (class 0 OID 24786)
-- Dependencies: 217
-- Data for Name: details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.details (id, type, "createdAt", "updatedAt", "deletedAt") FROM stdin;
1	motuba	2024-03-27 16:33:45.041+07	2024-03-27 19:42:30.522+07	\N
2	SUV	2024-03-27 16:50:08.423+07	2024-03-27 19:43:43.044+07	\N
3	MPV	2024-03-27 19:46:57.22+07	2024-03-27 19:46:57.22+07	\N
4	sedan	2024-03-29 14:34:34.013+07	2024-03-29 14:34:34.013+07	\N
5	crossover	2024-03-29 15:04:47.918+07	2024-03-29 15:04:47.918+07	\N
\.


--
-- TOC entry 4872 (class 0 OID 24846)
-- Dependencies: 221
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.members (id, email, password, name, photo, "createdAt", "updatedAt", "deletedAt", role) FROM stdin;
1	cobasatu@gmail.com	$2b$10$Gpz2rzv4PBUBifYvcTtXiu4KtoA9Jgo3lehUxHpUdSHEcN2NCUB4.	coba	https://res.cloudinary.com/dyypdddve/image/upload/v1712841870/cfb9e32ff3380e6b83b702b8d8531b52.jpg	2024-04-11 20:24:30.799+07	2024-04-11 20:24:30.799+07	\N	member
2	andiragil@gmail.com	$2b$10$/l2kfUO7O/JP2KwCCnL6XeXbf5LVnrlKYL80r4zgj6gDOQ4WG/zQW	andiragil	https://res.cloudinary.com/dyypdddve/image/upload/v1712841946/55153811b0ff1de71dd88f65902d2cf3.jpg	2024-04-11 20:25:46.613+07	2024-04-11 20:25:46.613+07	\N	admin
3	andiragilwicaksono@gmail.com	$2b$10$Tu7B4dQdBmCDOkyjxL8CN.IKmFAIg3GSgdvg26Hns.FjiIJtKgbRW	andiragilwicaksono	https://res.cloudinary.com/dyypdddve/image/upload/v1712841984/194abb1f35ac0b62cabb293dd09f9725.jpg	2024-04-11 20:26:25.333+07	2024-04-11 20:26:25.333+07	\N	superAdmin
4	cobadua@gmail.com	$2b$10$ALSnVjDNhQVlRosCG.Wa2OBBz12PR.MHbGi.f6CHT6ET60PIGEEqa	cobadua	https://res.cloudinary.com/dyypdddve/image/upload/v1712846484/5809e44440897b78a4a3e25c98556d68.png	2024-04-11 21:41:25.46+07	2024-04-11 21:41:25.46+07	\N	admin
5	cobatiga@gmail.com	$2b$10$kI8B/IR5YEDIB8U/T4eXjeltqzqMaQNdeJewUanjVr19SbKcG00IW	cobatiga	https://res.cloudinary.com/dyypdddve/image/upload/v1712847193/5b33946c6d992de9dd15c87c5a6f8fee.jpg	2024-04-11 21:53:13.998+07	2024-04-11 21:53:13.998+07	\N	admin
\.


--
-- TOC entry 4882 (class 0 OID 0)
-- Dependencies: 218
-- Name: cars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cars_id_seq', 10, true);


--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 216
-- Name: details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.details_id_seq', 5, true);


--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 220
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.members_id_seq', 5, true);


--
-- TOC entry 4713 (class 2606 OID 24752)
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- TOC entry 4717 (class 2606 OID 24800)
-- Name: cars cars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);


--
-- TOC entry 4715 (class 2606 OID 24791)
-- Name: details details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.details
    ADD CONSTRAINT details_pkey PRIMARY KEY (id);


--
-- TOC entry 4719 (class 2606 OID 24855)
-- Name: members members_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_email_key UNIQUE (email);


--
-- TOC entry 4721 (class 2606 OID 24853)
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- TOC entry 4722 (class 2606 OID 24801)
-- Name: cars cars_detail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_detail_id_fkey FOREIGN KEY (detail_id) REFERENCES public.details(id);


-- Completed on 2024-04-16 20:10:53

--
-- PostgreSQL database dump complete
--

-- Completed on 2024-04-16 20:10:53

--
-- PostgreSQL database cluster dump complete
--

