--
-- PostgreSQL database dump
--

\restrict RdEMCphPzYhTMGCc5lCEmdGfwzeWpaqCymwaEqFcXNOyzHmpLQk9MiuekKwJYGy

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-04-21 15:58:03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 18462)
-- Name: seguridad; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA seguridad;


ALTER SCHEMA seguridad OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 18464)
-- Name: empleados; Type: TABLE; Schema: seguridad; Owner: db_admin
--

CREATE TABLE seguridad.empleados (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    cargo character varying(100) NOT NULL,
    salario numeric(10,2) NOT NULL,
    estado character varying(20)
);


ALTER TABLE seguridad.empleados OWNER TO db_admin;

--
-- TOC entry 220 (class 1259 OID 18463)
-- Name: empleados_id_seq; Type: SEQUENCE; Schema: seguridad; Owner: db_admin
--

CREATE SEQUENCE seguridad.empleados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE seguridad.empleados_id_seq OWNER TO db_admin;

--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 220
-- Name: empleados_id_seq; Type: SEQUENCE OWNED BY; Schema: seguridad; Owner: db_admin
--

ALTER SEQUENCE seguridad.empleados_id_seq OWNED BY seguridad.empleados.id;


--
-- TOC entry 223 (class 1259 OID 18487)
-- Name: tabla_ddl; Type: TABLE; Schema: seguridad; Owner: rol_ddl
--

CREATE TABLE seguridad.tabla_ddl (
    id integer NOT NULL,
    descripcion character varying(100)
);


ALTER TABLE seguridad.tabla_ddl OWNER TO rol_ddl;

--
-- TOC entry 222 (class 1259 OID 18486)
-- Name: tabla_ddl_id_seq; Type: SEQUENCE; Schema: seguridad; Owner: rol_ddl
--

CREATE SEQUENCE seguridad.tabla_ddl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE seguridad.tabla_ddl_id_seq OWNER TO rol_ddl;

--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 222
-- Name: tabla_ddl_id_seq; Type: SEQUENCE OWNED BY; Schema: seguridad; Owner: rol_ddl
--

ALTER SEQUENCE seguridad.tabla_ddl_id_seq OWNED BY seguridad.tabla_ddl.id;


--
-- TOC entry 4862 (class 2604 OID 18467)
-- Name: empleados id; Type: DEFAULT; Schema: seguridad; Owner: db_admin
--

ALTER TABLE ONLY seguridad.empleados ALTER COLUMN id SET DEFAULT nextval('seguridad.empleados_id_seq'::regclass);


--
-- TOC entry 4863 (class 2604 OID 18490)
-- Name: tabla_ddl id; Type: DEFAULT; Schema: seguridad; Owner: rol_ddl
--

ALTER TABLE ONLY seguridad.tabla_ddl ALTER COLUMN id SET DEFAULT nextval('seguridad.tabla_ddl_id_seq'::regclass);


--
-- TOC entry 5016 (class 0 OID 18464)
-- Dependencies: 221
-- Data for Name: empleados; Type: TABLE DATA; Schema: seguridad; Owner: db_admin
--

COPY seguridad.empleados (id, nombre, cargo, salario, estado) FROM stdin;
1	Johan	Analista	2500000.00	\N
10	Laura	TCL	3500000.00	\N
\.


--
-- TOC entry 5018 (class 0 OID 18487)
-- Dependencies: 223
-- Data for Name: tabla_ddl; Type: TABLE DATA; Schema: seguridad; Owner: rol_ddl
--

COPY seguridad.tabla_ddl (id, descripcion) FROM stdin;
1	Prueba DDL
2	Prueba DDL
\.


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 220
-- Name: empleados_id_seq; Type: SEQUENCE SET; Schema: seguridad; Owner: db_admin
--

SELECT pg_catalog.setval('seguridad.empleados_id_seq', 10, true);


--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 222
-- Name: tabla_ddl_id_seq; Type: SEQUENCE SET; Schema: seguridad; Owner: rol_ddl
--

SELECT pg_catalog.setval('seguridad.tabla_ddl_id_seq', 2, true);


--
-- TOC entry 4865 (class 2606 OID 18473)
-- Name: empleados empleados_pkey; Type: CONSTRAINT; Schema: seguridad; Owner: db_admin
--

ALTER TABLE ONLY seguridad.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (id);


--
-- TOC entry 4867 (class 2606 OID 18493)
-- Name: tabla_ddl tabla_ddl_pkey; Type: CONSTRAINT; Schema: seguridad; Owner: rol_ddl
--

ALTER TABLE ONLY seguridad.tabla_ddl
    ADD CONSTRAINT tabla_ddl_pkey PRIMARY KEY (id);


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA seguridad; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA seguridad TO db_admin;
GRANT ALL ON SCHEMA seguridad TO rol_ddl;
GRANT USAGE ON SCHEMA seguridad TO rol_dml;
GRANT USAGE ON SCHEMA seguridad TO rol_tcl;


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE empleados; Type: ACL; Schema: seguridad; Owner: db_admin
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE seguridad.empleados TO rol_dml;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE seguridad.empleados TO rol_tcl;


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 220
-- Name: SEQUENCE empleados_id_seq; Type: ACL; Schema: seguridad; Owner: db_admin
--

GRANT SELECT,USAGE ON SEQUENCE seguridad.empleados_id_seq TO rol_dml;
GRANT SELECT,USAGE ON SEQUENCE seguridad.empleados_id_seq TO rol_tcl;


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE tabla_ddl; Type: ACL; Schema: seguridad; Owner: rol_ddl
--

REVOKE ALL ON TABLE seguridad.tabla_ddl FROM rol_ddl;
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE seguridad.tabla_ddl TO rol_ddl;


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 222
-- Name: SEQUENCE tabla_ddl_id_seq; Type: ACL; Schema: seguridad; Owner: rol_ddl
--

REVOKE ALL ON SEQUENCE seguridad.tabla_ddl_id_seq FROM rol_ddl;
GRANT UPDATE ON SEQUENCE seguridad.tabla_ddl_id_seq TO rol_ddl;


-- Completed on 2026-04-21 15:58:04

--
-- PostgreSQL database dump complete
--

\unrestrict RdEMCphPzYhTMGCc5lCEmdGfwzeWpaqCymwaEqFcXNOyzHmpLQk9MiuekKwJYGy

