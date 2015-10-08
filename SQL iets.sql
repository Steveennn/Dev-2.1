--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.4
-- Started on 2015-10-09 00:11:25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 2034 (class 1262 OID 16438)
-- Dependencies: 2033
-- Name: DEV 2.1 Opdr 1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE "DEV 2.1 Opdr 1" IS 'Assignment 1 for DEV 2.1';


--
-- TOC entry 177 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2037 (class 0 OID 0)
-- Dependencies: 177
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 16466)
-- Name: characters; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE characters (
    name character varying NOT NULL,
    class character varying NOT NULL,
    race character varying NOT NULL,
    level integer DEFAULT 1 NOT NULL
);


ALTER TABLE characters OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 16485)
-- Name: owns; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE owns (
    name character varying NOT NULL,
    user_name character varying NOT NULL
);


ALTER TABLE owns OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 16475)
-- Name: servers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE servers (
    address character varying NOT NULL,
    name character varying NOT NULL,
    location character varying NOT NULL,
    connected_users integer DEFAULT 0 NOT NULL,
    max_users integer DEFAULT 20 NOT NULL
);


ALTER TABLE servers OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 16501)
-- Name: stores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE stores (
    address character varying NOT NULL,
    user_name character varying NOT NULL
);


ALTER TABLE stores OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 16449)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    user_name character varying NOT NULL,
    balance integer DEFAULT 0 NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    iban character varying NOT NULL,
    character_slots integer DEFAULT 5 NOT NULL,
    last_payment date,
    months_payed integer,
    password character varying NOT NULL,
    banned character varying
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 2025 (class 0 OID 16466)
-- Dependencies: 173
-- Data for Name: characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY characters (name, class, race, level) FROM stdin;
\.


--
-- TOC entry 2027 (class 0 OID 16485)
-- Dependencies: 175
-- Data for Name: owns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY owns (name, user_name) FROM stdin;
\.


--
-- TOC entry 2026 (class 0 OID 16475)
-- Dependencies: 174
-- Data for Name: servers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY servers (address, name, location, connected_users, max_users) FROM stdin;
101202	EU West	Nederland	0	20
0909	NA Scrubs	Murica	0	20
112	Emergency	Testing	0	20
\.


--
-- TOC entry 2028 (class 0 OID 16501)
-- Dependencies: 176
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY stores (address, user_name) FROM stdin;
\.


--
-- TOC entry 2024 (class 0 OID 16449)
-- Dependencies: 172
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (user_name, balance, first_name, last_name, iban, character_slots, last_payment, months_payed, password, banned) FROM stdin;
waffles	0	Bart	Nales	987654321	5	\N	0	waffles	\N
steveennn	0	Steven	van der Stel	123456789	5	2015-09-05	6	steven	\N
rvp	0	Robin	van Persie	100001	5	\N	\N	rvp	\N
\.


--
-- TOC entry 1908 (class 2606 OID 16474)
-- Name: PK Char; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY characters
    ADD CONSTRAINT "PK Char" PRIMARY KEY (name);


--
-- TOC entry 1910 (class 2606 OID 16484)
-- Name: PK servers; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY servers
    ADD CONSTRAINT "PK servers" PRIMARY KEY (address);


--
-- TOC entry 1906 (class 2606 OID 16458)
-- Name: Primary Key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT "Primary Key" PRIMARY KEY (user_name);


--
-- TOC entry 1911 (class 2606 OID 16491)
-- Name: owns_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY owns
    ADD CONSTRAINT owns_name_fkey FOREIGN KEY (name) REFERENCES characters(name) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1912 (class 2606 OID 16496)
-- Name: owns_user_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY owns
    ADD CONSTRAINT owns_user_name_fkey FOREIGN KEY (user_name) REFERENCES users(user_name) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1913 (class 2606 OID 16507)
-- Name: stores_address_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stores
    ADD CONSTRAINT stores_address_fkey FOREIGN KEY (address) REFERENCES servers(address) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1914 (class 2606 OID 16512)
-- Name: stores_user_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stores
    ADD CONSTRAINT stores_user_name_fkey FOREIGN KEY (user_name) REFERENCES users(user_name) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2036 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-10-09 00:11:25

--
-- PostgreSQL database dump complete
--

