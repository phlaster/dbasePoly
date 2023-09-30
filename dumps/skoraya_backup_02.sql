--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

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
-- Name: calls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calls (
    patient_id integer NOT NULL,
    crew_id integer NOT NULL,
    ishod_id integer NOT NULL,
    adress character varying,
    id integer NOT NULL,
    time_of_call timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    end_of_call timestamp without time zone
);


ALTER TABLE public.calls OWNER TO postgres;

--
-- Name: calls_1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.calls_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calls_1_id_seq OWNER TO postgres;

--
-- Name: calls_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.calls_1_id_seq OWNED BY public.calls.id;


--
-- Name: cars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cars (
    id integer NOT NULL,
    is_reanimation boolean DEFAULT false NOT NULL,
    date_new date NOT NULL,
    date_end date
);


ALTER TABLE public.cars OWNER TO postgres;

--
-- Name: cars_1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cars_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cars_1_id_seq OWNER TO postgres;

--
-- Name: cars_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cars_1_id_seq OWNED BY public.cars.id;


--
-- Name: crews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.crews (
    id integer NOT NULL,
    driver_id integer NOT NULL,
    sanitar_id integer NOT NULL,
    feldsher_id integer,
    car_id integer NOT NULL,
    smena_day date NOT NULL
);


ALTER TABLE public.crews OWNER TO postgres;

--
-- Name: crew_1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.crew_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crew_1_id_seq OWNER TO postgres;

--
-- Name: crew_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.crew_1_id_seq OWNED BY public.crews.id;


--
-- Name: ishody; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ishody (
    id integer NOT NULL,
    diagnosis character varying NOT NULL
);


ALTER TABLE public.ishody OWNER TO postgres;

--
-- Name: ishod_1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ishod_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ishod_1_id_seq OWNER TO postgres;

--
-- Name: ishod_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ishod_1_id_seq OWNED BY public.ishody.id;


--
-- Name: occupations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.occupations (
    id integer NOT NULL,
    prof_name character varying NOT NULL
);


ALTER TABLE public.occupations OWNER TO postgres;

--
-- Name: otguls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.otguls (
    sotrudnic_id integer NOT NULL,
    date_start time without time zone NOT NULL,
    date_end time without time zone,
    id integer NOT NULL
);


ALTER TABLE public.otguls OWNER TO postgres;

--
-- Name: otguls_1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.otguls_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.otguls_1_id_seq OWNER TO postgres;

--
-- Name: otguls_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.otguls_1_id_seq OWNED BY public.otguls.id;


--
-- Name: patients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patients (
    id integer NOT NULL,
    persona_id integer NOT NULL
);


ALTER TABLE public.patients OWNER TO postgres;

--
-- Name: patients_1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patients_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patients_1_id_seq OWNER TO postgres;

--
-- Name: patients_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patients_1_id_seq OWNED BY public.patients.id;


--
-- Name: personas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personas (
    name character varying NOT NULL,
    birthday time without time zone NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.personas OWNER TO postgres;

--
-- Name: personas_1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personas_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personas_1_id_seq OWNER TO postgres;

--
-- Name: personas_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personas_1_id_seq OWNED BY public.personas.id;


--
-- Name: profession_1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profession_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profession_1_id_seq OWNER TO postgres;

--
-- Name: profession_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profession_1_id_seq OWNED BY public.occupations.id;


--
-- Name: sotrudniki; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sotrudniki (
    id integer NOT NULL,
    data_hire time without time zone NOT NULL,
    data_kick time without time zone,
    persona_id integer NOT NULL,
    prof_id integer NOT NULL
);


ALTER TABLE public.sotrudniki OWNER TO postgres;

--
-- Name: sotrudniki_1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sotrudniki_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sotrudniki_1_id_seq OWNER TO postgres;

--
-- Name: sotrudniki_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sotrudniki_1_id_seq OWNED BY public.sotrudniki.id;


--
-- Name: calls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calls ALTER COLUMN id SET DEFAULT nextval('public.calls_1_id_seq'::regclass);


--
-- Name: cars id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars ALTER COLUMN id SET DEFAULT nextval('public.cars_1_id_seq'::regclass);


--
-- Name: crews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crews ALTER COLUMN id SET DEFAULT nextval('public.crew_1_id_seq'::regclass);


--
-- Name: ishody id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ishody ALTER COLUMN id SET DEFAULT nextval('public.ishod_1_id_seq'::regclass);


--
-- Name: occupations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.occupations ALTER COLUMN id SET DEFAULT nextval('public.profession_1_id_seq'::regclass);


--
-- Name: otguls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otguls ALTER COLUMN id SET DEFAULT nextval('public.otguls_1_id_seq'::regclass);


--
-- Name: patients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients ALTER COLUMN id SET DEFAULT nextval('public.patients_1_id_seq'::regclass);


--
-- Name: personas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas ALTER COLUMN id SET DEFAULT nextval('public.personas_1_id_seq'::regclass);


--
-- Name: sotrudniki id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sotrudniki ALTER COLUMN id SET DEFAULT nextval('public.sotrudniki_1_id_seq'::regclass);


--
-- Data for Name: calls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.calls (patient_id, crew_id, ishod_id, adress, id, time_of_call, end_of_call) FROM stdin;
\.


--
-- Data for Name: cars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cars (id, is_reanimation, date_new, date_end) FROM stdin;
\.


--
-- Data for Name: crews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.crews (id, driver_id, sanitar_id, feldsher_id, car_id, smena_day) FROM stdin;
\.


--
-- Data for Name: ishody; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ishody (id, diagnosis) FROM stdin;
\.


--
-- Data for Name: occupations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.occupations (id, prof_name) FROM stdin;
\.


--
-- Data for Name: otguls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.otguls (sotrudnic_id, date_start, date_end, id) FROM stdin;
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patients (id, persona_id) FROM stdin;
\.


--
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personas (name, birthday, id) FROM stdin;
\.


--
-- Data for Name: sotrudniki; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sotrudniki (id, data_hire, data_kick, persona_id, prof_id) FROM stdin;
\.


--
-- Name: calls_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.calls_1_id_seq', 1, false);


--
-- Name: cars_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cars_1_id_seq', 1, true);


--
-- Name: crew_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.crew_1_id_seq', 1, false);


--
-- Name: ishod_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ishod_1_id_seq', 1, false);


--
-- Name: otguls_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.otguls_1_id_seq', 1, false);


--
-- Name: patients_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patients_1_id_seq', 1, false);


--
-- Name: personas_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personas_1_id_seq', 1, false);


--
-- Name: profession_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profession_1_id_seq', 1, false);


--
-- Name: sotrudniki_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sotrudniki_1_id_seq', 1, false);


--
-- Name: calls call_1_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calls
    ADD CONSTRAINT call_1_pk PRIMARY KEY (id);


--
-- Name: cars cars_pk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pk_1 PRIMARY KEY (id);


--
-- Name: crews crew_pk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crews
    ADD CONSTRAINT crew_pk_1 PRIMARY KEY (id);


--
-- Name: ishody ishod_pk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ishody
    ADD CONSTRAINT ishod_pk_1 PRIMARY KEY (id);


--
-- Name: otguls otguls_1_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otguls
    ADD CONSTRAINT otguls_1_pk PRIMARY KEY (id);


--
-- Name: patients patients_pk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pk_1 PRIMARY KEY (id);


--
-- Name: personas personas_pk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_pk_1 PRIMARY KEY (id);


--
-- Name: occupations profession_pk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.occupations
    ADD CONSTRAINT profession_pk_1 PRIMARY KEY (id);


--
-- Name: sotrudniki sotrudniki_pk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sotrudniki
    ADD CONSTRAINT sotrudniki_pk_1 PRIMARY KEY (id);


--
-- Name: crews car_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crews
    ADD CONSTRAINT car_fk FOREIGN KEY (car_id) REFERENCES public.cars(id);


--
-- Name: calls crew_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calls
    ADD CONSTRAINT crew_fk FOREIGN KEY (crew_id) REFERENCES public.crews(id);


--
-- Name: crews driver_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crews
    ADD CONSTRAINT driver_fk FOREIGN KEY (driver_id) REFERENCES public.sotrudniki(id);


--
-- Name: crews feldsher_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crews
    ADD CONSTRAINT feldsher_fk FOREIGN KEY (feldsher_id) REFERENCES public.sotrudniki(id);


--
-- Name: calls ishod_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calls
    ADD CONSTRAINT ishod_fk FOREIGN KEY (ishod_id) REFERENCES public.ishody(id);


--
-- Name: sotrudniki occupation_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sotrudniki
    ADD CONSTRAINT occupation_fk FOREIGN KEY (prof_id) REFERENCES public.occupations(id);


--
-- Name: otguls otguls_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otguls
    ADD CONSTRAINT otguls_fk FOREIGN KEY (sotrudnic_id) REFERENCES public.sotrudniki(id);


--
-- Name: calls patient_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calls
    ADD CONSTRAINT patient_fk FOREIGN KEY (patient_id) REFERENCES public.patients(id);


--
-- Name: patients patients_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_fk FOREIGN KEY (persona_id) REFERENCES public.personas(id);


--
-- Name: sotrudniki persona_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sotrudniki
    ADD CONSTRAINT persona_fk FOREIGN KEY (persona_id) REFERENCES public.personas(id);


--
-- Name: crews sanitar_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crews
    ADD CONSTRAINT sanitar_fk FOREIGN KEY (sanitar_id) REFERENCES public.sotrudniki(id);


--
-- PostgreSQL database dump complete
--

