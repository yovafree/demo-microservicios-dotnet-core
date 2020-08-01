--
-- PostgreSQL database dump
--

-- Dumped from database version 10.13
-- Dumped by pg_dump version 12.2

-- Started on 2020-05-24 18:46:34 UTC

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

--
-- TOC entry 197 (class 1259 OID 16386)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    cod_cliente integer NOT NULL,
    nit text,
    nombre text,
    direccion text
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16384)
-- Name: cliente_cod_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_cod_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_cod_cliente_seq OWNER TO postgres;

--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 196
-- Name: cliente_cod_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_cod_cliente_seq OWNED BY public.cliente.cod_cliente;


--
-- TOC entry 203 (class 1259 OID 16424)
-- Name: det_factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.det_factura (
    cod_det_factura integer NOT NULL,
    precio_unitario numeric(12,2),
    subtotal numeric(12,2),
    cod_producto integer,
    cod_factura integer,
    cantidad numeric(6,2)
);


ALTER TABLE public.det_factura OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16422)
-- Name: det_factura_cod_det_factura_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.det_factura_cod_det_factura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.det_factura_cod_det_factura_seq OWNER TO postgres;

--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 202
-- Name: det_factura_cod_det_factura_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.det_factura_cod_det_factura_seq OWNED BY public.det_factura.cod_det_factura;


--
-- TOC entry 201 (class 1259 OID 16408)
-- Name: factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura (
    cod_factura integer NOT NULL,
    cod_cliente integer,
    fec_factura date,
    descripcion text
);


ALTER TABLE public.factura OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16406)
-- Name: factura_cod_factura_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.factura_cod_factura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.factura_cod_factura_seq OWNER TO postgres;

--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 200
-- Name: factura_cod_factura_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.factura_cod_factura_seq OWNED BY public.factura.cod_factura;


--
-- TOC entry 199 (class 1259 OID 16397)
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    cod_producto integer NOT NULL,
    nombre text,
    precio_unitario numeric(12,2)
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16395)
-- Name: producto_cod_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_cod_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producto_cod_producto_seq OWNER TO postgres;

--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 198
-- Name: producto_cod_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_cod_producto_seq OWNED BY public.producto.cod_producto;


--
-- TOC entry 205 (class 1259 OID 16442)
-- Name: proveedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedor (
    cod_proveedor integer NOT NULL,
    nit text,
    nombre text,
    descripcion text
);


ALTER TABLE public.proveedor OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16440)
-- Name: proveedor_cod_proveedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proveedor_cod_proveedor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proveedor_cod_proveedor_seq OWNER TO postgres;

--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 204
-- Name: proveedor_cod_proveedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proveedor_cod_proveedor_seq OWNED BY public.proveedor.cod_proveedor;


--
-- TOC entry 2803 (class 2604 OID 16389)
-- Name: cliente cod_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN cod_cliente SET DEFAULT nextval('public.cliente_cod_cliente_seq'::regclass);


--
-- TOC entry 2806 (class 2604 OID 16427)
-- Name: det_factura cod_det_factura; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.det_factura ALTER COLUMN cod_det_factura SET DEFAULT nextval('public.det_factura_cod_det_factura_seq'::regclass);


--
-- TOC entry 2805 (class 2604 OID 16411)
-- Name: factura cod_factura; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura ALTER COLUMN cod_factura SET DEFAULT nextval('public.factura_cod_factura_seq'::regclass);


--
-- TOC entry 2804 (class 2604 OID 16400)
-- Name: producto cod_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto ALTER COLUMN cod_producto SET DEFAULT nextval('public.producto_cod_producto_seq'::regclass);


--
-- TOC entry 2807 (class 2604 OID 16445)
-- Name: proveedor cod_proveedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedor ALTER COLUMN cod_proveedor SET DEFAULT nextval('public.proveedor_cod_proveedor_seq'::regclass);


--
-- TOC entry 2943 (class 0 OID 16386)
-- Dependencies: 197
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (cod_cliente, nit, nombre, direccion) FROM stdin;
1	123456	José Diaz	Ciudad
2	6549871	Manuel García	Ciudad
3	558899	Diego Urtado	Ciudad
4	887956	Luis Galicia	Ciudad
5	8552315	Juan de Dios	Ciudad
\.


--
-- TOC entry 2949 (class 0 OID 16424)
-- Dependencies: 203
-- Data for Name: det_factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.det_factura (cod_det_factura, precio_unitario, subtotal, cod_producto, cod_factura, cantidad) FROM stdin;
1	3.50	7.00	1	1	2.00
2	3.50	10.50	1	2	3.00
3	7.80	7.80	2	2	1.00
4	23.00	23.00	3	3	1.00
5	11.50	11.50	4	4	1.00
6	7.80	7.80	2	5	1.00
7	3.50	3.50	1	5	1.00
\.


--
-- TOC entry 2947 (class 0 OID 16408)
-- Dependencies: 201
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.factura (cod_factura, cod_cliente, fec_factura, descripcion) FROM stdin;
1	1	2020-01-01	--
2	1	2020-01-02	--
3	2	2020-03-01	--
4	3	2020-04-04	--
5	4	2020-05-25	--
\.


--
-- TOC entry 2945 (class 0 OID 16397)
-- Dependencies: 199
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto (cod_producto, nombre, precio_unitario) FROM stdin;
1	Pasta Hina	3.50
2	Pasta Colgate	7.80
3	Korn Flakes de Kellogs	23.00
4	Frijol Ducal Mediano	11.50
\.


--
-- TOC entry 2951 (class 0 OID 16442)
-- Dependencies: 205
-- Data for Name: proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedor (cod_proveedor, nit, nombre, descripcion) FROM stdin;
1	4559963	Ducal	--
2	5854631	Kellogs	--
3	77885566	Diana	--
4	7665134	Colgate	--
5	9876543	Cervecería Centroamericana	--
\.


--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 196
-- Name: cliente_cod_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_cod_cliente_seq', 5, true);


--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 202
-- Name: det_factura_cod_det_factura_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.det_factura_cod_det_factura_seq', 7, true);


--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 200
-- Name: factura_cod_factura_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.factura_cod_factura_seq', 5, true);


--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 198
-- Name: producto_cod_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_cod_producto_seq', 4, true);


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 204
-- Name: proveedor_cod_proveedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedor_cod_proveedor_seq', 5, true);


--
-- TOC entry 2809 (class 2606 OID 16394)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cod_cliente);


--
-- TOC entry 2815 (class 2606 OID 16429)
-- Name: det_factura det_factura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.det_factura
    ADD CONSTRAINT det_factura_pkey PRIMARY KEY (cod_det_factura);


--
-- TOC entry 2813 (class 2606 OID 16416)
-- Name: factura factura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (cod_factura);


--
-- TOC entry 2811 (class 2606 OID 16405)
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (cod_producto);


--
-- TOC entry 2817 (class 2606 OID 16450)
-- Name: proveedor proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT proveedor_pkey PRIMARY KEY (cod_proveedor);


--
-- TOC entry 2818 (class 2606 OID 16451)
-- Name: factura cliente_factura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT cliente_factura FOREIGN KEY (cod_cliente) REFERENCES public.cliente(cod_cliente) NOT VALID;


--
-- TOC entry 2819 (class 2606 OID 16430)
-- Name: det_factura factura_det_factura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.det_factura
    ADD CONSTRAINT factura_det_factura FOREIGN KEY (cod_factura) REFERENCES public.factura(cod_factura);


--
-- TOC entry 2820 (class 2606 OID 16435)
-- Name: det_factura producto_det_factura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.det_factura
    ADD CONSTRAINT producto_det_factura FOREIGN KEY (cod_producto) REFERENCES public.producto(cod_producto);


-- Completed on 2020-05-24 18:46:34 UTC

--
-- PostgreSQL database dump complete
--

