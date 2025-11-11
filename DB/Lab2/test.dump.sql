--
-- PostgreSQL database dump
--

\restrict lG5lH1sEIrYQ3xDOgB7MaNW6BzpMaJw1l1FNY09CKQXyOTvAg2LFqNsfRl7Peoc

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2025-11-11 15:50:52

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
-- TOC entry 870 (class 1247 OID 24632)
-- Name: status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.status AS ENUM (
    'не розпочато',
    'у процесі',
    'зроблено'
);


ALTER TYPE public.status OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 40960)
-- Name: author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author (
    author_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.author OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 40965)
-- Name: author_author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.author_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.author_author_id_seq OWNER TO postgres;

--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 220
-- Name: author_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.author_author_id_seq OWNED BY public.author.author_id;


--
-- TOC entry 237 (class 1259 OID 41100)
-- Name: author_book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author_book (
    author_id integer,
    book_id integer
);


ALTER TABLE public.author_book OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 40966)
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    book_id integer NOT NULL,
    title character varying(255) NOT NULL,
    language character varying(255) NOT NULL,
    year_published integer,
    pages integer,
    CONSTRAINT book_pages_check CHECK ((pages > 0))
);


ALTER TABLE public.book OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 40975)
-- Name: book_book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.book_book_id_seq OWNER TO postgres;

--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 222
-- Name: book_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_book_id_seq OWNED BY public.book.book_id;


--
-- TOC entry 223 (class 1259 OID 40976)
-- Name: book_copy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_copy (
    book_copy_id integer NOT NULL,
    book_id integer,
    copy_number character varying(255) NOT NULL
);


ALTER TABLE public.book_copy OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 40981)
-- Name: book_copy_book_copy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_copy_book_copy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.book_copy_book_copy_id_seq OWNER TO postgres;

--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 224
-- Name: book_copy_book_copy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_copy_book_copy_id_seq OWNED BY public.book_copy.book_copy_id;


--
-- TOC entry 225 (class 1259 OID 40982)
-- Name: book_genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_genres (
    book_id integer NOT NULL,
    genre_id integer NOT NULL
);


ALTER TABLE public.book_genres OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 40987)
-- Name: checkout; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.checkout (
    checkout_id integer NOT NULL,
    book_copy_id integer,
    patron_id integer,
    start_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    end_time timestamp without time zone,
    is_borrowing boolean
);


ALTER TABLE public.checkout OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 40992)
-- Name: checkout_checkout_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.checkout_checkout_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.checkout_checkout_id_seq OWNER TO postgres;

--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 227
-- Name: checkout_checkout_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.checkout_checkout_id_seq OWNED BY public.checkout.checkout_id;


--
-- TOC entry 228 (class 1259 OID 40993)
-- Name: debtors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.debtors (
    patron_id integer,
    book_id integer,
    due_date timestamp without time zone
);


ALTER TABLE public.debtors OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 40996)
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    genre_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 41001)
-- Name: genre_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genre_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genre_genre_id_seq OWNER TO postgres;

--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 230
-- Name: genre_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genre_genre_id_seq OWNED BY public.genre.genre_id;


--
-- TOC entry 231 (class 1259 OID 41002)
-- Name: notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notification (
    notification_id integer NOT NULL,
    patron_id integer,
    contents text NOT NULL
);


ALTER TABLE public.notification OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 41009)
-- Name: notification_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notification_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notification_notification_id_seq OWNER TO postgres;

--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 232
-- Name: notification_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notification_notification_id_seq OWNED BY public.notification.notification_id;


--
-- TOC entry 233 (class 1259 OID 41010)
-- Name: patron; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patron (
    patron_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    phone_number character varying(50)
);


ALTER TABLE public.patron OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 41017)
-- Name: patron_patron_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patron_patron_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.patron_patron_id_seq OWNER TO postgres;

--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 234
-- Name: patron_patron_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patron_patron_id_seq OWNED BY public.patron.patron_id;


--
-- TOC entry 235 (class 1259 OID 41018)
-- Name: waitlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.waitlist (
    waitlist_id integer NOT NULL,
    patron_id integer,
    book_id integer
);


ALTER TABLE public.waitlist OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 41022)
-- Name: waitlist_waitlist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.waitlist_waitlist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.waitlist_waitlist_id_seq OWNER TO postgres;

--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 236
-- Name: waitlist_waitlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.waitlist_waitlist_id_seq OWNED BY public.waitlist.waitlist_id;


--
-- TOC entry 4805 (class 2604 OID 41023)
-- Name: author author_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author ALTER COLUMN author_id SET DEFAULT nextval('public.author_author_id_seq'::regclass);


--
-- TOC entry 4806 (class 2604 OID 41024)
-- Name: book book_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book ALTER COLUMN book_id SET DEFAULT nextval('public.book_book_id_seq'::regclass);


--
-- TOC entry 4807 (class 2604 OID 41025)
-- Name: book_copy book_copy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_copy ALTER COLUMN book_copy_id SET DEFAULT nextval('public.book_copy_book_copy_id_seq'::regclass);


--
-- TOC entry 4808 (class 2604 OID 41026)
-- Name: checkout checkout_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checkout ALTER COLUMN checkout_id SET DEFAULT nextval('public.checkout_checkout_id_seq'::regclass);


--
-- TOC entry 4810 (class 2604 OID 41027)
-- Name: genre genre_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre ALTER COLUMN genre_id SET DEFAULT nextval('public.genre_genre_id_seq'::regclass);


--
-- TOC entry 4811 (class 2604 OID 41028)
-- Name: notification notification_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification ALTER COLUMN notification_id SET DEFAULT nextval('public.notification_notification_id_seq'::regclass);


--
-- TOC entry 4812 (class 2604 OID 41029)
-- Name: patron patron_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patron ALTER COLUMN patron_id SET DEFAULT nextval('public.patron_patron_id_seq'::regclass);


--
-- TOC entry 4813 (class 2604 OID 41030)
-- Name: waitlist waitlist_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.waitlist ALTER COLUMN waitlist_id SET DEFAULT nextval('public.waitlist_waitlist_id_seq'::regclass);


--
-- TOC entry 4994 (class 0 OID 40960)
-- Dependencies: 219
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.author (author_id, name) FROM stdin;
1	Чак Поланік
2	Сіжань Джей Джао
3	Медлін Міллер
4	 В. Домонтович
\.


--
-- TOC entry 5012 (class 0 OID 41100)
-- Dependencies: 237
-- Data for Name: author_book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.author_book (author_id, book_id) FROM stdin;
1	1
2	2
3	3
4	4
\.


--
-- TOC entry 4996 (class 0 OID 40966)
-- Dependencies: 221
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book (book_id, title, language, year_published, pages) FROM stdin;
2	Залізна Вдова	Українська	2024	446
3	Цирцея	Українська	2024	399
4	Доктор Серафікус	Українська	2024	315
1	Бійцівський Клуб 	Українська	1996	318
\.


--
-- TOC entry 4998 (class 0 OID 40976)
-- Dependencies: 223
-- Data for Name: book_copy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_copy (book_copy_id, book_id, copy_number) FROM stdin;
1	1	5
2	3	8
3	2	2
\.


--
-- TOC entry 5000 (class 0 OID 40982)
-- Dependencies: 225
-- Data for Name: book_genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_genres (book_id, genre_id) FROM stdin;
1	26
1	25
1	8
2	5
2	4
1	2
2	2
3	2
4	1
3	4
4	29
\.


--
-- TOC entry 5001 (class 0 OID 40987)
-- Dependencies: 226
-- Data for Name: checkout; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.checkout (checkout_id, book_copy_id, patron_id, start_time, end_time, is_borrowing) FROM stdin;
2	2	4	2025-11-10 19:07:56.744589	2025-11-10 00:00:00	t
3	1	2	2025-11-10 19:08:30.424319	2025-11-10 00:00:00	t
4	3	5	2025-11-10 19:08:41.5614	2025-11-10 00:00:00	t
6	1	5	2025-11-10 19:08:57.36113	2025-11-10 00:00:00	t
\.


--
-- TOC entry 5003 (class 0 OID 40993)
-- Dependencies: 228
-- Data for Name: debtors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.debtors (patron_id, book_id, due_date) FROM stdin;
\.


--
-- TOC entry 5004 (class 0 OID 40996)
-- Dependencies: 229
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genre (genre_id, name) FROM stdin;
3	Оповідання
4	Фентезі
5	Наукова фантастика
6	Пригоди
7	Детектив
8	Трилер
9	Жахи
10	Драма
11	Мелодрама
12	Біографія
13	Історичний роман
14	Міфологія
15	Психологічний роман
16	Поезія
17	Сатира
18	Комедія
19	Документальна література
20	Філософія
21	Релігія
22	Есе
23	Дитяча література
24	Навчальна література
25	Художня література
26	Сучасна проза
27	Роман
28	Повість
1	Українське
2	Зарубіжне
29	Класична проза
\.


--
-- TOC entry 5006 (class 0 OID 41002)
-- Dependencies: 231
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notification (notification_id, patron_id, contents) FROM stdin;
\.


--
-- TOC entry 5008 (class 0 OID 41010)
-- Dependencies: 233
-- Data for Name: patron; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patron (patron_id, first_name, last_name, email, phone_number) FROM stdin;
1	Анна	Куц	anna@gmail.com	0662484478
2	Андрій	Туров	andrii@gmail.com	0662484479
3	Сірко	Кропивницький	sirko@gmail.com	0662484480
4	Артем	Тен	artem.tem@gmail.com	0693773843
5	Нікіта	Бен	nikita.ben@gmail.com	0583884467
\.


--
-- TOC entry 5010 (class 0 OID 41018)
-- Dependencies: 235
-- Data for Name: waitlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.waitlist (waitlist_id, patron_id, book_id) FROM stdin;
\.


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 220
-- Name: author_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.author_author_id_seq', 7, true);


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 222
-- Name: book_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_book_id_seq', 5, true);


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 224
-- Name: book_copy_book_copy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_copy_book_copy_id_seq', 4, true);


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 227
-- Name: checkout_checkout_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.checkout_checkout_id_seq', 6, true);


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 230
-- Name: genre_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genre_genre_id_seq', 29, true);


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 232
-- Name: notification_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notification_notification_id_seq', 1, false);


--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 234
-- Name: patron_patron_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patron_patron_id_seq', 6, true);


--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 236
-- Name: waitlist_waitlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.waitlist_waitlist_id_seq', 1, false);


--
-- TOC entry 4816 (class 2606 OID 41032)
-- Name: author author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (author_id);


--
-- TOC entry 4820 (class 2606 OID 41034)
-- Name: book_copy book_copy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_copy
    ADD CONSTRAINT book_copy_pkey PRIMARY KEY (book_copy_id);


--
-- TOC entry 4822 (class 2606 OID 41036)
-- Name: book_genres book_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_genres
    ADD CONSTRAINT book_genres_pkey PRIMARY KEY (book_id, genre_id);


--
-- TOC entry 4818 (class 2606 OID 41038)
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (book_id);


--
-- TOC entry 4824 (class 2606 OID 41040)
-- Name: checkout checkout_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checkout
    ADD CONSTRAINT checkout_pkey PRIMARY KEY (checkout_id);


--
-- TOC entry 4826 (class 2606 OID 41042)
-- Name: genre genre_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_name_key UNIQUE (name);


--
-- TOC entry 4828 (class 2606 OID 41044)
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genre_id);


--
-- TOC entry 4830 (class 2606 OID 41046)
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (notification_id);


--
-- TOC entry 4832 (class 2606 OID 41048)
-- Name: patron patron_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patron
    ADD CONSTRAINT patron_email_key UNIQUE (email);


--
-- TOC entry 4834 (class 2606 OID 41050)
-- Name: patron patron_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patron
    ADD CONSTRAINT patron_pkey PRIMARY KEY (patron_id);


--
-- TOC entry 4836 (class 2606 OID 41052)
-- Name: waitlist waitlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.waitlist
    ADD CONSTRAINT waitlist_pkey PRIMARY KEY (waitlist_id);


--
-- TOC entry 4845 (class 2606 OID 41107)
-- Name: author_book author_book_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author_book
    ADD CONSTRAINT author_book_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.author(author_id);


--
-- TOC entry 4846 (class 2606 OID 41112)
-- Name: author_book author_book_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author_book
    ADD CONSTRAINT author_book_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.book(book_id);


--
-- TOC entry 4837 (class 2606 OID 41058)
-- Name: book_copy book_copy_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_copy
    ADD CONSTRAINT book_copy_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.book(book_id);


--
-- TOC entry 4838 (class 2606 OID 41063)
-- Name: book_genres book_genres_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_genres
    ADD CONSTRAINT book_genres_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.book(book_id) ON DELETE CASCADE;


--
-- TOC entry 4839 (class 2606 OID 41068)
-- Name: book_genres book_genres_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_genres
    ADD CONSTRAINT book_genres_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genre(genre_id) ON DELETE CASCADE;


--
-- TOC entry 4840 (class 2606 OID 41073)
-- Name: checkout checkout_book_copy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checkout
    ADD CONSTRAINT checkout_book_copy_id_fkey FOREIGN KEY (book_copy_id) REFERENCES public.book_copy(book_copy_id);


--
-- TOC entry 4841 (class 2606 OID 41078)
-- Name: checkout checkout_patron_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checkout
    ADD CONSTRAINT checkout_patron_id_fkey FOREIGN KEY (patron_id) REFERENCES public.patron(patron_id);


--
-- TOC entry 4842 (class 2606 OID 41083)
-- Name: notification notification_patron_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_patron_id_fkey FOREIGN KEY (patron_id) REFERENCES public.patron(patron_id);


--
-- TOC entry 4843 (class 2606 OID 41088)
-- Name: waitlist waitlist_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.waitlist
    ADD CONSTRAINT waitlist_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.book(book_id);


--
-- TOC entry 4844 (class 2606 OID 41093)
-- Name: waitlist waitlist_patron_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.waitlist
    ADD CONSTRAINT waitlist_patron_id_fkey FOREIGN KEY (patron_id) REFERENCES public.patron(patron_id);


-- Completed on 2025-11-11 15:50:52

--
-- PostgreSQL database dump complete
--

\unrestrict lG5lH1sEIrYQ3xDOgB7MaNW6BzpMaJw1l1FNY09CKQXyOTvAg2LFqNsfRl7Peoc

