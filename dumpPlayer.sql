--
-- PostgreSQL database dump
--

-- Dumped from database version 15.5 (Ubuntu 15.5-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.5 (Ubuntu 15.5-1.pgdg22.04+1)

-- Started on 2023-11-27 12:33:47 -03

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
-- TOC entry 223 (class 1259 OID 17246)
-- Name: bibliotecas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bibliotecas (
    id_ouvinte integer NOT NULL,
    id_playlist integer NOT NULL
);


ALTER TABLE public.bibliotecas OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17244)
-- Name: bibliotecas_id_ouvinte_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bibliotecas_id_ouvinte_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bibliotecas_id_ouvinte_seq OWNER TO postgres;

--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 221
-- Name: bibliotecas_id_ouvinte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bibliotecas_id_ouvinte_seq OWNED BY public.bibliotecas.id_ouvinte;


--
-- TOC entry 222 (class 1259 OID 17245)
-- Name: bibliotecas_id_playlist_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bibliotecas_id_playlist_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bibliotecas_id_playlist_seq OWNER TO postgres;

--
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 222
-- Name: bibliotecas_id_playlist_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bibliotecas_id_playlist_seq OWNED BY public.bibliotecas.id_playlist;


--
-- TOC entry 230 (class 1259 OID 17274)
-- Name: historicos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historicos (
    id_historico integer NOT NULL,
    data_adicao date,
    id_playlist integer NOT NULL,
    id_musica integer NOT NULL,
    id_ouvinte integer NOT NULL
);


ALTER TABLE public.historicos OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17270)
-- Name: historicos_id_historico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historicos_id_historico_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.historicos_id_historico_seq OWNER TO postgres;

--
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 226
-- Name: historicos_id_historico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historicos_id_historico_seq OWNED BY public.historicos.id_historico;


--
-- TOC entry 228 (class 1259 OID 17272)
-- Name: historicos_id_musica_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historicos_id_musica_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.historicos_id_musica_seq OWNER TO postgres;

--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 228
-- Name: historicos_id_musica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historicos_id_musica_seq OWNED BY public.historicos.id_musica;


--
-- TOC entry 229 (class 1259 OID 17273)
-- Name: historicos_id_ouvinte_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historicos_id_ouvinte_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.historicos_id_ouvinte_seq OWNER TO postgres;

--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 229
-- Name: historicos_id_ouvinte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historicos_id_ouvinte_seq OWNED BY public.historicos.id_ouvinte;


--
-- TOC entry 227 (class 1259 OID 17271)
-- Name: historicos_id_playlist_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historicos_id_playlist_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.historicos_id_playlist_seq OWNER TO postgres;

--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 227
-- Name: historicos_id_playlist_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historicos_id_playlist_seq OWNED BY public.historicos.id_playlist;


--
-- TOC entry 225 (class 1259 OID 17264)
-- Name: musicas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.musicas (
    id_musica integer NOT NULL,
    titulo character varying(255),
    duracao interval
);


ALTER TABLE public.musicas OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17263)
-- Name: musicas_id_musica_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.musicas_id_musica_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.musicas_id_musica_seq OWNER TO postgres;

--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 224
-- Name: musicas_id_musica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.musicas_id_musica_seq OWNED BY public.musicas.id_musica;


--
-- TOC entry 218 (class 1259 OID 17223)
-- Name: ouvintes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ouvintes (
    id_ouvinte integer NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE public.ouvintes OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17221)
-- Name: ouvintes_id_ouvinte_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ouvintes_id_ouvinte_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ouvintes_id_ouvinte_seq OWNER TO postgres;

--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 216
-- Name: ouvintes_id_ouvinte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ouvintes_id_ouvinte_seq OWNED BY public.ouvintes.id_ouvinte;


--
-- TOC entry 217 (class 1259 OID 17222)
-- Name: ouvintes_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ouvintes_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ouvintes_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 217
-- Name: ouvintes_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ouvintes_id_usuario_seq OWNED BY public.ouvintes.id_usuario;


--
-- TOC entry 220 (class 1259 OID 17236)
-- Name: playlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlists (
    id_playlist integer NOT NULL,
    nome character varying(255),
    descricao character varying(255)
);


ALTER TABLE public.playlists OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17235)
-- Name: playlists_id_playlist_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.playlists_id_playlist_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.playlists_id_playlist_seq OWNER TO postgres;

--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 219
-- Name: playlists_id_playlist_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.playlists_id_playlist_seq OWNED BY public.playlists.id_playlist;


--
-- TOC entry 215 (class 1259 OID 17211)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nome_usuario character varying(255),
    email character varying(255)
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17210)
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 214
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;


--
-- TOC entry 3250 (class 2604 OID 17249)
-- Name: bibliotecas id_ouvinte; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bibliotecas ALTER COLUMN id_ouvinte SET DEFAULT nextval('public.bibliotecas_id_ouvinte_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 17250)
-- Name: bibliotecas id_playlist; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bibliotecas ALTER COLUMN id_playlist SET DEFAULT nextval('public.bibliotecas_id_playlist_seq'::regclass);


--
-- TOC entry 3253 (class 2604 OID 17277)
-- Name: historicos id_historico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historicos ALTER COLUMN id_historico SET DEFAULT nextval('public.historicos_id_historico_seq'::regclass);


--
-- TOC entry 3254 (class 2604 OID 17278)
-- Name: historicos id_playlist; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historicos ALTER COLUMN id_playlist SET DEFAULT nextval('public.historicos_id_playlist_seq'::regclass);


--
-- TOC entry 3255 (class 2604 OID 17279)
-- Name: historicos id_musica; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historicos ALTER COLUMN id_musica SET DEFAULT nextval('public.historicos_id_musica_seq'::regclass);


--
-- TOC entry 3256 (class 2604 OID 17280)
-- Name: historicos id_ouvinte; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historicos ALTER COLUMN id_ouvinte SET DEFAULT nextval('public.historicos_id_ouvinte_seq'::regclass);


--
-- TOC entry 3252 (class 2604 OID 17267)
-- Name: musicas id_musica; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musicas ALTER COLUMN id_musica SET DEFAULT nextval('public.musicas_id_musica_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 17226)
-- Name: ouvintes id_ouvinte; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ouvintes ALTER COLUMN id_ouvinte SET DEFAULT nextval('public.ouvintes_id_ouvinte_seq'::regclass);


--
-- TOC entry 3248 (class 2604 OID 17227)
-- Name: ouvintes id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ouvintes ALTER COLUMN id_usuario SET DEFAULT nextval('public.ouvintes_id_usuario_seq'::regclass);


--
-- TOC entry 3249 (class 2604 OID 17239)
-- Name: playlists id_playlist; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists ALTER COLUMN id_playlist SET DEFAULT nextval('public.playlists_id_playlist_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 17214)
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- TOC entry 3428 (class 0 OID 17246)
-- Dependencies: 223
-- Data for Name: bibliotecas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bibliotecas (id_ouvinte, id_playlist) FROM stdin;
\.


--
-- TOC entry 3435 (class 0 OID 17274)
-- Dependencies: 230
-- Data for Name: historicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historicos (id_historico, data_adicao, id_playlist, id_musica, id_ouvinte) FROM stdin;
\.


--
-- TOC entry 3430 (class 0 OID 17264)
-- Dependencies: 225
-- Data for Name: musicas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.musicas (id_musica, titulo, duracao) FROM stdin;
\.


--
-- TOC entry 3423 (class 0 OID 17223)
-- Dependencies: 218
-- Data for Name: ouvintes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ouvintes (id_ouvinte, id_usuario) FROM stdin;
\.


--
-- TOC entry 3425 (class 0 OID 17236)
-- Dependencies: 220
-- Data for Name: playlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlists (id_playlist, nome, descricao) FROM stdin;
\.


--
-- TOC entry 3420 (class 0 OID 17211)
-- Dependencies: 215
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id_usuario, nome_usuario, email) FROM stdin;
\.


--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 221
-- Name: bibliotecas_id_ouvinte_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bibliotecas_id_ouvinte_seq', 1, false);


--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 222
-- Name: bibliotecas_id_playlist_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bibliotecas_id_playlist_seq', 1, false);


--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 226
-- Name: historicos_id_historico_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historicos_id_historico_seq', 2, true);


--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 228
-- Name: historicos_id_musica_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historicos_id_musica_seq', 1, false);


--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 229
-- Name: historicos_id_ouvinte_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historicos_id_ouvinte_seq', 1, false);


--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 227
-- Name: historicos_id_playlist_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historicos_id_playlist_seq', 1, false);


--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 224
-- Name: musicas_id_musica_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.musicas_id_musica_seq', 2, true);


--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 216
-- Name: ouvintes_id_ouvinte_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ouvintes_id_ouvinte_seq', 1, true);


--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 217
-- Name: ouvintes_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ouvintes_id_usuario_seq', 1, false);


--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 219
-- Name: playlists_id_playlist_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.playlists_id_playlist_seq', 1, true);


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 214
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 1, true);


--
-- TOC entry 3266 (class 2606 OID 17252)
-- Name: bibliotecas bibliotecas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bibliotecas
    ADD CONSTRAINT bibliotecas_pkey PRIMARY KEY (id_ouvinte, id_playlist);


--
-- TOC entry 3270 (class 2606 OID 17282)
-- Name: historicos historicos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historicos
    ADD CONSTRAINT historicos_pkey PRIMARY KEY (id_historico);


--
-- TOC entry 3268 (class 2606 OID 17269)
-- Name: musicas musicas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musicas
    ADD CONSTRAINT musicas_pkey PRIMARY KEY (id_musica);


--
-- TOC entry 3262 (class 2606 OID 17229)
-- Name: ouvintes ouvintes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ouvintes
    ADD CONSTRAINT ouvintes_pkey PRIMARY KEY (id_ouvinte);


--
-- TOC entry 3264 (class 2606 OID 17243)
-- Name: playlists playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_pkey PRIMARY KEY (id_playlist);


--
-- TOC entry 3258 (class 2606 OID 17220)
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- TOC entry 3260 (class 2606 OID 17218)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 3272 (class 2606 OID 17253)
-- Name: bibliotecas bibliotecas_id_ouvinte_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bibliotecas
    ADD CONSTRAINT bibliotecas_id_ouvinte_fkey FOREIGN KEY (id_ouvinte) REFERENCES public.ouvintes(id_ouvinte);


--
-- TOC entry 3273 (class 2606 OID 17258)
-- Name: bibliotecas bibliotecas_id_playlist_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bibliotecas
    ADD CONSTRAINT bibliotecas_id_playlist_fkey FOREIGN KEY (id_playlist) REFERENCES public.playlists(id_playlist);


--
-- TOC entry 3274 (class 2606 OID 17288)
-- Name: historicos historicos_id_musica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historicos
    ADD CONSTRAINT historicos_id_musica_fkey FOREIGN KEY (id_musica) REFERENCES public.musicas(id_musica);


--
-- TOC entry 3275 (class 2606 OID 17293)
-- Name: historicos historicos_id_ouvinte_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historicos
    ADD CONSTRAINT historicos_id_ouvinte_fkey FOREIGN KEY (id_ouvinte) REFERENCES public.ouvintes(id_ouvinte);


--
-- TOC entry 3276 (class 2606 OID 17283)
-- Name: historicos historicos_id_playlist_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historicos
    ADD CONSTRAINT historicos_id_playlist_fkey FOREIGN KEY (id_playlist) REFERENCES public.playlists(id_playlist);


--
-- TOC entry 3271 (class 2606 OID 17230)
-- Name: ouvintes ouvintes_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ouvintes
    ADD CONSTRAINT ouvintes_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


-- Completed on 2023-11-27 12:33:47 -03

--
-- PostgreSQL database dump complete
--

