--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE authors (
    author_id integer NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE authors OWNER TO vagrant;

--
-- Name: authors_author_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE authors_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authors_author_id_seq OWNER TO vagrant;

--
-- Name: authors_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE authors_author_id_seq OWNED BY authors.author_id;


--
-- Name: book_authors; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE book_authors (
    book_author_id integer NOT NULL,
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE book_authors OWNER TO vagrant;

--
-- Name: book_authors_book_author_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE book_authors_book_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE book_authors_book_author_id_seq OWNER TO vagrant;

--
-- Name: book_authors_book_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE book_authors_book_author_id_seq OWNED BY book_authors.book_author_id;


--
-- Name: book_genres; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE book_genres (
    book_genre_id integer NOT NULL,
    book_id integer NOT NULL,
    genre_id integer NOT NULL
);


ALTER TABLE book_genres OWNER TO vagrant;

--
-- Name: book_genres_book_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE book_genres_book_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE book_genres_book_genre_id_seq OWNER TO vagrant;

--
-- Name: book_genres_book_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE book_genres_book_genre_id_seq OWNED BY book_genres.book_genre_id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE books (
    book_id integer NOT NULL,
    title character varying(256) NOT NULL,
    release_year integer,
    url character varying(256) NOT NULL,
    book_cover character varying(256) NOT NULL,
    mini_summary character varying(1024) NOT NULL,
    goodreads_id integer
);


ALTER TABLE books OWNER TO vagrant;

--
-- Name: books_book_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE books_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_book_id_seq OWNER TO vagrant;

--
-- Name: books_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE books_book_id_seq OWNED BY books.book_id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE genres (
    genre_id integer NOT NULL,
    genre character varying(64) NOT NULL
);


ALTER TABLE genres OWNER TO vagrant;

--
-- Name: genres_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE genres_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genres_genre_id_seq OWNER TO vagrant;

--
-- Name: genres_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE genres_genre_id_seq OWNED BY genres.genre_id;


--
-- Name: user_books; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE user_books (
    user_book_id integer NOT NULL,
    user_id integer NOT NULL,
    book_id integer NOT NULL,
    book_read boolean NOT NULL,
    rating integer,
    updated_at timestamp without time zone
);


ALTER TABLE user_books OWNER TO vagrant;

--
-- Name: user_books_user_book_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE user_books_user_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_books_user_book_id_seq OWNER TO vagrant;

--
-- Name: user_books_user_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE user_books_user_book_id_seq OWNED BY user_books.user_book_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE users (
    user_id integer NOT NULL,
    name character varying(64) NOT NULL,
    goodreads_id integer,
    email character varying(128),
    password character varying(64)
);


ALTER TABLE users OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_user_id_seq OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- Name: author_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY authors ALTER COLUMN author_id SET DEFAULT nextval('authors_author_id_seq'::regclass);


--
-- Name: book_author_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY book_authors ALTER COLUMN book_author_id SET DEFAULT nextval('book_authors_book_author_id_seq'::regclass);


--
-- Name: book_genre_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY book_genres ALTER COLUMN book_genre_id SET DEFAULT nextval('book_genres_book_genre_id_seq'::regclass);


--
-- Name: book_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY books ALTER COLUMN book_id SET DEFAULT nextval('books_book_id_seq'::regclass);


--
-- Name: genre_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY genres ALTER COLUMN genre_id SET DEFAULT nextval('genres_genre_id_seq'::regclass);


--
-- Name: user_book_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY user_books ALTER COLUMN user_book_id SET DEFAULT nextval('user_books_user_book_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY authors (author_id, name) FROM stdin;
1	Lewis Carroll
2	Jane Austen
3	Arthur Conan Doyle
4	William Shakespeare
5	Francis Scott Fitzgerald
6	Vatsyayana
7	Bram Stoker
8	Sun Tzu
9	H. G. Wells
10	Lyman Frank Baum
11	J.M. Barrie
12	Robert Louis Stevenson
13	Charlotte Brontë
14	Sigmund Freud
15	Dante Alighieri
16	Solomon Northup
17	Joseph Conrad
18	Mary Shelley
19	Jules Verne
20	Frances Hodgson Burnett
21	Louisa May Alcott
22	Marcus  Aurelius
23	Jack London
24	Lev Nikolayevich Tolstoy
25	Richard Connell
26	Charles Dickens
27	Agatha Christie
28	Niccolò Machiavelli
29	Charles Darwin
30	Alexandre Dumas
31	Edgar Allan Poe
32	Hermann Hesse
33	Kahlil Gibran
34	John Cleland
35	Jacob Ludwig Karl Grimm
36	Wilhem Karl Grimm
37	Emily Brontë
38	Oscar Wilde
39	Andrew Lang
40	Virginia Woolf
41	Lucius Apuleius
42	Daniel Defoe
43	David Herbert Lawrence
44	Yei Theodora Ozaki
45	Adam Smith
46	Mark Twain
47	Franz Kafka
48	Thomas Hardy
49	Lucy Maud Montgomery
50	Homer
51	Herman Melville
52	Fyodor Mikhailovich Dostoyevsky
53	Victor Hugo
54	E. M. Forster
55	Philip K. Dick
56	Dale Breckenridge Carnegie
57	Laozi
58	Hendrik Antoon Lorentz
59	Nikolai Gogol
60	Randall Garrett
61	Laurence Mark Janifer
62	James Joyce
63	Musashi Miyamoto
64	Gilbert Keith Chesterton
65	Leopold Von Sacher-Masoch
66	Ivan Sergeyevich Turgenev
67	Marcel Proust
68	Margaret Cavendish
69	Washington Irving
70	Jonathan Swift
71	Sinclair Lewis
72	William Strunk Jr.
73	Margaret Deland
74	Robert William Chambers
75	Thea von Harbou
76	Aristotle
77	Thomas More
78	Irving Cox
79	Theodore Dreiser
80	Hans Christian Andersen
81	Wilkie Collins
82	Friedrich Wilhelm Nietzsche
83	Nathaniel Hawthorne
84	Plato
85	Howard Phillips Lovecraft
86	David Reagan
87	Henry Rider Haggard
88	Cory Doctorow
89	Rudyard Kipling
90	Anonymous
91	Stephen Crane
92	Lawrence Lessig
93	Edgar Wallace
94	William Hope Hodgson
95	William Makepeace Thackeray
96	Kenneth Grahame
97	Bertrand Russell
98	Adam Rakunas
99	Ivan Aleksandrovich Goncharov
100	B. M. Bower
101	James Stephens
102	Edgar Rice Burroughs
103	Gustave Flaubert
104	Gaston Leroux
105	George Sylvester Viereck
106	Hume Nisbet
107	George Eliot
108	Joseph Sheridan Le Fanu
109	Peter Watts
110	Karl Marx
111	Friedrich Engels
112	John Milton
113	Charlotte Perkins Gilman
114	George Bernard Shaw
115	Elizabeth Cleghorn Gaskell
116	Joseph Lewis French
117	Robert Stawell Ball
118	Thomas Paine
119	Anthony Hope
120	Kurt Vonnegut
121	Publius
122	Voltaire
123	Hammurabi
124	Harry Harrison
125	Lord Redesdale
126	Paulo Coelho
127	Edith Nesbit
128	Dorothy Leigh Sayers
129	Miguel Cervantes
130	P. T. Barnum
131	Henry Kuttner
132	Marie Corelli
133	Henry James
134	René Descartes
135	Henry David Thoreau
136	Prentice Mulford
\.


--
-- Name: authors_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('authors_author_id_seq', 136, true);


--
-- Data for Name: book_authors; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY book_authors (book_author_id, book_id, author_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	6	6
7	7	7
8	8	8
9	9	4
10	10	9
11	11	10
12	12	11
13	13	9
14	14	4
15	15	12
16	16	13
17	17	14
18	18	15
19	19	16
20	20	17
21	21	18
22	22	19
23	23	20
24	24	21
25	25	22
26	26	9
27	27	23
28	28	24
29	29	4
30	30	25
31	31	26
32	32	3
33	33	2
34	34	27
35	35	28
36	36	29
37	37	9
38	38	30
39	39	31
40	40	32
41	41	33
42	42	34
43	43	35
44	43	36
45	44	26
46	45	37
47	46	38
48	47	2
49	48	3
50	49	19
51	50	39
52	51	38
53	52	40
54	53	41
55	54	40
56	55	42
57	56	43
58	57	44
59	58	45
60	59	46
61	60	3
62	61	47
63	62	48
64	63	49
65	64	50
66	65	19
67	66	51
68	67	26
69	68	27
70	69	23
71	70	52
72	71	53
73	72	3
74	73	46
75	74	54
76	75	3
77	76	55
78	77	23
79	78	4
80	79	56
81	80	4
82	81	57
83	82	58
84	83	59
85	84	30
86	85	60
87	85	61
88	86	46
89	87	62
90	88	4
91	89	40
92	90	3
93	91	24
94	92	28
95	93	1
96	94	26
97	95	43
98	96	63
99	97	64
100	98	65
101	99	66
102	100	67
103	101	43
104	102	68
105	103	31
106	104	69
107	105	62
108	106	52
109	107	38
110	108	70
111	109	71
112	110	5
113	111	4
114	112	3
115	113	72
116	114	3
117	115	73
118	116	74
119	117	75
120	118	76
121	119	77
122	120	12
123	121	2
124	122	23
125	123	78
126	124	79
127	125	80
128	126	81
129	127	82
130	128	47
131	129	19
132	130	83
133	131	49
134	132	84
135	133	31
136	134	85
137	135	43
138	136	86
139	137	87
140	138	26
141	139	88
142	140	89
143	141	90
144	142	53
145	143	4
146	144	91
147	145	19
148	146	40
149	147	92
150	148	20
151	149	4
152	150	5
153	151	9
154	152	23
155	153	93
156	154	50
157	155	94
158	156	9
159	157	4
160	158	39
161	159	31
162	160	95
163	161	96
164	162	97
165	163	23
166	164	98
167	165	52
168	166	40
169	167	3
170	168	31
171	169	99
172	170	100
173	171	2
174	172	101
175	173	102
176	174	103
177	175	104
178	176	105
179	177	106
180	178	19
181	179	107
182	180	108
183	181	109
184	182	82
185	183	46
186	184	110
187	184	111
188	185	112
189	186	113
190	187	114
191	188	26
192	189	84
193	190	59
194	191	2
195	192	115
196	193	116
197	194	10
198	195	52
199	196	48
200	197	117
201	198	118
202	199	119
203	200	54
204	201	5
205	202	120
206	203	9
207	204	23
208	205	85
209	206	89
210	207	4
211	208	43
212	209	121
213	210	19
214	211	122
215	212	123
216	213	31
217	214	10
218	215	124
219	216	82
220	217	23
221	218	125
222	219	23
223	220	126
224	221	49
225	222	3
226	223	39
227	224	30
228	225	127
229	226	128
230	227	115
231	228	49
232	229	129
233	230	130
234	231	118
235	232	131
236	233	43
237	234	9
238	235	46
239	236	132
240	237	113
241	238	102
242	239	133
243	240	134
244	241	26
245	242	93
246	243	135
247	244	136
248	245	113
249	246	102
250	247	19
251	248	46
\.


--
-- Name: book_authors_book_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('book_authors_book_author_id_seq', 251, true);


--
-- Data for Name: book_genres; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY book_genres (book_genre_id, book_id, genre_id) FROM stdin;
1	1	1
2	1	2
3	2	1
4	2	3
5	3	1
6	3	4
7	3	5
8	4	1
9	4	6
10	4	3
11	5	1
12	5	7
13	5	3
14	6	8
15	6	9
16	6	10
17	6	11
18	6	12
19	7	1
20	7	13
21	8	8
22	8	9
23	8	10
24	9	1
25	9	6
26	10	1
27	10	14
28	10	15
29	11	1
30	11	2
31	12	1
32	12	2
33	13	1
34	13	14
35	13	5
36	14	1
37	14	6
38	15	1
39	15	16
40	16	1
41	16	3
42	17	8
43	17	9
44	17	11
45	18	1
46	18	17
47	19	8
48	19	18
49	19	19
50	20	1
51	20	7
52	21	1
53	21	13
54	22	1
55	22	16
56	22	14
57	23	1
58	23	20
59	24	1
60	24	20
61	25	8
62	25	9
63	25	10
64	26	1
65	26	14
66	26	21
67	27	1
68	27	16
69	28	1
70	28	22
71	28	21
72	29	1
73	29	6
74	29	3
75	30	1
76	30	16
77	30	4
78	30	5
79	30	23
80	31	1
81	31	22
82	32	1
83	32	4
84	32	5
85	33	1
86	33	3
87	34	1
88	34	4
89	35	8
90	35	9
91	35	10
92	35	24
93	36	8
94	36	25
95	36	26
96	37	1
97	37	14
98	38	1
99	38	16
100	39	1
101	39	4
102	39	5
103	40	1
104	40	8
105	40	9
106	40	10
107	41	1
108	41	17
109	42	1
110	42	27
111	43	1
112	43	28
113	43	20
114	43	29
115	43	30
116	44	1
117	45	1
118	45	3
119	45	31
120	46	1
121	47	1
122	47	3
123	48	1
124	48	4
125	49	1
126	49	16
127	49	14
128	50	1
129	50	28
130	51	1
131	51	28
132	52	1
133	52	7
134	53	1
135	53	28
136	53	32
137	54	1
138	54	7
139	55	1
140	55	16
141	56	1
142	56	7
143	57	1
144	57	2
145	57	28
146	57	5
147	58	8
148	58	33
149	58	34
150	58	25
151	58	26
152	59	1
153	59	16
154	59	35
155	60	1
156	60	4
157	60	5
158	61	1
159	61	13
160	61	5
161	62	1
162	62	3
163	63	1
164	64	1
165	64	17
166	64	28
167	65	1
168	65	16
169	65	14
170	66	1
171	66	16
172	67	1
173	68	1
174	68	4
175	69	1
176	69	16
177	70	1
178	70	7
179	71	1
180	71	22
181	72	1
182	72	4
183	72	5
184	73	1
185	73	22
186	73	36
187	74	1
188	74	3
189	75	1
190	75	4
191	76	1
192	76	14
193	76	5
194	77	1
195	77	3
196	78	1
197	78	6
198	78	37
199	79	8
200	79	9
201	79	38
202	79	39
203	80	1
204	80	6
205	81	8
206	81	9
207	81	10
208	81	40
209	82	8
210	82	25
211	82	26
212	83	1
213	83	7
214	84	1
215	84	16
216	84	22
217	84	3
218	85	1
219	85	14
220	85	27
221	86	1
222	86	16
223	87	1
224	87	7
225	88	1
226	88	6
227	89	8
228	89	41
229	89	33
230	89	42
231	90	1
232	90	4
233	91	1
234	91	3
235	92	8
236	92	9
237	92	10
238	92	33
239	92	34
240	92	43
241	92	44
242	92	45
243	92	46
244	92	47
245	93	1
246	93	2
247	94	1
248	95	1
249	95	7
250	96	8
251	96	9
252	96	10
253	97	1
254	97	4
255	97	5
256	98	1
257	98	27
258	99	1
259	99	3
260	99	5
261	100	1
262	100	7
263	101	1
264	101	7
265	102	1
266	102	14
267	102	48
268	103	1
269	103	4
270	103	5
271	104	1
272	104	49
273	104	50
274	104	51
275	104	13
276	104	5
277	105	1
278	105	5
279	106	1
280	106	5
281	107	1
282	107	49
283	107	50
284	107	51
285	107	35
286	107	5
287	108	1
288	108	35
289	109	1
290	109	35
291	110	1
292	110	5
293	111	1
294	111	6
295	112	1
296	112	4
297	112	5
298	113	8
299	114	1
300	114	4
301	115	1
302	115	7
303	116	1
304	116	13
305	116	5
306	117	1
307	117	14
308	118	8
309	118	9
310	118	10
311	119	8
312	119	9
313	119	10
314	120	1
315	120	13
316	121	1
317	121	3
318	122	1
319	122	14
320	122	5
321	123	1
322	123	14
323	123	5
324	124	1
325	124	7
326	125	1
327	125	2
328	125	28
329	125	5
330	126	1
331	126	4
332	126	3
333	126	31
334	126	23
335	127	8
336	127	9
337	127	10
338	128	1
339	128	7
340	129	1
341	129	14
342	129	5
343	130	1
344	130	3
345	130	31
346	131	1
347	131	20
348	132	8
349	132	9
350	132	10
351	133	1
352	133	13
353	133	17
354	134	1
355	134	13
356	134	5
357	135	1
358	135	3
359	135	5
360	136	1
361	136	14
362	136	27
363	136	5
364	137	1
365	137	16
366	137	3
367	138	1
368	138	49
369	138	50
370	138	51
371	138	5
372	139	1
373	139	14
374	139	5
375	140	1
376	140	2
377	141	8
378	141	40
379	142	1
380	142	22
381	142	3
382	143	1
383	143	6
384	143	3
385	144	1
386	144	21
387	145	1
388	145	16
389	146	1
390	146	52
391	146	53
392	146	54
393	147	8
394	148	1
395	148	20
396	149	1
397	149	6
398	150	1
399	150	7
400	150	54
401	151	1
402	151	8
403	151	9
404	151	10
405	151	14
406	152	8
407	152	18
408	152	55
409	153	1
410	153	4
411	154	1
412	154	17
413	154	28
414	155	1
415	155	2
416	155	13
417	155	14
418	156	1
419	156	14
420	156	5
421	157	1
422	157	6
423	158	1
424	158	2
425	158	28
426	158	5
427	159	1
428	159	13
429	159	5
430	160	1
431	160	7
432	161	1
433	161	2
434	162	8
435	162	9
436	162	10
437	162	40
438	162	25
439	162	26
440	163	1
441	163	16
442	163	5
443	164	1
444	164	14
445	164	27
446	164	5
447	165	1
448	166	1
449	166	7
450	167	1
451	167	16
452	168	1
453	168	13
454	168	5
455	169	1
456	169	3
457	170	1
458	170	16
459	170	56
460	171	1
461	171	3
462	171	31
463	172	1
464	172	2
465	172	5
466	172	28
467	173	1
468	173	16
469	173	14
470	174	1
471	174	7
472	175	1
473	175	4
474	176	1
475	176	3
476	176	31
477	176	13
478	176	27
479	177	1
480	177	3
481	177	31
482	177	13
483	177	5
484	178	1
485	178	16
486	178	4
487	179	1
488	179	7
489	180	1
490	180	3
491	180	31
492	180	13
493	181	1
494	181	14
495	182	8
496	182	9
497	182	10
498	183	8
499	183	43
500	183	57
501	183	55
502	184	8
503	184	33
504	184	34
505	185	1
506	185	17
507	186	1
508	186	14
509	186	48
510	187	1
511	187	6
512	188	1
513	189	8
514	189	9
515	189	10
516	190	1
517	190	5
518	191	1
519	191	35
520	191	3
521	192	1
522	192	7
523	193	1
524	193	4
525	193	5
526	194	1
527	194	2
528	194	5
529	195	1
530	195	7
531	196	1
532	196	3
533	197	8
534	197	18
535	197	58
536	197	25
537	197	26
538	197	59
539	198	8
540	198	9
541	198	10
542	198	40
543	199	1
544	199	16
545	199	3
546	199	23
547	200	1
548	200	14
549	200	5
550	201	1
551	201	7
552	202	1
553	202	35
554	202	14
555	202	5
556	203	1
557	203	14
558	204	1
559	204	16
560	204	5
561	205	1
562	205	13
563	205	5
564	206	1
565	206	2
566	206	5
567	207	1
568	207	6
569	207	60
570	208	1
571	208	3
572	209	8
573	209	43
574	209	33
575	209	34
576	210	1
577	210	14
578	211	1
579	211	8
580	211	9
581	211	10
582	212	8
583	212	43
584	212	33
585	212	34
586	213	1
587	213	5
588	214	1
589	214	2
590	215	1
591	215	16
592	215	14
593	216	8
594	216	9
595	216	10
596	217	1
597	217	14
598	218	1
599	218	22
600	218	5
601	219	1
602	219	16
603	220	1
604	220	5
605	222	1
606	222	14
607	222	5
608	223	1
609	223	2
610	223	5
611	223	28
612	224	1
613	224	16
614	224	22
615	224	3
616	225	1
617	225	2
618	225	5
619	226	1
620	226	4
621	227	1
622	227	3
623	228	1
624	229	1
625	229	35
626	230	8
627	230	61
628	230	62
629	231	8
630	231	33
631	231	34
632	232	1
633	232	2
634	232	14
635	233	1
636	233	3
637	234	1
638	234	14
639	235	1
640	235	5
641	236	1
642	236	2
643	236	49
644	237	8
645	237	33
646	237	42
647	237	63
648	238	1
649	238	14
650	239	1
651	239	49
652	239	50
653	239	51
654	240	8
655	240	9
656	240	10
657	241	1
658	242	1
659	242	4
660	243	1
661	243	54
662	243	22
663	243	64
664	244	8
665	244	9
666	244	10
667	245	8
668	245	18
669	245	1
670	245	13
671	245	5
672	246	1
673	246	14
674	247	1
675	247	16
676	247	14
677	248	8
678	248	18
679	248	57
680	248	55
\.


--
-- Name: book_genres_book_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('book_genres_book_genre_id_seq', 680, true);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY books (book_id, title, release_year, url, book_cover, mini_summary, goodreads_id) FROM stdin;
4	Romeo and Juliet	1597	http://www.feedbooks.com/book/2936.epub	http://covers.feedbooks.net/book/2936.jpg?size=large&t=1425660764	Romeo and Juliet is a tragic play written early in the career of William Shakespeare about two teenage "star-cross'd lovers" whose untimely deaths ultimately unite their feuding households. It was among Shakespeare's most popular plays during his ...	18135
29	A Midsummer Night's Dream	1596	http://www.feedbooks.com/book/2990.epub	http://covers.feedbooks.net/book/2990.jpg?size=large&t=1453264913	A Midsummer Night's Dream is a romantic comedy by William Shakespeare, suggested by "The Knight's Tale" from Geoffrey Chaucer's The Canterbury Tales, written around 1594 to 1596. It portrays the adventures of four young Athenian lovers and a group...	1622
14	Macbeth	1606	http://www.feedbooks.com/book/2935.epub	http://covers.feedbooks.net/book/2935.jpg?size=large&t=1425660764	Macbeth is among the best-known of William Shakespeare's plays, and is his shortest tragedy, believed to have been written between 1603 and 1606. It is frequently performed at both amateur and professional levels, and has been adapted for opera, f...	8852
36	On the Origin of Species, 6th Edition	1872	http://www.feedbooks.com/book/3015.epub	http://covers.feedbooks.net/book/3015.jpg?size=large&t=1439158819	Charles Darwin's On the Origin of Species, in which he writes of his theories of evolution by natural selection, is one of the most important works of scientific study ever published.	29618825
41	The Prophet	1923	http://www.feedbooks.com/book/2843.epub	http://covers.feedbooks.net/book/2843.jpg?size=large&t=1425660746	The Prophet is a book of 26 poetic essays written in English in 1923 by the Lebanese-American artist, philosopher and writer Khalil Gibran. In the book, the prophet Almustafa who has lived in the foreign city of Orphalese for 12 years is about to ...	2547
48	The Hound of the Baskervilles	1902	http://www.feedbooks.com/book/1.epub	http://covers.feedbooks.net/book/1.jpg?size=large&t=1472223989	The rich landowner Sir Charles Baskerville is found dead in the park of his manor surrounded by the grim moor of Dartmoor, in the county of Devon. His death seems to have been caused by a heart attack, but the victim's best friend, Dr. Mortimer, i...	8921
80	Julius Caesar	1599	http://www.feedbooks.com/book/2942.epub	http://covers.feedbooks.net/book/2942.jpg?size=large&t=1425660765	Julius Caesar is a tragedy by William Shakespeare, believed to have been written in 1599. It portrays the conspiracy against the Roman dictator of the same name, his assassination and its aftermath. It is one of several Roman plays that he wrote, ...	13006
83	Dead Souls	1842	http://www.feedbooks.com/book/12.epub	http://covers.feedbooks.net/book/12.jpg?size=large&t=1451486483	Since its publication in 1842, Dead Souls has been celebrated as a supremely realistic portrait of provincial Russian life and as a splendidly exaggerated tale; as a paean to the Russian spirit and as a remorseless satire of imperial Russian venal...	28381
100	Swann's Way	1922	http://www.feedbooks.com/book/1262.epub	http://covers.feedbooks.net/book/1262.jpg?size=large&t=1435693588	In Search of Lost Time or Remembrance of Things Past (French: À la recherche du temps perdu) is a semi-autobiographical novel in seven volumes by Marcel Proust. His most prominent work, it is popularly known for its extended length and the notion ...	12749
218	Tales of Old Japan	1871	http://www.feedbooks.com/book/2726.epub	http://covers.feedbooks.net/book/2726.jpg?size=large&t=1435693222	Tales of Old Japan is an anthology of short stories, compiled by Algernon Bertram Freeman-Mitford, Lord Redesdale, writing under the better known name of A.B. Mitford. These stories focus on the varying aspects of Japanese life in centuries past. ...	31620870
219	Before Adam	1907	http://www.feedbooks.com/book/2854.epub	http://covers.feedbooks.net/book/2854.jpg?size=large&t=1425660749	A young man in modern America is terrorized by visions of an earlier, primitive life. Across the enormous chasm of thousands of centuries, his consciousness has become entwined with that of Big-Tooth, an ancestor living at the dawn of humanity. Bi...	533850
105	Dubliners	1914	http://www.feedbooks.com/book/5.epub	http://covers.feedbooks.net/book/5.jpg?size=large&t=1437534720	Dubliners is a collection of 15 short stories by James Joyce, first published in 1914. The fifteen stories were meant to be a naturalistic depiction of the Irish middle class life in and around Dublin in the early years of the 20th century.\nThe st...	11012
127	Beyond Good and Evil	1886	http://www.feedbooks.com/book/676.epub	http://covers.feedbooks.net/book/676.jpg?size=large&t=1473092170	Beyond Good and Evil (German: Jenseits von Gut und Böse), subtitled "Prelude to a Philosophy of the Future" (Vorspiel einer Philosophie der Zukunft), is a book by the German philosopher Friedrich Nietzsche, first published in 1886.\nIt takes up an...	12321
133	The Raven	1845	http://www.feedbooks.com/book/3428.epub	http://covers.feedbooks.net/book/3428.jpg?size=large&t=1427199070	"The Raven" is a narrative poem by the American writer and poet Edgar Allan Poe. It was published for the first time on January 29, 1845, in the New York Evening Mirror. Noted for its musicality, stylized language and supernatural atmosphere, it t...	264158
141	The New Testament, King James Version	1611	http://www.feedbooks.com/book/4203.epub	http://covers.feedbooks.net/book/4203.jpg?size=large&t=1425661022	The Authorized King James Version is an English translation of the Christian Bible began in 1604 and completed in 1611 by the Church of England. A primary concern of the translators was to produce a Bible that would be appropriate, dignified and r...	728958
155	The Night Land	1912	http://www.feedbooks.com/book/2417.epub	http://covers.feedbooks.net/book/2417.jpg?size=large&t=1453265154	The Sun has gone out: the Earth is lit only by the glow of residual vulcanism. The last few millions of the human race are gathered together in a gigantic metal pyramid, the Last Redoubt, under siege from unknown forces and Powers outside in the d...	970602
181	Blindsight	2006	http://creativecommons.org/licenses/by-nc-sa/3.0/	http://www.feedbooks.com/book/976.pdf	Two months since sixty-five thousand alien objects clenched around the Earth like a luminous fist, screaming to the heavens as the atmosphere burned them to ash. Two months since that moment of brief, bright surveillance by agents unknown. \n\nTwo...	48484
182	Thus Spake Zarathustra	1885	http://www.feedbooks.com/book/172.epub	http://covers.feedbooks.net/book/172.jpg?size=large&t=1468714277	Thus Spoke Zarathustra (German: Also sprach Zarathustra, sometimes translated Thus Spake Zarathustra), subtitled A Book for All and None (Ein Buch für Alle und Keinen), is a written work by German philosopher Friedrich Nietzsche, composed in four ...	6700688
186	Herland	1915	http://www.feedbooks.com/book/3610.epub	http://covers.feedbooks.net/book/3610.jpg?size=large&t=1435693694	Herland is a utopian novel from 1915, written by feminist Charlotte Perkins Gilman. The book describes an isolated society composed entirely of women who reproduce via parthenogenesis (asexual reproduction). The result is an ideal social order, fr...	531509
203	The Island of Dr. Moreau	1896	http://www.feedbooks.com/book/33.epub	http://covers.feedbooks.net/book/33.jpg?size=large&t=1437250794	Edward Prendick is shipwrecked in the Pacific. Rescued by Doctor Moreau's assistant he is taken to the doctor's island home where he discovers the doctor has been experimenting on the animal inhabitants of the island, creating bizarre proto-humans...	29981
224	The Man in the Iron Mask	1850	http://www.feedbooks.com/book/3601.epub	http://covers.feedbooks.net/book/3601.jpg?size=large&t=1426673718	The Vicomte of Bragelonne: Ten Years Later (Le Vicomte de Bragelonne ou Dix ans plus tard) is a novel by Alexandre Dumas, père. It is the third and last of the d'Artagnan Romances following The Three Musketeers and Twenty Years After. It appeared ...	54499
19	Twelve Years a Slave	1853	http://www.feedbooks.com/book/6875.epub	http://covers.feedbooks.net/book/6875.jpg?size=large&t=1435693283	Twelve Years a Slave, sub-title: Narrative of Solomon Northup, citizen of New-York, kidnapped in Washington city in 1841, and rescued in 1853, from a cotton plantation near the Red River in Louisiana, is a memoir by Solomon Northup as told to and ...	18478222
42	Fanny Hill: Memoirs of a Woman of Pleasure	1749	http://www.feedbooks.com/book/84.epub	http://covers.feedbooks.net/book/84.jpg?size=large&t=1427191506	Memoirs of a Woman of Pleasure, popularly known as Fanny Hill, is a novel by John Cleland.\nWritten in 1748 while Cleland was in debtor's prison in London, it is considered the first modern "erotic novel" in English, and has become a byword for th...	195144
44	Great Expectations	1861	http://www.feedbooks.com/book/70.epub	http://covers.feedbooks.net/book/70.jpg?size=large&t=1439163698	Great Expectations is a novel by Charles Dickens first serialised in All the Year Round from 1 December 1860 to August 1861. It is regarded as one of his greatest and most sophisticated novels, and is one of his most enduringly popular, having bee...	2623
221	Anne of Windy Poplars	1936	http://www.feedbooks.com/book/5106.epub	http://covers.feedbooks.net/book/5106.jpg?size=large&t=1425661245	Anne Shirley has left Redmond College behind to begin a new job and a new chapter of her life away from Green Gables. Now she faces a new challenge: the Pringles. They're known as the royal family of Summerside - and they quickly let Anne know she...	65840
226	Whose Body?	1923	http://www.feedbooks.com/book/3406.epub	http://covers.feedbooks.net/book/3406.jpg?size=large&t=1473267170	Lord Peter Wimsey investigates the sudden appearance of a naked body in the bath of an architect at the same time a noted financier goes missing under strange circumstances. As the case progresses it becomes clear that the two events are linked in...	192893
2	Pride and Prejudice	1813	http://www.feedbooks.com/book/52.epub	http://covers.feedbooks.net/book/52.jpg?size=large&t=1446740099	Pride And Prejudice, the story of Mrs. Bennet's attempts to marry off her five daughters is one of the best-loved and most enduring classics in English literature. Excitement fizzes through the Bennet household at Longbourn in Hertfordshire when y...	1885
184	Manifesto of the Communist Party	1848	http://www.feedbooks.com/book/209.epub	http://covers.feedbooks.net/book/209.jpg?size=large&t=1474027010	Manifesto of the Communist Party (German: Manifest der Kommunistischen Partei), often referred to as The Communist Manifesto, was first published on February 21, 1848, and is one of the world's most influential political manuscripts. Commissioned ...	10925104
79	The Art of Public Speaking	1905	http://www.feedbooks.com/book/3695.epub	http://covers.feedbooks.net/book/3695.jpg?size=large&t=1473092191	Training in public speaking is not a matter of externals--primarily; it is not a matter of imitation--fundamentally; it is not a matter of conformity to standards--at all. Public speaking is public utterance, public issuance, of the man himself; t...	3363618
25	Meditations	180	http://www.feedbooks.com/book/5315.epub	http://covers.feedbooks.net/book/5315.jpg?size=large&t=1468714247	The writings of Marcus Aurelius on Stoic philosophy.	30659
60	The Casebook of Sherlock Holmes	1923	http://www.feedbooks.com/book/66.epub	http://covers.feedbooks.net/book/66.jpg?size=large&t=1472223989	The last twelve stories written about Holmes and Watson, these tales reflect the disillusioned world of the 1920s in which they were written. Some of the sharpest turns of wit in English literature are contrasted by dark images of psychological tr...	929229
230	The Art of Money Getting, or Golden Rules for Making Money	1880	http://creativecommons.org/licenses/by-nc-sa/3.0/	http://www.feedbooks.com/book/6712.pdf	P. T. Barnum, the great American showman of the 19th century, wrote this short book about making and keeping money. He certainly had life experiences that qualify him for the subject--he started a small newspaper in his twenties, bought and transf...	1414549
64	The Iliad of Homer	-900	http://www.feedbooks.com/book/2962.epub	http://covers.feedbooks.net/book/2962.jpg?size=large&t=1437058429	Translated into English Blank Verse by William Cowper.\nThe Iliad is, together with the Odyssey, one of two ancient Greek epic poems traditionally attributed to Homer. The poem is commonly dated to the late 9th or to the 8th century BC, and many s...	1371
69	The Sea Wolf	1904	http://www.feedbooks.com/book/2848.epub	http://covers.feedbooks.net/book/2848.jpg?size=large&t=1425660748	Chronicles the voyages of a ship run by the ruthless Wolf Larsen, among the greatest of London's characters, and spokesman for an extreme individualism London intended to critique.	43049
119	Utopia	1515	http://www.feedbooks.com/book/198.epub	http://covers.feedbooks.net/book/198.jpg?size=large&t=1425660135	De Optimo Republicae Statu deque Nova Insula Utopia (translated On the Best State of a Republic and on the New Island of Utopia) or more simply Utopia is a 1516 book by Sir (Saint) Thomas More.\nThe book, written in Latin, is a frame narrative pri...	18414
121	Persuasion	1818	http://www.feedbooks.com/book/51.epub	http://covers.feedbooks.net/book/51.jpg?size=large&t=1446740152	The final novel by the acclaimed writer places heroine Anne Elliot, a woman of integrity and deep emotion, against the brutality and hypocrisy of Regency England.	2156
91	Anna Karenina	1877	http://www.feedbooks.com/book/1487.epub	http://covers.feedbooks.net/book/1487.jpg?size=large&t=1427192570	Anna Karenina tells of the doomed love affair between the sensuous and rebellious Anna and the dashing officer, Count Vronsky. Tragedy unfolds as Anna rejects her passionless marriage and must endure the hypocrisies of society. Set against a vast ...	15823480
142	The Hunchback of Notre Dame	1831	http://www.feedbooks.com/book/3580.epub	http://covers.feedbooks.net/book/3580.jpg?size=large&t=1425660885	The Hunchback of Notre Dame (French: Notre-Dame de Paris) is an 1831 French novel written by Victor Hugo. It is set in 1482 in Paris, in and around the cathedral of Notre Dame de Paris. The book tells the story of a poor barefoot Gypsy girl (La Es...	30597
102	The Blazing World	1666	http://www.feedbooks.com/book/6896.epub	http://covers.feedbooks.net/book/6896.jpg?size=large&t=1435693370	The Description of a New World, Called The Blazing-World, better known as The Blazing World, is a 1666 work of prose fiction by English writer Margaret Cavendish, the Duchess of Newcastle. It has been described as an early forerunner of science fi...	18982581
110	The Curious Case of Benjamin Button	1922	http://www.feedbooks.com/book/3431.epub	http://covers.feedbooks.net/book/3431.jpg?size=large&t=1466500611	This story was inspired by a remark of Mark Twain's to the effect that it was a pity that the best part of life came at the beginning and the worst part at the end. By trying the experiment upon only one man in a perfectly normal world I have scar...	747746
168	The Fall of the House of Usher	1839	http://www.feedbooks.com/book/772.epub	http://covers.feedbooks.net/book/772.jpg?size=large&t=1427203982	The tale opens with the unnamed narrator arriving at the house of his friend, Roderick Usher, having received a letter from him in a distant part of the country complaining of an illness and asking for his comfort.	175516
172	Irish Fairy Tales	1920	http://www.feedbooks.com/book/4143.epub	http://covers.feedbooks.net/book/4143.jpg?size=large&t=1473097232	The lore of ancient Ireland comes to life in this collection of classic folk tales retold for modern readers.	377663
122	The Scarlet Plague	1912	http://www.feedbooks.com/book/2379.epub	http://covers.feedbooks.net/book/2379.jpg?size=large&t=1473424852	This novella explores life following a devastating plague that wipes out most of humanity.	1201864
124	An American Tragedy	1925	http://www.feedbooks.com/book/7130.epub	http://covers.feedbooks.net/book/7130.jpg?size=large&t=1477920372	An American Tragedy is a novel by the American writer Theodore Dreiser.	331319
185	Paradise Lost	1667	http://www.feedbooks.com/book/174.epub	http://covers.feedbooks.net/book/174.jpg?size=large&t=1426597025	Paradise Lost is an epic poem in blank verse by the 17th-century English poet John Milton. It was originally published in 1667 in ten books; a second edition followed in 1674, redivided into twelve books (in the manner of the division of Virgil's ...	15997
147	Free Culture	2006	http://creativecommons.org/licenses/by-nc/3.0/	http://www.feedbooks.com/book/2750.pdf	Lawrence Lessig, “the most important thinker on intellectual property in the Internet era” (The New Yorker), masterfully argues that never before in human history has the power to control creative progress been so concentrated in the hands of the ...	72011
148	A Little Princess	1903	http://www.feedbooks.com/book/4155.epub	http://covers.feedbooks.net/book/4155.jpg?size=large&t=1425661010	Generations of children have treasured the story of Sara Crewe, the little girl who imagines she's a princess in order to survive hard times at Miss Minchins London boarding school.	3008
206	Just so Stories	1902	http://www.feedbooks.com/book/865.epub	http://covers.feedbooks.net/book/865.jpg?size=large&t=1473096742	The stories, first published in 1902, are pourquoi stories, fantastic accounts of how various phenomena came about. A forerunner of these stories is "How Fear Came" in The Second Jungle Book (1895), in which Mowgli hears the story of how the tiger...	34053
215	Deathworld	1960	http://www.feedbooks.com/book/3749.epub	http://covers.feedbooks.net/book/3749.jpg?size=large&t=1466110967	Some planet in the galaxy must—by definition—be the toughest, meanest, nastiest of all. If Pyrrus wasn't it ... it was an awfully good approximation!	2037559
169	Oblomov	1858	http://www.feedbooks.com/book/10.epub	http://covers.feedbooks.net/book/10.jpg?size=large&t=1425660101	Oblomov is the best known novel by Russian writer Ivan Goncharov, first published in 1859. Oblomov is also the central character of the novel, often seen as the ultimate incarnation of the superfluous man, a symbolic character in 19th-century Russ...	254308
171	Northanger Abbey	1817	http://www.feedbooks.com/book/357.epub	http://covers.feedbooks.net/book/357.jpg?size=large&t=1446740171	Jane Austen’s first novel, Northanger Abbey—published posthumously in 1818—tells the story of Catherine Morland and her dangerously sweet nature, innocence, and sometime self-delusion. Though Austen’s fallible heroine is repeatedly drawn into scra...	50398
231	Common Sense	1776	http://www.feedbooks.com/book/2850.epub	http://covers.feedbooks.net/book/2850.jpg?size=large&t=1474027022	Enormously popular and widely read pamphlet, first published in January of 1776, clearly and persuasively argues for American separation from Great Britain and paves the way for the Declaration of Independence. This highly influential landmark doc...	161744
238	John Carter and the Giant of Mars	1940	http://www.feedbooks.com/book/1217.epub	http://covers.feedbooks.net/book/1217.jpg?size=large&t=1463373664	No Description Available	6302723
97	The Man Who Knew Too Much	1922	http://creativecommons.org/licenses/by-nc-sa/3.0/	http://www.feedbooks.com/book/6718.pdf	This contains the first 8 of the 12 stories in the published book The Man Who Knew Too Much and Other Stories.  In these 8 detective thrillers, the main protagonist is Horne Fisher. (The omitted four are individual stories with separate heroes/det...	174852
209	The Federalist Papers	1787	http://www.feedbooks.com/book/2674.epub	http://covers.feedbooks.net/book/2674.jpg?size=large&t=1427388945	The Federalist Papers are a series of 85 articles advocating the ratification of the United States Constitution. Seventy-seven of the essays were published serially in The Independent Journal and The New York Packet between October 1787 and August...	12071357
5	The Great Gatsby	1925	http://www.feedbooks.com/book/5543.epub	http://covers.feedbooks.net/book/5543.jpg?size=large&t=1469749531	In 1922, F. Scott Fitzgerald announced his decision to write "something new--something extraordinary and beautiful and simple + intricately patterned." That extraordinary, beautiful, intricately patterned, and above all, simple novel became The Gr...	4671
8	The Art of War	-514	http://www.feedbooks.com/book/168.epub	http://covers.feedbooks.net/book/168.jpg?size=large&t=1456375182	The Art of War is a Chinese military treatise that was written during the 6th century BC by Sun Tzu. Composed of 13 chapters, each of which is devoted to one aspect of warfare, it has long been praised as the definitive work on military strategies...	99324
202	2 B R O 2 B	1962	http://www.feedbooks.com/book/912.epub	http://covers.feedbooks.net/book/912.jpg?size=large&t=1473097164	2 B R 0 2 B is a satiric short story that imagines life (and death) in a future world where aging has been “cured” and population control is mandated and administered by the government.	\N
37	The Invisible Man	1897	http://www.feedbooks.com/book/34.epub	http://covers.feedbooks.net/book/34.jpg?size=large&t=1425660104	The Invisible Man is an 1897 science fiction novella by H.G. Wells. Wells' novel was originally serialised in Pearson's Magazine in 1897, and published as a novel the same year. The Invisible Man of the title is Griffin, a scientist who theorises ...	17184
153	Room 13	1924	http://www.feedbooks.com/book/1774.epub	http://covers.feedbooks.net/book/1774.jpg?size=large&t=1478342281	No Description Available	6558828
63	Anne of Green Gables	1908	http://www.feedbooks.com/book/2776.epub	http://covers.feedbooks.net/book/2776.jpg?size=large&t=1446899295	Marilla Cuthbert and Matthew Cuthbert, middle-aged siblings who live together at Green Gables, a farm in Avonlea, on Prince Edward Island, decide to adopt a boy from an orphan asylum in Nova Scotia as a helper on their farm. Through a series of mi...	8127
81	Tao Te Ching	-600	http://www.feedbooks.com/book/215.epub	http://covers.feedbooks.net/book/215.jpg?size=large&t=1435688580	The Tao Te Ching is fundamental to the Taoist school of Chinese philosophy and strongly influenced other schools, such as Legalism and Neo-Confucianism. This ancient book is also central in Chinese religion, not only for Taoism  but Chinese Buddhi...	\N
106	The Double	1846	http://www.feedbooks.com/book/6899.epub	http://covers.feedbooks.net/book/6899.jpg?size=large&t=1473097602	The Double centers on a government clerk who goes mad. It deals with the internal psychological struggle of its main character, Yakov Petrovich Golyadkin, who repeatedly encounters someone who is his exact double in appearance but confident, aggre...	210190
131	The Story Girl	1911	http://www.feedbooks.com/book/7041.epub	http://covers.feedbooks.net/book/7041.jpg?size=large&t=1425661646	The Story Girl narrates the adventures of a group of young cousins and their friends who live in a rural community on Prince Edward Island, Canada.	821099
136	Only The Neck Down	2006	http://creativecommons.org/licenses/by-nc-nd/3.0/	http://www.feedbooks.com/book/2813.pdf	No Description Available	11085218
137	Cleopatra	1889	http://www.feedbooks.com/book/977.epub	http://covers.feedbooks.net/book/977.jpg?size=large&t=1425660307	No Description Available	957186
177	The Vampire Maid	1900	http://www.feedbooks.com/book/1326.epub	http://covers.feedbooks.net/book/1326.jpg?size=large&t=1473096799	No Description Available	9242583
156	The Star	1897	http://www.feedbooks.com/book/607.epub	http://covers.feedbooks.net/book/607.jpg?size=large&t=1425660219	No Description Available	\N
162	Mysticism and Logic and Other Essays	1918	http://www.feedbooks.com/book/4123.epub	http://covers.feedbooks.net/book/4123.jpg?size=large&t=1468714285	Essays on philosophy, religion, science, and mathematics.	11384959
180	Carmilla	1871	http://www.feedbooks.com/book/1506.epub	http://covers.feedbooks.net/book/1506.jpg?size=large&t=1425660442	"Carmilla" is a Gothic novella by Joseph Sheridan Le Fanu. First published in 1872, it tells the story of a young woman's susceptibility to the attentions of a female vampire named Carmilla. "Carmilla" predates Bram Stoker's Dracula by 25 years an...	48037
204	South Sea Tales	1911	http://www.feedbooks.com/book/3181.epub	http://covers.feedbooks.net/book/3181.jpg?size=large&t=1473097118	Darker Pacific tales, including "Mauki" and "The Terrible Solomans."	349429
205	The Dunwich Horror	1928	http://www.feedbooks.com/book/20.epub	http://covers.feedbooks.net/book/20.jpg?size=large&t=1473096847	In H.P. Lovecraft’s, "The Dunwich Horror", we are told the story of Wilbur Whateley, the son of a deformed albino mother and an unknown father (alluded to in passing by the mad Old Whateley as "Yog-Sothoth"), and the strange events surrounding his...	63213
227	North and South	1855	http://www.feedbooks.com/book/3190.epub	http://covers.feedbooks.net/book/3190.jpg?size=large&t=1441975275	North and South is a novel by Elizabeth Gaskell, first published in book form in 1855 originally appeared as a twenty-two-part weekly serial from September 1854 through January 1855 in the magazine Household Words, edited by Charles Dickens. The t...	156538
214	The Marvelous Land of Oz	1904	http://www.feedbooks.com/book/202.epub	http://covers.feedbooks.net/book/202.jpg?size=large&t=1473835296	First issued in 1904, L. Frank Baum's The Marvelous Land of Oz is the story of the wonderful adventures of the young boy named Tip as he travels throughout the many lands of Oz. Here he meets with our old friends the Scarecrow and Tin Woodman, as ...	179565
217	The Iron Heel	1908	http://www.feedbooks.com/book/2381.epub	http://covers.feedbooks.net/book/2381.jpg?size=large&t=1425660636	The Iron Heel is a dystopian novel by American writer Jack London, first published in 1908.\nGenerally considered to be "the earliest of the modern Dystopian," it chronicles the rise of an oligarchic tyranny in the United States. It is arguably th...	929783
243	Walden	1854	http://www.feedbooks.com/book/3914.epub	http://covers.feedbooks.net/book/3914.jpg?size=large&t=1427198439	Walden (also known as Life in the Woods) by Henry David Thoreau is one of the best-known non-fiction books written by an American. Published in 1854, it details Thoreau's life for two years and two months in second-growth forest around the shores ...	16902
183	Life On The Mississippi	1883	http://www.feedbooks.com/book/4313.epub	http://covers.feedbooks.net/book/4313.jpg?size=large&t=1474026733	Life on the Mississippi is a memoir by Mark Twain detailing his days as a steamboat pilot on the Mississippi River before and after the American Civil War. The book begins with a brief history of the river. It continues with anecdotes of Twain's t...	99152
220	The Way of the Bow	2008	http://www.feedbooks.com/book/3873.epub	http://covers.feedbooks.net/book/3873.jpg?size=large&t=1473097041	“The Way of the Bow” relates the story of Tetsuya, the best archer of the country, who conveys his teachings to a boy in his village. Using the metaphor of archery the author leads us through several essential thoughts : our daily efforts and work...	6333213
222	The Disintegration Machine	1928	http://www.feedbooks.com/book/354.epub	http://covers.feedbooks.net/book/354.jpg?size=large&t=1473243534	Professor Challenger is arguing with people who are persistently calling him on the telephone when his young friend Malone, a reporter for the Gazette, enters and requests Challenger accompany him to inspect the discovery of Theodore Nemor, who cl...	4340651
228	Anne of Avonlea	1909	http://www.feedbooks.com/book/3197.epub	http://covers.feedbooks.net/book/3197.jpg?size=large&t=1425660808	Following Anne of Green Gables (1908), the book covers the second chapter in the life of Anne Shirley. This book follows Anne from the age of 16 to 18, during the two years that she teaches at Avonlea school. It includes many of the characters fro...	77390
232	The Dark World	1946	http://www.feedbooks.com/book/2317.epub	http://covers.feedbooks.net/book/2317.jpg?size=large&t=1434837921	World War II veteran Edward Bond's recuperation from a disastrous fighter plane crash takes a distinct turn for the weird when he encounters a giant wolf, a red witch, and the undeniable power of the need-fire, a portal to a world of magic and swo...	1881716
229	Don Quixote	1615	http://www.feedbooks.com/book/183.epub	http://covers.feedbooks.net/book/183.jpg?size=large&t=1439166698	Don Quixote, errant knight and sane madman, with the company of his faithful squire and wise fool, Sancho Panza, together roam the world and haunt readers' imaginations as they have for nearly four hundred years.	\N
35	The Art of War	1521	http://www.feedbooks.com/book/204.epub	http://covers.feedbooks.net/book/204.jpg?size=large&t=1463739487	The Art of War (Dell'arte della guerra), is one of the lesser-read works of Florentine statesman and political philosopher Niccolò Machiavelli.\nThe format of 'The Art of War' was in socratic dialogue. The purpose, declared by Fabrizio (Machiavell...	\N
233	The Rainbow	1915	http://www.feedbooks.com/book/214.epub	http://covers.feedbooks.net/book/214.jpg?size=large&t=1425660137	The Rainbow is a 1915 novel by British author D. H. Lawrence. It follows three generations of the Brangwen family, particularly focusing on the sexual dynamics of, and relations between, the characters.\nLawrence's frank treatment of sexual desire...	31491
234	The Sleeper Awakes	1910	http://www.feedbooks.com/book/593.epub	http://covers.feedbooks.net/book/593.jpg?size=large&t=1425660214	The Sleeper Awakes is H. G. Wells's wildly imaginative story of London in the twenty-second century and the man who by accident becomes owner and master of the world. In 1897 a Victorian gentleman falls into a sleep from which he cannot be waked. ...	29670696
235	The Million Pound Bank Note	1893	http://www.feedbooks.com/book/6916.epub	http://covers.feedbooks.net/book/6916.jpg?size=large&t=1473096522	The story takes place in Victorian London, where two very rich, eccentric brothers give the penniless story protagonist, Henry Adams, one million pounds of money in the form of a single peerless bank note. Henry would not be easily able to exchang...	3259806
236	The Sorrows of Satan	1895	http://www.feedbooks.com/book/6279.epub	http://covers.feedbooks.net/book/6279.jpg?size=large&t=1473267376	The Sorrows of Satan is an 1895 faustian novel by Marie Corelli. It is widely regarded as one of the world's first bestsellers, partly due to an upheaval in the system British libraries used to purchase their books and partly due to its popular ap...	799266
237	Women and Economics	1898	http://www.feedbooks.com/book/6889.epub	http://covers.feedbooks.net/book/6889.jpg?size=large&t=1472832426	Women and Economics – A Study of the Economic Relation Between Men and Women as a Factor in Social Evolution is a book written by Charlotte Perkins Gilman and published in 1898. It is considered by many to be her single greatest work, and as with ...	600806
239	The Turn of the Screw	1898	http://www.feedbooks.com/book/300.epub	http://covers.feedbooks.net/book/300.jpg?size=large&t=1425660152	The Turn of the Screw is a short novel or a novella written by American writer Henry James. Originally published in 1898, it is ostensibly a ghost story that has lent itself well to operatic and film adaptation. Due to its ambiguous content and na...	12948
240	Discourse on the Method	1637	http://www.feedbooks.com/book/677.epub	http://covers.feedbooks.net/book/677.jpg?size=large&t=1428398185	The Discourse on the Method is a philosophical and mathematical treatise published by René Descartes in 1637. Its full name is Discourse on the Method of Rightly Conducting the Reason, and Searching for Truth in the Sciences (French title: Discour...	159418
22	The Mysterious Island	1874	http://www.feedbooks.com/book/2448.epub	http://covers.feedbooks.net/book/2448.jpg?size=large&t=1439141861	The book tells the adventures of five American prisoners of war on an uncharted island in the South Pacific. Begining in the American Civil War, as famine and death ravage the city of Richmond, Virginia, five northern POWs decide to escape in a ra...	32831
6	The Kama Sutra	400	http://www.feedbooks.com/book/3622.epub	http://covers.feedbooks.net/book/3622.jpg?size=large&t=1453308685	The Kama Sutra, is an ancient Indian text widely considered to be the standard work on human sexual behavior in Sanskrit literature written by the Indian scholar Vatsyayana. A portion of the work consists of practical advice on sex. Kāma means sen...	\N
9	Hamlet	1599	http://www.feedbooks.com/book/2846.epub	http://covers.feedbooks.net/book/2846.jpg?size=large&t=1437345472	Hamlet is a tragedy by William Shakespeare, believed to have been written between 1599 and 1601. The play, set in Denmark, recounts how Prince Hamlet exacts revenge on his uncle Claudius, who has murdered Hamlet's father, the King, and then taken ...	1420
10	The Time Machine	1895	http://www.feedbooks.com/book/32.epub	http://covers.feedbooks.net/book/32.jpg?size=large&t=1464191110	The book's protagonist is an amateur inventor or scientist living in London who is never named; he is identified simply as The Time Traveller. Having demonstrated to friends using a miniature model that time is a fourth dimension, and that a suita...	2493
11	The Wonderful Wizard of Oz	1900	http://www.feedbooks.com/book/197.epub	http://covers.feedbooks.net/book/197.jpg?size=large&t=1473835296	Dorothy is a young girl who lives on a Kansas farm with her Uncle Henry, Aunt Em, and little dog Toto. One day the farmhouse, with Dorothy inside, is caught up in a tornado and deposited in a field in the country of the Munchkins. The falling hous...	236093
12	Peter Pan (Peter and Wendy)	1911	http://www.feedbooks.com/book/3413.epub	http://covers.feedbooks.net/book/3413.jpg?size=large&t=1469749551	Peter Pan, or The Boy Who Wouldn't Grow Up and Peter and Wendy are the stage play and novel (respectively) which tell the story of Peter Pan, a mischievous little boy who can fly, and his adventures on the island of Neverland with Wendy Darling an...	30030536
16	Jane Eyre	1847	http://www.feedbooks.com/book/144.epub	http://covers.feedbooks.net/book/144.jpg?size=large&t=1439153221	Jane Eyre, the story of a young girl and her passage into adulthood, was an immediate commercial success at the time of its original publication in 1847. Its representation of the underside of domestic life and the hypocrisy behind religious enthu...	10210
17	Dream Psychology	1920	http://www.feedbooks.com/book/176.epub	http://covers.feedbooks.net/book/176.jpg?size=large&t=1425660132	The Interpretation of Dreams is a book by Sigmund Freud. The first edition was first published in German in November 1899 as Die Traumdeutung (though post-dated as 1900 by the publisher). The publication inaugurated the theory of Freudian dream an...	426077
18	The Divine Comedy	1306	http://www.feedbooks.com/book/206.epub	http://covers.feedbooks.net/book/206.jpg?size=large&t=1468438462	Dante Alighieri's poetic masterpiece, The Divine Comedy, is a moving human drama, an unforgettable visionary journey through the infinite torment of Hell, up the arduous slopes of Purgatory, and on to the glorious realm of Paradise-the sphere of u...	6656
23	The Secret Garden	1911	http://www.feedbooks.com/book/6578.epub	http://covers.feedbooks.net/book/6578.jpg?size=large&t=1478115402	Mary Lennox is a sour-faced 10-year-old girl, who is born in India to selfish wealthy British parents who had not wanted her and were too wrapped up in their own lives. She was taken care of primarily by servants, who pacify her as much as possibl...	2998
24	Little Women	1868	http://www.feedbooks.com/book/139.epub	http://covers.feedbooks.net/book/139.jpg?size=large&t=1425660125	Little Women or, Meg, Jo, Beth and Amy is a novel by American author Louisa May Alcott (1832–1888). Written and published in two parts in 1868 and 1869, the novel follows the lives of four sisters — Meg, Jo, Beth and Amy March — and is loosely bas...	1934
26	The War of the Worlds	1898	http://www.feedbooks.com/book/35.epub	http://covers.feedbooks.net/book/35.jpg?size=large&t=1451371207	The War of the Worlds (1898), by H. G. Wells, is an early science fiction novel which describes an invasion of England by aliens from Mars. It is one of the earliest and best-known depictions of an alien invasion of Earth, and has influenced many ...	8909
27	The Call of the Wild	1903	http://www.feedbooks.com/book/92.epub	http://covers.feedbooks.net/book/92.jpg?size=large&t=1439161646	The Call of the Wild is a novel by American writer Jack London. The plot concerns a previously domesticated and even somewhat pampered dog named Buck, whose primordial instincts return after a series of events finds him serving as a sled dog in th...	1852
28	War and Peace	1869	http://www.feedbooks.com/book/83.epub	http://covers.feedbooks.net/book/83.jpg?size=large&t=1476754481	War and Peace is a novel by Leo Tolstoy, first published from 1865 to 1869 in Russkii Vestnik, which tells the story of Russian society during the Napoleonic Era. It is usually described as one of Tolstoy's two major masterpieces (the other being ...	656
30	The Most Dangerous Game	1924	http://www.feedbooks.com/book/3638.epub	http://covers.feedbooks.net/book/3638.jpg?size=large&t=1466500591	"The Most Dangerous Game" features as its main character a big-game hunter from New York, who becomes shipwrecked on an isolated island in the Caribbean, and is hunted by a Russian aristocrat. \n\nThe story is an inversion of the big-game hunting ...	157076
31	A Tale of Two Cities	1859	http://www.feedbooks.com/book/81.epub	http://covers.feedbooks.net/book/81.jpg?size=large&t=1466107863	A Tale of Two Cities (1859) is the second historical novel by Charles Dickens, set in London and Paris before and during the French Revolution. It depicts the plight of the French proletariat under the brutal oppression of the French aristocracy i...	1953
32	The Memoirs of Sherlock Holmes	1893	http://www.feedbooks.com/book/58.epub	http://covers.feedbooks.net/book/58.jpg?size=large&t=1472223989	The Memoirs of Sherlock Holmes is a collection of Sherlock Holmes stories, originally published in 1894, by Arthur Conan Doyle.	194373
241	Hard Times	1850	http://www.feedbooks.com/book/674.epub	http://covers.feedbooks.net/book/674.jpg?size=large&t=1425660238	No Description Available	5344
33	Sense and Sensibility	1811	http://www.feedbooks.com/book/53.epub	http://covers.feedbooks.net/book/53.jpg?size=large&t=1446740128	Elinor and Marianne are two daughters of Mr. Dashwood by his second wife. They have a younger sister, Margaret, and an older half-brother named John. When their father dies, the family estate passes to John and the Dashwood women are left in reduc...	14935
15	Treasure Island	1883	http://www.feedbooks.com/book/97.epub	http://covers.feedbooks.net/book/97.jpg?size=large&t=1439162909	While going through the possessions of a deceased guest who owed them money, the mistress of the inn and her son find a treasure map that leads them to a pirate's fortune.	295
38	The Count of Monte Cristo	1845	http://www.feedbooks.com/book/73.epub	http://covers.feedbooks.net/book/73.jpg?size=large&t=1473154680	The Count of Monte Cristo (French: Le Comte de Monte-Cristo) is an adventure novel by Alexandre Dumas, père. It is often considered, along with The Three Musketeers, as Dumas' most popular work. It is also among the highest selling books of all ti...	7126
39	The Black Cat	1842	http://www.feedbooks.com/book/759.epub	http://covers.feedbooks.net/book/759.jpg?size=large&t=1452590439	"The Black Cat" is a short story by Edgar Allan Poe. It was first published in the August 19, 1843, edition of The Saturday Evening Post. It is a study of the psychology of guilt, often paired in analysis with Poe's "The Tell-Tale Heart". In both,...	391724
43	Grimm's Fairy Tales	1812	http://www.feedbooks.com/book/187.epub	http://covers.feedbooks.net/book/187.jpg?size=large&t=1434692847	Children's and Household Tales (German: Kinder- und Hausmärchen) is a collection of German origin fairy tales first published in 1812 by Jacob and Wilhelm Grimm, the Brothers Grimm. The collection is commonly known today as Grimms' Fairy Tales (Ge...	22917
45	Wuthering Heights	1847	http://www.feedbooks.com/book/135.epub	http://covers.feedbooks.net/book/135.jpg?size=large&t=1429879517	Wuthering Heights is Emily Brontë's only novel. It was first published in 1847 under the pseudonym Ellis Bell, and a posthumous second edition was edited by her sister Charlotte. The name of the novel comes from the Yorkshire manor on the moors on...	6185
46	The Picture of Dorian Gray	1891	http://www.feedbooks.com/book/6.epub	http://covers.feedbooks.net/book/6.jpg?size=large&t=1473092689	Oscar Wilde's story of a fashionable young man who sells his soul for eternal youth and beauty is one of his most popular works. Written in Wilde's characteristically dazzling manner, full of stinging epigrams and shrewd observations, the tale of ...	5297
47	Emma	1816	http://www.feedbooks.com/book/45.epub	http://covers.feedbooks.net/book/45.jpg?size=large&t=1472425883	Emma is a comic novel by Jane Austen, first published in December 1815, about the perils of misconstrued romance. The main character, Emma Woodhouse, is described in the opening paragraph as "handsome, clever, and rich" but is also rather spoiled....	6969
49	20,000 Leagues Under the Sea	1870	http://www.feedbooks.com/book/182.epub	http://covers.feedbooks.net/book/182.jpg?size=large&t=1434016187	Twenty Thousand Leagues Under the Sea (French: Vingt mille lieues sous les mers) is a classic science fiction novel by French writer Jules Verne, published in 1870. It is about the fictional Captain Nemo and his submarine, Nautilus, as seen by one...	15762322
50	The Arabian Nights	1898	http://www.feedbooks.com/book/208.epub	http://covers.feedbooks.net/book/208.jpg?size=large&t=1434692861	One Thousand and One Nights  is a collection of stories collected over many centuries by various authors, translators and scholars in various countries across the Middle East and South Asia. These collections of tales trace their roots back to anc...	6328670
51	The Happy Prince and Other Tales	1910	http://www.feedbooks.com/book/6469.epub	http://covers.feedbooks.net/book/6469.jpg?size=large&t=1473092664	The Happy Prince and Other Tales (sometimes called The Happy Prince and Other Stories) is a collection of stories for children by Oscar Wilde first published in May 1888. It contains five stories, "The Happy Prince", "The Nightingale and the Rose"...	779021
52	Mrs Dalloway	1925	http://www.feedbooks.com/book/1231.epub	http://covers.feedbooks.net/book/1231.jpg?size=large&t=1429885961	Mrs Dalloway (published on 14 May 1925) is a novel by Virginia Woolf that details a day in the life of Clarissa Dalloway in post-World War I England. Mrs Dalloway continues to be one of Woolf's best-known novels.\nCreated from two short stories, "...	14942
53	The Golden Ass	160	http://www.feedbooks.com/book/591.epub	http://covers.feedbooks.net/book/591.jpg?size=large&t=1425660214	The story follows Lucius, a young man of good birth, as he disports himself in the cities and along the roads of Thessaly. This is a wonderful tale abounding in lusty incident, curious adventure and bawdy wit.	80081
54	To the Lighthouse	1927	http://www.feedbooks.com/book/1234.epub	http://covers.feedbooks.net/book/1234.jpg?size=large&t=1447559568	To the Lighthouse (5 May 1927) is a novel by Virginia Woolf. A landmark novel of high modernism, the text, centering on the Ramsay family and their visits to the Isle of Skye in Scotland between 1910 and 1920, skillfully manipulates temporality an...	59716
55	Robinson Crusoe	1719	http://www.feedbooks.com/book/102.epub	http://covers.feedbooks.net/book/102.jpg?size=large&t=1429880462	The Life and Strange Surprising Adventures of Robinson Crusoe (of York, Mariner Who lived Eight and Twenty Years all alone in an un-inhabited Island on the Coast of America, near the Mouth of the Great River of Oroonoque; Having been cast on Shore...	2932
56	The Lost Girl	1920	http://www.feedbooks.com/book/6631.epub	http://covers.feedbooks.net/book/6631.jpg?size=large&t=1468465364	Alvina Houghton, the daughter of a widowed Midlands draper, comes of age just as her father’s business is failing. In a desperate attempt to regain his fortune and secure his daughter’s proper upbringing, James Houghton buys a theater. Among the t...	459123
98	Venus in Furs	1906	http://www.feedbooks.com/book/190.epub	http://covers.feedbooks.net/book/190.jpg?size=large&t=1425660134	Severin is so infatuated with Wanda that he requests to be treated as her slave and encourages her to treat him in progressively more degrading ways. At first Wanda does not want to, but later embraces the idea; though at the same time, she disdai...	427354
104	The Legend of Sleepy Hollow	1820	http://www.feedbooks.com/book/196.epub	http://covers.feedbooks.net/book/196.jpg?size=large&t=1472746123	No Description Available	93261
242	The Door with Seven Locks	1926	http://www.feedbooks.com/book/1808.epub	http://covers.feedbooks.net/book/1808.jpg?size=large&t=1425660508	No Description Available	854320
57	Japanese Fairy Tales	1908	http://www.feedbooks.com/book/4570.epub	http://covers.feedbooks.net/book/4570.jpg?size=large&t=1473097730	This collection of Japanese fairy tales is the outcome of a suggestion made to me indirectly through a friend by Mr. Andrew Lang. They have been translated from the modern version written by Sadanami Sanjin. These stories are not literal translati...	642956
61	The Metamorphosis	1912	http://www.feedbooks.com/book/8.epub	http://covers.feedbooks.net/book/8.jpg?size=large&t=1439145846	The Metamorphosis (German: Die Verwandlung) is a novella by Franz Kafka, first published in 1915. The story begins with a traveling salesman, Gregor Samsa, waking to find himself transformed into a "monstrous vermin".	485894
62	Tess of the d'Urbervilles	1891	http://www.feedbooks.com/book/2699.epub	http://covers.feedbooks.net/book/2699.jpg?size=large&t=1473233623	Young Tess Durbeyfield attempts to restore her family's fortunes by claiming their connection with the aristocratic d'Urbervilles. But Alec d'Urberville is a rich wastrel who seduces her and makes her life miserable. When Tess meets Angel Clare, s...	32261
65	A Journey into the Center of the Earth	1877	http://www.feedbooks.com/book/3796.epub	http://covers.feedbooks.net/book/3796.jpg?size=large&t=1469749585	Journey to the Center of the Earth is a classic 1864 science fiction novel by Jules Verne (published in the original French as Voyage au centre de la Terre). The story involves a professor who leads his nephew and hired guide down a volcano in Ice...	32829
66	Moby-Dick	1851	http://www.feedbooks.com/book/54.epub	http://covers.feedbooks.net/book/54.jpg?size=large&t=1469749640	Moby-Dick is an 1851 novel by Herman Melville. The story tells the adventures of the wandering sailor Ishmael and his voyage on the whaling ship Pequod, commanded by Captain Ahab. Ishmael soon learns that Ahab seeks one specific whale, Moby-Dick, ...	153747
67	Oliver Twist	1867	http://www.feedbooks.com/book/56.epub	http://covers.feedbooks.net/book/56.jpg?size=large&t=1425660108	Set in Victorian London, this is a tale of a spirited young innocent's unwilling but inevitable recruitment into a scabrous gang of thieves. Masterminded by the loathsome Fagin, the underworld crew features some of Dickens' most memorable characte...	18254
68	The Secret Adversary	1922	http://www.feedbooks.com/book/2059.epub	http://covers.feedbooks.net/book/2059.jpg?size=large&t=1454838893	Hiring themselves out as “young adventurers willing to do anything” is a smart move for Tommy and Tuppence. All Tuppence has to do is take an all-expenses-paid trip to Paris and pose as someone named Jane Finn. But with the job comes a threat to h...	49596
70	The Brothers Karamazov	1880	http://www.feedbooks.com/book/180.epub	http://covers.feedbooks.net/book/180.jpg?size=large&t=1453264774	The Brothers Karamazov is the final novel by the Russian author Fyodor Dostoevsky, and is generally considered the culmination of his life's work. Dostoevsky spent nearly two years writing The Brothers Karamazov, which was published as a serial in...	4934
71	Les Mis�rables	1862	http://www.feedbooks.com/book/1559.epub	http://covers.feedbooks.net/book/1559.jpg?size=large&t=1439165223	Les Misérables (1862) is a novel by French author Victor Hugo, and among the best-known novels of the 19th century. It follows the lives and interactions of several French characters over a twenty year period in the early 19th century that starts ...	24280
72	The Return of Sherlock Holmes	1905	http://www.feedbooks.com/book/63.epub	http://covers.feedbooks.net/book/63.jpg?size=large&t=1472223989	The Return of Sherlock Holmes is a collection of 13 Sherlock Holmes stories, originally published in 1903-1904, by Arthur Conan Doyle.\nThe book was first published on March 7, 1905 by Georges Newnes, Ltd and in a Colonial edition by Longmans. 30,...	194366
73	The Prince and the Pauper	1881	http://www.feedbooks.com/book/6623.epub	http://covers.feedbooks.net/book/6623.jpg?size=large&t=1431026137	The novel represents Twain's first attempt at historical fiction. Set in 1547, it tells the story of two young boys who are identical in appearance: Tom Canty, a pauper who lives with his abusive father in Offal Court off Pudding Lane in London, a...	62446
74	A Room with a View	1908	http://www.feedbooks.com/book/2068.epub	http://covers.feedbooks.net/book/2068.jpg?size=large&t=1445854211	This Edwardian social comedy explores love and prim propriety among an eccentric cast of characters assembled in an Italian pensione and in a corner of Surrey, England.\n\nA charming young Englishwoman, Lucy Honeychurch, faints into the arms of a fe...	3087
75	A Study in Scarlet	1887	http://www.feedbooks.com/book/57.epub	http://covers.feedbooks.net/book/57.jpg?size=large&t=1472223989	A Study in Scarlet is a detective mystery novel written by Sir Arthur Conan Doyle, which was first published in 1887. It is the first story to feature the character of Sherlock Holmes, who would later become one of the most famous and iconic liter...	102868
76	Beyond the Door	1954	http://www.feedbooks.com/book/3863.epub	http://covers.feedbooks.net/book/3863.jpg?size=large&t=1473097719	Did you ever wonder at the lonely life the bird in a cuckoo clock has to lead—that it might possibly love and hate just as easily as a real animal of flesh and blood? Philip Dick used that idea for this brief fantasy tale. We're sure that after re...	6468230
77	The Little Lady of the Big House	1916	http://www.feedbooks.com/book/3117.epub	http://covers.feedbooks.net/book/3117.jpg?size=large&t=1425660793	A triangle romance provides the basis for a questioning of the meaning of masculinity, as well as an examination of agribusiness in California.\nJack London said of this novel: "It is all sex from start to finish -- in which no sexual adventure is...	363976
82	The Einstein Theory of Relativity	1920	http://www.feedbooks.com/book/3591.epub	http://covers.feedbooks.net/book/3591.jpg?size=large&t=1464191016	Whether it is true or not that not more than twelve persons in all the world are able to understand Einstein's Theory, it is nevertheless a fact that there is a constant demand for information about this much-debated topic of relativity. The books...	6567738
95	Sons and Lovers	1913	http://www.feedbooks.com/book/213.epub	http://covers.feedbooks.net/book/213.jpg?size=large&t=1468466388	The third published novel of D. H. Lawrence, taken by many to be his earliest masterpiece, tells the story of Paul Morel, a young man and budding artist. Richard Aldington explains the semi-autobiographical nature of his masterpiece:\nWhen you hav...	32071
99	First Love	1860	http://www.feedbooks.com/book/2298.epub	http://covers.feedbooks.net/book/2298.jpg?size=large&t=1473097326	Vladimir Petrovich Voldemar, a 16-year-old, is staying in the country with his family and meets Zinaida Alexandrovna Zasyekina, a beautiful 21-year-old woman, staying with her mother, Princess Zasyekina, in a wing of the manor. This family, as wit...	3532
123	Love Story	1956	http://www.feedbooks.com/book/4720.epub	http://covers.feedbooks.net/book/4720.jpg?size=large&t=1473097271	Everything was aimed at satisfying the whims of women. The popular cliches, the pretty romances, the catchwords of advertising became realities; and the compound kept the men enslaved. George knew what he had to do....	\N
84	The Three Musketeers	1844	http://www.feedbooks.com/book/398.epub	http://covers.feedbooks.net/book/398.jpg?size=large&t=1439146664	The Three Musketeers (Les Trois Mousquetaires) is a novel by Alexandre Dumas, père. It recounts the adventures of a young man named d'Artagnan after he leaves home to become a musketeer. D'Artagnan is not one of the musketeers of the title; those ...	7190
85	Pagan Passions	1959	http://www.feedbooks.com/book/1963.epub	http://covers.feedbooks.net/book/1963.jpg?size=large&t=1425660545	The Gods and Goddesses of Ancient Greece and Rome had returned to Earth -- with all their awesome powers intact. Overnight, Earth was transformed. War on any scale was outlawed, along with boom-and-bust economic cycles, and prudery. No change was ...	2897159
86	The Adventures of Tom Sawyer	1876	http://www.feedbooks.com/book/72.epub	http://covers.feedbooks.net/book/72.jpg?size=large&t=1469749566	The Adventures of Tom Sawyer, by Mark Twain, is a popular 1876 novel about a young boy growing up in the antebellum South on the Mississippi River in the fictional town of St. Petersburg, Missouri.	24583
87	Ulysses	1922	http://www.feedbooks.com/book/1232.epub	http://covers.feedbooks.net/book/1232.jpg?size=large&t=1437534696	Ulysses is a novel by James Joyce, first serialized in parts in the American journal The Little Review from March 1918 to December 1920, then published in its entirety by Sylvia Beach on February 2, 1922, in Paris. It is considered one of the most...	338798
88	Othello	1603	http://www.feedbooks.com/book/2941.epub	http://covers.feedbooks.net/book/2941.jpg?size=large&t=1425660765	Othello, The Moor of Venice is a tragedy by William Shakespeare based on the short story "Moor of Venice" by Cinthio, believed to have been written in approximately 1603. The work revolves around four central characters: Othello, his wife Desdemon...	12996
89	A Room of One's Own	1929	http://www.feedbooks.com/book/6655.epub	http://covers.feedbooks.net/book/6655.jpg?size=large&t=1435693348	A Room of One's Own is an extended essay by Virginia Woolf. First published on 24 October 1929, the essay was based on a series of lectures she delivered at Newnham College and Girton College, two women's colleges at Cambridge University in Octobe...	18521
90	The Sign of the Four	1890	http://www.feedbooks.com/book/2.epub	http://covers.feedbooks.net/book/2.jpg?size=large&t=1472223989	First published in 1890, The Sign of Four is Sir Arthur Conan Doyle's second book starring legendary detective Sherlock Holmes. The story is complex, involving a secret between four ex-cons from India and a hidden treasure. More complex than the f...	608474
92	The Prince	1513	http://www.feedbooks.com/book/94.epub	http://covers.feedbooks.net/book/94.jpg?size=large&t=1425660115	Il Principe (The Prince) is a political treatise by the Florentine public servant and political theorist Niccolò Machiavelli. Originally called De Principatibus (About Principalities), it was written in 1513, but not published until 1532, five yea...	28862
93	Through the Looking Glass (And What Alice Found There)	1871	http://www.feedbooks.com/book/23.epub	http://covers.feedbooks.net/book/23.jpg?size=large&t=1425660103	Through the Looking-Glass, and What Alice Found There (1871) is a work of children's literature by Lewis Carroll (Charles Lutwidge Dodgson), generally categorized as literary nonsense. It is the sequel to Alice's Adventures in Wonderland (1865). A...	83346
94	David Copperfield	1850	http://www.feedbooks.com/book/673.epub	http://covers.feedbooks.net/book/673.jpg?size=large&t=1439163931	David Copperfield is the novel that draws most closely from Charles Dickens's own life. Its eponymous hero, orphaned as a boy, grows up to discover love and happiness, heartbreak and sorrow amid a cast of eccentrics, innocents, and villains. Prais...	58696
96	The Book of Five Rings	1644	http://www.feedbooks.com/book/3953.epub	http://covers.feedbooks.net/book/3953.jpg?size=large&t=1468714256	Miyamoto Musashi's Go Rin no Sho or the book of five rings,  is considered a classic treatise on military strategy, much like Sun Tzu's The Art of War and Chanakya's Arthashastra.\n\nThe five "books" refer to the idea that there are different elem...	31919703
101	Lady Chatterley's Lover	1928	http://www.feedbooks.com/book/87.epub	http://covers.feedbooks.net/book/87.jpg?size=large&t=1455764008	Lady Chatterley's Lover is a novel by D. H. Lawrence written in 1928.\nPrinted privately in Florence in 1928, it was not printed in the United Kingdom until 1960 (other than in an underground edition issued by Inky Stephensen's Mandrake Press in 1...	32049
107	The Canterville Ghost	1887	http://www.feedbooks.com/book/7.epub	http://covers.feedbooks.net/book/7.jpg?size=large&t=1473097645	The Canterville Ghost is a popular 1887 novella by Oscar Wilde, widely adapted for the screen and stage.\n“The Canterville Ghost” is a parody featuring a dramatic spirit named Sir Simon and the United States minister (ambassador) to the Court of S...	45685
108	Gulliver's Travels	1726	http://www.feedbooks.com/book/159.epub	http://covers.feedbooks.net/book/159.jpg?size=large&t=1429880620	Gulliver's Travels (1726, amended 1735), officially Travels into Several Remote Nations of the World, in Four Parts. By Lemuel Gulliver, First a Surgeon, and then a Captain of several Ships, is a novel by Jonathan Swift that is both a satire on hu...	7733
109	It Can't Happen Here	1935	http://www.feedbooks.com/book/3659.epub	http://covers.feedbooks.net/book/3659.jpg?size=large&t=1425660899	It Can't Happen Here is a semi-satirical political novel by Sinclair Lewis published in 1935. It features newspaperman Doremus Jessup struggling against the fascist regime of President Berzelius "Buzz" Windrip, who resembles Gerald B. Winrod, the ...	11371
111	King Lear	1606	http://www.feedbooks.com/book/2940.epub	http://covers.feedbooks.net/book/2940.jpg?size=large&t=1425660764	King Lear is a tragedy by William Shakespeare, believed to have been written between 1603 and 1606, and is considered one of his greatest works. The play is based on the legend of King Leir of Britain. It has been widely adapted for stage and scre...	12938
112	His Last Bow	1917	http://www.feedbooks.com/book/65.epub	http://covers.feedbooks.net/book/65.jpg?size=large&t=1472223989	His Last Bow is a collection of seven Sherlock Holmes stories (eight in American editions) by Arthur Conan Doyle, as well as the title of one of the stories in that collection. Originally published in 1917, it contains the various Holmes stories p...	18873517
152	The Road	1907	http://www.feedbooks.com/book/3248.epub	http://covers.feedbooks.net/book/3248.jpg?size=large&t=1474026788	Tales of London's days as a hobo.	\N
113	The Elements of Style	1918	http://www.feedbooks.com/book/3697.epub	http://covers.feedbooks.net/book/3697.jpg?size=large&t=1425660908	The Elements of Style is an American English writing style guide. It is one of the most influential and best-known prescriptive treatments of English grammar and usage in the United States. It originally detailed eight elementary rules of usage, t...	33514
114	The Valley of Fear	1915	http://www.feedbooks.com/book/64.epub	http://covers.feedbooks.net/book/64.jpg?size=large&t=1472223989	The plot of the novel is based very loosely on the real-life activities of the Molly Maguires and, particularly, of Pinkerton agent James McParland.\nThe novel is divided into two parts: in the first, Holmes investigates an apparent murder and disc...	736131
115	The Iron Woman	1911	http://www.feedbooks.com/book/7139.epub	http://covers.feedbooks.net/book/7139.jpg?size=large&t=1453216276	The Iron Woman is a novel of manners by the American writer Margaret Deland set in the 19th century fictional locale of Mercer, an Ohio River community that represents Pittsburgh, Pennsylvania.	20942128
116	The King in Yellow	1895	http://www.feedbooks.com/book/1376.epub	http://covers.feedbooks.net/book/1376.jpg?size=large&t=1473097530	The book is named after a fictional play with the same title which recurs as a motif through some of the stories. The first half of the book features highly esteemed weird stories, and the book is described by S.T. Joshi as a classic in the field ...	17211636
120	Strange Case of Dr Jekyll and Mr Hyde	1886	http://www.feedbooks.com/book/95.epub	http://covers.feedbooks.net/book/95.jpg?size=large&t=1439142775	Strange Case of Dr Jekyll and Mr Hyde is a novella written by the Scottish author Robert Louis Stevenson and first published in 1886. It is about a London lawyer who investigates strange occurrences between his old friend, Dr Henry Jekyll, and the...	51496
125	Fairy Tales of Hans Christian Andersen	1872	http://www.feedbooks.com/book/4022.epub	http://covers.feedbooks.net/book/4022.jpg?size=large&t=1473097498	Hans Christian Andersen began publishing his Fairy Tales in 1835. This collection of 127 of the stories was translated by Mrs. Paull in 1872.	6356046
126	The Woman in White	1860	http://www.feedbooks.com/book/3696.epub	http://covers.feedbooks.net/book/3696.jpg?size=large&t=1456229348	The Woman in White is an epistolary novel written by Wilkie Collins in 1859, serialized in 1859–1860, and first published in book form in 1860. It is considered to be among the first mystery novels and is widely regarded as one of the first (and f...	5890
128	The Trial	1925	http://www.feedbooks.com/book/9.epub	http://covers.feedbooks.net/book/9.jpg?size=large&t=1439145868	The Trial (German: Der Process) is a novel by Franz Kafka about a character named Josef K., who awakens one morning and, for reasons never revealed, is arrested and prosecuted for an unspecified crime.\nAccording to Kafka's friend Max Brod, the au...	17690
129	In the Year 2889	1889	http://www.feedbooks.com/book/477.epub	http://covers.feedbooks.net/book/477.jpg?size=large&t=1473097514	In the Year 2889 was first published in the Forum, February, 1889. It was published in France the next year. Although published under the name of Jules Verne, it is now believed to be chiefly if not entirely the work of Jules Verne's son, Michel V...	78735
130	The Scarlet Letter	1850	http://www.feedbooks.com/book/1523.epub	http://covers.feedbooks.net/book/1523.jpg?size=large&t=1474027150	The Scarlet Letter, published in 1850, is an American novel written by Nathaniel Hawthorne and is generally considered to be his magnum opus. Set in 17th-century Puritan Boston, it tells the story of Hester Prynne, who gives birth after committing...	12296
132	The Complete Plato	-347	http://creativecommons.org/licenses/by-nc-sa/3.0/	http://www.feedbooks.com/book/4961.pdf	Plato (428/427–348/347 BCE) was a Greek philosopher and mathematician of the Classic Age who founded the Academy of Athens. Noted as a student of Socrates, Plato has distinguished himself as one of the founders of Western philosophy by recording t...	30290
134	The Call of Cthulhu	1926	http://www.feedbooks.com/book/18.epub	http://covers.feedbooks.net/book/18.jpg?size=large&t=1473097507	"The Call of Cthulhu" is one of H. P. Lovecraft's best-known short stories. Written in the summer of 1926, it was first published in Weird Tales, February 1928. It is the only story written by Lovecraft in which the extraterrestrial entity Cthulhu...	15730101
135	The Virgin and the Gipsy	1930	http://www.feedbooks.com/book/1079.epub	http://covers.feedbooks.net/book/1079.jpg?size=large&t=1473097130	No Description Available	876138
138	The Haunted House	1859	http://www.feedbooks.com/book/305.epub	http://covers.feedbooks.net/book/305.jpg?size=large&t=1425660153	No Description Available	198323
139	I, Robot	2005	http://creativecommons.org/licenses/by-nc-sa/3.0/	http://www.feedbooks.com/book/337.pdf	"I, Robot" is a science-fiction short story by Cory Doctorow published in 2005.\nThe story is set in the type of police state needed to ensure that only one company is allowed to make robots, and only one type of robot is allowed.\nThe story follo...	6147406
143	Much Ado About Nothing	1600	http://www.feedbooks.com/book/2991.epub	http://covers.feedbooks.net/book/2991.jpg?size=large&t=1425660773	Much Ado About Nothing is a comedy by William Shakespeare. First published in 1600, it is likely to have been first performed in the autumn or winter of 1598-1599, and it remains one of Shakespeare's most enduring and exhilarating plays on stage. ...	12957
144	The Red Badge of Courage	1895	http://www.feedbooks.com/book/4527.epub	http://covers.feedbooks.net/book/4527.jpg?size=large&t=1425661094	The Red Badge of Courage is an 1895 war novel by American author Stephen Crane. It is considered one of the most influential works in American literature. The novel, a depiction on the cruelty of the American Civil War, features a young recruit wh...	35220
150	Tender is the Night	1933	http://www.feedbooks.com/book/1136.epub	http://covers.feedbooks.net/book/1136.jpg?size=large&t=1426685873	Tender Is the Night is an English language novel by F. Scott Fitzgerald. It was first published in Scribner's Magazine between January-April, 1934 in four issues. It is ranked #28 on the Modern Library's list of the 100 Greatest Novels of the 20th...	46164
151	A Modern Utopia	1905	http://www.feedbooks.com/book/4183.epub	http://covers.feedbooks.net/book/4183.jpg?size=large&t=1451486668	In A Modern Utopia, two travelers fall into a space-warp and suddenly find themselves upon a Utopian Earth controlled by a single World Government.	29964
145	Around the World in Eighty Days	1872	http://www.feedbooks.com/book/199.epub	http://covers.feedbooks.net/book/199.jpg?size=large&t=1439141774	Shocking his stodgy colleagues at the exclusive Reform Club, enigmatic Englishman Phileas Fogg wagers his fortune, undertaking an extraordinary and daring enterprise: to circumnavigate the globe in eighty days. With his French valet Passepartout i...	54479
146	Orlando	1928	http://www.feedbooks.com/book/6278.epub	http://covers.feedbooks.net/book/6278.jpg?size=large&t=1425661463	Orlando: A Biography is an influential novel by Virginia Woolf, first published on 11 October 1928. A semi-biographical novel based in part on the life of Woolf's lover Vita Sackville-West, it is generally considered one of Woolf's most accessible...	18839
149	Twelfth Night	1601	http://www.feedbooks.com/book/3008.epub	http://covers.feedbooks.net/book/3008.jpg?size=large&t=1425660776	Twelfth Night, Or What You Will is a comedy by William Shakespeare, based on the short story "Of Apolonius and Silla" by Barnabe Rich. It is named after the Twelfth Night holiday of the Christmas season. It was written around 1601 and first publis...	1625
154	The Iliad & The Odyssey	-800	http://creativecommons.org/licenses/by-nc-sa/3.0/	http://www.feedbooks.com/book/4959.pdf	While Homer's existence as a historical person is still a topic of debate, the writings attributed to the name have made their mark not only on Greek history and literature, but upon western civilization itself. Homer's epic poems, The Iliad and T...	1375
157	As You Like It	1600	http://www.feedbooks.com/book/2972.epub	http://covers.feedbooks.net/book/2972.jpg?size=large&t=1425660771	As You Like It is a pastoral comedy by William Shakespeare based on the novel Rosalynde by Thomas Lodge, believed to have been written in 1599 or early 1600. It features one of Shakespeare's most famous and oft-quoted lines, "All the world's a sta...	42607
158	The Blue Fairy Book	1889	http://www.feedbooks.com/book/4037.epub	http://covers.feedbooks.net/book/4037.jpg?size=large&t=1453265069	Andrew Lang's Fairy Books or Andrew Lang's "Coloured" Fairy Books constitute a twelve-book series of fairy tale collections. Although Andrew Lang did not collect the stories himself from the oral tradition, the extent of his sources, who had colle...	543164
159	The Tell-Tale Heart	1843	http://www.feedbooks.com/book/814.epub	http://covers.feedbooks.net/book/814.jpg?size=large&t=1426596662	"The Tell-Tale Heart" is a short story by Edgar Allan Poe first published in 1843. It follows an unnamed narrator who insists on his sanity after murdering an old man with a "vulture eye". The murder is carefully calculated, and the murderer hides...	391729
160	Vanity Fair	1848	http://www.feedbooks.com/book/1469.epub	http://covers.feedbooks.net/book/1469.jpg?size=large&t=1472832635	“I think I could be a good woman, if I had five thousand a year,” observes beautiful and clever Becky Sharp, one of the wickedest—and most appealing—women in all of literature. Becky is just one of the many fascinating figures that populate Willia...	5797
163	The Son of the Wolf	1900	http://www.feedbooks.com/book/2849.epub	http://covers.feedbooks.net/book/2849.jpg?size=large&t=1425660748	Jack London gained his first and most lasting fame as the author of tales of the Klondike gold rush. This, his first collection of stories, draws on his experience in the Yukon. The stories tell of gambles won and lost, of endurance and sacrifice,...	2836089
164	The Right People	2008	http://creativecommons.org/licenses/by-nc-nd/3.0/	http://www.feedbooks.com/book/3563.pdf	Imagine what high school would have been like if dealing drugs had been legal when licensed, mobile social networking had been ubiquitous and the in-crowd had more leverage than most political parties… what would the smart-but-slightly-crazy outca...	17181884
165	Crime and Punishment	1866	http://www.feedbooks.com/book/38.epub	http://covers.feedbooks.net/book/38.jpg?size=large&t=1439156390	The poverty-stricken Raskolnikov, believing he is exempt from moral law, murders a man only to face the consequences not only from society but from his conscience, in this seminal story of justice, morality, and redemption from one of Russia's gre...	7144
166	The Waves	1931	http://www.feedbooks.com/book/1230.epub	http://covers.feedbooks.net/book/1230.jpg?size=large&t=1425660372	One of Woolf’s most experimental novels, The Waves presents six characters in monologue - from morning until night, from childhood into old age - against a background of the sea. The result is a glorious chorus of voices that exists not to remark ...	46114
170	Cabin Fever	1918	http://creativecommons.org/licenses/by-sa/3.0/	http://www.feedbooks.com/book/6642.pdf	"... the mind fed too long upon monotony succumbs to the insidious mental ailment which the West calls 'cabin fever.' ... Bud Moore, ex-cow-puncher and now owner of an auto stage that did not run in the winter, was touched with cabin fever and did...	6328784
173	The Gods of Mars	1918	http://www.feedbooks.com/book/163.epub	http://covers.feedbooks.net/book/163.jpg?size=large&t=1463373664	After the long exile on Earth, John Carter finally returned to his beloved Mars. But beautiful Dejah Thoris, the woman he loved, had vanished. Now he was trapped in the legendary Eden of Mars -- an Eden from which none ever escaped alive.	841973
174	Madame Bovary	1857	http://www.feedbooks.com/book/2042.epub	http://covers.feedbooks.net/book/2042.jpg?size=large&t=1439167647	Madame Bovary scandalized its readers when it was first published in 1857. And the story itself remains as fresh today as when it was first written, a work that remains unsurpassed in its unveiling of character and society. It tells the tragic sto...	2175
175	The Phantom of the Opera	1910	http://www.feedbooks.com/book/3403.epub	http://covers.feedbooks.net/book/3403.jpg?size=large&t=1425660848	The story of a man named Erik, an eccentric, physically deformed genius who terrorizes the Opera Garnier in Paris. He builds his home beneath it and takes the love of his life, a beautiful soprano, under his wing.	480204
176	The House of the Vampire	1907	http://www.feedbooks.com/book/3837.epub	http://covers.feedbooks.net/book/3837.jpg?size=large&t=1470440912	The first known gay vampire novel and one of the first psychic vampire stories.	5424730
178	An Antarctic Mystery	1899	http://www.feedbooks.com/book/3947.epub	http://covers.feedbooks.net/book/3947.jpg?size=large&t=1439141928	A sequel to Edgar Allan Poe's The Narrative of A. Gordon Pym.	719181
179	Middlemarch	1871	http://www.feedbooks.com/book/575.epub	http://covers.feedbooks.net/book/575.jpg?size=large&t=1473425429	Vast and crowded, rich in irony and suspense, Middlemarch is richer still in character, with two of the era's most enduring characters, Dorothea Brooke, trapped in a loveless marriage, and Lydgate, an ambitious young doctor.	19089
187	Pygmalion	1913	http://www.feedbooks.com/book/4440.epub	http://covers.feedbooks.net/book/4440.jpg?size=large&t=1425661075	The story of Henry Higgins, a professor of phonetics who makes a bet with his friend Colonel Pickering that he can successfully pass off a Cockney flower girl, Eliza Doolittle, as a refined society lady by teaching her how to speak with an upper c...	7714
188	A Christmas Carol	1843	http://www.feedbooks.com/book/59.epub	http://covers.feedbooks.net/book/59.jpg?size=large&t=1466864161	In his "Ghostly little book," Charles Dickens invents the modern concept of Christmas Spirit and offers one of the world’s most adapted and imitated stories. We know Ebenezer Scrooge, Tiny Tim, and the Ghosts of Christmas Past, Present, and Future...	5326
189	The Republic	-380	http://www.feedbooks.com/book/4104.epub	http://covers.feedbooks.net/book/4104.jpg?size=large&t=1468714281	The Republic is a Socratic dialogue by Plato, written in approximately 380 BC. It is one of the most influential works of philosophy and political theory, and Plato's best known work. In Plato's fictional dialogues the characters of Socrates as we...	30289
190	Diary Of A Madman	1835	http://www.feedbooks.com/book/6464.epub	http://covers.feedbooks.net/book/6464.jpg?size=large&t=1473096897	Diary of a Madman (1835; Russian: Записки сумасшедшего, Zapiski sumasshedshevo) is a farcical short story by Nikolai Gogol. Along with The Overcoat and The Nose, Diary of a Madman is considered to be one of Gogol's greatest short stories. The tale...	28382
191	Lady Susan	1794	http://www.feedbooks.com/book/3922.epub	http://covers.feedbooks.net/book/3922.jpg?size=large&t=1446740183	Austen's "most wicked tale," Lady Susan is a short epistolary novel by Jane Austen, possibly written in 1794 but not published until 1871. Lady Susan is a selfish, attractive woman, who tries to trap the best possible husband while maintaining a r...	91582
192	Sylvia's Lovers	1863	http://www.feedbooks.com/book/7034.epub	http://covers.feedbooks.net/book/7034.jpg?size=large&t=1425661644	The novel begins in the 1790s in the coastal town of Monkshaven (modeled on Whitby, England) against the background of the practice of impressment during the early phases of the Napoleonic Wars.	830205
193	Masterpieces of Mystery: Riddle Stories	1922	http://creativecommons.org/licenses/by-nc-sa/3.0/	http://www.feedbooks.com/book/6679.pdf	Edited by Joseph Lewis French, this collection of 9 riddle stories includes "The Mysterious Card" and its sequel by Cleveland Moffett, "The Oblong Box" by Poe, "A Terribly Strange Bed" by Wilkie Collins, "The Lost Room" by Fitz-James O'Brien and o...	18900516
194	American Fairy Tales	1901	http://www.feedbooks.com/book/3408.epub	http://covers.feedbooks.net/book/3408.jpg?size=large&t=1473097106	12 Fairy Tales from the author of the Wizard of Oz series of books.  Inspired by Lang and the Brothers Grimm, Baum sought to create an American type of fairy tales, avoiding the usual violence and roman often found in these sort of stories.	1954859
195	The Idiot	1868	http://www.feedbooks.com/book/367.epub	http://covers.feedbooks.net/book/367.jpg?size=large&t=1437534824	Returning to Russia from a sanitarium in Switzerland, the Christ-like epileptic Prince Myshkin finds himself enmeshed in a tangle of love, torn between two women—the notorious kept woman Nastasya and the pure Aglaia—both involved, in turn, with th...	12505
196	Far from the Madding Crowd	1874	http://www.feedbooks.com/book/4156.epub	http://covers.feedbooks.net/book/4156.jpg?size=large&t=1425661011	Far from the Madding Crowd was the first of Hardy's novels to apply the name of Wessex to the landscape of south-west England, and the first to gain him widespread popularity as a novelist. When the beautiful and spirited Bathsheba Everdene inheri...	31463
197	Great Astronomers: Isaac Newton	1907	http://www.feedbooks.com/book/6601.epub	http://covers.feedbooks.net/book/6601.jpg?size=large&t=1425661540	Sir Isaac Newton (1642–1726) was an English physicist, mathematician, astronomer, natural philosopher, alchemist and theologian who has been considered by many to be the greatest and most influential scientist who ever lived. His monograph Philoso...	20966284
198	The Age of Reason	1807	http://www.feedbooks.com/book/3781.epub	http://covers.feedbooks.net/book/3781.jpg?size=large&t=1472832818	The Age of Reason: Being an Investigation of True and Fabulous Theology, a deistic treatise written by eighteenth-century British radical and American revolutionary Thomas Paine, critiques institutionalized religion and challenges the inerrancy of...	1031803
199	The Prisoner of Zenda	1894	http://www.feedbooks.com/book/3582.epub	http://covers.feedbooks.net/book/3582.jpg?size=large&t=1460300712	The Prisoner of Zenda is an adventure novel by Anthony Hope, published in 1894. The king of the fictional country of Ruritania is abducted on the eve of his coronation, and the protagonist, an English gentleman on holiday who fortuitously resemble...	54492
200	The Machine Stops	1909	http://www.feedbooks.com/book/2073.epub	http://covers.feedbooks.net/book/2073.jpg?size=large&t=1466110839	The Machine Stops is a short science fiction story. It describes a world in which almost all humans have lost the ability to live on the surface of the Earth. Each individual lives in isolation in a 'cell', with all bodily and spiritual needs met ...	4711854
201	The Beautiful and the Damned	1922	http://www.feedbooks.com/book/1417.epub	http://covers.feedbooks.net/book/1417.jpg?size=large&t=1425660420	The novel provides a portrait of the Eastern elite during the Jazz Age, exploring New York Café Society. As with his other novels, Fitzgerald's characters are complex, especially in their marriage and intimacy, much like how he treats intimacy in ...	4708
208	Women in Love	1920	http://www.feedbooks.com/book/1030.epub	http://covers.feedbooks.net/book/1030.jpg?size=large&t=1425660320	Women in Love is a novel by British author D. H. Lawrence published in 1920. It is a sequel to his earlier novel The Rainbow (1915), and follows the continuing loves and lives of the Brangwen sisters, Gudrun and Ursula. Gudrun Brangwen, an artist,...	9784
216	The Antichrist	1888	http://www.feedbooks.com/book/711.epub	http://covers.feedbooks.net/book/711.jpg?size=large&t=1439160339	Friedrich Nietzsche's "The Antichrist" might be more aptly named "The Antichristian," for it is an unmitigated attack on Christianity that Nietzsche makes within the text instead of an exposition on evil or Satan as the title might suggest. In "Th...	326222
225	The Book of Dragons	1899	http://www.feedbooks.com/book/2924.epub	http://covers.feedbooks.net/book/2924.jpg?size=large&t=1473096639	Eight madcap tales of unpredictable dragons — including one made of ice, another that takes refuge in the General Post Office, and a fire-breathing monster that flies out of an enchanted book and eats an entire soccer team!	97087
34	The Mysterious Affair at Styles	1920	http://www.feedbooks.com/book/2058.epub	http://covers.feedbooks.net/book/2058.jpg?size=large&t=1454838911	In her first published mystery, Agatha Christie introduces readers to the heroic detective, Hercule Poirot. This is a classic murder mystery set in the outskirts of Essex. The victim is the wealthy mistress of Styles Court. The list of suspects is...	16343
40	Siddhartha	1922	http://www.feedbooks.com/book/3374.epub	http://covers.feedbooks.net/book/3374.jpg?size=large&t=1468714229	Siddhartha is an allegorical novel by Hermann Hesse which deals with the spiritual journey of an Indian boy called Siddhartha during the time of the Buddha.\nThe book, Hesse's ninth novel, was written in German, in a simple, yet powerful and lyric...	52036
58	An Inquiry into the Nature and Causes of the Wealth of Nations	1776	http://www.feedbooks.com/book/210.epub	http://covers.feedbooks.net/book/210.jpg?size=large&t=1473091970	Adam Smith's masterpiece, first published in 1776, is the foundation of modern economic thought and remains the single most important account of the rise of, and the principles behind, modern capitalism. Written in clear and incisive prose, The We...	1102506
59	The Adventures of Huckleberry Finn	1885	http://www.feedbooks.com/book/71.epub	http://covers.feedbooks.net/book/71.jpg?size=large&t=1425660111	Adventures of Huckleberry Finn (often shortened to Huck Finn) is a novel written by American humorist Mark Twain. It is commonly used and accounted as one of the first Great American Novels. It is also one of the first major American novels writte...	2956
78	The Merchant of Venice	1598	http://www.feedbooks.com/book/2989.epub	http://covers.feedbooks.net/book/2989.jpg?size=large&t=1425660772	The Merchant of Venice is a play by William Shakespeare, believed to have been written between 1596 and 1598. Although classified as a comedy in the First Folio, and while it shares certain aspects with Shakespeare's other romantic comedies, the p...	24128
103	The Murders in the Rue Morgue	1841	http://www.feedbooks.com/book/795.epub	http://covers.feedbooks.net/book/795.jpg?size=large&t=1439144867	"The Murders in the Rue Morgue" is a short story by Edgar Allan Poe published in Graham's Magazine in 1841. It has been claimed as the first detective story; Poe referred to it as one of his "tales of ratiocination". Similar works predate Poe's st...	3301759
117	Metropolis	1927	http://www.feedbooks.com/book/1123.epub	http://covers.feedbooks.net/book/1123.jpg?size=large&t=1451456033	This is Metropolis, the novel that the film's screenwriter -- Thea von Harbou, who was director Fritz Lang's wife, and a collaborator in the creation of the film -- this is the novel that Harbou wrote from her own notes. It contains bits of the st...	1043987
140	The Jungle Book	1894	http://www.feedbooks.com/book/162.epub	http://covers.feedbooks.net/book/162.jpg?size=large&t=1427197970	The Jungle Book (1894) is a collection of stories written by Rudyard Kipling.The tales in the book (and also those in The Second Jungle Book which followed in 1895, and which includes five further stories about Mowgli) are fables, using animals in...	77270
167	The Lost World	1912	http://www.feedbooks.com/book/67.epub	http://covers.feedbooks.net/book/67.jpg?size=large&t=1473243534	The Lost World is a novel released in 1912 by Arthur Conan Doyle concerning an expedition to a plateau in South America where prehistoric animals (dinosaurs and other extinct creatures) still survive. The character of Professor Challenger was intr...	10155
207	Antony and Cleopatra	1623	http://www.feedbooks.com/book/2943.epub	http://covers.feedbooks.net/book/2943.jpg?size=large&t=1425660765	Antony and Cleopatra is a tragedy by William Shakespeare. It was first printed in the First Folio of 1623.\nThe plot is based on Thomas North's translation of Plutarch's Life of Markus Antonius and follows the relationship between Cleopatra and Ma...	104837
210	From the Earth to the Moon	1865	http://www.feedbooks.com/book/476.epub	http://covers.feedbooks.net/book/476.jpg?size=large&t=1450148150	One of the earliest science fantasy stories ever written, From the Earth to the Moon follows three wealthy members of a post-Civil War gun club who design and build an enormous columbiad -- and ride a spaceship fired from it all the way to the moon!	32827
211	Candide	1759	http://www.feedbooks.com/book/709.epub	http://covers.feedbooks.net/book/709.jpg?size=large&t=1439166315	Candide, ou l'Optimisme (1759) is a French satire by the Enlightenment philosopher Voltaire, English translations of which have been titled Candide: Or, All for the Best (1759); Candide: Or, The Optimist (1762); and Candide: Or, Optimism (1947). T...	19380
212	The Code of Hammurabi	-1790	http://www.feedbooks.com/book/4239.epub	http://covers.feedbooks.net/book/4239.jpg?size=large&t=1425661031	The Code of Hammurabi (Codex Hammurabi) is a well-preserved ancient law code, created ca. 1790 BC (middle chronology) in ancient Babylon. It was enacted by the sixth Babylonian king, Hammurabi. One nearly complete example of the Code survives toda...	7415260
213	The Purloined Letter	1844	http://www.feedbooks.com/book/805.epub	http://covers.feedbooks.net/book/805.jpg?size=large&t=1473094933	"The Purloined Letter" is a short story by American author Edgar Allan Poe. It is the third of his three detective stories featuring the fictional C. Auguste Dupin, the other two being "The Murders in the Rue Morgue" and "The Mystery of Marie Rogê...	278854
246	A Princess of Mars	1912	http://www.feedbooks.com/book/80.epub	http://covers.feedbooks.net/book/80.jpg?size=large&t=1463373664	A Princess of Mars is an Edgar Rice Burroughs science fiction novel, the first of his famous Barsoom series. It is also Burroughs' first novel, predating his Tarzan stories. He wrote it between July and September 28, 1911, going through four worki...	40395
247	The Underground City	1877	http://www.feedbooks.com/book/4395.epub	http://covers.feedbooks.net/book/4395.jpg?size=large&t=1475954282	A novel about the fortunes of a mining community called Aberfoyle which is near Stirling, Scotland. Miner James Starr, after receiving a letter from an old friend, leaves for the Aberfoyle mine. Although believed to be mined out a decade earlier, ...	32824
248	Roughing It	1872	http://www.feedbooks.com/book/4307.epub	http://covers.feedbooks.net/book/4307.jpg?size=large&t=1474026781	Roughing It follows the travels of young Mark Twain through the Wild West during the years 1861–1867. After a brief stint as a Confederate cavalry militiaman, he joined his brother Orion Clemens, who had been appointed Secretary of the Nevada Terr...	38747
1	Alice's Adventures in Wonderland	1897	http://www.feedbooks.com/book/22.epub	http://covers.feedbooks.net/book/22.jpg?size=large&t=1457972708	Alice's Adventures in Wonderland (1865) is a novel written by English author Charles Lutwidge Dodgson, better known under the pseudonym Lewis Carroll. It tells the story of a girl named Alice who falls down a rabbit-hole into a fantasy world popul...	13023
3	The Adventures of Sherlock Holmes	1892	http://www.feedbooks.com/book/1421.epub	http://covers.feedbooks.net/book/1421.jpg?size=large&t=1472223989	The Adventures of Sherlock Holmes is a collection of twelve stories by Sir Arthur Conan Doyle, featuring his famous detective and illustrated by Sidney Paget.\nThese are the first of the Sherlock Holmes short stories, originally published as singl...	3590
7	Dracula	1897	http://www.feedbooks.com/book/88.epub	http://covers.feedbooks.net/book/88.jpg?size=large&t=1439157381	Dracula is an 1897 novel by Irish author Bram Stoker, featuring as its primary antagonist the vampire Count Dracula.\nDracula has been attributed to many literary genres including vampire literature, horror fiction, the gothic novel and invasion l...	17245
13	Tales of Space and Time	1900	http://www.feedbooks.com/book/3469.epub	http://covers.feedbooks.net/book/3469.jpg?size=large&t=1473095990	A collection of short stories: "The Crystal Egg", "The Star", "A Story of the Stone Age", "A Story of the Days to Come" & "The Man who could Work Miracles"	3497718
20	Heart of Darkness	1902	http://www.feedbooks.com/book/15.epub	http://covers.feedbooks.net/book/15.jpg?size=large&t=1437534779	Heart of Darkness is a novella written by Polish-born writer Joseph Conrad (born Józef Teodor Konrad Korzeniowski). Before its 1902 publication, it appeared as a three-part series (1899) in Blackwood's Magazine. It is widely regarded as a signific...	4900
21	Frankenstein	1818	http://www.feedbooks.com/book/91.epub	http://covers.feedbooks.net/book/91.jpg?size=large&t=1439162270	Frankenstein; or, The Modern Prometheus, generally known as Frankenstein, is a novel written by the British author Mary Shelley. The title of the novel refers to a scientist, Victor Frankenstein, who learns how to create life and creates a being i...	18490
118	The Complete Aristotle	-322	http://creativecommons.org/licenses/by-nc-sa/3.0/	http://www.feedbooks.com/book/4960.pdf	Aristotle (384–322 BCE) was a Greek philosopher and student of Plato who stunningly changed the course of Western philosophy. He has gone down in history as one of the greatest philosophers of all time. Cicero, the Roman statesman and philosopher,...	5068121
161	The Wind in the Willows	1908	http://www.feedbooks.com/book/3645.epub	http://covers.feedbooks.net/book/3645.jpg?size=large&t=1425660896	The Wind in the Willows is a classic of children's literature by Kenneth Grahame, first published in 1908. Alternately slow moving and fast paced, it focuses on four anthropomorphised animal characters in a pastoral version of England. The novel i...	5659
223	The Red Fairy Book	1890	http://www.feedbooks.com/book/4040.epub	http://covers.feedbooks.net/book/4040.jpg?size=large&t=1458743551	Andrew Lang's Fairy Books or Andrew Lang's "Coloured" Fairy Books constitute a twelve-book series of fairy tale collections. Although Andrew Lang did not collect the stories himself from the oral tradition, the extent of his sources, who had colle...	774544
244	Thoughts are Things	1889	http://www.feedbooks.com/book/5011.epub	http://covers.feedbooks.net/book/5011.jpg?size=large&t=1473957071	Prentice Mulford was instrumental in the founding of the popular philosophy, New Thought, along with other notable writers including Ralph Waldo Emerson. Mulford's book, Thoughts are Things served as a guide to this new belief system and is still ...	595332
245	The Yellow Wallpaper	1892	http://www.feedbooks.com/book/3609.epub	http://covers.feedbooks.net/book/3609.jpg?size=large&t=1435714823	"The Yellow Wallpaper" is a 6,000-word short story by American writer Charlotte Perkins Gilman, first published in January 1892 in New England Magazine. It is regarded as an important early work of American feminist literature, illustrating attitu...	99300
\.


--
-- Name: books_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('books_book_id_seq', 248, true);


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY genres (genre_id, genre) FROM stdin;
1	Fiction
2	Fantasy
3	Romance
4	Mystery & Detective
5	Short Stories
6	Drama
7	Literary
8	Non-Fiction
9	Human Science
10	Philosophy
11	Psychology
12	Human Sexuality
13	Horror
14	Science Fiction
15	Time travel
16	Action & Adventure
17	Poetry
18	Biography & autobiography
19	True story
20	Juvenile & Young Adult
21	War & Military
22	Historical
23	Thrillers
24	Eastern
25	Science and Technics
26	Science
27	Erotica
28	Fairy Tales, Folk Tales & Mythology
29	Tales
30	Collections by a Single Author
31	Gothic
32	Europe
33	Social science
34	Political science
35	Humorous
36	Modern (<1799)
37	Comedy
38	Language arts & disciplines
39	Public Speaking
40	Religion
41	Literary essay
42	Feminism & Feminist Theory
43	History
44	History by country
45	United States
46	Other
47	Military
48	Dystopia and uchronia
49	Occult & Supernatural
50	Supernatural Creatures
51	Ghost
52	LGBT
53	Lesbian
54	Biographical
55	Travel
56	Westerns
57	Humor
58	Science & Technology
59	Astronomy
60	Tragedy
61	Business & economics
62	Free Enterprise
63	Sociology
64	XIXth century
\.


--
-- Name: genres_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('genres_genre_id_seq', 64, true);


--
-- Data for Name: user_books; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY user_books (user_book_id, user_id, book_id, book_read, rating, updated_at) FROM stdin;
92	1030	174	t	4	2016-03-30 00:00:00
93	1030	31	t	4	2015-07-28 00:00:00
94	1030	33	t	5	2015-05-15 00:00:00
95	1030	221	t	5	2013-12-27 00:00:00
96	1030	228	t	5	2013-12-27 00:00:00
97	1030	23	t	5	2010-07-13 00:00:00
98	1030	63	t	5	2010-07-13 00:00:00
99	1030	24	t	5	2010-07-13 00:00:00
100	1030	2	t	5	2010-07-13 00:00:00
101	1030	45	t	5	2009-12-20 00:00:00
102	1031	24	t	5	2015-11-08 00:00:00
103	1031	5	t	3	2015-11-08 00:00:00
104	1032	133	t	2	2016-05-29 00:00:00
105	1032	48	t	3	2015-12-13 00:00:00
106	1032	93	t	2	2012-09-29 00:00:00
107	1032	26	t	3	2012-08-10 00:00:00
108	1034	211	t	3	2016-06-30 00:00:00
109	1034	159	t	5	2016-06-30 00:00:00
110	1034	86	t	2	2016-06-30 00:00:00
111	1034	41	t	5	2016-06-29 00:00:00
112	1034	52	t	4	2016-06-29 00:00:00
113	1034	245	t	4	2016-06-27 00:00:00
114	1034	143	t	2	2016-06-27 00:00:00
115	1034	29	t	2	2016-06-21 00:00:00
116	1034	157	t	2	2016-06-21 00:00:00
117	1034	171	t	5	2016-06-21 00:00:00
118	1034	47	t	5	2016-06-21 00:00:00
119	1034	92	t	2	2016-06-21 00:00:00
120	1034	146	t	4	2016-06-21 00:00:00
121	1034	40	t	5	2016-06-21 00:00:00
122	1034	119	t	2	2016-06-21 00:00:00
123	1034	189	t	1	2016-06-21 00:00:00
124	1034	54	t	4	2016-06-21 00:00:00
125	1034	74	t	5	2016-06-21 00:00:00
126	1034	150	t	5	2016-06-21 00:00:00
127	1034	11	t	4	2016-06-21 00:00:00
128	1034	88	t	1	2016-06-21 00:00:00
129	1034	20	t	1	2016-06-21 00:00:00
130	1034	14	t	3	2016-06-21 00:00:00
131	1034	91	t	4	2016-06-21 00:00:00
132	1034	9	t	2	2016-06-21 00:00:00
133	1034	121	t	5	2016-06-21 00:00:00
134	1034	7	t	3	2016-06-21 00:00:00
135	1034	80	t	1	2016-06-21 00:00:00
136	1034	130	t	4	2016-06-21 00:00:00
137	1034	21	t	2	2016-06-21 00:00:00
138	1034	33	t	5	2016-06-21 00:00:00
139	1034	24	t	3	2016-06-21 00:00:00
140	1034	4	t	3	2016-06-21 00:00:00
141	1034	78	t	2	2016-06-21 00:00:00
142	1034	95	t	3	2016-06-21 00:00:00
143	1034	233	t	3	2016-06-21 00:00:00
144	1034	45	t	5	2016-06-21 00:00:00
145	1034	16	t	4	2016-06-21 00:00:00
146	1034	5	t	5	2016-06-21 00:00:00
147	1034	59	t	1	2016-06-21 00:00:00
148	1034	174	t	4	2016-06-21 00:00:00
149	1034	2	t	5	2016-06-21 00:00:00
150	1035	37	t	3	2016-01-22 00:00:00
151	1035	23	t	4	2016-01-20 00:00:00
152	1035	221	t	2	2012-07-22 00:00:00
153	1035	187	t	4	2011-10-11 00:00:00
154	1037	5	t	4	2011-09-07 00:00:00
155	1039	3	t	5	2014-09-27 00:00:00
156	1039	14	t	4	2014-09-27 00:00:00
157	1039	188	t	5	2014-09-27 00:00:00
158	1039	4	t	5	2014-09-27 00:00:00
159	1039	5	t	5	2013-08-27 00:00:00
160	1040	102	t	4	2016-10-13 00:00:00
161	1040	5	t	2	2016-10-04 00:00:00
162	1040	111	t	2	2016-10-13 00:00:00
163	1040	94	t	2	2016-10-12 00:00:00
164	1040	45	t	4	2016-07-08 00:00:00
165	1040	20	t	4	2016-06-10 00:00:00
166	1040	145	t	3	2016-04-29 00:00:00
167	1040	247	t	3	2016-04-29 00:00:00
168	1040	186	t	4	2016-05-31 00:00:00
169	1040	206	t	4	2015-11-11 00:00:00
170	1040	167	t	3	2015-11-11 00:00:00
171	1040	11	t	3	2016-05-03 00:00:00
172	1040	15	t	3	2016-09-15 00:00:00
173	1040	65	t	2	2016-04-30 00:00:00
174	1040	161	t	4	2016-07-24 00:00:00
175	1040	55	t	4	2016-09-15 00:00:00
176	1040	119	t	2	2015-11-17 00:00:00
177	1040	175	t	4	2016-07-24 00:00:00
178	1040	46	t	2	2016-05-31 00:00:00
179	1040	98	t	3	2016-04-29 00:00:00
180	1040	178	t	3	2016-09-15 00:00:00
181	1040	210	t	3	2016-04-29 00:00:00
182	1040	199	t	3	2016-04-29 00:00:00
183	1040	180	t	3	2016-05-31 00:00:00
184	1040	21	t	4	2016-07-14 00:00:00
185	1040	66	t	3	2016-09-15 00:00:00
186	1040	211	t	3	2015-11-10 00:00:00
187	1040	203	t	2	2016-04-29 00:00:00
188	1040	37	t	3	2016-05-31 00:00:00
189	1040	146	t	4	2015-11-17 00:00:00
190	1040	108	t	3	2016-09-15 00:00:00
191	1040	26	t	4	2016-07-14 00:00:00
192	1040	10	t	2	2016-05-31 00:00:00
193	1040	246	t	1	2016-05-31 00:00:00
194	1040	117	t	3	2016-05-31 00:00:00
195	1040	42	t	3	2015-11-10 00:00:00
196	1040	93	t	2	2016-06-12 00:00:00
197	1040	1	t	2	2016-06-12 00:00:00
198	1041	1	t	5	2016-06-09 00:00:00
199	1041	44	t	4	2015-11-02 00:00:00
200	1041	25	t	5	2015-11-02 00:00:00
201	1041	40	t	3	2015-11-14 00:00:00
202	1041	61	t	4	2015-11-14 00:00:00
203	1041	174	t	4	2015-11-14 00:00:00
204	1041	144	t	3	2015-11-02 00:00:00
205	1041	111	t	5	2015-11-02 00:00:00
206	1041	64	t	5	2015-11-02 00:00:00
207	1041	78	t	4	2015-11-02 00:00:00
208	1041	165	t	5	2016-01-12 00:00:00
209	1041	94	t	4	2015-11-02 00:00:00
210	1041	4	t	4	2015-11-02 00:00:00
211	1041	14	t	5	2015-11-02 00:00:00
212	1041	5	t	3	2015-11-02 00:00:00
213	1041	16	t	4	2015-11-02 00:00:00
214	1041	88	t	3	2015-11-02 00:00:00
215	1042	171	t	4	2016-01-21 00:00:00
216	1042	239	t	2	2015-11-04 00:00:00
217	1042	90	t	3	2015-09-11 00:00:00
218	1042	104	t	3	2016-10-19 00:00:00
219	1042	134	t	3	2015-07-10 00:00:00
220	1042	68	t	3	2014-09-22 00:00:00
221	1042	221	t	4	2014-09-04 00:00:00
222	1043	46	t	3	2013-12-16 00:00:00
223	1043	54	t	2	2013-05-30 00:00:00
224	1043	65	t	4	2013-05-15 00:00:00
225	1043	67	t	2	2013-05-15 00:00:00
226	1043	27	t	3	2013-05-15 00:00:00
227	1043	111	t	2	2013-04-23 00:00:00
228	1043	29	t	1	2013-04-04 00:00:00
229	1043	245	t	1	2013-03-10 00:00:00
230	1043	199	t	5	2013-03-08 00:00:00
231	1043	239	t	1	2013-03-06 00:00:00
232	1043	44	t	2	2013-02-28 00:00:00
233	1043	61	t	3	2013-03-10 00:00:00
234	1043	9	t	1	2013-02-27 00:00:00
235	1043	88	t	3	2013-02-10 00:00:00
236	1043	73	t	5	2012-12-30 00:00:00
237	1043	140	t	3	2012-10-17 00:00:00
238	1043	80	t	2	2013-06-23 00:00:00
239	1043	14	t	5	2013-12-07 00:00:00
240	1043	203	t	1	2012-10-13 00:00:00
241	1043	84	t	5	2012-06-05 00:00:00
242	1043	3	t	5	2012-06-05 00:00:00
243	1043	20	t	5	2012-06-05 00:00:00
244	1043	38	t	3	2012-06-05 00:00:00
245	1043	31	t	1	2012-06-05 00:00:00
246	1043	33	t	3	2012-06-05 00:00:00
247	1043	45	t	3	2013-06-23 00:00:00
248	1044	43	t	4	2016-04-23 00:00:00
249	1044	168	t	4	2016-05-04 00:00:00
250	1044	107	t	4	2016-05-04 00:00:00
251	1044	21	t	5	2016-05-04 00:00:00
252	1044	145	t	4	2016-05-04 00:00:00
253	1044	133	t	4	2016-05-04 00:00:00
254	1044	11	t	4	2016-05-06 00:00:00
255	1044	64	t	4	2015-03-11 00:00:00
256	1045	61	t	5	2016-08-08 00:00:00
257	1045	99	t	4	2016-07-31 00:00:00
258	1045	1	t	5	2016-06-20 00:00:00
259	1045	54	t	4	2016-09-28 00:00:00
260	1045	46	t	5	2016-03-03 00:00:00
261	1045	70	t	5	2016-03-03 00:00:00
262	1045	165	t	5	2015-03-24 00:00:00
263	1045	195	t	4	2015-03-30 00:00:00
264	1048	149	t	2	2016-10-22 00:00:00
265	1048	55	t	3	2016-10-22 00:00:00
266	1048	16	t	3	2015-05-16 00:00:00
267	1048	130	t	4	2015-06-02 00:00:00
268	1048	159	t	3	2015-03-05 00:00:00
269	1048	21	t	2	2016-03-26 00:00:00
270	1048	2	t	1	2014-11-18 00:00:00
271	1048	196	t	4	2014-11-05 00:00:00
272	1048	70	t	5	2016-01-28 00:00:00
273	1048	29	t	4	2014-06-30 00:00:00
274	1048	91	t	5	2015-03-17 00:00:00
275	1048	134	t	4	2014-06-30 00:00:00
276	1048	44	t	3	2015-01-21 00:00:00
277	1048	165	t	4	2014-11-18 00:00:00
278	1049	26	t	5	2016-02-19 00:00:00
279	1049	7	t	5	2016-02-19 00:00:00
280	1052	93	t	4	2016-10-29 00:00:00
281	1052	1	t	5	2016-10-29 00:00:00
282	1052	66	t	3	2016-09-10 00:00:00
283	1052	145	t	5	2016-06-15 00:00:00
284	1052	40	t	5	2016-01-22 00:00:00
285	1052	64	t	5	2015-03-05 00:00:00
286	1052	21	t	3	2015-03-05 00:00:00
287	1052	4	t	4	2016-05-08 00:00:00
288	1052	59	t	4	2015-02-23 00:00:00
289	1052	5	t	3	2016-05-12 00:00:00
290	1052	2	t	3	2015-03-05 00:00:00
291	1053	189	t	3	2016-08-20 00:00:00
292	1053	89	t	4	2016-08-17 00:00:00
293	1053	11	t	4	2016-08-09 00:00:00
294	1053	62	t	5	2016-08-19 00:00:00
295	1053	23	t	3	2016-08-30 00:00:00
296	1053	241	t	3	2016-11-07 00:00:00
297	1053	5	t	5	2016-08-01 00:00:00
298	1053	211	t	2	2016-07-14 00:00:00
299	1053	10	t	3	2016-07-12 00:00:00
300	1053	52	t	5	2016-08-08 00:00:00
301	1053	130	t	4	2016-06-26 00:00:00
302	1053	47	t	5	2015-12-26 00:00:00
303	1053	188	t	4	2015-12-06 00:00:00
304	1053	16	t	3	2016-07-03 00:00:00
305	1053	110	t	2	2016-04-03 00:00:00
306	1053	120	t	4	2015-08-04 00:00:00
307	1053	61	t	4	2015-08-02 00:00:00
308	1053	227	t	5	2015-08-02 00:00:00
309	1055	91	t	3	2016-02-09 00:00:00
310	1055	175	t	4	2015-12-09 00:00:00
311	1055	7	t	2	2016-09-10 00:00:00
312	1055	5	t	5	2015-09-26 00:00:00
313	1056	106	t	4	2016-07-10 00:00:00
314	1056	93	t	5	2016-03-28 00:00:00
315	1056	31	t	4	2016-11-08 00:00:00
316	1056	126	t	5	2016-01-30 00:00:00
317	1058	16	t	4	2016-04-17 00:00:00
318	1059	111	t	5	2016-09-11 00:00:00
319	1059	21	t	5	2016-08-21 00:00:00
320	1059	16	t	5	2016-06-17 00:00:00
321	1059	5	t	3	2016-06-14 00:00:00
322	1060	191	t	4	2016-10-27 00:00:00
323	1060	63	t	4	2016-09-16 00:00:00
324	1060	148	t	3	2016-08-02 00:00:00
325	1061	171	t	4	2016-11-10 00:00:00
326	1061	47	t	4	2016-11-10 00:00:00
327	1061	46	t	5	2016-11-10 00:00:00
328	1061	221	t	3	2016-10-01 00:00:00
329	1061	65	t	4	2016-08-29 00:00:00
330	1061	75	t	4	2016-08-29 00:00:00
331	1061	228	t	4	2016-10-01 00:00:00
332	1061	63	t	5	2016-09-21 00:00:00
333	1061	189	t	3	2016-08-10 00:00:00
334	1061	61	t	4	2016-08-10 00:00:00
335	1061	38	t	4	2016-08-10 00:00:00
336	1061	5	t	2	2016-08-10 00:00:00
337	1061	14	t	4	2016-08-04 00:00:00
338	1061	67	t	4	2016-08-04 00:00:00
339	1061	196	t	3	2016-07-30 00:00:00
340	1061	183	t	4	2016-07-29 00:00:00
341	1061	73	t	3	2016-07-29 00:00:00
342	1061	9	t	4	2016-07-28 00:00:00
343	1061	93	t	5	2016-07-28 00:00:00
344	1061	2	t	4	2016-07-26 00:00:00
345	1061	100	t	4	2016-07-20 00:00:00
346	1061	55	t	4	2016-07-20 00:00:00
347	1061	48	t	5	2016-07-20 00:00:00
348	1061	10	t	4	2016-07-20 00:00:00
349	1061	94	t	4	2016-07-20 00:00:00
350	1061	27	t	4	2016-07-20 00:00:00
351	1061	66	t	4	2016-07-20 00:00:00
352	1061	4	t	4	2016-07-20 00:00:00
353	1061	142	t	4	2016-07-20 00:00:00
354	1061	165	t	4	2016-07-19 00:00:00
355	1061	91	t	3	2016-07-19 00:00:00
356	1061	126	t	4	2016-07-19 00:00:00
357	1061	168	t	4	2016-07-19 00:00:00
358	1061	133	t	5	2016-07-21 00:00:00
359	1061	107	t	5	2016-07-19 00:00:00
360	1061	161	t	4	2016-07-27 00:00:00
361	1061	44	t	4	2016-07-19 00:00:00
362	1061	45	t	3	2016-07-19 00:00:00
363	1061	84	t	4	2016-07-19 00:00:00
364	1061	108	t	4	2016-07-19 00:00:00
365	1061	1	t	5	2016-07-19 00:00:00
366	1061	185	t	3	2016-07-19 00:00:00
367	1061	175	t	5	2016-07-19 00:00:00
368	1061	239	t	4	2016-07-19 00:00:00
369	1061	7	t	5	2016-07-19 00:00:00
370	1061	11	t	5	2016-07-19 00:00:00
371	1061	21	t	5	2016-07-30 00:00:00
372	1061	86	t	4	2016-07-19 00:00:00
373	1061	104	t	5	2016-07-30 00:00:00
374	1061	188	t	5	2016-07-19 00:00:00
375	1061	23	t	4	2016-10-01 00:00:00
376	1063	196	t	4	2016-10-30 00:00:00
377	1064	119	t	5	2016-11-10 00:00:00
378	1064	201	t	5	2016-11-10 00:00:00
379	1064	91	t	5	2016-10-30 00:00:00
380	1064	84	t	5	2016-10-27 00:00:00
381	1064	21	t	5	2016-10-27 00:00:00
382	1065	29	t	2	2016-11-07 00:00:00
383	1065	61	t	2	2016-11-07 00:00:00
384	1065	40	t	4	2016-11-07 00:00:00
385	1065	16	t	3	2016-11-07 00:00:00
386	1065	46	t	4	2016-11-07 00:00:00
387	1065	2	t	4	2016-11-07 00:00:00
388	1065	5	t	4	2016-11-05 00:00:00
389	1065	31	t	5	2016-11-05 00:00:00
390	1065	21	t	3	2016-11-05 00:00:00
391	1065	130	t	1	2016-11-05 00:00:00
392	1067	104	t	3	2016-09-11 00:00:00
393	1067	78	t	5	2016-08-26 00:00:00
394	1067	5	t	3	2016-05-27 00:00:00
395	1067	187	t	5	2016-06-07 00:00:00
396	1068	140	t	5	2016-06-25 00:00:00
397	1068	104	t	4	2016-06-25 00:00:00
398	1068	149	t	4	2016-05-27 00:00:00
399	1068	15	t	4	2016-05-17 00:00:00
400	1068	128	t	2	2016-06-03 00:00:00
401	1068	61	t	4	2016-04-23 00:00:00
402	1068	122	t	5	2016-04-10 00:00:00
403	1068	126	t	5	2014-11-05 00:00:00
404	1068	46	t	4	2014-02-05 00:00:00
405	1070	121	t	2	2014-05-20 00:00:00
406	1070	124	t	2	2013-06-17 00:00:00
407	1070	110	t	2	2013-01-09 00:00:00
408	1070	48	t	3	2012-12-12 00:00:00
409	1070	27	t	4	2012-11-22 00:00:00
410	1070	94	t	3	2012-11-22 00:00:00
411	1070	63	t	3	2012-11-22 00:00:00
412	1070	16	t	5	2012-11-21 00:00:00
413	1070	71	t	5	2011-06-27 00:00:00
414	1070	21	t	3	2012-10-07 00:00:00
415	1070	59	t	4	2011-06-27 00:00:00
416	1071	34	t	4	2016-11-12 00:00:00
417	1071	120	t	4	2016-11-11 00:00:00
418	1071	111	t	4	2016-10-31 00:00:00
419	1071	133	t	4	2016-10-31 00:00:00
420	1071	66	t	3	2016-10-31 00:00:00
421	1071	107	t	4	2016-10-11 00:00:00
422	1071	38	t	5	2016-10-25 00:00:00
423	1071	45	t	2	2016-10-25 00:00:00
424	1071	16	t	5	2016-11-12 00:00:00
425	1071	2	t	4	2016-10-25 00:00:00
426	1071	140	t	3	2016-10-31 00:00:00
427	1071	28	t	4	2016-10-21 00:00:00
428	1071	1	t	3	2016-10-11 00:00:00
429	1071	75	t	4	2016-10-17 00:00:00
430	1071	7	t	4	2016-10-14 00:00:00
431	1071	157	t	4	2016-10-11 00:00:00
432	1071	150	t	3	2016-10-11 00:00:00
433	1071	110	t	4	2016-10-31 00:00:00
434	1071	18	t	3	2016-10-11 00:00:00
435	1071	15	t	4	2016-10-11 00:00:00
436	1071	185	t	3	2016-10-11 00:00:00
437	1071	84	t	4	2016-10-11 00:00:00
438	1071	228	t	3	2016-10-31 00:00:00
439	1071	91	t	3	2016-10-11 00:00:00
440	1071	43	t	5	2016-10-31 00:00:00
441	1071	64	t	5	2016-10-17 00:00:00
442	1071	142	t	4	2016-10-11 00:00:00
443	1071	26	t	4	2016-10-11 00:00:00
444	1071	149	t	5	2016-10-11 00:00:00
445	1071	108	t	3	2016-10-11 00:00:00
446	1071	88	t	4	2016-10-11 00:00:00
447	1071	46	t	5	2016-11-12 00:00:00
448	1071	21	t	3	2016-11-04 00:00:00
449	1072	5	t	5	2016-08-28 00:00:00
450	1072	19	t	2	2015-02-07 00:00:00
451	1072	48	t	4	2015-01-10 00:00:00
452	1072	189	t	3	2015-01-10 00:00:00
453	1072	26	t	3	2015-01-10 00:00:00
454	1072	34	t	4	2015-01-10 00:00:00
455	1073	191	t	4	2016-11-03 00:00:00
456	1073	160	t	3	2016-09-28 00:00:00
457	1073	63	t	5	2016-09-28 00:00:00
458	1073	148	t	4	2016-09-28 00:00:00
459	1073	24	t	3	2016-09-28 00:00:00
460	1073	171	t	4	2016-09-28 00:00:00
461	1073	47	t	4	2016-09-28 00:00:00
462	1073	121	t	4	2016-09-28 00:00:00
463	1073	38	t	5	2016-09-28 00:00:00
464	1073	11	t	4	2016-09-28 00:00:00
465	1073	211	t	4	2016-09-28 00:00:00
466	1073	5	t	5	2016-09-28 00:00:00
467	1073	16	t	4	2016-09-28 00:00:00
468	1073	2	t	4	2016-09-28 00:00:00
469	1075	201	t	5	2016-01-14 00:00:00
470	1075	214	t	5	2015-11-26 00:00:00
471	1076	29	t	2	2015-11-01 00:00:00
472	1076	88	t	3	2015-11-01 00:00:00
473	1076	4	t	4	2014-09-02 00:00:00
474	1076	143	t	4	2014-08-11 00:00:00
475	1076	63	t	3	2013-11-25 00:00:00
476	1076	23	t	4	2013-11-25 00:00:00
477	1076	48	t	4	2013-08-05 00:00:00
478	1076	40	t	3	2013-06-09 00:00:00
479	1076	46	t	4	2016-03-21 00:00:00
480	1076	211	t	2	2012-12-30 00:00:00
481	1076	5	t	3	2014-07-09 00:00:00
482	1076	86	t	3	2014-07-09 00:00:00
483	1076	59	t	3	2014-07-09 00:00:00
484	1076	24	t	3	2014-07-09 00:00:00
485	1076	21	t	2	2014-07-09 00:00:00
486	1076	45	t	2	2014-07-09 00:00:00
487	1076	16	t	3	2014-07-09 00:00:00
488	1076	28	t	4	2014-07-09 00:00:00
489	1076	171	t	1	2014-07-09 00:00:00
490	1076	121	t	3	2014-07-09 00:00:00
491	1076	47	t	2	2014-07-09 00:00:00
492	1076	33	t	2	2014-07-09 00:00:00
493	1076	2	t	5	2014-07-09 00:00:00
494	1077	211	t	4	2016-10-31 00:00:00
495	1077	148	t	2	2016-10-25 00:00:00
496	1077	92	t	3	2016-10-09 00:00:00
497	1077	108	t	3	2016-09-26 00:00:00
498	1077	20	t	2	2016-09-26 00:00:00
499	1077	23	t	3	2016-09-26 00:00:00
500	1077	14	t	4	2016-09-26 00:00:00
501	1077	2	t	3	2016-10-13 00:00:00
502	1077	89	t	5	2016-09-27 00:00:00
503	1077	21	t	4	2013-09-10 00:00:00
504	1077	29	t	3	2016-09-25 00:00:00
505	1077	61	t	4	2016-09-25 00:00:00
506	1077	9	t	4	2016-09-25 00:00:00
507	1077	4	t	3	2016-09-25 00:00:00
508	1077	5	t	2	2016-09-25 00:00:00
509	1077	119	t	3	2016-07-08 00:00:00
510	1078	104	t	3	2016-09-08 00:00:00
511	1078	239	t	4	2016-08-24 00:00:00
512	1078	78	t	4	2016-08-13 00:00:00
513	1078	34	t	3	2016-05-02 00:00:00
514	1078	168	t	4	2016-04-27 00:00:00
515	1078	61	t	5	2016-04-13 00:00:00
516	1078	226	t	4	2016-07-14 00:00:00
517	1078	195	t	3	2016-08-06 00:00:00
518	1078	54	t	3	2016-08-06 00:00:00
519	1078	103	t	4	2016-08-08 00:00:00
520	1080	41	t	5	2016-06-21 00:00:00
521	1080	2	t	5	2016-08-25 00:00:00
522	1080	171	t	5	2016-10-28 00:00:00
523	1080	121	t	5	2016-11-08 00:00:00
524	1080	120	t	5	2015-06-27 00:00:00
525	1080	61	t	4	2015-06-26 00:00:00
526	1080	1	t	3	2016-02-23 00:00:00
527	1080	33	t	5	2016-10-18 00:00:00
528	1080	47	t	5	2016-10-14 00:00:00
529	1080	4	t	3	2016-02-23 00:00:00
530	1080	5	t	5	2016-04-26 00:00:00
531	1082	119	t	2	2016-10-16 00:00:00
532	1082	67	t	3	2016-09-25 00:00:00
533	1082	143	t	5	2016-09-25 00:00:00
534	1082	4	t	3	2016-09-25 00:00:00
535	1082	14	t	4	2016-09-25 00:00:00
536	1082	34	t	4	2016-09-25 00:00:00
537	1082	44	t	3	2016-09-25 00:00:00
538	1082	23	t	5	2016-09-25 00:00:00
539	1082	188	t	2	2016-09-25 00:00:00
540	1082	21	t	3	2016-09-25 00:00:00
541	1082	5	t	2	2016-09-25 00:00:00
542	1082	16	t	4	2016-09-25 00:00:00
543	1082	126	t	5	2016-09-25 00:00:00
544	1082	7	t	5	2016-09-25 00:00:00
545	1084	16	t	5	2016-08-10 00:00:00
546	1086	41	t	5	2016-03-17 00:00:00
547	1086	228	t	4	2016-01-31 00:00:00
548	1086	63	t	4	2015-10-15 00:00:00
549	1086	223	t	4	2014-12-16 00:00:00
550	1086	43	t	3	2014-01-02 00:00:00
551	1086	38	t	5	2015-01-22 00:00:00
552	1086	174	t	3	2012-07-04 00:00:00
553	1086	16	t	5	2012-03-06 00:00:00
554	1086	158	t	4	2012-02-19 00:00:00
555	1087	88	t	3	2016-08-28 00:00:00
556	1087	37	t	3	2016-10-14 00:00:00
557	1087	228	t	4	2013-07-24 00:00:00
558	1087	165	t	3	2013-05-29 00:00:00
559	1088	243	t	5	2016-06-02 00:00:00
560	1088	61	t	5	2016-05-22 00:00:00
561	1089	195	t	3	2015-08-13 00:00:00
562	1089	196	t	3	2015-07-04 00:00:00
563	1089	20	t	2	2015-03-27 00:00:00
564	1089	38	t	3	2013-08-26 00:00:00
565	1089	46	t	3	2013-08-26 00:00:00
566	1089	62	t	3	2013-08-24 00:00:00
567	1089	14	t	5	2012-12-08 00:00:00
568	1089	4	t	4	2012-12-08 00:00:00
569	1089	9	t	3	2012-12-08 00:00:00
570	1089	188	t	4	2012-12-08 00:00:00
571	1089	67	t	3	2012-09-01 00:00:00
572	1089	31	t	4	2012-09-01 00:00:00
573	1089	130	t	4	2012-08-01 00:00:00
574	1089	21	t	3	2012-08-01 00:00:00
575	1089	7	t	3	2012-08-01 00:00:00
576	1089	165	t	3	2012-08-01 00:00:00
577	1089	29	t	3	2012-08-01 00:00:00
578	1089	74	t	3	2013-01-24 00:00:00
579	1089	227	t	4	2012-05-03 00:00:00
580	1089	121	t	3	2012-05-03 00:00:00
581	1089	185	t	4	2012-04-23 00:00:00
582	1089	179	t	3	2012-04-23 00:00:00
583	1089	160	t	4	2012-04-23 00:00:00
584	1089	28	t	4	2012-04-23 00:00:00
585	1089	174	t	4	2012-04-23 00:00:00
586	1089	44	t	3	2012-04-23 00:00:00
587	1089	47	t	3	2012-04-23 00:00:00
588	1089	33	t	3	2012-04-23 00:00:00
589	1089	45	t	5	2012-04-23 00:00:00
590	1089	24	t	3	2012-04-23 00:00:00
591	1089	16	t	5	2012-07-12 00:00:00
592	1089	5	t	4	2012-04-22 00:00:00
593	1089	2	t	5	2012-04-22 00:00:00
594	1090	15	t	3	2016-10-03 00:00:00
595	1090	186	t	3	2016-10-03 00:00:00
596	1090	4	t	4	2016-10-03 00:00:00
597	1090	78	t	3	2016-10-03 00:00:00
598	1090	200	t	3	2016-09-18 00:00:00
599	1090	66	t	4	2016-07-31 00:00:00
600	1090	103	t	2	2015-06-23 00:00:00
601	1090	108	t	3	2015-03-17 00:00:00
602	1090	196	t	2	2015-09-11 00:00:00
603	1090	168	t	1	2016-05-25 00:00:00
604	1090	47	t	2	2016-01-05 00:00:00
605	1090	203	t	2	2016-04-04 00:00:00
606	1090	61	t	3	2016-05-23 00:00:00
607	1090	128	t	3	2016-07-12 00:00:00
608	1090	19	t	3	2014-01-09 00:00:00
609	1090	211	t	3	2015-09-11 00:00:00
610	1090	239	t	3	2014-04-15 00:00:00
611	1090	104	t	2	2013-10-05 00:00:00
612	1090	214	t	3	2013-09-25 00:00:00
613	1090	11	t	4	2013-09-05 00:00:00
614	1090	145	t	2	2016-01-05 00:00:00
615	1092	38	t	5	2016-09-23 00:00:00
616	1093	112	t	3	2016-06-11 00:00:00
617	1093	154	t	4	2016-03-29 00:00:00
618	1094	16	t	4	2016-10-28 00:00:00
619	1094	67	t	4	2016-07-15 00:00:00
620	1094	33	t	4	2016-05-30 00:00:00
621	1094	120	t	4	2016-07-27 00:00:00
622	1094	47	t	4	2016-04-08 00:00:00
623	1094	2	t	5	2016-03-12 00:00:00
624	1094	46	t	4	2016-04-18 00:00:00
625	1094	5	t	3	2016-03-16 00:00:00
626	1095	46	t	5	2016-08-13 00:00:00
627	1095	16	t	2	2016-08-13 00:00:00
628	1095	5	t	2	2016-08-13 00:00:00
629	1095	2	t	5	2016-08-13 00:00:00
630	1096	191	t	3	2016-11-04 00:00:00
631	1097	10	t	4	2014-07-05 00:00:00
632	1097	243	t	5	2013-05-31 00:00:00
633	1097	189	t	5	2010-09-10 00:00:00
634	1097	108	t	5	2010-08-16 00:00:00
635	1097	130	t	5	2010-07-21 00:00:00
636	1097	45	t	3	2010-05-31 00:00:00
637	1097	70	t	5	2010-05-31 00:00:00
638	1097	211	t	5	2010-05-31 00:00:00
639	1097	9	t	5	2010-05-31 00:00:00
640	1097	61	t	3	2010-05-31 00:00:00
641	1097	2	t	5	2010-05-30 00:00:00
642	1097	38	t	4	2010-05-30 00:00:00
643	1097	4	t	5	2010-07-21 00:00:00
644	1097	5	t	5	2010-05-30 00:00:00
645	1098	88	t	5	2016-11-09 00:00:00
646	1098	191	t	3	2016-11-03 00:00:00
647	1098	14	t	5	2016-09-30 00:00:00
648	1098	7	t	4	2016-10-24 00:00:00
649	1098	63	t	4	2016-09-26 00:00:00
650	1098	104	t	4	2016-09-18 00:00:00
651	1098	46	t	5	2016-11-07 00:00:00
652	1098	78	t	4	2016-09-16 00:00:00
653	1098	107	t	3	2016-08-22 00:00:00
654	1098	103	t	3	2016-09-18 00:00:00
655	1098	2	t	4	2016-08-11 00:00:00
656	1098	188	t	5	2016-06-08 00:00:00
657	1098	168	t	3	2016-06-23 00:00:00
658	1098	23	t	5	2016-08-21 00:00:00
659	1098	110	t	4	2016-01-06 00:00:00
660	1098	5	t	4	2010-08-01 00:00:00
661	1100	7	t	5	2016-10-29 00:00:00
662	1100	38	t	5	2016-06-16 00:00:00
663	1100	100	t	4	2015-09-16 00:00:00
664	1100	55	t	4	2015-08-21 00:00:00
665	1100	207	t	5	2015-07-19 00:00:00
666	1100	2	t	5	2015-07-09 00:00:00
667	1100	168	t	5	2015-06-22 00:00:00
668	1100	120	t	4	2015-06-22 00:00:00
669	1100	5	t	4	2015-06-22 00:00:00
670	1100	21	t	4	2014-11-22 00:00:00
671	1100	71	t	4	2013-01-30 00:00:00
672	1100	27	t	4	2012-10-23 00:00:00
673	1100	195	t	4	2012-08-31 00:00:00
674	1100	126	t	5	2012-08-30 00:00:00
675	1100	149	t	4	2012-08-24 00:00:00
676	1100	107	t	4	2012-08-24 00:00:00
677	1100	40	t	3	2012-08-24 00:00:00
678	1100	127	t	5	2012-08-24 00:00:00
679	1100	95	t	4	2012-08-21 00:00:00
680	1100	128	t	5	2012-08-21 00:00:00
681	1100	62	t	4	2012-08-21 00:00:00
682	1100	130	t	4	2012-08-21 00:00:00
683	1100	9	t	5	2012-08-21 00:00:00
684	1100	174	t	5	2012-08-21 00:00:00
685	1100	144	t	3	2012-08-21 00:00:00
686	1100	46	t	5	2016-10-29 00:00:00
687	1100	28	t	5	2016-10-29 00:00:00
688	1100	165	t	5	2012-08-21 00:00:00
689	1100	45	t	4	2012-08-21 00:00:00
690	1100	70	t	5	2012-08-21 00:00:00
691	1100	61	t	5	2012-08-21 00:00:00
692	1100	47	t	3	2013-05-10 00:00:00
693	1100	33	t	5	2012-08-21 00:00:00
694	1101	44	t	4	2016-02-28 00:00:00
695	1102	45	t	5	2016-06-13 00:00:00
696	1102	33	t	2	2015-11-27 00:00:00
697	1102	245	t	4	2016-09-04 00:00:00
698	1102	24	t	3	2015-05-29 00:00:00
699	1102	90	t	4	2015-02-19 00:00:00
700	1102	95	t	2	2015-06-18 00:00:00
701	1102	44	t	4	2013-12-21 00:00:00
702	1102	120	t	5	2015-07-30 00:00:00
703	1102	228	t	1	2013-08-05 00:00:00
704	1102	67	t	3	2013-08-05 00:00:00
705	1102	149	t	4	2013-08-05 00:00:00
706	1102	63	t	3	2013-06-24 00:00:00
707	1102	107	t	4	2013-04-27 00:00:00
708	1102	2	t	3	2015-07-30 00:00:00
709	1102	21	t	1	2015-07-30 00:00:00
710	1102	174	t	1	2012-12-29 00:00:00
711	1102	48	t	3	2012-12-29 00:00:00
712	1102	65	t	3	2012-12-28 00:00:00
713	1102	168	t	5	2012-12-16 00:00:00
714	1102	39	t	5	2012-12-16 00:00:00
715	1102	75	t	3	2012-12-05 00:00:00
716	1102	211	t	5	2015-07-30 00:00:00
717	1102	188	t	5	2016-07-16 00:00:00
718	1102	157	t	5	2015-05-26 00:00:00
719	1102	80	t	5	2015-06-28 00:00:00
720	1102	27	t	4	2012-11-21 00:00:00
721	1102	29	t	4	2012-11-11 00:00:00
722	1102	215	t	4	2012-11-10 00:00:00
723	1103	180	t	4	2016-10-31 00:00:00
724	1103	2	t	5	2016-04-13 00:00:00
725	1103	121	t	4	2016-04-19 00:00:00
726	1103	196	t	5	2016-04-19 00:00:00
727	1103	145	t	3	2016-04-13 00:00:00
728	1103	171	t	2	2016-09-25 00:00:00
729	1103	134	t	3	2015-07-17 00:00:00
730	1103	90	t	4	2015-01-21 00:00:00
731	1103	48	t	4	2015-05-29 00:00:00
732	1103	3	t	4	2015-06-20 00:00:00
733	1103	133	t	5	2015-07-17 00:00:00
734	1103	75	t	4	2015-01-14 00:00:00
735	1103	39	t	4	2015-07-17 00:00:00
736	1103	37	t	3	2015-07-17 00:00:00
737	1103	168	t	4	2015-07-17 00:00:00
738	1103	120	t	3	2015-07-17 00:00:00
739	1103	1	t	3	2014-12-22 00:00:00
740	1104	120	t	4	2016-10-13 00:00:00
741	1104	130	t	2	2014-01-30 00:00:00
742	1104	144	t	3	2014-01-30 00:00:00
743	1104	55	t	4	2014-01-30 00:00:00
744	1104	10	t	4	2014-01-30 00:00:00
745	1104	23	t	4	2014-01-30 00:00:00
746	1104	180	t	2	2014-01-30 00:00:00
747	1104	175	t	3	2014-01-30 00:00:00
748	1104	7	t	3	2014-01-30 00:00:00
749	1104	38	t	4	2014-01-30 00:00:00
750	1104	46	t	4	2016-11-11 00:00:00
751	1104	33	t	4	2014-01-30 00:00:00
752	1104	45	t	5	2014-01-30 00:00:00
753	1104	16	t	4	2014-01-30 00:00:00
754	1104	5	t	5	2014-01-30 00:00:00
755	1104	2	t	4	2014-01-30 00:00:00
756	1104	24	t	3	2014-01-30 00:00:00
757	1105	126	t	5	2014-06-13 00:00:00
758	1105	120	t	4	2014-06-13 00:00:00
759	1105	95	t	3	2014-06-13 00:00:00
760	1105	5	t	5	2014-06-13 00:00:00
761	1105	88	t	4	2014-06-13 00:00:00
762	1105	29	t	5	2014-06-13 00:00:00
763	1105	121	t	2	2014-07-08 00:00:00
764	1105	14	t	5	2014-06-13 00:00:00
765	1105	9	t	2	2014-06-13 00:00:00
766	1105	45	t	4	2014-06-13 00:00:00
767	1105	21	t	5	2014-06-13 00:00:00
768	1105	7	t	5	2014-06-13 00:00:00
769	1107	46	t	5	2016-01-10 00:00:00
770	1107	121	t	4	2016-04-19 00:00:00
771	1107	171	t	4	2015-07-22 00:00:00
772	1107	33	t	5	2016-01-10 00:00:00
773	1107	2	t	5	2015-07-22 00:00:00
774	1108	174	t	3	2016-10-24 00:00:00
775	1108	14	t	4	2016-10-25 00:00:00
776	1108	23	t	3	2016-10-22 00:00:00
777	1108	88	t	3	2016-10-22 00:00:00
778	1108	9	t	3	2016-10-22 00:00:00
779	1108	78	t	2	2016-10-22 00:00:00
780	1108	143	t	4	2016-10-22 00:00:00
781	1108	189	t	3	2016-10-22 00:00:00
782	1108	92	t	3	2016-10-22 00:00:00
783	1108	10	t	3	2016-10-22 00:00:00
784	1108	185	t	3	2016-10-22 00:00:00
785	1108	7	t	3	2016-10-22 00:00:00
786	1108	21	t	3	2016-10-22 00:00:00
787	1108	45	t	5	2016-10-22 00:00:00
788	1108	16	t	5	2016-10-22 00:00:00
789	1109	188	t	5	2016-03-13 00:00:00
790	1109	128	t	4	2016-03-13 00:00:00
791	1109	67	t	4	2016-03-13 00:00:00
792	1109	29	t	4	2016-03-13 00:00:00
793	1109	61	t	4	2016-03-13 00:00:00
794	1109	21	t	3	2016-03-13 00:00:00
795	1109	9	t	4	2016-03-11 00:00:00
796	1109	143	t	5	2016-03-11 00:00:00
797	1109	120	t	3	2016-03-11 00:00:00
798	1109	111	t	4	2016-03-11 00:00:00
799	1109	23	t	4	2016-03-11 00:00:00
800	1109	5	t	4	2016-03-11 00:00:00
801	1109	7	t	4	2016-03-11 00:00:00
802	1109	4	t	4	2016-03-11 00:00:00
803	1109	2	t	4	2016-03-11 00:00:00
804	1109	33	t	4	2016-03-09 00:00:00
805	1109	16	t	5	2016-03-09 00:00:00
806	1109	45	t	5	2016-03-09 00:00:00
807	1110	112	t	4	2016-10-21 00:00:00
808	1110	47	t	4	2016-06-15 00:00:00
809	1110	62	t	4	2016-06-15 00:00:00
810	1110	68	t	4	2016-09-16 00:00:00
811	1110	34	t	4	2016-09-16 00:00:00
812	1112	98	t	2	2016-09-27 00:00:00
813	1112	63	t	5	2016-09-06 00:00:00
814	1112	61	t	3	2016-09-05 00:00:00
815	1112	174	t	4	2016-08-27 00:00:00
816	1112	89	t	5	2016-09-23 00:00:00
817	1112	20	t	5	2016-09-23 00:00:00
818	1112	23	t	3	2016-08-27 00:00:00
819	1112	14	t	4	2016-08-27 00:00:00
820	1112	71	t	4	2016-08-27 00:00:00
821	1112	59	t	1	2016-08-27 00:00:00
822	1112	4	t	4	2016-08-27 00:00:00
823	1112	142	t	3	2016-09-23 00:00:00
824	1112	45	t	5	2016-09-23 00:00:00
825	1115	54	t	2	2012-11-11 00:00:00
826	1115	228	t	5	2012-08-24 00:00:00
827	1116	4	t	3	2016-09-28 00:00:00
828	1116	159	t	4	2016-01-23 00:00:00
829	1116	213	t	3	2016-01-23 00:00:00
830	1116	239	t	4	2015-11-04 00:00:00
831	1117	78	t	3	2015-03-26 00:00:00
832	1118	196	t	2	2016-06-24 00:00:00
833	1118	16	t	5	2016-11-07 00:00:00
834	1118	243	t	4	2015-05-20 00:00:00
835	1118	3	t	4	2014-11-18 00:00:00
836	1118	143	t	5	2014-11-17 00:00:00
837	1118	29	t	3	2014-11-06 00:00:00
838	1118	195	t	4	2014-05-04 00:00:00
839	1118	52	t	3	2014-01-13 00:00:00
840	1118	11	t	4	2014-01-02 00:00:00
841	1118	221	t	4	2013-07-25 00:00:00
842	1120	61	t	2	2016-02-25 00:00:00
843	1120	23	t	4	2016-09-27 00:00:00
844	1121	191	t	4	2016-10-26 00:00:00
845	1121	148	t	5	2016-10-30 00:00:00
846	1121	88	t	5	2016-10-30 00:00:00
847	1121	29	t	4	2016-09-24 00:00:00
848	1121	9	t	4	2016-09-24 00:00:00
849	1121	4	t	4	2016-09-24 00:00:00
850	1121	14	t	3	2016-09-24 00:00:00
851	1121	133	t	3	2016-06-23 00:00:00
852	1121	67	t	4	2016-10-31 00:00:00
853	1121	228	t	4	2015-04-24 00:00:00
854	1121	5	t	2	2016-10-23 00:00:00
855	1125	228	t	4	2016-08-17 00:00:00
856	1125	59	t	3	2016-07-19 00:00:00
857	1125	93	t	4	2016-06-08 00:00:00
858	1125	9	t	2	2016-03-30 00:00:00
859	1125	3	t	5	2014-11-03 00:00:00
860	1126	55	t	5	2015-06-21 00:00:00
861	1126	65	t	5	2015-06-21 00:00:00
862	1126	114	t	5	2014-07-31 00:00:00
863	1126	75	t	5	2014-07-31 00:00:00
864	1126	68	t	5	2014-07-31 00:00:00
865	1126	157	t	5	2014-07-31 00:00:00
866	1126	78	t	5	2014-07-31 00:00:00
867	1126	80	t	5	2014-07-31 00:00:00
868	1126	88	t	5	2014-07-31 00:00:00
869	1126	73	t	5	2014-07-31 00:00:00
870	1126	86	t	4	2014-07-31 00:00:00
871	1126	64	t	5	2014-07-31 00:00:00
872	1126	3	t	5	2014-07-31 00:00:00
873	1126	4	t	5	2014-07-31 00:00:00
874	1126	120	t	5	2014-07-30 00:00:00
875	1126	185	t	5	2014-07-30 00:00:00
876	1126	2	t	5	2014-07-29 00:00:00
877	1126	94	t	5	2014-07-29 00:00:00
878	1126	67	t	5	2014-07-29 00:00:00
879	1126	188	t	5	2014-07-29 00:00:00
880	1126	31	t	5	2014-07-29 00:00:00
881	1126	14	t	5	2014-07-29 00:00:00
882	1126	59	t	4	2014-07-29 00:00:00
883	1126	15	t	5	2014-07-29 00:00:00
884	1126	24	t	5	2014-07-29 00:00:00
885	1126	121	t	5	2014-07-29 00:00:00
886	1126	44	t	5	2014-07-29 00:00:00
887	1126	47	t	5	2014-07-29 00:00:00
888	1126	16	t	5	2014-07-29 00:00:00
889	1127	24	t	5	2016-11-09 00:00:00
890	1128	54	t	3	2016-05-25 00:00:00
891	1128	188	t	4	2015-12-17 00:00:00
892	1128	16	t	4	2015-09-14 00:00:00
893	1128	55	t	3	2015-01-02 00:00:00
894	1128	186	t	3	2015-01-01 00:00:00
895	1128	171	t	2	2015-01-01 00:00:00
896	1128	62	t	2	2015-01-01 00:00:00
897	1128	46	t	5	2015-01-01 00:00:00
898	1128	21	t	4	2015-01-01 00:00:00
899	1128	2	t	3	2015-01-01 00:00:00
900	1129	62	t	3	2016-09-27 00:00:00
901	1129	120	t	1	2016-07-28 00:00:00
902	1129	171	t	3	2016-07-19 00:00:00
903	1129	21	t	4	2016-07-19 00:00:00
904	1129	5	t	4	2016-07-19 00:00:00
905	1129	11	t	1	2016-03-18 00:00:00
906	1129	241	t	2	2016-07-19 00:00:00
907	1129	46	t	3	2016-07-19 00:00:00
908	1129	146	t	3	2016-07-19 00:00:00
909	1129	10	t	4	2016-07-19 00:00:00
910	1129	16	t	3	2016-07-19 00:00:00
911	1130	165	t	3	2016-04-18 00:00:00
912	1130	21	t	5	2014-03-31 00:00:00
913	1130	20	t	2	2011-10-16 00:00:00
914	1130	45	t	5	2011-12-03 00:00:00
915	1130	44	t	2	2013-08-23 00:00:00
916	1130	31	t	1	2011-10-14 00:00:00
917	1130	166	t	3	2012-01-19 00:00:00
918	1130	5	t	2	2011-10-16 00:00:00
919	1130	4	t	4	2011-06-19 00:00:00
920	1130	14	t	4	2011-06-19 00:00:00
921	1130	16	t	3	2011-06-19 00:00:00
922	1132	168	t	5	2016-04-13 00:00:00
923	1132	63	t	5	2016-06-11 00:00:00
924	1132	149	t	5	2015-10-28 00:00:00
925	1132	78	t	5	2015-10-28 00:00:00
926	1132	80	t	5	2015-10-28 00:00:00
927	1132	111	t	5	2015-10-28 00:00:00
928	1132	88	t	5	2015-10-28 00:00:00
929	1132	29	t	5	2015-10-28 00:00:00
930	1132	9	t	5	2015-10-28 00:00:00
931	1132	4	t	5	2015-10-28 00:00:00
932	1132	133	t	5	2015-10-27 00:00:00
933	1132	30	t	5	2015-10-27 00:00:00
934	1132	157	t	5	2015-10-28 00:00:00
935	1132	143	t	5	2015-10-28 00:00:00
936	1132	228	t	5	2014-08-28 00:00:00
937	1132	48	t	4	2014-08-28 00:00:00
938	1132	10	t	3	2014-08-28 00:00:00
939	1132	15	t	3	2014-08-28 00:00:00
940	1132	130	t	4	2014-08-28 00:00:00
941	1132	86	t	4	2014-08-28 00:00:00
942	1132	14	t	5	2015-10-28 00:00:00
943	1132	24	t	4	2014-08-28 00:00:00
944	1132	23	t	4	2014-08-28 00:00:00
945	1132	59	t	4	2014-08-28 00:00:00
946	1132	45	t	5	2014-08-28 00:00:00
947	1132	62	t	5	2014-08-26 00:00:00
948	1132	27	t	5	2014-08-26 00:00:00
949	1132	5	t	5	2013-03-21 00:00:00
950	1132	7	t	5	2013-03-21 00:00:00
951	1133	239	t	4	2016-10-14 00:00:00
952	1133	24	t	3	2016-10-14 00:00:00
953	1133	16	t	4	2016-10-14 00:00:00
954	1133	33	t	4	2016-10-14 00:00:00
955	1133	46	t	4	2016-10-14 00:00:00
956	1133	168	t	2	2016-10-14 00:00:00
957	1133	120	t	4	2016-10-14 00:00:00
958	1135	130	t	1	2016-05-31 00:00:00
959	1135	150	t	1	2016-05-11 00:00:00
960	1135	196	t	2	2015-03-14 00:00:00
961	1136	103	t	4	2016-10-13 00:00:00
962	1136	78	t	4	2016-09-22 00:00:00
963	1136	105	t	4	2016-09-17 00:00:00
964	1136	213	t	4	2016-08-03 00:00:00
965	1136	111	t	5	2016-09-05 00:00:00
966	1136	30	t	4	2016-07-26 00:00:00
967	1136	168	t	4	2016-05-23 00:00:00
968	1136	239	t	3	2016-04-06 00:00:00
969	1136	190	t	4	2016-03-16 00:00:00
970	1136	200	t	4	2016-02-05 00:00:00
971	1136	187	t	4	2016-01-25 00:00:00
972	1136	1	t	5	2015-10-31 00:00:00
973	1136	129	t	3	2015-07-20 00:00:00
974	1136	126	t	5	2015-05-08 00:00:00
975	1136	68	t	3	2015-02-20 00:00:00
976	1136	107	t	4	2015-02-08 00:00:00
977	1136	90	t	4	2015-01-20 00:00:00
978	1136	180	t	4	2015-02-05 00:00:00
979	1136	3	t	4	2014-11-21 00:00:00
980	1136	93	t	4	2015-01-20 00:00:00
981	1136	94	t	4	2014-08-09 00:00:00
982	1136	7	t	4	2015-05-17 00:00:00
983	1136	130	t	4	2015-01-20 00:00:00
984	1136	144	t	4	2015-01-20 00:00:00
985	1136	246	t	4	2015-01-20 00:00:00
986	1136	196	t	4	2015-01-17 00:00:00
987	1136	27	t	4	2015-01-16 00:00:00
988	1136	40	t	4	2016-10-17 00:00:00
989	1136	21	t	4	2015-01-17 00:00:00
990	1136	67	t	4	2015-01-20 00:00:00
991	1136	59	t	4	2015-01-16 00:00:00
992	1136	86	t	4	2015-01-16 00:00:00
993	1136	14	t	4	2014-06-04 00:00:00
994	1136	33	t	4	2015-01-20 00:00:00
995	1136	207	t	4	2014-05-15 00:00:00
996	1136	203	t	4	2015-01-18 00:00:00
997	1136	66	t	3	2015-08-08 00:00:00
998	1136	9	t	4	2014-05-04 00:00:00
999	1136	92	t	4	2014-06-11 00:00:00
1000	1136	104	t	4	2016-05-23 00:00:00
1001	1136	201	t	4	2014-09-16 00:00:00
1002	1136	95	t	4	2015-01-20 00:00:00
1003	1136	47	t	4	2015-01-17 00:00:00
1004	1136	211	t	4	2015-01-16 00:00:00
1005	1136	55	t	4	2015-01-20 00:00:00
1006	1136	140	t	4	2014-04-19 00:00:00
1007	1137	120	t	4	2016-08-21 00:00:00
1008	1137	90	t	3	2016-08-21 00:00:00
1009	1140	104	t	2	2016-11-01 00:00:00
1010	1140	5	t	4	2016-02-23 00:00:00
1011	1140	45	t	4	2015-12-22 00:00:00
1012	1140	52	t	5	2015-12-22 00:00:00
1013	1140	46	t	3	2015-12-22 00:00:00
1014	1140	130	t	3	2016-07-03 00:00:00
1015	1140	59	t	4	2015-12-22 00:00:00
1016	1141	40	t	4	2016-08-10 00:00:00
1017	1141	46	t	4	2016-08-12 00:00:00
1018	1141	7	t	5	2016-06-24 00:00:00
1019	1142	107	t	1	2016-06-20 00:00:00
1020	1143	70	t	5	2016-09-24 00:00:00
1021	1143	111	t	5	2016-08-15 00:00:00
1022	1143	189	t	3	2016-08-15 00:00:00
1023	1143	91	t	5	2016-08-15 00:00:00
1024	1143	88	t	5	2016-08-15 00:00:00
1025	1143	28	t	5	2016-08-15 00:00:00
1026	1144	119	t	4	2016-07-31 00:00:00
1027	1144	149	t	4	2013-09-27 00:00:00
1028	1145	20	t	4	2016-11-08 00:00:00
1029	1145	134	t	5	2016-10-03 00:00:00
1030	1145	1	t	5	2016-09-26 00:00:00
1031	1145	241	t	4	2016-08-11 00:00:00
1032	1145	111	t	3	2011-03-25 00:00:00
1033	1147	126	t	5	2012-10-22 00:00:00
1034	1147	188	t	5	2011-12-31 00:00:00
1035	1147	130	t	4	2011-11-08 00:00:00
1036	1147	46	t	4	2011-10-28 00:00:00
1037	1147	44	t	4	2011-09-27 00:00:00
1038	1147	45	t	3	2011-09-29 00:00:00
1039	1147	5	t	3	2011-11-22 00:00:00
1040	1147	16	t	3	2011-09-29 00:00:00
1041	1147	2	t	5	2011-05-26 00:00:00
1042	1147	31	t	1	2011-09-29 00:00:00
1043	1147	66	t	4	2011-10-11 00:00:00
1044	1149	210	t	3	2016-01-28 00:00:00
1045	1149	40	t	3	2012-09-10 00:00:00
1046	1149	108	t	4	2013-06-25 00:00:00
1047	1149	21	t	4	2014-04-30 00:00:00
1048	1149	2	t	5	2013-05-17 00:00:00
1049	1149	33	t	3	2012-07-23 00:00:00
1050	1149	161	t	4	2012-07-23 00:00:00
1051	1149	5	t	3	2012-07-23 00:00:00
1052	1149	23	t	4	2012-07-23 00:00:00
1053	1149	7	t	3	2012-07-23 00:00:00
1054	1150	108	t	4	2016-08-05 00:00:00
1055	1150	64	t	3	2016-04-30 00:00:00
1056	1150	144	t	5	2016-05-10 00:00:00
1057	1150	4	t	5	2016-05-10 00:00:00
1058	1150	14	t	5	2016-05-10 00:00:00
1059	1150	80	t	5	2016-05-10 00:00:00
1060	1150	92	t	4	2016-08-05 00:00:00
1061	1152	130	t	3	2013-09-26 00:00:00
1062	1152	211	t	3	2013-09-24 00:00:00
1063	1152	59	t	3	2013-08-18 00:00:00
1064	1152	24	t	3	2014-12-26 00:00:00
1065	1152	188	t	5	2013-08-18 00:00:00
1066	1152	16	t	5	2013-08-18 00:00:00
1067	1152	5	t	3	2013-08-18 00:00:00
1068	1152	45	t	4	2013-08-18 00:00:00
1069	1154	16	t	4	2016-08-28 00:00:00
1070	1154	5	t	5	2016-07-24 00:00:00
1071	1154	26	t	3	2015-06-03 00:00:00
1072	1154	75	t	4	2015-04-04 00:00:00
1073	1154	48	t	5	2015-03-10 00:00:00
1074	1154	24	t	3	2016-07-29 00:00:00
1075	1155	5	t	5	2016-09-26 00:00:00
1076	1155	2	t	5	2016-09-24 00:00:00
1077	1156	71	t	4	2012-11-20 00:00:00
1078	1156	2	t	1	2009-10-03 00:00:00
1079	1156	130	t	3	2009-08-14 00:00:00
1080	1158	24	t	4	2013-01-04 00:00:00
1081	1158	121	t	4	2012-12-05 00:00:00
1082	1158	23	t	3	2012-12-05 00:00:00
1083	1158	71	t	5	2014-07-25 00:00:00
1084	1158	2	t	5	2010-10-19 00:00:00
1085	1159	245	t	2	2016-11-10 00:00:00
1086	1159	88	t	4	2016-08-19 00:00:00
1087	1159	78	t	4	2016-06-24 00:00:00
1088	1159	66	t	5	2016-02-08 00:00:00
1089	1159	239	t	3	2015-11-14 00:00:00
1090	1159	27	t	5	2015-11-09 00:00:00
1091	1159	111	t	4	2015-10-24 00:00:00
1092	1159	1	t	5	2015-09-11 00:00:00
1093	1159	48	t	4	2015-08-11 00:00:00
1094	1159	21	t	3	2015-07-31 00:00:00
1095	1159	64	t	4	2016-08-24 00:00:00
1096	1159	128	t	3	2015-03-03 00:00:00
1097	1159	203	t	4	2014-12-21 00:00:00
1098	1159	188	t	5	2014-12-16 00:00:00
1099	1159	46	t	3	2014-08-28 00:00:00
1100	1159	61	t	4	2014-07-01 00:00:00
1101	1159	30	t	4	2014-05-18 00:00:00
1102	1159	120	t	5	2015-09-09 00:00:00
1103	1159	20	t	3	2013-08-06 00:00:00
1104	1159	70	t	4	2013-07-11 00:00:00
1105	1159	211	t	4	2013-06-09 00:00:00
1106	1159	92	t	5	2013-06-04 00:00:00
1107	1159	38	t	5	2015-07-31 00:00:00
1108	1160	44	t	3	2015-05-17 00:00:00
1109	1160	16	t	5	2016-06-13 00:00:00
1110	1160	5	t	3	2016-03-03 00:00:00
1111	1160	46	t	3	2014-11-16 00:00:00
1112	1160	91	t	5	2016-06-13 00:00:00
1113	1160	160	t	4	2014-11-16 00:00:00
1114	1160	188	t	4	2013-08-15 00:00:00
1115	1161	185	t	4	2012-10-29 00:00:00
1116	1161	161	t	4	2012-03-15 00:00:00
1117	1161	145	t	3	2011-12-12 00:00:00
1118	1161	73	t	3	2012-09-04 00:00:00
1119	1161	21	t	3	2011-12-12 00:00:00
1120	1161	7	t	4	2011-12-12 00:00:00
1121	1161	148	t	4	2011-12-12 00:00:00
1122	1161	23	t	5	2011-12-12 00:00:00
1123	1161	71	t	4	2011-10-20 00:00:00
1124	1161	24	t	4	2011-08-01 00:00:00
1125	1161	38	t	5	2011-08-01 00:00:00
1126	1162	107	t	4	2016-07-27 00:00:00
1127	1162	80	t	4	2016-07-27 00:00:00
1128	1162	75	t	3	2016-07-02 00:00:00
1129	1162	133	t	5	2014-12-29 00:00:00
1130	1162	30	t	4	2016-07-27 00:00:00
1131	1162	21	t	3	2016-05-23 00:00:00
1132	1162	46	t	5	2014-11-19 00:00:00
1133	1162	120	t	4	2016-05-23 00:00:00
1134	1162	2	t	5	2015-07-22 00:00:00
1135	1162	4	t	3	2016-07-27 00:00:00
1136	1162	5	t	3	2016-05-23 00:00:00
1137	1163	168	t	5	2015-11-25 00:00:00
1138	1163	107	t	4	2015-11-25 00:00:00
1139	1163	203	t	4	2015-11-21 00:00:00
1140	1163	37	t	5	2015-11-21 00:00:00
1141	1163	158	t	5	2015-11-21 00:00:00
1142	1163	31	t	2	2015-11-28 00:00:00
1143	1163	11	t	5	2015-11-21 00:00:00
1144	1163	7	t	4	2015-12-04 00:00:00
1145	1164	44	t	4	2014-02-21 00:00:00
1146	1164	133	t	3	2012-10-14 00:00:00
1147	1164	32	t	5	2012-08-24 00:00:00
1148	1164	90	t	4	2012-08-24 00:00:00
1149	1164	3	t	5	2012-08-24 00:00:00
1150	1164	239	t	3	2012-08-23 00:00:00
1151	1164	107	t	3	2012-08-23 00:00:00
1152	1164	195	t	4	2012-08-23 00:00:00
1153	1164	75	t	5	2012-08-23 00:00:00
1154	1164	46	t	5	2012-08-23 00:00:00
1155	1164	121	t	5	2012-08-23 00:00:00
1156	1164	4	t	2	2012-08-23 00:00:00
1157	1164	45	t	4	2012-08-23 00:00:00
1158	1164	5	t	5	2012-08-23 00:00:00
1159	1164	2	t	5	2012-08-23 00:00:00
1160	1166	5	t	3	2016-02-28 00:00:00
1161	1166	61	t	5	2016-04-04 00:00:00
1162	1166	121	t	3	2016-02-10 00:00:00
1163	1167	14	t	4	2014-10-27 00:00:00
1164	1167	9	t	4	2014-10-27 00:00:00
1165	1167	84	t	3	2015-05-27 00:00:00
1166	1168	39	t	1	2016-08-19 00:00:00
1167	1168	59	t	4	2016-01-12 00:00:00
1168	1168	86	t	4	2016-01-12 00:00:00
1169	1168	67	t	5	2016-02-17 00:00:00
1170	1169	143	t	4	2016-08-06 00:00:00
1171	1169	70	t	4	2016-08-06 00:00:00
1172	1169	40	t	3	2016-05-09 00:00:00
1173	1169	168	t	4	2016-06-02 00:00:00
1174	1169	89	t	4	2016-04-06 00:00:00
1175	1169	52	t	3	2016-04-05 00:00:00
1176	1169	195	t	4	2016-04-05 00:00:00
1177	1169	61	t	3	2016-04-05 00:00:00
1178	1169	11	t	4	2016-04-05 00:00:00
1179	1169	130	t	3	2016-04-05 00:00:00
1180	1169	59	t	3	2016-04-05 00:00:00
1181	1169	120	t	4	2016-04-05 00:00:00
1182	1169	121	t	4	2016-09-30 00:00:00
1183	1169	86	t	3	2016-04-05 00:00:00
1184	1169	48	t	4	2016-04-05 00:00:00
1185	1169	21	t	4	2016-04-05 00:00:00
1186	1169	2	t	4	2016-09-30 00:00:00
1187	1169	103	t	4	2016-03-21 00:00:00
1188	1169	24	t	5	2016-03-21 00:00:00
1189	1169	179	t	5	2016-08-03 00:00:00
1190	1169	226	t	3	2016-04-18 00:00:00
1191	1169	16	t	5	2016-08-03 00:00:00
1192	1169	28	t	5	2015-11-24 00:00:00
1193	1169	46	t	4	2015-11-24 00:00:00
1194	1169	241	t	4	2015-11-24 00:00:00
1195	1169	94	t	5	2015-11-24 00:00:00
1196	1169	188	t	5	2015-11-24 00:00:00
1197	1169	5	t	5	2015-11-09 00:00:00
1198	1169	45	t	5	2015-11-09 00:00:00
1199	1169	165	t	5	2015-11-09 00:00:00
1200	1169	33	t	4	2016-09-30 00:00:00
1201	1169	91	t	5	2015-11-09 00:00:00
1202	1170	126	t	4	2016-08-29 00:00:00
1203	1170	14	t	4	2016-01-04 00:00:00
1204	1170	4	t	5	2016-08-13 00:00:00
1205	1170	46	t	4	2015-12-17 00:00:00
1206	1170	45	t	5	2015-12-16 00:00:00
1207	1170	47	t	3	2016-01-05 00:00:00
1208	1170	33	t	4	2015-12-16 00:00:00
1209	1170	121	t	4	2015-12-16 00:00:00
1210	1170	2	t	4	2015-12-16 00:00:00
1211	1170	5	t	5	2015-12-16 00:00:00
1212	1170	62	t	5	2015-12-16 00:00:00
1213	1170	88	t	5	2016-02-19 00:00:00
1214	1170	9	t	5	2015-12-16 00:00:00
1215	1170	21	t	5	2016-06-25 00:00:00
1216	1171	66	t	2	2016-11-05 00:00:00
1217	1171	10	t	2	2016-11-05 00:00:00
1218	1171	67	t	2	2016-11-05 00:00:00
1219	1171	48	t	5	2016-11-05 00:00:00
1220	1171	59	t	2	2016-11-05 00:00:00
1221	1171	84	t	5	2016-11-05 00:00:00
1222	1171	7	t	3	2016-11-05 00:00:00
1223	1171	171	t	2	2016-11-05 00:00:00
1224	1171	26	t	4	2016-11-05 00:00:00
1225	1171	64	t	5	2016-11-05 00:00:00
1226	1171	111	t	2	2016-11-05 00:00:00
1227	1171	11	t	2	2016-11-05 00:00:00
1228	1171	65	t	2	2016-11-05 00:00:00
1229	1171	145	t	5	2016-11-05 00:00:00
1230	1171	28	t	5	2016-11-05 00:00:00
1231	1171	33	t	4	2016-11-05 00:00:00
1232	1171	165	t	1	2016-11-05 00:00:00
1233	1171	120	t	2	2016-11-05 00:00:00
1234	1171	37	t	3	2016-11-05 00:00:00
1235	1171	1	t	3	2016-11-05 00:00:00
1236	1171	107	t	4	2016-11-05 00:00:00
1237	1171	103	t	3	2016-11-05 00:00:00
1238	1171	24	t	2	2016-11-05 00:00:00
1239	1171	211	t	1	2016-11-05 00:00:00
1240	1171	63	t	3	2016-11-05 00:00:00
1241	1171	61	t	1	2016-11-05 00:00:00
1242	1171	191	t	1	2016-11-05 00:00:00
1243	1171	15	t	5	2016-01-13 00:00:00
1244	1171	206	t	4	2016-01-13 00:00:00
1245	1171	161	t	4	2016-01-13 00:00:00
1246	1171	71	t	3	2016-01-13 00:00:00
1247	1171	23	t	5	2016-01-13 00:00:00
1248	1171	14	t	4	2016-01-13 00:00:00
1249	1171	94	t	2	2016-01-13 00:00:00
1250	1171	38	t	4	2016-01-13 00:00:00
1251	1171	73	t	3	2016-01-13 00:00:00
1252	1171	126	t	4	2016-01-13 00:00:00
1253	1171	31	t	5	2016-01-13 00:00:00
1254	1171	47	t	4	2016-01-13 00:00:00
1255	1171	108	t	2	2016-01-13 00:00:00
1256	1171	199	t	3	2016-01-13 00:00:00
1257	1171	55	t	3	2016-01-13 00:00:00
1258	1171	86	t	3	2016-01-13 00:00:00
1259	1171	21	t	3	2016-01-13 00:00:00
1260	1171	74	t	5	2016-01-13 00:00:00
1261	1171	160	t	3	2016-01-13 00:00:00
1262	1171	187	t	5	2016-01-13 00:00:00
1263	1171	179	t	1	2016-01-13 00:00:00
1264	1171	121	t	4	2016-01-13 00:00:00
1265	1171	45	t	3	2016-01-13 00:00:00
1266	1171	16	t	3	2016-01-13 00:00:00
1267	1171	2	t	5	2016-01-13 00:00:00
1268	1172	14	t	3	2016-07-31 00:00:00
1269	1172	45	t	3	2016-07-27 00:00:00
1270	1172	2	t	5	2016-04-03 00:00:00
1271	1172	5	t	4	2016-09-26 00:00:00
1272	1175	43	t	4	2016-03-15 00:00:00
1273	1175	86	t	4	2016-03-15 00:00:00
1274	1175	174	t	3	2016-05-24 00:00:00
1275	1175	247	t	4	2012-06-11 00:00:00
1276	1175	7	t	3	2016-05-25 00:00:00
1277	1175	55	t	4	2016-05-25 00:00:00
1278	1175	41	t	4	2009-06-23 00:00:00
1279	1175	94	t	4	2016-05-25 00:00:00
1280	1175	84	t	4	2016-05-25 00:00:00
1281	1175	23	t	5	2016-05-25 00:00:00
1282	1175	28	t	4	2016-05-25 00:00:00
1283	1175	45	t	4	2016-05-25 00:00:00
1284	1175	67	t	4	2016-05-25 00:00:00
1285	1175	121	t	5	2009-06-23 00:00:00
1286	1175	70	t	4	2016-04-29 00:00:00
1287	1175	195	t	4	2016-05-25 00:00:00
1288	1175	16	t	5	2016-05-25 00:00:00
1289	1175	2	t	5	2016-05-25 00:00:00
1290	1175	66	t	3	2016-05-25 00:00:00
1291	1175	38	t	5	2016-05-25 00:00:00
1292	1175	4	t	4	2009-06-22 00:00:00
1293	1175	59	t	4	2016-05-25 00:00:00
1294	1176	103	t	2	2015-06-08 00:00:00
1295	1176	78	t	4	2015-12-27 00:00:00
1296	1176	48	t	4	2014-05-29 00:00:00
1297	1176	3	t	3	2014-05-28 00:00:00
1298	1176	75	t	3	2014-05-05 00:00:00
1299	1176	207	t	4	2015-12-27 00:00:00
1300	1176	157	t	3	2015-12-27 00:00:00
1301	1177	168	t	2	2016-10-04 00:00:00
1302	1177	29	t	4	2016-10-02 00:00:00
1303	1177	78	t	3	2016-09-04 00:00:00
1304	1177	54	t	3	2016-04-19 00:00:00
1305	1177	61	t	5	2016-04-07 00:00:00
1306	1177	89	t	5	2016-03-23 00:00:00
1307	1177	24	t	5	2013-08-03 00:00:00
1308	1177	45	t	3	2013-08-03 00:00:00
1309	1177	2	t	5	2016-03-22 00:00:00
1310	1177	5	t	5	2014-04-02 00:00:00
1311	1177	11	t	5	2013-08-03 00:00:00
1312	1178	168	t	5	2016-09-14 00:00:00
1313	1178	39	t	5	2016-09-10 00:00:00
1314	1178	149	t	5	2016-03-19 00:00:00
1315	1178	203	t	3	2016-10-04 00:00:00
1316	1178	88	t	3	2016-06-12 00:00:00
1317	1178	143	t	5	2015-04-04 00:00:00
1318	1178	78	t	4	2016-09-10 00:00:00
1319	1178	188	t	4	2015-12-08 00:00:00
1320	1178	120	t	4	2015-03-07 00:00:00
1321	1178	21	t	5	2016-05-12 00:00:00
1322	1178	157	t	4	2016-03-14 00:00:00
1323	1178	114	t	3	2015-06-05 00:00:00
1324	1178	90	t	4	2016-03-06 00:00:00
1325	1178	48	t	4	2016-03-01 00:00:00
1326	1178	72	t	3	2016-01-22 00:00:00
1327	1178	32	t	3	2015-05-01 00:00:00
1328	1178	75	t	3	2015-04-01 00:00:00
1329	1178	14	t	4	2015-12-29 00:00:00
1330	1178	52	t	3	2016-01-11 00:00:00
1331	1178	3	t	3	2016-02-12 00:00:00
1332	1179	88	t	4	2013-09-03 00:00:00
1333	1180	48	t	5	2015-01-14 00:00:00
1334	1180	67	t	3	2015-01-14 00:00:00
1335	1180	2	t	3	2015-03-09 00:00:00
1336	1180	75	t	4	2015-02-06 00:00:00
1337	1180	108	t	3	2015-02-06 00:00:00
1338	1180	55	t	4	2015-02-06 00:00:00
1339	1180	90	t	4	2015-01-14 00:00:00
1340	1180	107	t	4	2015-01-14 00:00:00
1341	1181	180	t	3	2015-04-18 00:00:00
1342	1181	92	t	5	2016-02-04 00:00:00
1343	1181	44	t	4	2014-10-14 00:00:00
1344	1181	114	t	5	2014-10-14 00:00:00
1345	1181	72	t	5	2014-10-14 00:00:00
1346	1181	90	t	3	2014-10-14 00:00:00
1347	1181	32	t	5	2014-10-14 00:00:00
1348	1181	48	t	5	2014-10-14 00:00:00
1349	1181	75	t	4	2014-10-14 00:00:00
1350	1181	185	t	5	2015-05-13 00:00:00
1351	1181	9	t	5	2015-06-20 00:00:00
1352	1181	21	t	5	2015-01-22 00:00:00
1353	1181	31	t	5	2014-06-14 00:00:00
1354	1181	14	t	5	2016-02-03 00:00:00
1355	1181	29	t	5	2013-12-28 00:00:00
1356	1181	120	t	3	2013-12-07 00:00:00
1357	1181	45	t	5	2014-07-15 00:00:00
1358	1181	128	t	4	2014-10-14 00:00:00
1359	1181	4	t	5	2013-10-19 00:00:00
1360	1181	43	t	5	2016-03-24 00:00:00
1361	1181	46	t	5	2015-04-30 00:00:00
1362	1181	61	t	5	2015-11-30 00:00:00
1363	1181	15	t	4	2013-07-10 00:00:00
1364	1181	67	t	5	2013-07-10 00:00:00
1365	1181	3	t	5	2013-07-10 00:00:00
1366	1181	188	t	5	2015-04-30 00:00:00
1367	1181	23	t	5	2013-07-10 00:00:00
1368	1181	91	t	4	2013-10-08 00:00:00
1369	1181	7	t	5	2013-07-10 00:00:00
1370	1181	5	t	4	2016-06-28 00:00:00
1371	1183	104	t	4	2016-10-05 00:00:00
1372	1184	55	t	3	2016-11-03 00:00:00
1373	1184	148	t	5	2016-05-16 00:00:00
1374	1184	206	t	5	2016-05-16 00:00:00
1375	1184	48	t	3	2016-11-03 00:00:00
1376	1184	168	t	4	2016-07-25 00:00:00
1377	1184	211	t	3	2015-12-14 00:00:00
1378	1185	68	t	3	2011-09-20 00:00:00
1379	1185	34	t	3	2011-09-20 00:00:00
1380	1185	93	t	3	2011-08-06 00:00:00
1381	1185	11	t	4	2010-07-17 00:00:00
1382	1185	24	t	4	2014-02-11 00:00:00
1383	1185	126	t	5	2010-12-31 00:00:00
1384	1185	52	t	2	2010-01-02 00:00:00
1385	1185	16	t	4	2011-03-26 00:00:00
1386	1185	121	t	3	2009-12-30 00:00:00
1387	1185	5	t	1	2009-12-30 00:00:00
1388	1187	239	t	3	2016-11-01 00:00:00
1389	1187	191	t	4	2016-10-18 00:00:00
1390	1187	104	t	3	2016-09-12 00:00:00
1391	1187	168	t	3	2016-06-18 00:00:00
1392	1187	126	t	5	2016-05-22 00:00:00
1393	1187	75	t	5	2016-04-24 00:00:00
1394	1187	195	t	3	2016-05-20 00:00:00
1395	1187	61	t	4	2016-05-20 00:00:00
1396	1187	46	t	4	2016-09-22 00:00:00
1397	1187	120	t	4	2016-02-24 00:00:00
1398	1187	15	t	4	2016-04-01 00:00:00
1399	1187	54	t	4	2016-04-12 00:00:00
1400	1187	40	t	5	2016-06-10 00:00:00
1401	1187	157	t	4	2016-01-23 00:00:00
1402	1187	149	t	3	2016-01-23 00:00:00
1403	1187	9	t	3	2016-01-23 00:00:00
1404	1187	78	t	3	2016-01-23 00:00:00
1405	1187	111	t	3	2016-01-23 00:00:00
1406	1187	171	t	3	2016-01-23 00:00:00
1407	1187	143	t	3	2016-01-23 00:00:00
1408	1187	88	t	3	2016-01-23 00:00:00
1409	1187	80	t	3	2016-01-23 00:00:00
1410	1187	47	t	3	2016-01-23 00:00:00
1411	1187	29	t	3	2016-01-23 00:00:00
1412	1187	7	t	4	2016-01-23 00:00:00
1413	1187	14	t	3	2016-01-23 00:00:00
1414	1187	45	t	3	2016-01-23 00:00:00
1415	1187	21	t	3	2011-07-14 00:00:00
1416	1187	4	t	2	2011-07-14 00:00:00
1417	1187	33	t	4	2011-07-14 00:00:00
1418	1187	16	t	3	2011-07-14 00:00:00
1419	1187	2	t	4	2011-07-14 00:00:00
1420	1188	168	t	5	2016-07-19 00:00:00
1421	1188	239	t	2	2016-01-27 00:00:00
1422	1190	104	t	4	2016-10-01 00:00:00
1423	1190	78	t	5	2016-09-07 00:00:00
1424	1190	168	t	4	2016-06-04 00:00:00
1425	1190	101	t	5	2016-04-30 00:00:00
1426	1190	32	t	4	2016-04-12 00:00:00
1427	1190	120	t	5	2016-03-31 00:00:00
1428	1190	61	t	4	2016-04-07 00:00:00
1429	1190	3	t	3	2016-03-30 00:00:00
1430	1190	90	t	3	2016-03-29 00:00:00
1431	1190	75	t	4	2016-03-29 00:00:00
1432	1190	71	t	4	2016-01-10 00:00:00
1433	1190	130	t	2	2012-09-30 00:00:00
1434	1191	66	t	1	2016-06-24 00:00:00
1435	1191	174	t	2	2016-06-24 00:00:00
1436	1191	21	t	1	2016-06-24 00:00:00
1437	1191	29	t	4	2016-06-24 00:00:00
1438	1191	71	t	4	2016-06-24 00:00:00
1439	1191	23	t	3	2016-06-24 00:00:00
1440	1191	93	t	3	2016-06-24 00:00:00
1441	1191	94	t	1	2016-06-24 00:00:00
1442	1191	121	t	4	2016-06-24 00:00:00
1443	1191	16	t	5	2016-06-24 00:00:00
1444	1191	150	t	3	2016-06-24 00:00:00
1445	1191	33	t	4	2016-06-24 00:00:00
1446	1191	59	t	4	2016-06-24 00:00:00
1447	1191	111	t	3	2016-06-24 00:00:00
1448	1191	87	t	3	2016-06-24 00:00:00
1449	1191	91	t	4	2016-06-24 00:00:00
1450	1192	165	t	4	2016-03-14 00:00:00
1451	1192	126	t	5	2016-03-14 00:00:00
1452	1192	16	t	5	2016-03-14 00:00:00
1453	1193	226	t	4	2014-12-14 00:00:00
1454	1193	23	t	3	2014-12-08 00:00:00
1455	1193	2	t	5	2014-12-26 00:00:00
1456	1193	75	t	5	2014-10-18 00:00:00
1457	1193	34	t	4	2014-10-18 00:00:00
1458	1193	211	t	3	2014-08-05 00:00:00
1459	1193	179	t	1	2014-08-05 00:00:00
1460	1193	66	t	1	2014-08-05 00:00:00
1461	1193	171	t	5	2014-12-26 00:00:00
1462	1193	47	t	5	2014-12-26 00:00:00
1463	1193	121	t	4	2014-12-26 00:00:00
1464	1193	24	t	3	2014-12-26 00:00:00
1465	1193	33	t	5	2014-12-26 00:00:00
1466	1193	84	t	2	2014-08-05 00:00:00
1467	1193	10	t	3	2014-10-30 00:00:00
1468	1193	74	t	4	2014-08-05 00:00:00
1469	1193	45	t	3	2014-12-26 00:00:00
1470	1193	16	t	4	2014-12-26 00:00:00
1471	1193	5	t	5	2014-08-05 00:00:00
1472	1196	105	t	3	2013-07-14 00:00:00
1473	1198	196	t	4	2016-11-11 00:00:00
1474	1198	29	t	4	2016-07-25 00:00:00
1475	1198	14	t	4	2016-07-25 00:00:00
1476	1198	207	t	5	2016-07-15 00:00:00
1477	1198	171	t	4	2016-03-22 00:00:00
1478	1198	88	t	5	2016-04-21 00:00:00
1479	1198	52	t	3	2016-03-22 00:00:00
1480	1199	175	t	3	2016-04-19 00:00:00
1481	1199	63	t	5	2015-12-10 00:00:00
1482	1199	65	t	4	2016-09-20 00:00:00
1483	1199	20	t	4	2014-12-10 00:00:00
1484	1199	40	t	2	2014-12-10 00:00:00
1485	1199	75	t	4	2014-12-10 00:00:00
1486	1199	111	t	3	2013-10-24 00:00:00
1487	1199	14	t	4	2013-10-24 00:00:00
1488	1199	29	t	5	2015-12-04 00:00:00
1489	1199	92	t	5	2013-10-06 00:00:00
1490	1199	23	t	5	2013-10-06 00:00:00
1491	1199	9	t	4	2013-10-06 00:00:00
1492	1199	145	t	5	2013-10-06 00:00:00
1493	1199	73	t	4	2015-11-25 00:00:00
1494	1199	43	t	5	2013-10-06 00:00:00
1495	1199	108	t	5	2013-10-06 00:00:00
1496	1199	15	t	4	2014-12-10 00:00:00
1497	1199	4	t	4	2013-10-06 00:00:00
1498	1199	5	t	2	2013-10-06 00:00:00
1499	1201	214	t	4	2015-03-14 00:00:00
1500	1201	148	t	5	2015-03-13 00:00:00
1501	1201	183	t	4	2015-03-12 00:00:00
1502	1201	241	t	4	2015-03-12 00:00:00
1503	1201	94	t	4	2015-03-12 00:00:00
1504	1201	63	t	5	2015-03-12 00:00:00
1505	1201	111	t	4	2015-03-12 00:00:00
1506	1201	185	t	5	2015-03-12 00:00:00
1507	1201	80	t	4	2015-03-12 00:00:00
1508	1201	144	t	4	2015-03-12 00:00:00
1509	1201	73	t	5	2015-03-12 00:00:00
1510	1201	86	t	5	2015-03-12 00:00:00
1511	1201	71	t	5	2016-07-05 00:00:00
1512	1201	27	t	5	2015-03-12 00:00:00
1513	1201	67	t	4	2016-01-18 00:00:00
1514	1201	84	t	4	2015-03-12 00:00:00
1515	1201	154	t	4	2015-03-12 00:00:00
1516	1201	38	t	4	2015-03-12 00:00:00
1517	1201	20	t	4	2015-03-12 00:00:00
1518	1201	46	t	5	2015-03-12 00:00:00
1519	1201	62	t	3	2015-03-12 00:00:00
1520	1201	31	t	4	2015-03-12 00:00:00
1521	1201	47	t	4	2015-03-12 00:00:00
1522	1201	59	t	5	2015-03-12 00:00:00
1523	1201	33	t	4	2015-03-12 00:00:00
1524	1201	4	t	4	2015-03-12 00:00:00
1525	1201	5	t	4	2015-03-12 00:00:00
1526	1201	2	t	5	2015-03-12 00:00:00
1527	1201	106	t	5	2015-03-12 00:00:00
1528	1201	130	t	4	2015-03-12 00:00:00
1529	1201	171	t	5	2015-03-12 00:00:00
1530	1201	175	t	5	2015-03-12 00:00:00
1531	1201	24	t	5	2015-03-12 00:00:00
1532	1201	188	t	5	2015-03-12 00:00:00
1533	1201	44	t	5	2015-03-12 00:00:00
1534	1201	23	t	5	2015-03-12 00:00:00
1535	1201	88	t	4	2015-03-12 00:00:00
1536	1201	9	t	5	2015-03-12 00:00:00
1537	1201	14	t	5	2015-03-12 00:00:00
1538	1201	45	t	5	2015-03-12 00:00:00
1539	1201	142	t	5	2015-03-12 00:00:00
1540	1201	120	t	5	2015-03-12 00:00:00
1541	1201	104	t	5	2015-03-12 00:00:00
1542	1201	37	t	5	2015-03-12 00:00:00
1543	1201	11	t	5	2015-03-12 00:00:00
1544	1201	7	t	4	2015-03-12 00:00:00
1545	1201	10	t	5	2015-03-12 00:00:00
1546	1202	43	t	3	2016-10-18 00:00:00
1547	1202	45	t	2	2015-08-14 00:00:00
1548	1202	5	t	4	2015-08-14 00:00:00
1549	1203	89	t	5	2016-07-05 00:00:00
1550	1203	150	t	5	2016-06-30 00:00:00
1551	1203	51	t	5	2016-02-17 00:00:00
1552	1203	120	t	4	2016-07-05 00:00:00
1553	1203	45	t	2	2016-07-05 00:00:00
1554	1203	53	t	4	2016-07-05 00:00:00
1555	1203	241	t	2	2016-07-05 00:00:00
1556	1203	21	t	5	2016-07-05 00:00:00
1557	1203	46	t	5	2016-07-05 00:00:00
1558	1203	7	t	4	2016-07-05 00:00:00
1559	1203	23	t	4	2016-07-05 00:00:00
1560	1203	14	t	5	2016-07-05 00:00:00
1561	1203	171	t	3	2016-02-23 00:00:00
1562	1203	1	t	3	2016-07-05 00:00:00
1563	1203	211	t	4	2016-07-05 00:00:00
1564	1203	2	t	5	2016-07-05 00:00:00
1565	1203	5	t	5	2016-07-05 00:00:00
1566	1203	187	t	5	2016-07-05 00:00:00
1567	1205	52	t	4	2016-07-27 00:00:00
1568	1205	2	t	4	2016-07-27 00:00:00
1569	1206	21	t	4	2016-10-28 00:00:00
1570	1207	191	t	3	2016-11-01 00:00:00
1571	1207	40	t	3	2016-10-16 00:00:00
1572	1207	211	t	1	2016-10-16 00:00:00
1573	1207	168	t	1	2016-10-16 00:00:00
1574	1207	158	t	4	2016-10-16 00:00:00
1575	1207	110	t	3	2016-10-16 00:00:00
1576	1207	188	t	4	2015-12-20 00:00:00
1577	1207	221	t	2	2015-12-20 00:00:00
1578	1207	7	t	3	2015-04-27 00:00:00
1579	1207	228	t	4	2014-12-24 00:00:00
1580	1207	63	t	4	2014-11-21 00:00:00
1581	1207	9	t	2	2013-12-30 00:00:00
1582	1207	45	t	1	2013-12-30 00:00:00
1583	1207	165	t	2	2013-12-30 00:00:00
1584	1208	34	t	3	2016-04-18 00:00:00
1585	1209	211	t	4	2016-07-23 00:00:00
1586	1209	113	t	5	2016-07-11 00:00:00
1587	1209	10	t	5	2016-03-19 00:00:00
1588	1209	26	t	4	2015-12-23 00:00:00
1589	1209	73	t	3	2016-07-11 00:00:00
1590	1209	61	t	3	2016-07-11 00:00:00
1591	1209	5	t	3	2016-07-11 00:00:00
1592	1210	78	t	3	2016-09-13 00:00:00
1593	1210	143	t	4	2014-12-30 00:00:00
1594	1210	80	t	3	2014-12-29 00:00:00
1595	1210	130	t	4	2014-12-29 00:00:00
1596	1210	48	t	3	2014-12-29 00:00:00
1597	1210	144	t	3	2014-12-29 00:00:00
1598	1210	188	t	3	2016-09-13 00:00:00
1599	1210	214	t	3	2016-09-13 00:00:00
1600	1210	11	t	3	2016-09-13 00:00:00
1601	1211	1	t	5	2016-05-29 00:00:00
1602	1211	140	t	5	2016-05-29 00:00:00
1603	1211	148	t	3	2016-05-29 00:00:00
1604	1211	161	t	5	2016-04-12 00:00:00
1605	1211	73	t	4	2015-08-03 00:00:00
1606	1211	241	t	5	2015-06-27 00:00:00
1607	1211	44	t	5	2015-06-27 00:00:00
1608	1211	90	t	5	2014-04-22 00:00:00
1609	1211	40	t	4	2014-04-16 00:00:00
1610	1211	31	t	5	2014-04-16 00:00:00
1611	1211	63	t	4	2014-04-16 00:00:00
1612	1211	23	t	4	2014-04-16 00:00:00
1613	1211	24	t	4	2014-04-16 00:00:00
1614	1211	4	t	5	2014-04-14 00:00:00
1615	1211	55	t	4	2014-04-13 00:00:00
1616	1211	21	t	3	2014-04-13 00:00:00
1617	1211	28	t	3	2014-04-13 00:00:00
1618	1211	66	t	3	2014-04-13 00:00:00
1619	1211	108	t	4	2014-04-13 00:00:00
1620	1211	15	t	4	2014-04-13 00:00:00
1621	1211	67	t	4	2014-04-13 00:00:00
1622	1211	48	t	5	2014-04-13 00:00:00
1623	1211	59	t	4	2014-04-13 00:00:00
1624	1211	86	t	4	2014-04-26 00:00:00
1625	1211	71	t	4	2014-04-13 00:00:00
1626	1211	84	t	4	2014-04-13 00:00:00
1627	1211	7	t	3	2014-04-13 00:00:00
1628	1211	188	t	5	2014-04-13 00:00:00
1629	1211	65	t	4	2014-04-13 00:00:00
1630	1211	145	t	4	2014-04-13 00:00:00
1631	1211	187	t	4	2014-04-13 00:00:00
1632	1211	45	t	5	2014-04-13 00:00:00
1633	1211	226	t	4	2014-04-13 00:00:00
1634	1211	38	t	4	2014-04-13 00:00:00
1635	1211	120	t	5	2014-04-13 00:00:00
1636	1212	121	t	3	2016-10-16 00:00:00
1637	1212	62	t	5	2015-12-19 00:00:00
1638	1212	130	t	4	2015-12-19 00:00:00
1639	1212	77	t	4	2015-10-31 00:00:00
1640	1212	179	t	4	2015-09-16 00:00:00
1641	1212	46	t	5	2015-07-18 00:00:00
1642	1212	24	t	4	2015-03-16 00:00:00
1643	1212	10	t	5	2015-07-18 00:00:00
1644	1212	211	t	4	2015-07-18 00:00:00
1645	1212	69	t	5	2015-04-18 00:00:00
1646	1212	11	t	4	2014-05-20 00:00:00
1647	1212	185	t	4	2014-05-20 00:00:00
1648	1212	7	t	5	2014-05-20 00:00:00
1649	1212	21	t	4	2015-10-04 00:00:00
1650	1212	30	t	4	2014-05-20 00:00:00
1651	1212	5	t	3	2014-05-20 00:00:00
1652	1213	74	t	3	2016-09-19 00:00:00
1653	1213	43	t	5	2016-08-28 00:00:00
1654	1213	145	t	5	2016-08-28 00:00:00
1655	1213	91	t	5	2016-07-29 00:00:00
1656	1213	142	t	5	2016-07-06 00:00:00
1657	1213	94	t	5	2016-07-06 00:00:00
1658	1213	174	t	4	2016-07-06 00:00:00
1659	1213	67	t	5	2016-07-06 00:00:00
1660	1213	86	t	5	2016-07-06 00:00:00
1661	1213	23	t	5	2016-07-06 00:00:00
1662	1213	71	t	5	2016-07-06 00:00:00
1663	1213	9	t	5	2016-07-06 00:00:00
1664	1213	46	t	5	2016-07-06 00:00:00
1665	1213	24	t	5	2016-07-06 00:00:00
1666	1213	45	t	4	2016-07-06 00:00:00
1667	1213	16	t	5	2016-07-06 00:00:00
1668	1213	148	t	5	2016-07-06 00:00:00
1669	1213	2	t	5	2016-07-06 00:00:00
1670	1215	111	t	5	2016-06-07 00:00:00
1671	1215	88	t	5	2016-05-11 00:00:00
1672	1215	93	t	5	2016-01-25 00:00:00
1673	1215	10	t	4	2016-01-25 00:00:00
1674	1215	107	t	5	2016-01-25 00:00:00
1675	1215	120	t	5	2016-01-25 00:00:00
1676	1215	15	t	5	2016-01-25 00:00:00
1677	1215	14	t	5	2016-06-07 00:00:00
1678	1215	7	t	5	2016-01-25 00:00:00
1679	1215	46	t	5	2016-11-07 00:00:00
1680	1215	21	t	5	2016-01-25 00:00:00
1681	1215	1	t	4	2016-01-25 00:00:00
1682	1215	2	t	5	2016-01-25 00:00:00
1683	1217	207	t	4	2016-10-06 00:00:00
1684	1217	33	t	3	2016-10-06 00:00:00
1685	1217	224	t	4	2016-10-01 00:00:00
1686	1217	84	t	5	2016-09-30 00:00:00
1687	1217	63	t	3	2016-11-03 00:00:00
1688	1217	1	t	3	2016-10-05 00:00:00
1689	1217	74	t	3	2016-10-06 00:00:00
1690	1217	71	t	5	2016-10-07 00:00:00
1691	1218	130	t	3	2013-07-11 00:00:00
1692	1218	10	t	2	2013-07-11 00:00:00
1693	1218	61	t	4	2013-07-11 00:00:00
1694	1218	14	t	5	2016-04-08 00:00:00
1695	1218	5	t	3	2013-07-11 00:00:00
1696	1218	16	t	5	2013-07-11 00:00:00
1697	1219	5	t	3	2016-01-27 00:00:00
1698	1219	63	t	4	2015-03-21 00:00:00
1699	1219	130	t	4	2014-05-06 00:00:00
1700	1219	71	t	4	2013-09-18 00:00:00
1701	1220	174	t	5	2015-12-28 00:00:00
1702	1220	16	t	5	2015-12-05 00:00:00
1703	1220	45	t	5	2016-01-15 00:00:00
1704	1220	121	t	5	2015-12-05 00:00:00
1705	1220	47	t	5	2015-12-05 00:00:00
1706	1220	2	t	5	2016-01-16 00:00:00
1707	1221	52	t	5	2016-11-05 00:00:00
1708	1221	20	t	4	2015-04-28 00:00:00
1709	1221	126	t	2	2013-02-17 00:00:00
1710	1221	138	t	3	2013-02-17 00:00:00
1711	1221	87	t	5	2013-02-17 00:00:00
1712	1221	62	t	1	2013-02-17 00:00:00
1713	1221	16	t	5	2013-02-17 00:00:00
1714	1222	105	t	4	2016-08-01 00:00:00
1715	1222	19	t	3	2016-08-01 00:00:00
1716	1222	120	t	3	2016-08-01 00:00:00
1717	1222	46	t	4	2016-08-01 00:00:00
1718	1222	5	t	4	2016-08-01 00:00:00
1719	1222	2	t	5	2016-08-01 00:00:00
1720	1223	221	t	3	2016-05-02 00:00:00
1721	1223	228	t	4	2015-09-14 00:00:00
1722	1223	62	t	4	2014-09-18 00:00:00
1723	1223	92	t	2	2014-04-03 00:00:00
1724	1223	71	t	4	2013-11-30 00:00:00
1725	1223	108	t	5	2013-11-30 00:00:00
1726	1223	22	t	4	2013-11-30 00:00:00
1727	1223	145	t	3	2013-11-30 00:00:00
1728	1223	38	t	4	2013-11-30 00:00:00
1729	1223	7	t	4	2013-11-30 00:00:00
1730	1224	55	t	4	2016-11-04 00:00:00
1731	1224	78	t	5	2016-02-21 00:00:00
1732	1224	80	t	5	2016-06-26 00:00:00
1733	1224	148	t	5	2016-02-21 00:00:00
1734	1224	88	t	5	2016-01-03 00:00:00
1735	1224	16	t	3	2016-06-26 00:00:00
1736	1224	73	t	5	2016-01-10 00:00:00
1737	1224	33	t	5	2016-06-26 00:00:00
1738	1224	44	t	5	2016-01-03 00:00:00
1739	1224	38	t	5	2016-02-21 00:00:00
1740	1224	2	t	5	2016-06-26 00:00:00
1741	1224	5	t	5	2013-12-11 00:00:00
1742	1225	120	t	4	2016-06-20 00:00:00
1743	1225	54	t	3	2016-03-17 00:00:00
1744	1225	107	t	4	2015-02-28 00:00:00
1745	1225	44	t	5	2016-10-05 00:00:00
1746	1225	46	t	3	2016-10-01 00:00:00
1747	1225	211	t	3	2014-01-09 00:00:00
1748	1225	31	t	5	2015-05-20 00:00:00
1749	1225	5	t	2	2015-01-31 00:00:00
1750	1225	2	t	5	2016-07-01 00:00:00
1751	1226	120	t	2	2016-06-04 00:00:00
1752	1226	90	t	1	2016-05-12 00:00:00
1753	1226	21	t	1	2016-08-03 00:00:00
1754	1226	7	t	4	2016-08-03 00:00:00
1755	1226	74	t	5	2016-08-03 00:00:00
1756	1226	45	t	5	2016-08-03 00:00:00
1757	1226	62	t	5	2016-08-03 00:00:00
1758	1226	108	t	2	2016-08-03 00:00:00
1759	1226	16	t	4	2016-08-03 00:00:00
1760	1226	48	t	5	2014-07-08 00:00:00
1761	1226	20	t	5	2014-07-08 00:00:00
1762	1226	84	t	3	2016-08-03 00:00:00
1763	1226	46	t	4	2016-08-03 00:00:00
1764	1226	227	t	4	2016-08-03 00:00:00
1765	1226	66	t	2	2016-08-03 00:00:00
1766	1226	2	t	5	2016-08-03 00:00:00
1767	1226	44	t	5	2016-08-03 00:00:00
1768	1226	59	t	5	2016-08-03 00:00:00
1769	1226	5	t	5	2016-08-03 00:00:00
1770	1226	47	t	3	2016-08-03 00:00:00
1771	1226	67	t	4	2016-08-03 00:00:00
1772	1226	86	t	4	2014-07-08 00:00:00
1773	1227	30	t	4	2016-09-28 00:00:00
1774	1229	104	t	3	2016-10-11 00:00:00
1775	1229	32	t	4	2016-10-07 00:00:00
1776	1229	103	t	3	2016-10-06 00:00:00
1777	1229	168	t	4	2016-10-06 00:00:00
1778	1229	45	t	2	2016-10-06 00:00:00
1779	1229	90	t	4	2016-10-06 00:00:00
1780	1229	3	t	4	2016-10-06 00:00:00
1781	1229	75	t	4	2016-10-06 00:00:00
1782	1229	165	t	4	2016-10-06 00:00:00
1783	1229	195	t	4	2016-04-10 00:00:00
1784	1229	111	t	4	2016-04-10 00:00:00
1785	1229	83	t	3	2016-04-10 00:00:00
1786	1229	70	t	4	2016-04-10 00:00:00
1787	1229	14	t	4	2016-04-10 00:00:00
1788	1229	188	t	4	2016-10-06 00:00:00
1789	1229	9	t	4	2016-04-10 00:00:00
1790	1229	1	t	4	2016-04-10 00:00:00
1791	1229	7	t	5	2016-10-06 00:00:00
1792	1229	46	t	5	2016-04-10 00:00:00
1793	1229	86	t	4	2016-04-10 00:00:00
1794	1229	2	t	4	2016-04-10 00:00:00
1795	1230	165	t	5	2016-11-01 00:00:00
1796	1230	62	t	5	2016-10-09 00:00:00
1797	1231	46	t	5	2016-08-29 00:00:00
1798	1232	226	t	4	2015-08-16 00:00:00
1799	1233	47	t	3	2016-11-03 00:00:00
1800	1233	33	t	3	2016-08-19 00:00:00
1801	1233	2	t	3	2016-08-03 00:00:00
1802	1233	171	t	3	2016-07-07 00:00:00
1803	1233	20	t	3	2015-07-16 00:00:00
1804	1233	203	t	4	2015-07-15 00:00:00
1805	1233	46	t	4	2014-01-27 00:00:00
1806	1233	7	t	3	2013-06-04 00:00:00
1807	1233	130	t	3	2011-08-10 00:00:00
1808	1233	245	t	3	2011-06-29 00:00:00
1809	1233	66	t	4	2011-06-20 00:00:00
1810	1233	21	t	4	2011-06-20 00:00:00
1811	1233	4	t	3	2011-06-20 00:00:00
1812	1233	5	t	4	2011-06-20 00:00:00
1813	1235	61	t	3	2016-04-17 00:00:00
1814	1236	14	t	4	2016-07-13 00:00:00
1815	1236	71	t	4	2015-02-03 00:00:00
1816	1236	23	t	4	2013-07-24 00:00:00
1817	1236	86	t	4	2014-04-25 00:00:00
1818	1236	4	t	3	2013-04-21 00:00:00
1819	1236	65	t	4	2013-04-02 00:00:00
1820	1236	32	t	4	2013-03-17 00:00:00
1821	1236	3	t	5	2013-03-17 00:00:00
1822	1236	16	t	5	2013-06-02 00:00:00
1823	1236	24	t	4	2013-03-03 00:00:00
1824	1236	2	t	4	2013-03-03 00:00:00
1825	1236	5	t	3	2013-03-03 00:00:00
1826	1236	47	t	4	2013-03-03 00:00:00
1827	1236	45	t	5	2013-03-03 00:00:00
1828	1236	126	t	4	2013-03-03 00:00:00
1829	1236	91	t	3	2015-01-14 00:00:00
1830	1236	38	t	5	2013-03-03 00:00:00
1831	1237	104	t	3	2016-10-14 00:00:00
1832	1237	103	t	5	2016-07-21 00:00:00
1833	1237	54	t	4	2016-04-11 00:00:00
1834	1237	61	t	3	2016-04-18 00:00:00
1835	1237	43	t	5	2015-02-23 00:00:00
1836	1237	113	t	5	2015-03-19 00:00:00
1837	1237	80	t	4	2015-03-19 00:00:00
1838	1239	4	t	3	2016-01-04 00:00:00
1839	1240	45	t	3	2016-09-26 00:00:00
1840	1240	5	t	5	2013-07-24 00:00:00
1841	1245	15	t	3	2016-10-31 00:00:00
1842	1245	224	t	4	2016-08-01 00:00:00
1843	1245	4	t	4	2016-06-07 00:00:00
1844	1245	5	t	3	2016-10-26 00:00:00
1845	1245	2	t	4	2016-10-28 00:00:00
1846	1246	103	t	2	2015-12-27 00:00:00
1847	1246	107	t	3	2015-06-04 00:00:00
1848	1246	61	t	3	2015-12-27 00:00:00
1849	1246	47	t	3	2015-11-28 00:00:00
1850	1247	22	t	5	2016-09-14 00:00:00
1851	1247	46	t	4	2016-08-27 00:00:00
1852	1247	86	t	4	2016-08-27 00:00:00
1853	1248	59	t	2	2016-10-16 00:00:00
1854	1248	145	t	3	2013-05-10 00:00:00
1855	1248	44	t	4	2012-12-10 00:00:00
1856	1248	92	t	4	2012-08-30 00:00:00
1857	1248	38	t	3	2015-10-18 00:00:00
1858	1248	203	t	3	2014-07-01 00:00:00
1859	1249	187	t	4	2015-11-28 00:00:00
1860	1249	88	t	3	2015-10-19 00:00:00
1861	1249	200	t	3	2015-10-19 00:00:00
1862	1249	211	t	4	2015-09-20 00:00:00
1863	1249	10	t	3	2015-03-29 00:00:00
1864	1249	29	t	4	2014-12-29 00:00:00
1865	1249	248	t	4	2014-08-24 00:00:00
1866	1249	21	t	3	2014-10-22 00:00:00
1867	1249	59	t	4	2014-07-03 00:00:00
1868	1249	239	t	3	2014-04-22 00:00:00
1869	1249	144	t	3	2014-04-08 00:00:00
1870	1251	92	t	5	2013-03-01 00:00:00
1871	1251	40	t	5	2013-03-01 00:00:00
1872	1251	128	t	4	2012-05-27 00:00:00
1873	1251	159	t	5	2013-03-01 00:00:00
1874	1251	61	t	5	2012-05-27 00:00:00
1875	1252	145	t	5	2016-02-14 00:00:00
1876	1252	48	t	5	2016-02-14 00:00:00
1877	1252	143	t	5	2016-02-14 00:00:00
1878	1252	94	t	4	2016-02-14 00:00:00
1879	1252	88	t	4	2016-02-14 00:00:00
1880	1252	67	t	5	2016-02-14 00:00:00
1881	1252	14	t	5	2016-02-14 00:00:00
1882	1252	188	t	5	2016-02-14 00:00:00
1883	1252	4	t	5	2016-02-14 00:00:00
1884	1252	84	t	4	2016-01-28 00:00:00
1885	1252	133	t	5	2016-01-28 00:00:00
1886	1252	10	t	4	2016-01-02 00:00:00
1887	1252	75	t	2	2013-04-05 00:00:00
1888	1252	86	t	5	2014-04-25 00:00:00
1889	1252	59	t	5	2012-08-26 00:00:00
1890	1252	199	t	4	2012-08-01 00:00:00
1891	1252	120	t	3	2012-08-01 00:00:00
1892	1252	15	t	5	2012-08-01 00:00:00
1893	1253	104	t	4	2016-10-03 00:00:00
1894	1253	45	t	5	2014-07-26 00:00:00
1895	1253	16	t	5	2014-07-26 00:00:00
1896	1254	37	t	2	2015-11-30 00:00:00
1897	1254	31	t	4	2014-11-19 00:00:00
1898	1254	126	t	3	2014-11-25 00:00:00
1899	1254	130	t	2	2015-09-11 00:00:00
1900	1254	21	t	4	2015-07-29 00:00:00
1901	1254	93	t	3	2014-10-19 00:00:00
1902	1254	46	t	5	2015-12-30 00:00:00
1903	1254	4	t	3	2015-12-30 00:00:00
1904	1254	94	t	4	2016-03-31 00:00:00
1905	1254	67	t	5	2016-01-20 00:00:00
1906	1254	24	t	4	2015-12-30 00:00:00
1907	1254	71	t	4	2015-04-16 00:00:00
1908	1256	4	t	4	2016-09-07 00:00:00
1909	1257	203	t	3	2016-10-09 00:00:00
1910	1257	142	t	4	2016-09-01 00:00:00
1911	1257	78	t	3	2015-09-10 00:00:00
1912	1257	73	t	3	2015-09-10 00:00:00
1913	1257	104	t	4	2015-09-10 00:00:00
1914	1257	74	t	3	2016-07-08 00:00:00
1915	1257	75	t	3	2015-09-10 00:00:00
1916	1257	179	t	4	2015-09-10 00:00:00
1917	1257	185	t	4	2015-09-10 00:00:00
1918	1257	52	t	4	2015-09-10 00:00:00
1919	1257	154	t	5	2015-09-10 00:00:00
1920	1257	29	t	3	2015-09-10 00:00:00
1921	1257	88	t	5	2015-09-10 00:00:00
1922	1257	143	t	4	2015-09-10 00:00:00
1923	1257	18	t	4	2015-09-10 00:00:00
1924	1257	243	t	4	2015-09-10 00:00:00
1925	1257	92	t	3	2015-09-10 00:00:00
1926	1257	189	t	4	2015-09-10 00:00:00
1927	1257	43	t	4	2015-09-10 00:00:00
1928	1257	187	t	3	2015-07-31 00:00:00
1929	1257	89	t	4	2015-02-12 00:00:00
1930	1257	111	t	4	2016-04-23 00:00:00
1931	1257	150	t	3	2015-02-12 00:00:00
1932	1257	166	t	3	2015-02-12 00:00:00
1933	1257	240	t	5	2016-04-23 00:00:00
1934	1257	48	t	5	2015-02-12 00:00:00
1935	1257	140	t	5	2016-04-24 00:00:00
1936	1257	133	t	4	2016-04-23 00:00:00
1937	1257	86	t	4	2016-04-24 00:00:00
1938	1257	4	t	4	2015-02-12 00:00:00
1939	1257	14	t	5	2015-02-12 00:00:00
1940	1257	40	t	3	2015-02-12 00:00:00
1941	1257	120	t	3	2015-02-12 00:00:00
1942	1257	105	t	3	2015-02-12 00:00:00
1943	1257	128	t	4	2015-02-12 00:00:00
1944	1257	61	t	2	2015-02-12 00:00:00
1945	1257	239	t	4	2015-02-12 00:00:00
1946	1257	46	t	4	2015-02-12 00:00:00
1947	1257	145	t	3	2015-02-12 00:00:00
1948	1257	10	t	2	2015-02-12 00:00:00
1949	1257	108	t	2	2015-02-12 00:00:00
1950	1257	55	t	3	2015-02-12 00:00:00
1951	1257	21	t	4	2016-10-08 00:00:00
1952	1257	45	t	5	2015-02-12 00:00:00
1953	1257	130	t	1	2015-02-12 00:00:00
1954	1257	20	t	4	2015-02-12 00:00:00
1955	1257	15	t	5	2016-04-24 00:00:00
1956	1257	24	t	3	2015-02-12 00:00:00
1957	1257	171	t	3	2015-02-12 00:00:00
1958	1257	59	t	4	2016-04-24 00:00:00
1959	1257	121	t	3	2015-02-12 00:00:00
1960	1257	37	t	3	2015-02-12 00:00:00
1961	1257	211	t	5	2015-02-24 00:00:00
1962	1257	165	t	5	2015-02-12 00:00:00
1963	1257	119	t	3	2015-02-12 00:00:00
1964	1257	241	t	3	2015-02-12 00:00:00
1965	1257	144	t	4	2016-04-24 00:00:00
1966	1257	26	t	3	2015-02-12 00:00:00
1967	1257	27	t	5	2016-04-24 00:00:00
1968	1257	70	t	4	2015-02-12 00:00:00
1969	1257	95	t	4	2015-02-12 00:00:00
1970	1257	64	t	4	2015-02-12 00:00:00
1971	1257	195	t	4	2015-02-12 00:00:00
1972	1257	63	t	5	2016-04-24 00:00:00
1973	1257	196	t	5	2015-02-12 00:00:00
1974	1257	47	t	3	2015-02-12 00:00:00
1975	1257	66	t	4	2015-02-12 00:00:00
1976	1257	3	t	4	2015-02-12 00:00:00
1977	1257	161	t	4	2016-04-24 00:00:00
1978	1257	174	t	3	2015-02-12 00:00:00
1979	1257	28	t	5	2015-02-12 00:00:00
1980	1257	62	t	3	2015-02-12 00:00:00
1981	1257	33	t	3	2015-02-12 00:00:00
1982	1257	7	t	4	2016-10-09 00:00:00
1983	1257	5	t	3	2015-02-12 00:00:00
1984	1257	16	t	5	2015-02-12 00:00:00
1985	1257	31	t	2	2015-02-12 00:00:00
1986	1257	23	t	3	2016-04-24 00:00:00
1987	1257	38	t	5	2015-02-12 00:00:00
1988	1257	2	t	4	2015-02-12 00:00:00
1989	1257	1	t	2	2016-04-24 00:00:00
1990	1257	67	t	3	2015-02-12 00:00:00
1991	1258	146	t	4	2016-09-17 00:00:00
1992	1258	195	t	4	2016-01-26 00:00:00
1993	1259	128	t	3	2014-11-24 00:00:00
1994	1259	1	t	3	2016-11-03 00:00:00
1995	1259	5	t	4	2015-01-27 00:00:00
1996	1259	188	t	3	2013-08-31 00:00:00
1997	1259	110	t	3	2016-11-03 00:00:00
1998	1260	75	t	2	2016-07-03 00:00:00
1999	1260	188	t	3	2015-12-06 00:00:00
2000	1260	7	t	5	2016-07-30 00:00:00
2001	1263	104	t	4	2016-10-22 00:00:00
2002	1265	167	t	2	2013-10-04 00:00:00
2003	1265	9	t	4	2015-02-15 00:00:00
2004	1267	38	t	2	2015-02-20 00:00:00
2005	1267	121	t	2	2014-09-10 00:00:00
2006	1267	68	t	4	2016-03-07 00:00:00
2007	1268	61	t	2	2015-12-23 00:00:00
2008	1268	175	t	3	2016-02-10 00:00:00
2009	1268	90	t	2	2015-09-22 00:00:00
2010	1268	37	t	4	2015-08-12 00:00:00
2011	1268	63	t	4	2016-03-15 00:00:00
2012	1269	2	t	4	2015-05-29 00:00:00
2013	1269	84	t	5	2014-11-17 00:00:00
2014	1269	75	t	4	2014-11-16 00:00:00
2015	1269	180	t	5	2014-11-16 00:00:00
2016	1269	46	t	4	2014-11-16 00:00:00
2017	1270	120	t	4	2016-04-27 00:00:00
2018	1270	21	t	5	2016-04-27 00:00:00
2019	1270	239	t	3	2016-04-26 00:00:00
2020	1270	7	t	3	2016-04-28 00:00:00
2021	1270	142	t	5	2016-04-26 00:00:00
2022	1270	46	t	5	2016-04-26 00:00:00
2023	1270	5	t	3	2016-04-26 00:00:00
2024	1271	140	t	3	2016-08-16 00:00:00
2025	1271	30	t	5	2016-06-22 00:00:00
2026	1271	133	t	3	2016-06-17 00:00:00
2027	1271	61	t	2	2016-09-09 00:00:00
2028	1271	21	t	3	2016-09-12 00:00:00
2029	1271	23	t	3	2016-01-11 00:00:00
2030	1271	16	t	3	2016-03-02 00:00:00
2031	1271	243	t	4	2016-03-02 00:00:00
2032	1271	29	t	3	2016-03-02 00:00:00
2033	1271	24	t	3	2016-01-26 00:00:00
2034	1271	14	t	4	2016-03-02 00:00:00
2035	1271	64	t	4	2016-03-02 00:00:00
2036	1271	45	t	3	2016-03-02 00:00:00
2037	1271	9	t	4	2016-03-02 00:00:00
2038	1271	4	t	4	2016-05-10 00:00:00
2039	1271	2	t	5	2016-10-05 00:00:00
2040	1271	5	t	4	2016-03-02 00:00:00
2041	1272	145	t	3	2016-09-15 00:00:00
2042	1272	67	t	3	2016-09-15 00:00:00
2043	1272	61	t	4	2016-09-15 00:00:00
2044	1272	39	t	2	2016-09-15 00:00:00
2045	1272	40	t	4	2016-10-12 00:00:00
2046	1273	4	t	4	2015-07-29 00:00:00
2047	1273	174	t	5	2015-06-29 00:00:00
2048	1273	20	t	3	2015-07-29 00:00:00
2049	1273	183	t	4	2015-04-18 00:00:00
2050	1273	86	t	4	2015-04-18 00:00:00
2051	1273	59	t	5	2015-11-04 00:00:00
2052	1273	144	t	3	2015-06-29 00:00:00
2053	1273	73	t	4	2015-04-18 00:00:00
2054	1273	5	t	4	2015-06-29 00:00:00
2055	1273	62	t	5	2015-04-18 00:00:00
2056	1273	130	t	4	2015-11-04 00:00:00
2057	1273	21	t	5	2016-05-31 00:00:00
2058	1274	33	t	2	2016-07-05 00:00:00
2059	1274	67	t	5	2016-04-07 00:00:00
2060	1274	195	t	4	2016-03-03 00:00:00
2061	1274	28	t	4	2016-03-29 00:00:00
2062	1274	11	t	3	2015-12-20 00:00:00
2063	1274	93	t	5	2015-12-19 00:00:00
2064	1274	5	t	3	2015-12-18 00:00:00
2065	1274	1	t	5	2015-12-18 00:00:00
2066	1274	66	t	4	2015-12-18 00:00:00
2067	1274	71	t	4	2015-12-18 00:00:00
2068	1275	7	t	5	2016-08-17 00:00:00
2069	1275	15	t	4	2016-04-10 00:00:00
2070	1275	20	t	3	2016-03-01 00:00:00
2071	1275	46	t	4	2016-01-11 00:00:00
2072	1277	31	t	4	2016-10-06 00:00:00
2073	1277	94	t	5	2016-01-29 00:00:00
2074	1277	10	t	4	2016-01-29 00:00:00
2075	1277	65	t	4	2016-01-29 00:00:00
2076	1277	145	t	4	2016-01-29 00:00:00
2077	1277	44	t	5	2016-01-28 00:00:00
2078	1279	206	t	5	2016-08-21 00:00:00
2079	1279	148	t	5	2016-08-21 00:00:00
2080	1280	143	t	5	2016-07-11 00:00:00
2081	1280	93	t	4	2016-02-12 00:00:00
2082	1280	69	t	4	2015-03-15 00:00:00
2083	1280	78	t	4	2015-01-18 00:00:00
2084	1280	157	t	4	2014-04-14 00:00:00
2085	1280	84	t	5	2014-04-14 00:00:00
2086	1280	29	t	5	2014-04-14 00:00:00
2087	1280	104	t	5	2016-07-06 00:00:00
2088	1280	55	t	5	2012-07-26 00:00:00
2089	1280	89	t	2	2016-07-11 00:00:00
2090	1280	171	t	4	2012-07-26 00:00:00
2091	1280	47	t	4	2012-07-26 00:00:00
2092	1280	107	t	5	2012-07-26 00:00:00
2093	1280	241	t	2	2012-07-25 00:00:00
2094	1280	64	t	5	2012-07-25 00:00:00
2095	1280	14	t	5	2016-07-11 00:00:00
2096	1280	11	t	4	2011-12-08 00:00:00
2097	1280	119	t	4	2010-07-18 00:00:00
2098	1280	88	t	5	2016-07-08 00:00:00
2099	1280	3	t	5	2010-05-17 00:00:00
2100	1280	120	t	5	2010-05-17 00:00:00
2101	1280	15	t	5	2010-05-17 00:00:00
2102	1280	33	t	5	2010-05-17 00:00:00
2103	1280	2	t	5	2010-05-17 00:00:00
2104	1280	66	t	4	2016-06-12 00:00:00
2105	1280	38	t	4	2016-07-06 00:00:00
2106	1280	21	t	5	2010-05-17 00:00:00
2107	1280	4	t	3	2016-07-11 00:00:00
2108	1280	5	t	5	2016-10-28 00:00:00
2109	1281	75	t	4	2013-01-09 00:00:00
2110	1281	120	t	5	2014-09-03 00:00:00
2111	1281	45	t	5	2011-04-29 00:00:00
2112	1282	80	t	3	2011-11-17 00:00:00
2113	1282	47	t	3	2011-05-21 00:00:00
2114	1282	211	t	5	2011-05-21 00:00:00
2115	1282	84	t	3	2011-05-21 00:00:00
2116	1282	33	t	4	2011-05-21 00:00:00
2117	1282	14	t	5	2011-05-21 00:00:00
2118	1282	165	t	5	2011-05-21 00:00:00
2119	1282	24	t	5	2011-05-21 00:00:00
2120	1282	9	t	4	2011-05-21 00:00:00
2121	1282	5	t	2	2011-11-17 00:00:00
2122	1282	4	t	4	2011-05-21 00:00:00
2123	1282	2	t	5	2011-05-21 00:00:00
2124	1282	71	t	5	2011-05-21 00:00:00
2125	1283	68	t	5	2015-09-13 00:00:00
2126	1283	121	t	5	2015-06-16 00:00:00
2127	1283	150	t	3	2015-06-16 00:00:00
2128	1283	47	t	4	2015-06-16 00:00:00
2129	1283	33	t	4	2015-06-16 00:00:00
2130	1283	24	t	4	2012-10-26 00:00:00
2131	1283	5	t	4	2015-06-16 00:00:00
2132	1283	2	t	3	2015-06-16 00:00:00
2133	1284	16	t	5	2016-05-19 00:00:00
2134	1287	133	t	3	2016-06-11 00:00:00
2135	1289	134	t	3	2016-05-23 00:00:00
2136	1289	171	t	3	2015-08-23 00:00:00
2137	1289	213	t	4	2014-12-31 00:00:00
2138	1289	243	t	3	2016-09-01 00:00:00
2139	1289	52	t	3	2016-05-23 00:00:00
2140	1289	239	t	3	2015-06-30 00:00:00
2141	1289	24	t	3	2015-07-19 00:00:00
2142	1289	130	t	3	2016-03-08 00:00:00
2143	1289	59	t	3	2016-05-29 00:00:00
2144	1289	165	t	4	2016-04-28 00:00:00
2145	1289	45	t	4	2014-12-31 00:00:00
2146	1289	5	t	4	2015-02-04 00:00:00
2147	1289	16	t	4	2015-07-05 00:00:00
2148	1289	40	t	4	2014-12-31 00:00:00
2149	1289	80	t	3	2011-08-31 00:00:00
2150	1289	1	t	3	2014-12-31 00:00:00
2151	1289	203	t	3	2014-12-31 00:00:00
2152	1289	15	t	3	2014-12-31 00:00:00
2153	1289	2	t	3	2014-12-31 00:00:00
2154	1289	64	t	3	2014-03-11 00:00:00
2155	1289	84	t	3	2014-12-31 00:00:00
2156	1289	14	t	4	2014-03-14 00:00:00
2157	1289	199	t	4	2014-03-11 00:00:00
2158	1289	106	t	1	2011-06-23 00:00:00
2159	1289	175	t	2	2014-03-14 00:00:00
2160	1289	133	t	3	2014-03-14 00:00:00
2161	1289	39	t	3	2014-03-14 00:00:00
2162	1289	55	t	3	2014-12-31 00:00:00
2163	1289	93	t	2	2014-12-31 00:00:00
2164	1289	22	t	3	2011-06-20 00:00:00
2165	1289	145	t	3	2014-12-31 00:00:00
2166	1289	168	t	3	2014-12-31 00:00:00
2167	1289	31	t	2	2014-12-31 00:00:00
2168	1289	188	t	4	2014-12-31 00:00:00
2169	1289	46	t	4	2014-12-31 00:00:00
2170	1289	120	t	2	2014-12-31 00:00:00
2171	1289	37	t	5	2014-12-31 00:00:00
2172	1289	65	t	2	2014-12-31 00:00:00
2173	1289	10	t	3	2014-12-31 00:00:00
2174	1289	32	t	4	2014-03-14 00:00:00
2175	1289	167	t	4	2014-03-14 00:00:00
2176	1289	72	t	5	2014-03-14 00:00:00
2177	1289	75	t	2	2014-03-14 00:00:00
2178	1289	3	t	5	2014-12-31 00:00:00
2179	1289	48	t	4	2014-12-31 00:00:00
2180	1290	180	t	4	2016-10-10 00:00:00
2181	1290	191	t	4	2016-10-30 00:00:00
2182	1290	104	t	4	2016-10-10 00:00:00
2183	1290	46	t	5	2016-11-08 00:00:00
2184	1290	103	t	4	2016-10-10 00:00:00
2185	1290	203	t	4	2016-10-10 00:00:00
2186	1290	187	t	5	2016-09-08 00:00:00
2187	1290	29	t	4	2016-09-19 00:00:00
2188	1290	78	t	4	2016-10-02 00:00:00
2189	1290	75	t	4	2016-08-20 00:00:00
2190	1290	130	t	4	2016-10-10 00:00:00
2191	1290	63	t	5	2016-10-10 00:00:00
2192	1290	7	t	5	2016-10-23 00:00:00
2193	1290	34	t	3	2016-07-28 00:00:00
2194	1290	23	t	5	2016-08-18 00:00:00
2195	1291	7	t	3	2016-11-09 00:00:00
2196	1291	111	t	3	2016-10-03 00:00:00
2197	1291	29	t	2	2016-03-18 00:00:00
2198	1291	157	t	2	2016-03-14 00:00:00
2199	1291	78	t	2	2016-03-21 00:00:00
2200	1291	2	t	3	2014-05-27 00:00:00
2201	1291	88	t	2	2014-01-20 00:00:00
2202	1291	9	t	3	2016-10-03 00:00:00
2203	1291	62	t	4	2013-11-15 00:00:00
2204	1291	46	t	2	2015-02-24 00:00:00
2205	1291	61	t	2	2016-10-03 00:00:00
2206	1291	14	t	2	2013-08-02 00:00:00
2207	1291	45	t	2	2016-10-11 00:00:00
2208	1291	21	t	1	2016-03-22 00:00:00
2209	1291	48	t	2	2016-10-03 00:00:00
2210	1291	144	t	1	2016-10-03 00:00:00
2211	1291	188	t	1	2016-10-03 00:00:00
2212	1291	5	t	2	2016-10-03 00:00:00
2213	1292	16	t	3	2015-07-03 00:00:00
2214	1292	142	t	2	2014-01-07 00:00:00
2215	1292	45	t	4	2012-12-15 00:00:00
2216	1293	78	t	3	2016-09-15 00:00:00
2217	1293	231	t	3	2016-07-27 00:00:00
2218	1293	40	t	4	2016-04-27 00:00:00
2219	1293	54	t	3	2016-05-15 00:00:00
2220	1293	20	t	3	2016-06-15 00:00:00
2221	1293	3	t	4	2016-04-05 00:00:00
2222	1293	61	t	3	2016-05-05 00:00:00
2223	1293	187	t	4	2016-07-21 00:00:00
2224	1293	144	t	3	2016-01-10 00:00:00
2225	1293	119	t	3	2015-12-28 00:00:00
2226	1293	211	t	3	2016-05-05 00:00:00
2227	1293	227	t	4	2015-07-16 00:00:00
2228	1293	203	t	4	2015-04-10 00:00:00
2229	1293	52	t	3	2015-03-24 00:00:00
2230	1293	37	t	3	2014-10-16 00:00:00
2231	1293	104	t	4	2016-10-05 00:00:00
2232	1293	175	t	3	2014-09-05 00:00:00
2233	1293	120	t	4	2014-08-25 00:00:00
2234	1293	48	t	4	2014-06-27 00:00:00
2235	1293	221	t	4	2014-06-20 00:00:00
2236	1293	228	t	4	2014-06-20 00:00:00
2237	1293	63	t	5	2014-06-19 00:00:00
2238	1293	80	t	3	2015-08-31 00:00:00
2239	1293	165	t	3	2014-06-25 00:00:00
2240	1293	23	t	3	2014-12-04 00:00:00
2241	1293	10	t	3	2014-10-12 00:00:00
2242	1293	59	t	4	2016-05-05 00:00:00
2243	1293	86	t	4	2016-05-05 00:00:00
2244	1293	71	t	4	2015-01-01 00:00:00
2245	1293	84	t	4	2014-04-20 00:00:00
2246	1293	46	t	4	2016-05-05 00:00:00
2247	1293	26	t	4	2015-05-02 00:00:00
2248	1293	126	t	4	2014-11-29 00:00:00
2249	1293	65	t	3	2014-11-30 00:00:00
2250	1293	145	t	4	2015-08-31 00:00:00
2251	1293	201	t	4	2016-01-04 00:00:00
2252	1293	130	t	4	2016-01-21 00:00:00
2253	1293	128	t	3	2015-01-10 00:00:00
2254	1293	11	t	5	2015-05-25 00:00:00
2255	1294	126	t	4	2015-08-02 00:00:00
2256	1294	11	t	4	2016-03-10 00:00:00
2257	1294	161	t	4	2014-09-21 00:00:00
2258	1294	174	t	2	2013-05-27 00:00:00
2259	1294	2	t	5	2013-02-04 00:00:00
2260	1294	94	t	5	2015-04-27 00:00:00
2261	1294	67	t	5	2013-02-04 00:00:00
2262	1294	171	t	5	2013-02-04 00:00:00
2263	1294	28	t	5	2013-09-18 00:00:00
2264	1294	84	t	5	2013-02-04 00:00:00
2265	1294	71	t	5	2013-02-04 00:00:00
2266	1294	38	t	5	2014-07-03 00:00:00
2267	1294	33	t	5	2013-02-04 00:00:00
2268	1294	188	t	5	2013-12-22 00:00:00
2269	1294	91	t	5	2013-02-04 00:00:00
2270	1294	47	t	5	2013-02-04 00:00:00
2271	1294	44	t	5	2013-02-04 00:00:00
2272	1294	31	t	5	2013-02-04 00:00:00
2273	1294	45	t	5	2013-02-04 00:00:00
2274	1294	227	t	5	2013-02-04 00:00:00
2275	1294	160	t	5	2013-02-04 00:00:00
2276	1294	121	t	5	2013-02-04 00:00:00
2277	1294	179	t	5	2013-02-04 00:00:00
2278	1294	16	t	5	2013-02-04 00:00:00
2279	1295	61	t	4	2015-10-07 00:00:00
2280	1295	44	t	3	2015-01-11 00:00:00
2281	1295	31	t	4	2014-09-29 00:00:00
2282	1295	46	t	4	2014-09-29 00:00:00
2283	1295	59	t	4	2014-09-29 00:00:00
2284	1295	21	t	4	2014-09-29 00:00:00
2285	1295	24	t	4	2014-09-29 00:00:00
2286	1295	121	t	4	2014-08-24 00:00:00
2287	1295	133	t	5	2014-07-26 00:00:00
2288	1295	149	t	4	2014-07-26 00:00:00
2289	1295	48	t	3	2014-07-26 00:00:00
2290	1295	111	t	5	2014-07-26 00:00:00
2291	1295	28	t	4	2014-07-26 00:00:00
2292	1295	120	t	3	2014-07-26 00:00:00
2293	1295	15	t	4	2014-07-26 00:00:00
2294	1295	64	t	3	2014-07-26 00:00:00
2295	1295	29	t	3	2014-07-26 00:00:00
2296	1295	171	t	4	2014-07-26 00:00:00
2297	1295	47	t	5	2015-01-01 00:00:00
2298	1295	2	t	4	2014-07-26 00:00:00
2299	1295	95	t	4	2014-04-27 00:00:00
2300	1295	33	t	3	2014-04-27 00:00:00
2301	1295	4	t	4	2014-04-27 00:00:00
2302	1295	179	t	5	2014-04-27 00:00:00
2303	1295	91	t	5	2014-04-27 00:00:00
2304	1295	126	t	5	2014-04-27 00:00:00
2305	1295	45	t	5	2014-04-27 00:00:00
2306	1295	16	t	5	2014-04-27 00:00:00
2307	1295	5	t	4	2014-04-27 00:00:00
2308	1296	11	t	3	2015-09-06 00:00:00
2309	1298	62	t	3	2016-11-10 00:00:00
2310	1298	148	t	3	2016-10-25 00:00:00
2311	1298	31	t	3	2016-10-16 00:00:00
2312	1298	241	t	3	2016-08-14 00:00:00
2313	1298	171	t	3	2016-08-14 00:00:00
2314	1298	26	t	3	2016-08-14 00:00:00
2315	1298	71	t	5	2016-08-14 00:00:00
2316	1298	29	t	3	2016-07-14 00:00:00
2317	1298	211	t	4	2016-06-26 00:00:00
2318	1298	168	t	3	2016-08-14 00:00:00
2319	1298	110	t	2	2016-06-07 00:00:00
2320	1298	134	t	3	2016-08-14 00:00:00
2321	1298	61	t	3	2016-06-07 00:00:00
2322	1298	40	t	3	2016-06-07 00:00:00
2323	1298	157	t	3	2016-05-22 00:00:00
2324	1298	14	t	3	2016-05-19 00:00:00
2325	1298	91	t	5	2016-06-27 00:00:00
2326	1298	59	t	4	2016-06-27 00:00:00
2327	1298	245	t	1	2016-04-26 00:00:00
2328	1298	84	t	3	2016-06-27 00:00:00
2329	1298	7	t	4	2016-08-14 00:00:00
2330	1298	47	t	3	2016-06-27 00:00:00
2331	1298	9	t	3	2016-06-27 00:00:00
2332	1298	94	t	5	2016-06-27 00:00:00
2333	1298	179	t	5	2016-06-27 00:00:00
2334	1298	1	t	3	2016-06-27 00:00:00
2335	1298	2	t	5	2016-06-27 00:00:00
2336	1298	44	t	5	2016-06-27 00:00:00
2337	1298	15	t	3	2016-04-26 00:00:00
2338	1298	228	t	4	2016-04-26 00:00:00
2339	1298	63	t	5	2016-06-27 00:00:00
2340	1298	188	t	5	2016-06-27 00:00:00
2341	1298	67	t	3	2016-06-27 00:00:00
2342	1298	33	t	5	2016-06-27 00:00:00
2343	1298	121	t	5	2016-06-27 00:00:00
2344	1298	46	t	2	2016-04-26 00:00:00
2345	1298	165	t	2	2016-06-27 00:00:00
2346	1298	160	t	4	2016-06-27 00:00:00
2347	1298	3	t	4	2016-06-27 00:00:00
2348	1298	66	t	3	2016-06-27 00:00:00
2349	1298	24	t	3	2016-06-27 00:00:00
2350	1298	126	t	5	2016-06-27 00:00:00
2351	1298	174	t	2	2016-06-27 00:00:00
2352	1298	196	t	4	2016-06-27 00:00:00
2353	1298	161	t	3	2016-06-27 00:00:00
2354	1298	20	t	3	2016-06-27 00:00:00
2355	1298	27	t	2	2016-04-26 00:00:00
2356	1298	120	t	4	2016-08-14 00:00:00
2357	1298	23	t	5	2016-06-27 00:00:00
2358	1298	130	t	3	2016-04-26 00:00:00
2359	1298	45	t	2	2016-06-27 00:00:00
2360	1298	16	t	4	2016-06-27 00:00:00
2361	1298	5	t	4	2016-06-27 00:00:00
2362	1299	130	t	3	2016-03-07 00:00:00
2363	1302	188	t	5	2016-06-02 00:00:00
2364	1302	120	t	4	2016-06-02 00:00:00
2365	1302	113	t	5	2011-01-22 00:00:00
2366	1302	20	t	5	2011-01-20 00:00:00
2367	1302	27	t	4	2011-01-20 00:00:00
2368	1302	144	t	4	2011-01-20 00:00:00
2369	1302	40	t	4	2011-01-20 00:00:00
2370	1302	210	t	5	2011-01-19 00:00:00
2371	1302	65	t	5	2011-01-19 00:00:00
2372	1302	22	t	5	2011-01-19 00:00:00
2373	1302	26	t	5	2011-01-19 00:00:00
2374	1302	10	t	5	2011-01-19 00:00:00
2375	1302	87	t	4	2011-01-19 00:00:00
2376	1302	105	t	5	2011-01-19 00:00:00
2377	1302	80	t	5	2011-01-19 00:00:00
2378	1302	111	t	5	2011-01-19 00:00:00
2379	1302	143	t	5	2011-01-19 00:00:00
2380	1302	88	t	5	2011-01-19 00:00:00
2381	1302	29	t	5	2016-07-14 00:00:00
2382	1302	14	t	5	2011-01-19 00:00:00
2383	1302	9	t	5	2011-01-19 00:00:00
2384	1302	44	t	5	2011-01-19 00:00:00
2385	1302	185	t	5	2011-01-19 00:00:00
2386	1302	64	t	5	2011-01-19 00:00:00
2387	1302	165	t	4	2011-01-18 00:00:00
2388	1302	28	t	5	2011-01-18 00:00:00
2389	1302	2	t	4	2011-01-18 00:00:00
2390	1302	38	t	4	2011-01-18 00:00:00
2391	1302	31	t	5	2011-01-18 00:00:00
2392	1302	21	t	5	2011-01-18 00:00:00
2393	1302	59	t	5	2011-01-18 00:00:00
2394	1302	4	t	5	2011-01-18 00:00:00
2395	1302	5	t	4	2011-01-18 00:00:00
2396	1303	44	t	3	2014-09-15 00:00:00
2397	1304	1	t	3	2015-12-22 00:00:00
2398	1304	44	t	5	2015-08-06 00:00:00
2399	1304	190	t	2	2014-07-03 00:00:00
2400	1304	65	t	3	2014-08-13 00:00:00
2401	1304	89	t	1	2012-05-18 00:00:00
2402	1304	27	t	4	2014-08-13 00:00:00
2403	1305	188	t	4	2015-06-14 00:00:00
2404	1306	104	t	2	2015-11-02 00:00:00
2405	1306	144	t	2	2015-12-10 00:00:00
2406	1306	185	t	1	2016-02-16 00:00:00
2407	1306	119	t	2	2015-11-19 00:00:00
2408	1306	59	t	3	2015-12-06 00:00:00
2409	1306	89	t	3	2015-11-02 00:00:00
2410	1307	45	t	1	2016-10-12 00:00:00
2411	1307	84	t	3	2016-10-12 00:00:00
2412	1307	78	t	3	2016-09-01 00:00:00
2413	1307	48	t	4	2016-08-17 00:00:00
2414	1307	62	t	3	2016-05-18 00:00:00
2415	1307	27	t	4	2015-05-30 00:00:00
2416	1307	121	t	5	2016-05-18 00:00:00
2417	1307	227	t	5	2016-05-18 00:00:00
2418	1307	33	t	5	2016-05-18 00:00:00
2419	1307	16	t	5	2016-05-18 00:00:00
2420	1307	2	t	5	2016-05-18 00:00:00
2421	1308	34	t	3	2015-01-06 00:00:00
2422	1308	181	t	2	2014-11-25 00:00:00
2423	1308	174	t	3	2014-09-14 00:00:00
2424	1309	16	t	4	2016-10-20 00:00:00
2425	1309	227	t	4	2013-11-04 00:00:00
2426	1309	121	t	4	2013-11-04 00:00:00
2427	1309	45	t	4	2013-11-04 00:00:00
2428	1309	2	t	4	2013-11-04 00:00:00
2429	1309	5	t	4	2013-11-04 00:00:00
2430	1309	148	t	4	2013-11-04 00:00:00
2431	1309	63	t	4	2013-11-04 00:00:00
2432	1310	98	t	3	2014-08-04 00:00:00
2433	1310	140	t	4	2013-12-04 00:00:00
2434	1310	187	t	4	2013-12-01 00:00:00
2435	1310	107	t	4	2013-12-01 00:00:00
2436	1310	1	t	4	2013-11-16 00:00:00
2437	1310	195	t	4	2013-09-15 00:00:00
2438	1310	103	t	5	2013-07-26 00:00:00
2439	1310	73	t	2	2013-06-24 00:00:00
2440	1310	55	t	3	2013-06-24 00:00:00
2441	1310	108	t	2	2013-06-24 00:00:00
2442	1310	84	t	2	2013-06-24 00:00:00
2443	1310	18	t	3	2013-06-24 00:00:00
2444	1310	11	t	4	2013-06-24 00:00:00
2445	1310	64	t	2	2013-06-24 00:00:00
2446	1310	188	t	4	2013-06-24 00:00:00
2447	1310	86	t	4	2014-04-25 00:00:00
2448	1310	38	t	2	2013-06-24 00:00:00
2449	1310	9	t	4	2013-06-24 00:00:00
2450	1310	4	t	3	2013-06-24 00:00:00
2451	1310	5	t	4	2013-07-30 00:00:00
2452	1310	27	t	4	2015-08-19 00:00:00
2453	1310	70	t	3	2013-03-15 00:00:00
2454	1310	142	t	4	2014-09-26 00:00:00
2455	1310	83	t	3	2013-11-23 00:00:00
2456	1310	120	t	5	2013-03-15 00:00:00
2457	1310	15	t	4	2013-06-24 00:00:00
2458	1310	46	t	5	2016-05-26 00:00:00
2459	1310	61	t	3	2013-03-15 00:00:00
2460	1310	128	t	5	2016-05-26 00:00:00
2461	1310	174	t	2	2013-03-15 00:00:00
2462	1310	16	t	3	2013-03-15 00:00:00
2463	1310	7	t	4	2013-03-15 00:00:00
2464	1310	21	t	1	2013-03-15 00:00:00
2465	1310	2	t	3	2013-03-15 00:00:00
2466	1310	28	t	2	2013-03-15 00:00:00
2467	1310	236	t	5	2016-05-26 00:00:00
2468	1310	165	t	5	2016-05-26 00:00:00
2469	1311	179	t	5	2016-10-31 00:00:00
2470	1311	45	t	5	2016-03-23 00:00:00
2471	1311	74	t	5	2016-04-02 00:00:00
2472	1311	47	t	5	2016-03-23 00:00:00
2473	1311	165	t	5	2016-03-23 00:00:00
2474	1311	16	t	5	2015-05-24 00:00:00
2475	1312	211	t	3	2016-09-12 00:00:00
2476	1312	5	t	1	2016-02-07 00:00:00
2477	1313	120	t	4	2016-04-15 00:00:00
2478	1313	210	t	5	2014-09-02 00:00:00
2479	1313	80	t	4	2013-06-18 00:00:00
2480	1313	105	t	3	2013-06-11 00:00:00
2481	1313	40	t	1	2013-06-11 00:00:00
2482	1313	243	t	1	2013-06-11 00:00:00
2483	1314	64	t	5	2014-03-13 00:00:00
2484	1314	11	t	4	2014-03-13 00:00:00
2485	1314	7	t	4	2014-03-13 00:00:00
2486	1314	44	t	3	2014-03-13 00:00:00
2487	1314	86	t	3	2014-04-26 00:00:00
2488	1314	4	t	2	2014-03-13 00:00:00
2489	1314	26	t	3	2014-03-13 00:00:00
2490	1314	5	t	3	2014-03-13 00:00:00
2491	1315	145	t	4	2016-11-01 00:00:00
2492	1315	15	t	4	2016-11-01 00:00:00
2493	1315	43	t	5	2016-09-30 00:00:00
2494	1315	47	t	3	2016-10-07 00:00:00
2495	1315	154	t	5	2016-06-26 00:00:00
2496	1315	14	t	5	2016-06-26 00:00:00
2497	1315	65	t	3	2016-04-22 00:00:00
2498	1315	128	t	4	2016-09-29 00:00:00
2499	1315	28	t	5	2016-04-22 00:00:00
2500	1315	52	t	2	2016-10-07 00:00:00
2501	1315	91	t	5	2016-04-22 00:00:00
2502	1315	7	t	5	2016-10-07 00:00:00
2503	1315	130	t	5	2016-10-07 00:00:00
2504	1315	16	t	5	2016-10-07 00:00:00
2505	1315	45	t	3	2016-10-10 00:00:00
2506	1315	83	t	3	2016-10-07 00:00:00
2507	1315	195	t	4	2016-04-28 00:00:00
2508	1315	31	t	5	2016-10-30 00:00:00
2509	1315	60	t	4	2015-11-14 00:00:00
2510	1315	114	t	4	2015-11-14 00:00:00
2511	1315	72	t	4	2015-11-14 00:00:00
2512	1315	48	t	4	2015-11-14 00:00:00
2513	1315	32	t	4	2015-11-14 00:00:00
2514	1315	3	t	4	2015-11-14 00:00:00
2515	1315	90	t	4	2015-11-14 00:00:00
2516	1315	33	t	5	2016-10-07 00:00:00
2517	1315	211	t	5	2015-11-14 00:00:00
2518	1315	25	t	4	2016-02-29 00:00:00
2519	1315	92	t	4	2015-11-14 00:00:00
2520	1315	127	t	4	2015-11-14 00:00:00
2521	1315	189	t	4	2015-11-14 00:00:00
2522	1315	75	t	4	2015-11-14 00:00:00
2523	1315	1	t	3	2016-03-04 00:00:00
2524	1315	55	t	3	2015-11-14 00:00:00
2525	1315	84	t	4	2015-11-14 00:00:00
2526	1315	142	t	5	2015-11-14 00:00:00
2527	1315	120	t	4	2016-10-07 00:00:00
2528	1315	171	t	4	2015-11-14 00:00:00
2529	1315	9	t	5	2016-10-07 00:00:00
2530	1315	71	t	5	2015-11-14 00:00:00
2531	1315	21	t	3	2015-11-14 00:00:00
2532	1315	4	t	4	2015-11-14 00:00:00
2533	1315	2	t	5	2015-11-14 00:00:00
2534	1317	179	t	5	2016-02-14 00:00:00
2535	1317	16	t	5	2016-10-23 00:00:00
2536	1317	45	t	5	2016-11-12 00:00:00
2537	1317	160	t	3	2016-02-14 00:00:00
2538	1317	2	t	5	2016-02-16 00:00:00
2539	1317	94	t	5	2016-07-07 00:00:00
2540	1317	44	t	4	2016-02-14 00:00:00
2541	1317	54	t	3	2016-04-17 00:00:00
2542	1317	52	t	1	2016-04-05 00:00:00
2543	1317	166	t	1	2016-11-07 00:00:00
2544	1317	47	t	2	2016-10-29 00:00:00
2545	1317	121	t	2	2016-04-22 00:00:00
2546	1317	20	t	2	2016-02-14 00:00:00
2547	1317	84	t	3	2015-12-12 00:00:00
2548	1317	105	t	3	2015-11-15 00:00:00
2549	1320	239	t	3	2016-11-11 00:00:00
2550	1320	120	t	4	2016-10-28 00:00:00
2551	1320	21	t	4	2016-09-27 00:00:00
2552	1320	4	t	3	2015-05-02 00:00:00
2553	1320	207	t	4	2015-04-30 00:00:00
2554	1320	111	t	4	2015-04-30 00:00:00
2555	1320	179	t	4	2015-06-26 00:00:00
2556	1320	9	t	3	2015-04-30 00:00:00
2557	1320	108	t	3	2015-04-30 00:00:00
2558	1320	55	t	2	2015-04-30 00:00:00
2559	1320	196	t	4	2015-04-30 00:00:00
2560	1320	62	t	5	2015-04-30 00:00:00
2561	1320	46	t	5	2014-06-24 00:00:00
2562	1320	201	t	4	2015-12-26 00:00:00
2563	1320	171	t	5	2015-04-30 00:00:00
2564	1320	33	t	5	2015-04-30 00:00:00
2565	1320	121	t	5	2015-04-30 00:00:00
2566	1320	47	t	5	2015-04-30 00:00:00
2567	1320	16	t	5	2015-04-30 00:00:00
2568	1320	45	t	4	2016-09-30 00:00:00
2569	1320	150	t	3	2014-01-15 00:00:00
2570	1320	2	t	5	2015-04-30 00:00:00
2571	1320	5	t	5	2016-09-28 00:00:00
2572	1321	31	t	5	2016-01-19 00:00:00
2573	1321	38	t	4	2015-07-07 00:00:00
2574	1321	90	t	4	2013-01-30 00:00:00
2575	1321	21	t	4	2016-06-18 00:00:00
2576	1321	27	t	5	2012-09-15 00:00:00
2577	1321	67	t	5	2012-06-14 00:00:00
2578	1321	93	t	2	2016-06-07 00:00:00
2579	1322	1	t	5	2016-10-11 00:00:00
2580	1322	37	t	5	2016-04-15 00:00:00
2581	1322	65	t	3	2016-04-15 00:00:00
2582	1322	22	t	4	2016-04-15 00:00:00
2583	1322	145	t	4	2015-12-06 00:00:00
2584	1322	86	t	5	2016-04-19 00:00:00
2585	1322	148	t	4	2016-01-05 00:00:00
2586	1322	80	t	4	2016-04-19 00:00:00
2587	1322	44	t	4	2013-12-29 00:00:00
2588	1322	7	t	4	2015-06-09 00:00:00
2589	1322	10	t	4	2016-01-05 00:00:00
2590	1322	114	t	5	2016-04-19 00:00:00
2591	1322	90	t	5	2016-04-19 00:00:00
2592	1322	72	t	5	2016-04-19 00:00:00
2593	1322	48	t	5	2016-04-19 00:00:00
2594	1322	32	t	4	2016-04-19 00:00:00
2595	1322	75	t	5	2016-04-19 00:00:00
2596	1322	3	t	5	2016-04-19 00:00:00
2597	1323	23	t	5	2014-02-27 00:00:00
2598	1323	38	t	5	2014-02-27 00:00:00
2599	1323	46	t	3	2014-02-27 00:00:00
2600	1323	130	t	4	2014-02-27 00:00:00
2601	1323	171	t	3	2014-02-27 00:00:00
2602	1323	121	t	5	2014-02-27 00:00:00
2603	1323	47	t	4	2014-02-27 00:00:00
2604	1323	33	t	4	2014-02-27 00:00:00
2605	1323	148	t	5	2014-02-27 00:00:00
2606	1323	24	t	5	2014-02-27 00:00:00
2607	1323	160	t	4	2014-02-27 00:00:00
2608	1323	45	t	4	2014-02-27 00:00:00
2609	1323	91	t	3	2014-02-27 00:00:00
2610	1323	2	t	5	2014-02-27 00:00:00
2611	1323	5	t	4	2014-02-27 00:00:00
2612	1323	16	t	5	2014-02-27 00:00:00
2613	1324	66	t	4	2016-10-26 00:00:00
2614	1324	150	t	4	2015-12-05 00:00:00
2615	1324	5	t	5	2015-12-05 00:00:00
2616	1324	14	t	5	2015-12-05 00:00:00
2617	1324	88	t	3	2015-12-05 00:00:00
2618	1324	4	t	4	2015-12-05 00:00:00
2619	1325	84	t	4	2016-09-12 00:00:00
2620	1325	68	t	4	2016-08-10 00:00:00
2621	1325	199	t	4	2016-07-12 00:00:00
2622	1325	160	t	5	2016-04-17 00:00:00
2623	1325	67	t	5	2016-04-15 00:00:00
2624	1325	38	t	4	2016-04-15 00:00:00
2625	1325	59	t	5	2016-04-15 00:00:00
2626	1325	11	t	5	2016-04-15 00:00:00
2627	1325	31	t	5	2016-04-15 00:00:00
2628	1325	46	t	4	2016-04-15 00:00:00
2629	1325	1	t	5	2016-04-15 00:00:00
2630	1325	5	t	3	2016-04-15 00:00:00
2631	1325	120	t	4	2016-04-12 00:00:00
2632	1325	16	t	5	2016-04-12 00:00:00
2633	1325	33	t	4	2016-04-12 00:00:00
2634	1325	171	t	5	2016-04-12 00:00:00
2635	1325	121	t	3	2016-04-12 00:00:00
2636	1325	47	t	5	2016-04-06 00:00:00
2637	1325	2	t	5	2016-04-05 00:00:00
2638	1326	104	t	5	2016-09-26 00:00:00
2639	1326	45	t	5	2016-04-24 00:00:00
2640	1326	174	t	5	2016-04-24 00:00:00
2641	1326	101	t	4	2016-04-24 00:00:00
2642	1326	196	t	5	2016-04-24 00:00:00
2643	1326	130	t	5	2016-04-24 00:00:00
2644	1326	207	t	5	2016-04-24 00:00:00
2645	1326	14	t	5	2016-04-24 00:00:00
2646	1326	9	t	5	2016-04-24 00:00:00
2647	1326	31	t	5	2016-04-24 00:00:00
2648	1326	44	t	5	2016-04-24 00:00:00
2649	1326	16	t	5	2016-04-24 00:00:00
2650	1326	188	t	5	2016-06-13 00:00:00
2651	1326	2	t	5	2016-04-11 00:00:00
2652	1326	66	t	3	2016-04-11 00:00:00
2653	1327	31	t	3	2016-09-29 00:00:00
2654	1327	67	t	4	2016-09-29 00:00:00
2655	1327	5	t	4	2016-06-15 00:00:00
2656	1327	121	t	5	2016-06-09 00:00:00
2657	1327	66	t	4	2016-06-30 00:00:00
2658	1327	38	t	4	2015-10-30 00:00:00
2659	1327	75	t	4	2015-10-12 00:00:00
2660	1327	44	t	5	2015-12-17 00:00:00
2661	1327	94	t	5	2016-09-13 00:00:00
2662	1328	171	t	5	2010-06-08 00:00:00
2663	1330	16	t	4	2016-05-21 00:00:00
2664	1330	63	t	5	2012-06-25 00:00:00
2665	1330	45	t	5	2014-10-25 00:00:00
2666	1331	157	t	3	2016-10-03 00:00:00
2667	1331	80	t	4	2016-10-03 00:00:00
2668	1331	149	t	4	2016-05-17 00:00:00
2669	1331	143	t	4	2016-05-17 00:00:00
2670	1331	111	t	3	2013-11-22 00:00:00
2671	1331	64	t	4	2013-09-23 00:00:00
2672	1331	9	t	5	2016-05-17 00:00:00
2673	1331	185	t	4	2013-12-10 00:00:00
2674	1331	2	t	4	2013-01-10 00:00:00
2675	1331	5	t	4	2013-01-10 00:00:00
2676	1332	16	t	5	2016-01-08 00:00:00
2677	1333	2	t	5	2016-09-05 00:00:00
2678	1333	21	t	5	2016-10-10 00:00:00
2679	1333	26	t	3	2016-01-31 00:00:00
2680	1333	191	t	4	2015-08-28 00:00:00
2681	1334	59	t	4	2016-07-16 00:00:00
2682	1334	33	t	4	2016-07-16 00:00:00
2683	1334	188	t	4	2016-04-11 00:00:00
2684	1334	9	t	5	2016-04-11 00:00:00
2685	1334	84	t	4	2016-07-16 00:00:00
2686	1334	44	t	4	2016-07-16 00:00:00
2687	1334	55	t	2	2016-07-16 00:00:00
2688	1334	47	t	4	2016-07-16 00:00:00
2689	1334	86	t	4	2016-04-11 00:00:00
2690	1334	4	t	2	2016-04-11 00:00:00
2691	1334	2	t	5	2016-07-16 00:00:00
2692	1336	128	t	5	2012-09-24 00:00:00
2693	1336	40	t	5	2012-04-04 00:00:00
2694	1336	1	t	4	2012-07-27 00:00:00
2695	1336	2	t	4	2012-04-04 00:00:00
2696	1336	4	t	4	2012-04-04 00:00:00
2697	1337	19	t	5	2014-03-13 00:00:00
2698	1337	14	t	4	2014-02-12 00:00:00
2699	1337	86	t	5	2014-04-26 00:00:00
2700	1337	15	t	5	2014-01-20 00:00:00
2701	1337	1	t	3	2014-01-20 00:00:00
2702	1337	52	t	3	2014-01-20 00:00:00
2703	1337	27	t	5	2014-01-20 00:00:00
2704	1339	130	t	4	2016-07-21 00:00:00
2705	1339	158	t	5	2015-01-30 00:00:00
2706	1339	88	t	5	2015-09-05 00:00:00
2707	1339	64	t	5	2014-09-23 00:00:00
2708	1339	78	t	5	2015-09-05 00:00:00
2709	1339	46	t	5	2015-09-05 00:00:00
2710	1339	20	t	3	2014-09-23 00:00:00
2711	1339	29	t	5	2015-09-05 00:00:00
2712	1339	9	t	5	2015-09-05 00:00:00
2713	1339	108	t	4	2013-07-13 00:00:00
2714	1339	15	t	4	2016-09-09 00:00:00
2715	1339	21	t	5	2013-07-13 00:00:00
2716	1339	157	t	5	2015-02-12 00:00:00
2717	1339	59	t	3	2013-07-13 00:00:00
2718	1339	159	t	5	2013-07-13 00:00:00
2719	1339	45	t	2	2015-09-05 00:00:00
2720	1339	5	t	5	2015-09-05 00:00:00
2721	1339	4	t	5	2015-09-05 00:00:00
2722	1339	121	t	3	2015-09-05 00:00:00
2723	1339	16	t	5	2015-09-05 00:00:00
2724	1339	2	t	5	2015-09-05 00:00:00
2725	1339	43	t	5	2015-09-05 00:00:00
2726	1339	23	t	4	2013-07-13 00:00:00
2727	1341	33	t	4	2016-08-17 00:00:00
2728	1341	168	t	2	2016-06-01 00:00:00
2729	1341	142	t	2	2016-05-22 00:00:00
2730	1341	108	t	1	2016-03-28 00:00:00
2731	1341	23	t	3	2016-03-04 00:00:00
2732	1341	15	t	2	2016-03-04 00:00:00
2733	1341	62	t	3	2016-10-26 00:00:00
2734	1341	86	t	3	2015-03-01 00:00:00
2735	1341	165	t	2	2015-01-17 00:00:00
2736	1341	174	t	3	2015-09-05 00:00:00
2737	1343	55	t	5	2016-07-20 00:00:00
2738	1343	10	t	5	2016-07-09 00:00:00
2739	1344	23	t	5	2016-07-13 00:00:00
2740	1344	33	t	4	2016-07-13 00:00:00
2741	1344	83	t	3	2015-01-04 00:00:00
2742	1344	126	t	2	2015-01-04 00:00:00
2743	1344	124	t	5	2015-01-03 00:00:00
2744	1344	45	t	4	2015-05-11 00:00:00
2745	1344	75	t	5	2015-01-03 00:00:00
2746	1344	174	t	2	2015-01-03 00:00:00
2747	1344	67	t	3	2015-01-03 00:00:00
2748	1344	165	t	4	2015-01-03 00:00:00
2749	1344	160	t	4	2015-01-03 00:00:00
2750	1344	16	t	5	2015-01-03 00:00:00
2751	1344	5	t	3	2015-01-03 00:00:00
2752	1346	44	t	5	2016-10-03 00:00:00
2753	1346	196	t	5	2016-07-22 00:00:00
2754	1346	47	t	5	2015-09-25 00:00:00
2755	1346	145	t	4	2013-09-16 00:00:00
2756	1346	10	t	5	2013-08-20 00:00:00
2757	1346	165	t	4	2013-07-17 00:00:00
2758	1346	1	t	5	2013-07-17 00:00:00
2759	1346	187	t	5	2013-07-08 00:00:00
2760	1346	120	t	4	2013-07-08 00:00:00
2761	1346	91	t	5	2013-03-14 00:00:00
2762	1346	3	t	4	2012-10-24 00:00:00
2763	1346	108	t	4	2012-10-19 00:00:00
2764	1346	195	t	4	2012-10-19 00:00:00
2765	1346	46	t	5	2012-10-19 00:00:00
2766	1346	220	t	4	2012-10-13 00:00:00
2767	1346	128	t	5	2012-04-13 00:00:00
2768	1346	61	t	5	2012-04-13 00:00:00
2769	1346	41	t	5	2011-10-08 00:00:00
2770	1346	40	t	5	2011-10-08 00:00:00
2771	1346	66	t	5	2009-07-22 00:00:00
2772	1346	21	t	5	2009-07-22 00:00:00
2773	1346	4	t	5	2009-07-22 00:00:00
2774	1346	5	t	4	2009-07-22 00:00:00
2775	1349	16	t	5	2015-07-27 00:00:00
2776	1349	25	t	4	2014-07-20 00:00:00
2777	1349	92	t	4	2014-07-15 00:00:00
2778	1349	59	t	4	2009-01-05 00:00:00
2779	1349	10	t	5	2008-12-30 00:00:00
2780	1349	203	t	4	2008-12-30 00:00:00
2781	1349	37	t	4	2008-12-30 00:00:00
2782	1349	26	t	5	2008-12-30 00:00:00
2783	1349	27	t	4	2008-12-30 00:00:00
2784	1349	5	t	4	2008-12-30 00:00:00
2785	1349	140	t	4	2011-08-28 00:00:00
2786	1349	111	t	5	2008-12-30 00:00:00
2787	1349	14	t	4	2008-12-30 00:00:00
2788	1349	9	t	4	2008-12-30 00:00:00
2789	1349	4	t	4	2008-12-30 00:00:00
2790	1349	108	t	5	2008-12-30 00:00:00
2791	1349	65	t	5	2008-12-30 00:00:00
2792	1349	145	t	4	2008-12-30 00:00:00
2793	1349	84	t	5	2008-12-30 00:00:00
2794	1349	38	t	5	2008-12-30 00:00:00
2795	1349	44	t	5	2008-12-30 00:00:00
2796	1349	130	t	4	2008-12-30 00:00:00
2797	1349	72	t	5	2008-12-30 00:00:00
2798	1349	3	t	5	2008-12-30 00:00:00
2799	1349	48	t	5	2008-12-30 00:00:00
2800	1349	64	t	4	2008-12-30 00:00:00
2801	1349	55	t	5	2008-12-30 00:00:00
2802	1349	15	t	5	2008-12-30 00:00:00
2803	1349	120	t	5	2008-12-30 00:00:00
2804	1349	21	t	5	2008-12-30 00:00:00
2805	1349	7	t	5	2008-12-30 00:00:00
2806	1350	45	t	3	2014-10-08 00:00:00
2807	1350	131	t	4	2014-10-08 00:00:00
2808	1350	221	t	5	2014-10-08 00:00:00
2809	1350	228	t	5	2014-10-08 00:00:00
2810	1350	148	t	5	2010-08-11 00:00:00
2811	1350	86	t	5	2014-04-25 00:00:00
2812	1350	15	t	5	2015-10-23 00:00:00
2813	1350	108	t	5	2010-04-22 00:00:00
2814	1350	161	t	5	2010-03-18 00:00:00
2815	1350	23	t	5	2010-03-10 00:00:00
2816	1350	1	t	5	2010-03-10 00:00:00
2817	1350	63	t	5	2009-12-17 00:00:00
2818	1350	24	t	5	2009-12-17 00:00:00
2819	1350	171	t	5	2009-06-13 00:00:00
2820	1350	121	t	5	2009-06-13 00:00:00
2821	1350	47	t	5	2009-05-26 00:00:00
2822	1350	2	t	5	2009-05-13 00:00:00
2823	1351	144	t	2	2013-06-21 00:00:00
2824	1351	245	t	4	2016-09-28 00:00:00
2825	1352	213	t	2	2016-05-27 00:00:00
2826	1352	103	t	3	2016-05-27 00:00:00
2827	1352	168	t	2	2016-06-03 00:00:00
2828	1352	148	t	4	2016-06-17 00:00:00
2829	1352	27	t	4	2016-01-06 00:00:00
2830	1352	110	t	3	2016-03-26 00:00:00
2831	1352	1	t	3	2016-06-17 00:00:00
2832	1352	55	t	2	2015-08-24 00:00:00
2833	1352	38	t	5	2014-02-08 00:00:00
2834	1352	5	t	4	2015-05-27 00:00:00
2835	1352	46	t	4	2016-01-09 00:00:00
2836	1352	167	t	3	2015-03-06 00:00:00
2837	1352	7	t	3	2015-05-27 00:00:00
2838	1352	86	t	3	2014-04-25 00:00:00
2839	1352	2	t	2	2015-08-24 00:00:00
2840	1352	23	t	3	2016-06-17 00:00:00
2841	1353	175	t	5	2013-11-10 00:00:00
2842	1353	171	t	4	2013-09-02 00:00:00
2843	1353	4	t	4	2012-09-07 00:00:00
2844	1353	33	t	4	2012-11-19 00:00:00
2845	1354	66	t	3	2016-09-25 00:00:00
2846	1354	29	t	4	2016-03-04 00:00:00
2847	1354	174	t	3	2016-10-30 00:00:00
2848	1354	80	t	3	2015-07-07 00:00:00
2849	1354	88	t	4	2015-07-07 00:00:00
2850	1354	187	t	3	2015-07-07 00:00:00
2851	1354	1	t	3	2015-06-14 00:00:00
2852	1354	126	t	2	2016-09-25 00:00:00
2853	1354	10	t	4	2016-10-02 00:00:00
2854	1354	104	t	4	2016-10-30 00:00:00
2855	1354	107	t	4	2015-02-07 00:00:00
2856	1354	120	t	2	2016-10-02 00:00:00
2857	1354	161	t	4	2015-12-26 00:00:00
2858	1354	108	t	4	2014-12-16 00:00:00
2859	1354	145	t	4	2014-12-11 00:00:00
2860	1354	150	t	2	2016-10-02 00:00:00
2861	1354	67	t	5	2014-11-29 00:00:00
2862	1354	20	t	3	2014-10-24 00:00:00
2863	1354	87	t	3	2016-10-02 00:00:00
2864	1354	27	t	3	2014-10-24 00:00:00
2865	1354	9	t	5	2014-10-24 00:00:00
2866	1354	21	t	3	2014-06-23 00:00:00
2867	1354	37	t	3	2014-06-09 00:00:00
2868	1354	89	t	4	2016-09-25 00:00:00
2869	1354	34	t	3	2014-04-03 00:00:00
2870	1354	44	t	4	2016-09-25 00:00:00
2871	1354	54	t	3	2016-10-30 00:00:00
2872	1354	171	t	4	2015-12-07 00:00:00
2873	1354	48	t	3	2013-02-18 00:00:00
2874	1354	47	t	4	2014-12-04 00:00:00
2875	1354	14	t	4	2013-02-03 00:00:00
2876	1354	130	t	3	2016-10-02 00:00:00
2877	1354	45	t	1	2016-10-02 00:00:00
2878	1354	62	t	2	2016-10-02 00:00:00
2879	1354	228	t	3	2013-01-12 00:00:00
2880	1355	86	t	4	2016-10-05 00:00:00
2881	1355	2	t	4	2016-08-26 00:00:00
2882	1355	120	t	3	2015-10-10 00:00:00
2883	1355	1	t	4	2014-12-23 00:00:00
2884	1355	130	t	3	2014-12-07 00:00:00
2885	1355	37	t	3	2014-11-01 00:00:00
2886	1355	239	t	3	2014-10-19 00:00:00
2887	1355	23	t	3	2014-09-22 00:00:00
2888	1355	5	t	4	2013-10-09 00:00:00
2889	1356	37	t	4	2015-04-25 00:00:00
2890	1356	7	t	4	2014-07-12 00:00:00
2891	1357	11	t	4	2016-09-11 00:00:00
2892	1357	159	t	5	2016-03-30 00:00:00
2893	1357	221	t	5	2016-03-09 00:00:00
2894	1357	213	t	5	2015-10-15 00:00:00
2895	1357	103	t	5	2015-10-14 00:00:00
2896	1357	39	t	5	2015-09-14 00:00:00
2897	1357	104	t	4	2015-04-02 00:00:00
2898	1357	120	t	5	2015-02-25 00:00:00
2899	1357	15	t	4	2015-02-25 00:00:00
2900	1357	1	t	4	2015-02-25 00:00:00
2901	1357	180	t	4	2015-02-25 00:00:00
2902	1357	7	t	5	2016-03-07 00:00:00
2903	1357	47	t	5	2015-02-25 00:00:00
2904	1357	21	t	5	2015-02-25 00:00:00
2905	1357	46	t	5	2015-02-25 00:00:00
2906	1357	130	t	3	2015-02-25 00:00:00
2907	1357	4	t	5	2015-08-24 00:00:00
2908	1357	5	t	5	2015-02-25 00:00:00
2909	1357	2	t	5	2015-02-25 00:00:00
\.


--
-- Name: user_books_user_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('user_books_user_book_id_seq', 2909, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY users (user_id, name, goodreads_id, email, password) FROM stdin;
2088	Lynden	19568306	\N	\N
2089	Chris	8061642	\N	\N
2090	Austin	20479596	\N	\N
2091	Mo	419498	\N	\N
2092	RebeccaErGlad	2330106	\N	\N
2093	Heather	4675304	\N	\N
2094	Dilek	23334164	\N	\N
2095	Madeline	35948454	\N	\N
2096	Josh	40583371	\N	\N
2097	James	4167136	\N	\N
2098	cates	16264356	\N	\N
2099	Jim	2644185	\N	\N
2100	Petergiaquinta	4159895	\N	\N
2101	Annie	13271416	\N	\N
2102	Marlene	25432411	\N	\N
2103	Mallorie	59491266	\N	\N
2104	Roberto	39774018	\N	\N
2105	Judy	20235929	\N	\N
2106	Nina	57671004	\N	\N
2107	Gaby	6305120	\N	\N
2108	Baska	58738004	\N	\N
2109	Alisha Marie	1585205	\N	\N
2658	Lana	4799764	\N	\N
2659	Paula	15785805	\N	\N
2660	Arpit	39750016	\N	\N
2661	Marita	5398843	\N	\N
2662	Lilly	21812305	\N	\N
2663	Dorothea	39006081	\N	\N
2664	Priyanshu	5591533	\N	\N
2665	Cherry-blossom	4983490	\N	\N
2666	Tats	30643273	\N	\N
2667	Pieter	41653771	\N	\N
2668	Simon	27434314	\N	\N
2669	Bokelskerinnen	3467743	\N	\N
2670	Line	24801875	\N	\N
2671	Jessica	149503	\N	\N
2672	Lucinda	4287993	\N	\N
2673	Karin	41142755	\N	\N
2674	Satu	45485838	\N	\N
2675	Diana	25227534	\N	\N
2676	Batzul	32420534	\N	\N
2677	Josh	53630872	\N	\N
2678	Fyza	9006963	\N	\N
2679	Rebecca	33037047	\N	\N
2680	Rahell	40278816	\N	\N
2681	Sonya	30105152	\N	\N
2682	Jess	33914933	\N	\N
2683	Dee	9638915	\N	\N
2684	Davedc	5806872	\N	\N
2685	Divya	27476170	\N	\N
2686	Antonio	5314199	\N	\N
2687	Alison	18027654	\N	\N
2688	Michelle	53114323	\N	\N
2689	Jndread	3117415	\N	\N
2690	Raya	58741366	\N	\N
2691	Roisan	52762881	\N	\N
2692	Ed	47292531	\N	\N
2693	April	2424187	\N	\N
2694	Ally	36978618	\N	\N
2695	Edward	5953484	\N	\N
2696	Dan	49433701	\N	\N
2697	Madison	38989336	\N	\N
2698	Veronica	27770274	\N	\N
2699	Nicole	6353323	\N	\N
2700	Jared	25528309	\N	\N
2701	Frances	29710593	\N	\N
2702	Selma	15095600	\N	\N
2703	Keith	19574525	\N	\N
2704	Nicole	7313683	\N	\N
2705	Janey	9057377	\N	\N
2706	Bert	54356924	\N	\N
2707	MK	24619778	\N	\N
2708	Kati	24421102	\N	\N
2709	David	8514436	\N	\N
2710	Susan	25896710	\N	\N
2711	Heli	32037590	\N	\N
2712	Eric	33125404	\N	\N
2713	Debbie	5765950	\N	\N
2714	Kimberly	30964501	\N	\N
2715	Kollin	15835083	\N	\N
2716	Gary	8088369	\N	\N
2717	Deborah	58498366	\N	\N
2718	Erin	7323844	\N	\N
2719	Howard	47959814	\N	\N
2720	Christian	56199140	\N	\N
2721	Julia	7060533	\N	\N
2722	Christine	18006276	\N	\N
2723	Samantha	5874303	\N	\N
2724	Phyllis	34471667	\N	\N
2725	Misty	30149261	\N	\N
2726	Virginie	3537624	\N	\N
2727	Ariel	48253453	\N	\N
2728	Donna	2512877	\N	\N
2729	AH	45172305	\N	\N
2730	Trish	4376750	\N	\N
2731	Jacob	3500395	\N	\N
2732	Erika	18360534	\N	\N
2733	Marsha	4270790	\N	\N
2734	Erica	2179419	\N	\N
2735	Donna	275660	\N	\N
2736	Christy	3378153	\N	\N
2737	Denise	3670490	\N	\N
2738	Jerry	27884710	\N	\N
2739	Angel	615740	\N	\N
2740	Robyn	21866485	\N	\N
2741	Candace	12005601	\N	\N
2742	George	11010461	\N	\N
2743	Nicole	4347759	\N	\N
2744	Katie	1305941	\N	\N
2745	Hannah	28731580	\N	\N
2746	James	23212031	\N	\N
2747	Kate	59943471	\N	\N
2748	Andrea	32516774	\N	\N
2749	Lauren	27121711	\N	\N
2750	Lisa	29883517	\N	\N
2751	Booktasters	55690075	\N	\N
2752	Volli	60826175	\N	\N
2753	Erik	5975847	\N	\N
2754	Utpreksha	11053687	\N	\N
2755	Line	28471233	\N	\N
2756	Hassnain	17680041	\N	\N
2757	Brittany	22905111	\N	\N
2758	Kimberly	2609180	\N	\N
2759	Elena	5871422	\N	\N
2760	Ekaterina	53556836	\N	\N
2761	Joyce	4226159	\N	\N
2762	Spandan	20699664	\N	\N
2763	Yuli	44146391	\N	\N
2764	Veronica	44492488	\N	\N
2765	Ayan	34202062	\N	\N
2766	Lisa	10811994	\N	\N
2767	Dan	38898244	\N	\N
2768	Kelly	13668257	\N	\N
2769	Simone	51487556	\N	\N
2770	Michael	153594	\N	\N
2771	Cindy	39716623	\N	\N
2772	Andres	45531348	\N	\N
2773	Jack	56207930	\N	\N
2774	Kim	15381801	\N	\N
2775	IB	41927150	\N	\N
2776	Henry	14909392	\N	\N
2777	Cathy	16324843	\N	\N
2778	Emily	16846205	\N	\N
2779	Lizzie	23021064	\N	\N
2780	Shanna	15063076	\N	\N
2781	Mindy	5707455	\N	\N
2782	Avinash	49729040	\N	\N
2783	Emilie	25760107	\N	\N
2784	Hilary	44370706	\N	\N
2785	Adrienne	54568849	\N	\N
2786	Lauren	47536004	\N	\N
2787	Danja	37973630	\N	\N
2788	Chelsea	22734631	\N	\N
2789	Francesca	35342461	\N	\N
2790	Maria	50989808	\N	\N
2791	Viktorija	7510188	\N	\N
2792	Farah	17875782	\N	\N
2793	Alexandra	23821245	\N	\N
2794	Maddie	26103590	\N	\N
2795	Miike	53131874	\N	\N
2796	Lisa	5389855	\N	\N
2797	Jorge	33563696	\N	\N
2798	Kaisa	6836066	\N	\N
2799	Ross	39430999	\N	\N
2800	Heather	30074311	\N	\N
2801	Wes	56817546	\N	\N
2802	Jhmingos	7289765	\N	\N
2803	Somdutta	3009071	\N	\N
2804	Elda	4277839	\N	\N
2805	Bree	3512143	\N	\N
2806	Alice	25992613	\N	\N
2807	Laura	2079402	\N	\N
2808	Danique	51933677	\N	\N
2809	Tara	3056485	\N	\N
2810	Ana Yael	4369607	\N	\N
2811	Anvita	17168278	\N	\N
2812	Luciana	40609139	\N	\N
2813	Giota	58249748	\N	\N
2814	Andreea	1417076	\N	\N
2815	Rajesh Kumar	3514672	\N	\N
2110	Latifah	22383580	\N	\N
2111	Maya	24306635	\N	\N
2112	Jonnu	30188024	\N	\N
2113	Susan from MD	4209363	\N	\N
2114	Linda	32368211	\N	\N
2115	Karina	14957095	\N	\N
2116	Laura	30674514	\N	\N
2117	Odwyer	11301805	\N	\N
2118	Jordan	13357710	\N	\N
2119	Miriam	58289757	\N	\N
2120	Kathy	6643248	\N	\N
2121	Lynda	24878028	\N	\N
2122	Ana	54909068	\N	\N
2123	Jeremy	34469222	\N	\N
2124	Synn�ve	35968785	\N	\N
2125	Nicola	37602362	\N	\N
2126	Meg	4008958	\N	\N
2127	Rafael	7748505	\N	\N
2128	Sorento62	5235304	\N	\N
2129	Rita	8586770	\N	\N
2130	Jessica	17162123	\N	\N
2131	Jason	29380368	\N	\N
2132	Jen	12859252	\N	\N
2133	Eli	25227191	\N	\N
2134	Mike	6156821	\N	\N
2135	Carol	34530235	\N	\N
2136	Parvathy	4915009	\N	\N
2137	Veronica	47952723	\N	\N
2138	Cate	15725725	\N	\N
2139	Sandy	30129123	\N	\N
2140	Carlton	38714648	\N	\N
2141	Gareth	49400735	\N	\N
2142	Scarlett	4762966	\N	\N
2143	Kathy	5292078	\N	\N
2144	Iulia	6006610	\N	\N
2145	Christy	42524626	\N	\N
2146	Matteo	60734149	\N	\N
2147	Isabel	40575002	\N	\N
2148	Bluerose	17321655	\N	\N
2149	Ravindran	18892932	\N	\N
2150	Asif	23309753	\N	\N
2151	amber	3076627	\N	\N
2152	Robyn Gail	109525	\N	\N
2153	Cynthia	18230396	\N	\N
2154	Rachel	29294755	\N	\N
2155	Leslie	24006461	\N	\N
2156	Leandra	5558577	\N	\N
2157	Andrea	5687301	\N	\N
2158	Leslie	51061134	\N	\N
2159	Cassie	47403084	\N	\N
2160	KK	1443662	\N	\N
2161	Charles	12827406	\N	\N
2162	Cristina	19185822	\N	\N
2163	Paige	34358673	\N	\N
2164	Siropa	34544839	\N	\N
2165	Andrew	4252070	\N	\N
2166	Michaela	58675440	\N	\N
2167	Melissa	3371359	\N	\N
2168	Denise	2898303	\N	\N
2169	Izunia	16753042	\N	\N
2170	Joud	22252935	\N	\N
2171	Julia	58324258	\N	\N
2172	Saskia	19792663	\N	\N
2173	Sofie	30462310	\N	\N
2174	Christine	5567461	\N	\N
2175	Yvette	12133830	\N	\N
2176	Lulu	59757808	\N	\N
2177	Joana	16608271	\N	\N
2178	Kiya	44104528	\N	\N
2179	Jackson	50929720	\N	\N
2180	Maria	7283712	\N	\N
2181	Charlotte	32737385	\N	\N
2182	Richa	19660683	\N	\N
2183	Elizabeth	35608716	\N	\N
2184	K Rae	6560441	\N	\N
2185	Natia	39317186	\N	\N
2186	Mathias	47799441	\N	\N
2187	Sarah	59696476	\N	\N
2188	Lesley	4730294	\N	\N
2189	Michaela973	22231628	\N	\N
2190	Marci	2339646	\N	\N
2191	Rahul Nath	13129765	\N	\N
2192	Miguel	18527904	\N	\N
2193	Barbara	4191081	\N	\N
2194	Glenn	9252031	\N	\N
2195	Anna	22228887	\N	\N
2196	Madeline	15655452	\N	\N
2197	Maevah	40311918	\N	\N
2198	Abigail	60760530	\N	\N
2199	Julia	36075846	\N	\N
2200	Duygu	5653118	\N	\N
2201	Donna	1554616	\N	\N
2202	Katarina	1680059	\N	\N
2203	Mike	13281189	\N	\N
2204	Tante Tex	31957241	\N	\N
2205	Bella	4647084	\N	\N
2206	Frankie	5636068	\N	\N
2207	James	19069000	\N	\N
2208	Annemarie	11607503	\N	\N
2209	Rianna	16345474	\N	\N
2210	Newly	27323847	\N	\N
2211	Pernilla	43071674	\N	\N
2212	Katie	57913733	\N	\N
2213	Natalia	6691426	\N	\N
2214	Joseph	55004482	\N	\N
2215	A Great Book Study	8402385	\N	\N
2216	Elisabeth	6933186	\N	\N
2217	Bookchick	1642308	\N	\N
2218	Imade	41776237	\N	\N
2219	Ribota	10229294	\N	\N
2220	Susanne	20164091	\N	\N
2221	Simone	22298839	\N	\N
2222	Kristy	10986047	\N	\N
2223	Martha	28320656	\N	\N
2224	Carissa	15304464	\N	\N
2225	Jessica	18586215	\N	\N
2226	Thelonious	18830570	\N	\N
2227	Julied	14993560	\N	\N
2228	Charlotte	29470863	\N	\N
2229	Ashitha Mary	10078458	\N	\N
2230	Nina	10347384	\N	\N
2231	Mochaspresso	5317569	\N	\N
2232	Kamilah	35516160	\N	\N
2233	Miss Catherine G Harvey	46711536	\N	\N
2234	shannon	5020068	\N	\N
2235	Ron	21141837	\N	\N
2236	Ericka	40392551	\N	\N
2237	Iain	59899565	\N	\N
2238	Elisa	52576621	\N	\N
2239	Silver	1430273	\N	\N
2240	Renato	29402621	\N	\N
2241	 Gem 	44020611	\N	\N
2242	Corey	10357189	\N	\N
2243	Sarah	21225773	\N	\N
2244	Bobbi	45300547	\N	\N
2245	Joe	1892734	\N	\N
2246	Angelique	3925354	\N	\N
2247	Charlotte	4728277	\N	\N
2248	Amber	8929006	\N	\N
2249	Danielle	8504171	\N	\N
2250	Carolien	7323402	\N	\N
2251	David	27807154	\N	\N
2252	Melissa	39642467	\N	\N
2253	Huda	22579380	\N	\N
2254	Jeroen	18645979	\N	\N
2255	Nassiba	33939085	\N	\N
2256	Martha	1460828	\N	\N
2257	David	52372942	\N	\N
2258	Nathan	10164108	\N	\N
2259	Mahesh	12159422	\N	\N
2260	Laura	41119258	\N	\N
2261	Alena	4612723	\N	\N
2262	Adelina	20785157	\N	\N
2263	Beckey	5597032	\N	\N
2264	Cherie	35587191	\N	\N
2265	Kalyn	11718370	\N	\N
2266	Ashwin	1145513	\N	\N
2267	Franky	13180087	\N	\N
2268	Kelly	28547555	\N	\N
2269	Yolanda	31274724	\N	\N
2270	Marilyn	1153178	\N	\N
2271	Annie	4575867	\N	\N
2272	Ann	6659499	\N	\N
2273	Salma	34935838	\N	\N
2274	Dey	35180198	\N	\N
2275	Kim	41366108	\N	\N
2276	Benjamin	54221356	\N	\N
2277	Benjamin	54249040	\N	\N
2278	SDTNTLIFE	16820233	\N	\N
2279	Kristin	2286746	\N	\N
2280	Tina	26044605	\N	\N
2281	Yasmine	14731637	\N	\N
2282	Ashley	15624068	\N	\N
2283	Gerard	616770	\N	\N
2284	Kushniro	4673801	\N	\N
2285	Freya	7346917	\N	\N
2286	Adrianna	8959192	\N	\N
2287	Anik	41097837	\N	\N
2288	Becky	42503858	\N	\N
2289	Kev	24441041	\N	\N
2290	Caio	837711	\N	\N
2291	Elise	23932768	\N	\N
2292	LunaBel	6044687	\N	\N
2293	Matt	5310439	\N	\N
2294	Sreelakshmy	34544464	\N	\N
2295	Maaike	47666178	\N	\N
2296	Marian	16343888	\N	\N
2297	Jonathan	52569773	\N	\N
2298	Andreea	22548668	\N	\N
2299	Gabriela	58336303	\N	\N
2300	Melanie	13643558	\N	\N
2301	Kuba	60993518	\N	\N
2302	Jessica	37966654	\N	\N
2303	Ivy - Hearts Books	41366073	\N	\N
2304	Sri Harish	25974245	\N	\N
2305	G�rel	52597082	\N	\N
2306	Bruna	8832180	\N	\N
2307	Terri	13759951	\N	\N
2308	Matt	34032149	\N	\N
2309	Alice	13656522	\N	\N
2310	Hayley	17829385	\N	\N
2311	Muhammad	45550260	\N	\N
2312	Natalie	46389069	\N	\N
2313	Aitana	59292846	\N	\N
2314	Lizette	2570927	\N	\N
2315	Ivona	28377818	\N	\N
2316	Clint	25313402	\N	\N
2317	Farrah	5368659	\N	\N
2318	Meagan	3496736	\N	\N
2319	Vigdis	4219259	\N	\N
2320	Kim	904013	\N	\N
2321	Keshav	14500285	\N	\N
2322	Tim	19240945	\N	\N
2323	Beatriz	22914715	\N	\N
2324	Hayastan	33900058	\N	\N
2325	Sophie	56825853	\N	\N
2326	Celine	59319885	\N	\N
2327	Anelis	5134195	\N	\N
2328	Mamta	13731437	\N	\N
2329	Gaijinmama	917504	\N	\N
2330	Ankit	16846621	\N	\N
2331	Deniz	5890293	\N	\N
2332	Ashwini	27567970	\N	\N
2333	Ada	36532194	\N	\N
2334	�mit Vefa	45899120	\N	\N
2335	jkdze	5696125	\N	\N
2336	Michelle	4907756	\N	\N
2337	Janet	5619249	\N	\N
2338	Beth	6884680	\N	\N
2339	Alexandra	32711859	\N	\N
2340	mikoaj	34492630	\N	\N
2341	Susan	3456904	\N	\N
2342	Rebecca	5600172	\N	\N
2343	WildFlower3D	5379137	\N	\N
2344	Karen	48059322	\N	\N
2345	Jess	7166022	\N	\N
2346	Michael	6982643	\N	\N
2347	Kaylee	4786799	\N	\N
2348	katjann	10323005	\N	\N
2349	Donna	58608476	\N	\N
2350	Amanda	10117338	\N	\N
2351	T�nis	41283207	\N	\N
2352	Mindy	40621733	\N	\N
2353	Kelly	1330063	\N	\N
2354	LifeLoveGirl	37396921	\N	\N
2355	Kerith	195995	\N	\N
2356	Lalitha	7110406	\N	\N
2357	Estelle	54515027	\N	\N
2358	Zuzana	10711175	\N	\N
2359	Laura	59470195	\N	\N
2360	David	46855393	\N	\N
2361	Laurentiu	4736649	\N	\N
2362	Kathryn	16635448	\N	\N
2363	Hope	59685642	\N	\N
2364	Don	50940187	\N	\N
2365	Miikka	9789205	\N	\N
2366	Catherine	15442806	\N	\N
2367	Angie	402198	\N	\N
2368	James	3125810	\N	\N
2369	Muthiah Prabhakaran	37384893	\N	\N
2370	Brittany	45556029	\N	\N
2371	Styron15	60336010	\N	\N
2372	Vicky	19616325	\N	\N
2373	Randy	46980449	\N	\N
2374	Kim	39205046	\N	\N
2375	Sarah	4736566	\N	\N
2376	Jenny	5897112	\N	\N
2377	Keeley	1712843	\N	\N
2378	Tali	22555129	\N	\N
2379	Avril	58228869	\N	\N
2380	Jessica	49854131	\N	\N
2381	Merrilee	31170260	\N	\N
2382	Ericka	1947301	\N	\N
2383	Kate	795054	\N	\N
2384	Lena	7819492	\N	\N
2385	Brian	5021623	\N	\N
2386	Kate	32215443	\N	\N
2387	Amanda	5381992	\N	\N
2388	Frida	9147351	\N	\N
2389	Navnath	5689903	\N	\N
2390	Moll	1153008	\N	\N
2391	Renee	5385609	\N	\N
2392	CloudScape	35439245	\N	\N
2393	Mary Ellen	4903786	\N	\N
2394	Erica	7784976	\N	\N
2395	Lisa	3322545	\N	\N
2396	Book-a-Holic	5373652	\N	\N
2397	Kate	5638118	\N	\N
2398	Elizabeth	15541140	\N	\N
2399	Annika	21979707	\N	\N
2400	David	30688357	\N	\N
2401	Aly	59622668	\N	\N
2402	Catherine	5163797	\N	\N
2403	Krista	5184690	\N	\N
2404	Emma	16597773	\N	\N
2405	Michael	1274619	\N	\N
2406	Virginia	20254790	\N	\N
2407	Angela	3046662	\N	\N
2408	Mathis	6658124	\N	\N
2409	Nat�lia	14076750	\N	\N
2410	Tatiana	754130	\N	\N
2411	Julia	5653437	\N	\N
2412	Emma	21311456	\N	\N
2413	Suzie	21296359	\N	\N
2414	Michelle	30239645	\N	\N
2415	Erika	4828968	\N	\N
2416	Sydney	7403702	\N	\N
2417	Kendall	2526968	\N	\N
2418	Ally	57824996	\N	\N
2419	Iris	17717848	\N	\N
2420	Monica	52170225	\N	\N
2421	Sara	57324566	\N	\N
2422	Chavi	6607016	\N	\N
2423	Erica	32772363	\N	\N
2424	Karen	50797501	\N	\N
2425	Jason	49805678	\N	\N
2426	Hope	21169926	\N	\N
2427	Liza	1667870	\N	\N
2428	Roxy	5172794	\N	\N
2429	Mac	51695966	\N	\N
2430	D	1719928	\N	\N
2431	Chris	41402861	\N	\N
2432	Andrea	31130354	\N	\N
2433	Rebecca	47759621	\N	\N
2434	Rhonda	792933	\N	\N
2435	Shawn	1607486	\N	\N
2436	Aurelie	4746309	\N	\N
2437	Moose	5753809	\N	\N
2438	Adam	8519172	\N	\N
2439	Adam	3387371	\N	\N
2440	Jane	13093860	\N	\N
2441	Tha�s	45820413	\N	\N
2442	Tash	53225677	\N	\N
2443	Joni	1661161	\N	\N
2444	Alicia	8086928	\N	\N
2445	Mouhamed	13953508	\N	\N
2446	Si	23669290	\N	\N
2447	Bar	22249372	\N	\N
2448	Victoria	27507941	\N	\N
2449	Cindy	2319458	\N	\N
2450	Gina	29056098	\N	\N
2451	Angela	4255913	\N	\N
2452	Vasco	37668974	\N	\N
2453	Kimberly	3777996	\N	\N
2454	Kelli	17693169	\N	\N
2455	Marapad	18496596	\N	\N
2456	Andrea Edwinsdottir	28193541	\N	\N
2457	Angie	2109796	\N	\N
2458	Darlene	6792277	\N	\N
2459	Denise	10014116	\N	\N
2460	Sofia	31932476	\N	\N
2461	Iris	2492739	\N	\N
2462	Ryan	20821319	\N	\N
2463	Bryan	57209541	\N	\N
2464	Kami	3970329	\N	\N
2465	Eleanor	11631837	\N	\N
2466	Kristin	2234331	\N	\N
2467	Ayse	27476166	\N	\N
2468	Annie	24476089	\N	\N
2469	Liz	5881986	\N	\N
2470	Nicole	11753888	\N	\N
2471	Stephanie	4467306	\N	\N
2472	Melanie	10283047	\N	\N
2473	Anastasia	57966562	\N	\N
2474	Jaimee	33314257	\N	\N
2475	Lucy	45852193	\N	\N
2476	Cindy	3013482	\N	\N
2477	Mariia	6681376	\N	\N
2478	Laura	18239058	\N	\N
2479	Colleen  Quinn	2940549	\N	\N
2480	Mrs. C.	2210173	\N	\N
2481	Maddie	4551283	\N	\N
2482	Nathan	8341470	\N	\N
2483	Ruth	22495961	\N	\N
2484	JESS	60385521	\N	\N
2485	Sarah	7104400	\N	\N
2486	Bill	58606176	\N	\N
2487	Kimberly	20168995	\N	\N
2488	Valeria	53327098	\N	\N
2489	Buse	5695604	\N	\N
2490	Judy	30388509	\N	\N
2491	Melissa	3517821	\N	\N
2492	Stacy	51838541	\N	\N
2493	Nola	1015045	\N	\N
2494	Solanki	46520680	\N	\N
2495	Emma	28178702	\N	\N
2496	Sarala	45503379	\N	\N
2497	Katrina	2240622	\N	\N
2498	Sherry	17718074	\N	\N
2499	Meimei	27832475	\N	\N
2500	Robin	1720306	\N	\N
2501	Corrina	7723340	\N	\N
2502	Pascal	12549092	\N	\N
2503	Christa	54564408	\N	\N
2504	Ben	58083737	\N	\N
2505	Miranda	27736582	\N	\N
2506	Anastasia	93391	\N	\N
2507	Morgan	30078414	\N	\N
2508	Victoria	3024644	\N	\N
2509	Katia	8476449	\N	\N
2510	Andreea	8919484	\N	\N
2511	Bridget	24007166	\N	\N
1030	Lisa	107427	\N	\N
1031	Maren	8558698	\N	\N
1032	Sharon	11592265	\N	\N
1033	Souhaila	3497864	\N	\N
1034	Karen	3768500	\N	\N
1035	Iuliana	4855853	\N	\N
1036	Diana S	4918199	\N	\N
1037	Mary	4970984	\N	\N
1038	Jen	4983837	\N	\N
1039	lanalang	7638370	\N	\N
1040	Wreade1872	7708524	\N	\N
1041	Karen	8463734	\N	\N
1042	Tadiana Night Owl	8734459	\N	\N
1043	Nada	10007468	\N	\N
1044	Veronique	12371602	\N	\N
1045	Iulian	16761191	\N	\N
1046	Aprilleigh	20371713	\N	\N
1047	Atalinay	21872290	\N	\N
1048	Chidi	22461505	\N	\N
1049	Danielle	23900110	\N	\N
1050	A Girl Has No Name	29402776	\N	\N
1051	Barbara	34541100	\N	\N
1052	Dashiva	35211032	\N	\N
1053	Laura	45418010	\N	\N
1054	Amanda	46155096	\N	\N
1055	Mary	47326617	\N	\N
1056	Richard	48230617	\N	\N
1057	Josh	52997138	\N	\N
1058	Hailee	54530256	\N	\N
1059	Oziel	56294126	\N	\N
1060	Amalia	56789747	\N	\N
1061	Claire	57880054	\N	\N
1062	Laure	58398280	\N	\N
1063	Saad	60468799	\N	\N
1064	Arielle	60974880	\N	\N
1065	Nicole	61261132	\N	\N
1066	Ellen	57428516	\N	\N
1067	Brina	2933855	\N	\N
1068	Janet	3981773	\N	\N
1069	Mindi	4477659	\N	\N
1070	Lsma	5700736	\N	\N
1071	Amber	6284459	\N	\N
1072	Lidiana	6932545	\N	\N
1073	Celeste	7317186	\N	\N
1074	Alma Q	9046845	\N	\N
1075	Cosmic	14793626	\N	\N
1076	Beth	15898714	\N	\N
1077	Tanima	23582815	\N	\N
1078	Sylwia	25984792	\N	\N
1079	Andrea	28150554	\N	\N
1080	Nour El Houda	28500495	\N	\N
1081	Katie	29868756	\N	\N
1082	Katheryn	32687708	\N	\N
1083	Rosa	41405677	\N	\N
1084	Sydney	53106558	\N	\N
1085	Laura	900147	\N	\N
1086	Lila (formerly Jalilah)	4656570	\N	\N
1087	Tuuta	5149317	\N	\N
1088	Bam	5922426	\N	\N
1089	Lauren	8971285	\N	\N
1090	Pink	14084605	\N	\N
1091	Tytti	16936208	\N	\N
1092	Melissa  Dog Lover 	17438949	\N	\N
1093	Eggp	20110964	\N	\N
1094	Bianca	29430941	\N	\N
1095	Megan	58618612	\N	\N
1096	Q	1978972	\N	\N
1097	clay	3804397	\N	\N
1098	Sue	4047077	\N	\N
1099	Victoria	5609890	\N	\N
1100	Mohamad	12071773	\N	\N
1101	Susanne	13988340	\N	\N
1102	Phil	14413650	\N	\N
1103	Anne	17239844	\N	\N
1104	Krista	28222909	\N	\N
1105	Stephanie	32237574	\N	\N
1106	Buttons	34260878	\N	\N
1107	Johanna	45278992	\N	\N
1108	Susan	45302017	\N	\N
1109	Gabriele	47041057	\N	\N
1110	Wend	50953088	\N	\N
1111	DaceM	57931926	\N	\N
1112	Nikoleta	59039653	\N	\N
1113	Charan	23530474	\N	\N
1114	Pamela	1275271	\N	\N
1115	Samantha	6114042	\N	\N
1116	Courtney	6218190	\N	\N
1117	RachelvlehcaR	6368180	\N	\N
1118	Cleo	7092123	\N	\N
1119	Vilius	7299790	\N	\N
1120	Anne	11463387	\N	\N
1121	Innes	11686362	\N	\N
1122	Honigpfeffer	16593488	\N	\N
1123	Arielle	23239342	\N	\N
1124	Amber	23746365	\N	\N
1125	Elizabeth	29034676	\N	\N
1126	Miracle	33480939	\N	\N
1127	Niki	33717304	\N	\N
1128	Bethan	38589886	\N	\N
1129	E	822477	\N	\N
1130	Annmarie	5657982	\N	\N
1131	Cindy	6082517	\N	\N
1132	debbie~cr8zycat~	12436728	\N	\N
1133	Dessi	13625942	\N	\N
1134	Marita	17415449	\N	\N
1135	Megan	18760973	\N	\N
1136	Duane	24389390	\N	\N
1137	ahjummarin	29334575	\N	\N
1138	Edmundo	29907593	\N	\N
1139	Susan	44131812	\N	\N
1140	Marija	44820959	\N	\N
1141	Janete	45176242	\N	\N
1142	Stand	46612168	\N	\N
1143	Dalma	58654159	\N	\N
1144	Lindsey	101420	\N	\N
1145	Rakesh	4962158	\N	\N
1146	Amanda	5476515	\N	\N
1147	Marcie	5513920	\N	\N
1148	Lavender	10446318	\N	\N
1149	Janet	10926675	\N	\N
1150	Ernest	11574175	\N	\N
1151	Andrea (Catsos Person) is a Compulsive eBook Hoarder	22292038	\N	\N
1152	Jackie	23212060	\N	\N
1153	Hanna	28348948	\N	\N
1154	Thefantasticone	32963859	\N	\N
1155	Olivia	59892181	\N	\N
1156	Lisa	2099130	\N	\N
1157	Laurie	2685482	\N	\N
1158	Kandice	4031736	\N	\N
1159	Cameron	4968425	\N	\N
2512	Alice	31876727	\N	\N
2513	Mariana	40405851	\N	\N
1160	Pianogirl	5897560	\N	\N
1161	Madeleine27	5940603	\N	\N
1162	Kelsey	8038767	\N	\N
1163	Rachel	8387812	\N	\N
1164	La�s	12149294	\N	\N
1165	Matt	31667052	\N	\N
1166	Francisco	35181566	\N	\N
1167	Friso	36338684	\N	\N
1168	Lisa	43478324	\N	\N
1169	Kathleen	48502194	\N	\N
1170	Halima	49433761	\N	\N
1171	Arwen1968	51497057	\N	\N
1172	Sharon	54566711	\N	\N
1173	Alison	3973538	\N	\N
1174	Stacey	2237555	\N	\N
1175	Olivia	2445786	\N	\N
1176	Melanti	3034846	\N	\N
1177	Valeria	12644232	\N	\N
1178	Dora	14624833	\N	\N
1179	Tamara	15625081	\N	\N
1180	Mathangi	16010202	\N	\N
1181	Richard	22082482	\N	\N
1182	Vickie	51728382	\N	\N
1183	Nix	56471185	\N	\N
1184	Paula	2101582	\N	\N
1185	Tracey	2983918	\N	\N
1186	Emma	5215426	\N	\N
1187	Zoe	5799025	\N	\N
1188	Carol	7668522	\N	\N
1189	Midgetbee	8783181	\N	\N
1190	Paula W	13286533	\N	\N
1191	Michelle	27203016	\N	\N
1192	Faouzia	29598034	\N	\N
1193	April	33691712	\N	\N
1194	Kirsten (Mayaslan)	54854280	\N	\N
1195	Juhi	56605437	\N	\N
1196	Mike	7388085	\N	\N
1197	Gary	17271459	\N	\N
1198	Sarah Anne	23841736	\N	\N
1199	Sarah	24502671	\N	\N
1200	Debashis	27606236	\N	\N
1201	Chess	30960511	\N	\N
1202	Tintinnabula	39995391	\N	\N
1203	Irina	51817185	\N	\N
1204	Racheal	55855362	\N	\N
1205	Stephanie	58131253	\N	\N
1206	Milena	59694679	\N	\N
1207	Tina	26623904	\N	\N
1208	Jara	55047084	\N	\N
1209	Eirik	16135383	\N	\N
1210	Alissa	5964135	\N	\N
1211	Nina	26277122	\N	\N
1212	Joy	31559477	\N	\N
1213	Najada	36093355	\N	\N
1214	Andreea	44294692	\N	\N
1215	Marina	51935701	\N	\N
1216	Jenna	18807434	\N	\N
1217	Jaime	5557725	\N	\N
1218	Eve	7577384	\N	\N
1219	Jenessa	10261544	\N	\N
1220	Rachid	11891140	\N	\N
1221	Jennifer	17553817	\N	\N
1222	Oana	19618336	\N	\N
1223	Gavin	26133721	\N	\N
1224	Nargus	26511899	\N	\N
1225	Lagullande	27511313	\N	\N
1226	Yvonne	32902954	\N	\N
1227	Councillor	40792319	\N	\N
1228	Manuel	47163078	\N	\N
1229	Ivana	54788966	\N	\N
1230	Philipp	57644820	\N	\N
1231	Menno	57775345	\N	\N
1232	Jen	3033800	\N	\N
1233	Brian	5666527	\N	\N
1234	Pigletto	6674002	\N	\N
1235	Silverin	6983087	\N	\N
1236	Pucca	11965414	\N	\N
1237	Jennifer	15024988	\N	\N
1238	Kelly	16904193	\N	\N
1239	Paula	21504858	\N	\N
1240	Katy	22486770	\N	\N
1241	Caroline	30059972	\N	\N
1242	Tiffany	32815764	\N	\N
1243	Francesca	45182198	\N	\N
1244	PaperRose	47985137	\N	\N
1245	Sanja	56586587	\N	\N
1246	Aleta	22134423	\N	\N
1247	Simen	59052200	\N	\N
1248	Andre	2015177	\N	\N
1249	Kai	567204	\N	\N
1250	Lulu	8427052	\N	\N
1251	Jimmy	9824432	\N	\N
1252	Roan	11232390	\N	\N
1253	Tam	14413354	\N	\N
1254	Eman	15778576	\N	\N
1255	Jonathon	16377612	\N	\N
1256	Jenny	16404316	\N	\N
1257	Gary	18697926	\N	\N
1258	John	21938800	\N	\N
1259	Mary	22728070	\N	\N
1260	Kori	47129937	\N	\N
1261	Patricia	56042112	\N	\N
1262	Jelka	61361607	\N	\N
1263	Dawn Michelle	316327	\N	\N
1264	Lisa of Hopewell	1316990	\N	\N
1265	Sam	5759001	\N	\N
1266	Anna	7319656	\N	\N
1267	Luffy	7407364	\N	\N
1268	Alissa	20229277	\N	\N
1269	Sora	30012707	\N	\N
1270	Courtney	30189496	\N	\N
1271	Kaseadillla	32011663	\N	\N
1272	Banchi323	32824966	\N	\N
1273	Ryan	42289520	\N	\N
1274	Zouina	50140129	\N	\N
1275	Niall	50159446	\N	\N
1276	Michelle	50796966	\N	\N
1277	Huw	52059285	\N	\N
1278	Mohammad	57068506	\N	\N
1279	Fiona	2417021	\N	\N
1280	Andreia	3744453	\N	\N
1281	Janet	5346435	\N	\N
1282	Lily	5467982	\N	\N
1283	Victoria	13981467	\N	\N
1284	Angel	35597603	\N	\N
1285	Daria	53654788	\N	\N
1286	Kate	60732840	\N	\N
1287	Evan	1248986	\N	\N
1288	Kathy	2758455	\N	\N
1289	J_BlueFlower	5663651	\N	\N
1290	Susan	5923433	\N	\N
1291	Julie	9084560	\N	\N
1292	Gabriela	9726151	\N	\N
1293	Julie	13432161	\N	\N
1294	Antoinella	17123894	\N	\N
1295	Kathryn	30903940	\N	\N
1296	Paras2	33887780	\N	\N
1297	Feseven	43260837	\N	\N
1298	Jana	47010225	\N	\N
1299	Carolyn	51088962	\N	\N
1300	Terri	45128	\N	\N
1301	Tiffany	150648	\N	\N
1302	Steve	4833673	\N	\N
1303	Amy	6968514	\N	\N
1304	Fl�via	9566019	\N	\N
1305	Apoorv	21781579	\N	\N
1306	Katie	33619662	\N	\N
1307	Ruth	43535858	\N	\N
1308	Lori	3494632	\N	\N
1309	Charlotte	10642690	\N	\N
1310	Anna	17104656	\N	\N
1311	Mary-Chandler	18237049	\N	\N
1312	Emily	20134193	\N	\N
1313	Niles	21044979	\N	\N
1314	Alice	29628424	\N	\N
1315	Lily	48989400	\N	\N
1316	SejalRead Eat Sleep Repeat.	6479100	\N	\N
1317	Bruce	4293766	\N	\N
1318	Lotten	4639544	\N	\N
1319	Allie	4958674	\N	\N
1320	Amanda	5854266	\N	\N
1321	Haaze	6941528	\N	\N
1322	Manveer	19294597	\N	\N
1323	Nevada	29114908	\N	\N
1324	Jennifer	49389167	\N	\N
1325	Emily	54598397	\N	\N
1326	Dawn	54784560	\N	\N
1327	Chadwick	2518644	\N	\N
1328	Elizabeth	3310419	\N	\N
1329	Nanette	5983708	\N	\N
1330	Brenda	8119201	\N	\N
1331	Lolly	16303388	\N	\N
1332	Anders V.	17850749	\N	\N
1333	Nathalie	25116992	\N	\N
1334	Leni	36264060	\N	\N
1335	Alice	59668482	\N	\N
1336	Julia	8589681	\N	\N
1337	Cathy	27645744	\N	\N
1338	Susanna	25206734	\N	\N
1339	Alessandra	22175187	\N	\N
1340	Randolph	1804559	\N	\N
1341	Desertorum	30839997	\N	\N
1342	may	38437665	\N	\N
1343	Leigh	57029116	\N	\N
1344	Sasha	38698886	\N	\N
1345	Frank	27715232	\N	\N
1346	Vipin	2549786	\N	\N
1347	Michelle	28979128	\N	\N
1348	Marta	16044653	\N	\N
1349	Jack	1847134	\N	\N
1350	Karlyne	2158408	\N	\N
1351	Lauren	6748429	\N	\N
1352	Tatevik	7377638	\N	\N
1353	Joana Marta	12525315	\N	\N
1354	Laurie	15984398	\N	\N
1355	Tanya	23926342	\N	\N
1356	Ricky	26597660	\N	\N
1357	Fae	40670827	\N	\N
1358	Mary Kate	46336380	\N	\N
1359	Chiara	47823128	\N	\N
1360	Shania	47979268	\N	\N
1361	MKay	51180719	\N	\N
1362	Reiko	53169698	\N	\N
1363	Katie	54663613	\N	\N
1364	Payton	58284905	\N	\N
1365	Caravaggion	47048138	\N	\N
1366	Mel	140586	\N	\N
1367	Nate	3127227	\N	\N
1368	Kine Javiera	20126383	\N	\N
1369	Katie	34004477	\N	\N
1370	Darren	51183187	\N	\N
1371	Gyan	56231964	\N	\N
1372	Stuart	58729354	\N	\N
1373	Melora	5586131	\N	\N
1374	Katarzyna	14546083	\N	\N
1375	Sam	35278547	\N	\N
1376	Siddhartha	5742005	\N	\N
1377	Ashley	27544898	\N	\N
1378	Shannon	2066303	\N	\N
1379	Melissa	5075475	\N	\N
1380	Ffi	6076527	\N	\N
1381	Andy	10402220	\N	\N
1382	Josephine	15296599	\N	\N
1383	Athena	15928100	\N	\N
1384	ELLE	42380720	\N	\N
1385	Brit	43044584	\N	\N
1386	Chelsea	4405030	\N	\N
1387	Katie	5791343	\N	\N
1388	Rachel	10358888	\N	\N
1389	Mariana	22595921	\N	\N
1390	Linda	23051553	\N	\N
1391	Cody	13314582	\N	\N
1392	Greg	3372018	\N	\N
1393	Haleyselmon	9324071	\N	\N
1394	Maria	20846794	\N	\N
1395	Nente	22056219	\N	\N
1396	Jade	26081992	\N	\N
1397	Maria	50509525	\N	\N
1398	Kirsty-Ann	60162823	\N	\N
1399	Carl	60727852	\N	\N
1400	 jazz 	8787661	\N	\N
1401	Candace	3192690	\N	\N
1402	Kim	5731547	\N	\N
1403	Xan Shadowflutter	6732800	\N	\N
1404	Anetq	7356453	\N	\N
1405	Tobias	11408214	\N	\N
1406	Jelly	14957894	\N	\N
1407	Hilary	15972360	\N	\N
1408	Rui Alves	16723242	\N	\N
1409	Ryan	27591647	\N	\N
1410	Graham	48243908	\N	\N
1411	Tom	1378356	\N	\N
1412	Betsy	2873797	\N	\N
1413	Alexandar	12539885	\N	\N
1414	Parthiban	29910674	\N	\N
1415	Jackie	47569558	\N	\N
1416	Adelya	51751298	\N	\N
1417	Naz	52594068	\N	\N
1418	Ellena	4387621	\N	\N
1419	Bat-Cat	4462941	\N	\N
1420	Mayra	5434799	\N	\N
1421	Sara	5512657	\N	\N
1422	Jeni	11469936	\N	\N
1423	Tatiana	14415797	\N	\N
1424	Keyshla	23527311	\N	\N
1425	Veronika	28543688	\N	\N
1426	Samm	30448752	\N	\N
1427	Ginib	39859207	\N	\N
1428	Gerardo	45923518	\N	\N
1429	Cynthia	46237269	\N	\N
1430	Bojan	51300601	\N	\N
1431	Nathalie	43703645	\N	\N
1432	MalRoseMallory	15180596	\N	\N
1433	Amy	563794	\N	\N
1434	Orla	29708917	\N	\N
1435	Faith	4151972	\N	\N
1436	Prinal	5604235	\N	\N
1437	Lorna	6700518	\N	\N
1438	Kimberly	27489183	\N	\N
1439	Laura	36403107	\N	\N
1440	Sonal	39550720	\N	\N
1441	Tatiana	39566388	\N	\N
1442	Andrea	4329836	\N	\N
1443	Teri Pre	4903813	\N	\N
1444	Kristin	6543451	\N	\N
1445	Lizzy	6737110	\N	\N
1446	Terris	16281037	\N	\N
1447	Sadia	27327078	\N	\N
1448	Emma	45906507	\N	\N
1449	Allie	59335315	\N	\N
1450	Lily	60482867	\N	\N
1451	Glynn	2770066	\N	\N
1452	Kent	16211154	\N	\N
1453	Katie	18774351	\N	\N
1454	Violet	20044192	\N	\N
1455	Virgola	22079163	\N	\N
1456	Anirban	33592940	\N	\N
1457	Annie	53406423	\N	\N
1458	Sandro	53484257	\N	\N
1459	Murtaza	59487236	\N	\N
1460	Tammy	2461294	\N	\N
1461	Sarah	3752842	\N	\N
1462	Missy J	7406091	\N	\N
1463	Felicia	7621700	\N	\N
1464	Nathan	10678686	\N	\N
1465	Ichiqua	28530748	\N	\N
1466	Tavan	41518371	\N	\N
1467	Pinchy	4889505	\N	\N
1468	Katelyn	20408331	\N	\N
1469	Maria	26196077	\N	\N
1470	Justin Stuart	28933466	\N	\N
1471	Jerin	1939438	\N	\N
1472	Jackie	3194802	\N	\N
1473	Renee	13386332	\N	\N
1474	Nicole	25807280	\N	\N
1475	J	53099797	\N	\N
1476	Charlotte	29291004	\N	\N
1477	Jennifer	3588260	\N	\N
1478	Sarah Jane (MySoulToRead)	6811146	\N	\N
1479	Courtney	16784116	\N	\N
1480	John	32350177	\N	\N
1481	Mhairi	55701790	\N	\N
1482	Stephen	2393603	\N	\N
1483	Alisia	4803593	\N	\N
1484	Elienc	5691972	\N	\N
1485	Terri Lynn	5699299	\N	\N
1486	Leslie	13515434	\N	\N
1487	Lauren	28210319	\N	\N
1488	Jay	47768549	\N	\N
1489	Alex	783969	\N	\N
1490	Candiss	2867198	\N	\N
1491	Amy	6260271	\N	\N
1492	Viktoria	14132231	\N	\N
1493	Chelsea	21352370	\N	\N
1494	Peter	38641427	\N	\N
1495	Raul	43664238	\N	\N
1496	Sia	50069757	\N	\N
1497	Janet	8591103	\N	\N
1498	Mirela	16698422	\N	\N
1499	Lena	27934177	\N	\N
1500	Megan	30899765	\N	\N
1501	Annie	44325174	\N	\N
1502	Olivera	52609928	\N	\N
1503	Roberto	60728796	\N	\N
1504	Marlene	9967183	\N	\N
1505	Kimberly	28211638	\N	\N
1506	AyaSuu	1620487	\N	\N
1507	Lauren Taylor	4876208	\N	\N
1508	Janani	35257733	\N	\N
1509	Ankit	37920429	\N	\N
1510	Abraham	52087801	\N	\N
1511	Everyman	1176962	\N	\N
1512	decala	5274670	\N	\N
1513	Anna	5355846	\N	\N
1514	Imane	10866517	\N	\N
1515	Angie	32412036	\N	\N
1516	Susanna	38431898	\N	\N
1517	Kara	44340098	\N	\N
1518	Susan	48234312	\N	\N
1519	Jon	50132012	\N	\N
1520	Emerson	54089629	\N	\N
1521	Jennifer	54266751	\N	\N
1522	Jennifer	4068752	\N	\N
1523	Svenja	22609430	\N	\N
1524	Shannon	36388372	\N	\N
1525	Jill	5594847	\N	\N
1526	Hazellie	73984	\N	\N
1527	Alan	1045667	\N	\N
1528	Kaie	8739233	\N	\N
1529	Nathan	29647641	\N	\N
1530	Shruthi	37797307	\N	\N
1531	Kristinita	39382365	\N	\N
1532	Nicolas	45233635	\N	\N
1533	Kyle	50285702	\N	\N
1534	Ana	51876421	\N	\N
1535	Esse	3308557	\N	\N
1536	Sookie	4136921	\N	\N
1537	Ana Carolina	15828946	\N	\N
1538	Leonela	25337040	\N	\N
1539	Rym	28357860	\N	\N
1540	Lisa Ann 	24115642	\N	\N
1541	rinu	7603456	\N	\N
1542	Lu�sa	26391692	\N	\N
1543	Lara	50269346	\N	\N
1544	Mathias	52344213	\N	\N
1545	Kristen	2648890	\N	\N
1546	Christine	2700521	\N	\N
1547	Nicole	8237149	\N	\N
1548	Inesa	8785019	\N	\N
1549	Anusha	16375752	\N	\N
1550	Hsinsan	26745720	\N	\N
1551	Christopher	52630833	\N	\N
1552	Carlos	60150705	\N	\N
1553	Tommi	3238291	\N	\N
1554	Moselle	14939713	\N	\N
1555	JoLynn	1846518	\N	\N
1556	Giulia	16078869	\N	\N
1557	createjoy	1870680	\N	\N
1558	Kristina	1030889	\N	\N
1559	Anna	61164532	\N	\N
1560	Jura	1613698	\N	\N
1561	Abbra	16137709	\N	\N
1562	Chloe	772594	\N	\N
1563	Hannu	3759476	\N	\N
1564	Amanda	2049747	\N	\N
1565	Mcrid	42890764	\N	\N
1566	Kayley	56783608	\N	\N
1567	Allison	2299298	\N	\N
1568	Kristina	3266324	\N	\N
1569	Bob	4814165	\N	\N
1570	Jayne	5075258	\N	\N
1571	Maarit	6892146	\N	\N
1572	Juliana	12393247	\N	\N
1573	Rafaella	18867260	\N	\N
1574	Angela	26378095	\N	\N
1575	Amanda	40452101	\N	\N
1576	Faith	53174954	\N	\N
1577	Evelyn	60933497	\N	\N
1578	Alex	3144945	\N	\N
1579	Sara	5930057	\N	\N
1580	John	6511673	\N	\N
1581	Janin	60373788	\N	\N
1582	Blueberry	3107964	\N	\N
1583	Jaylia3	1794273	\N	\N
1584	Irene	2185963	\N	\N
1585	Angela	16384158	\N	\N
1586	Loretta	18967405	\N	\N
1587	Daniela	19123863	\N	\N
1588	Rachael	34113416	\N	\N
1589	Oana	48384942	\N	\N
1590	Penelope	3211162	\N	\N
1591	Tracy (A Good Novel)	3213130	\N	\N
1592	Charlotte	3736263	\N	\N
1593	Bollinger	4134992	\N	\N
1594	Kimberly	8855118	\N	\N
1595	Ozgun	16038595	\N	\N
1596	Lena	35645863	\N	\N
1597	Holly	1246928	\N	\N
1598	Mohammed	3947233	\N	\N
1599	Monica	3962279	\N	\N
1600	Mercedes	5124500	\N	\N
1601	A Bookworm Reading (Plethora)	11978911	\N	\N
1602	Vanessa	14638697	\N	\N
1603	Renee	57175071	\N	\N
1604	Susana	1205030	\N	\N
1605	Alexandra	12422562	\N	\N
1606	Linnie	30638454	\N	\N
1607	Stephanie	35084560	\N	\N
1608	Cristina	44105907	\N	\N
1609	Zavier	49114885	\N	\N
1610	Andrew	59679829	\N	\N
1611	Stephanie	6144386	\N	\N
1612	Jessica	6800836	\N	\N
1613	saiberiac	15367776	\N	\N
1614	Karen	17613506	\N	\N
1615	Karen	22115696	\N	\N
1616	The Mad Hatter ~I'd rather have my kingdom fall than lose you t	45707786	\N	\N
1617	Matt	57156694	\N	\N
1618	Rebecca	3701563	\N	\N
1619	Mickey	5077132	\N	\N
1620	Aimee	6921289	\N	\N
1621	Jolene	7676470	\N	\N
1622	Lika_k	10358818	\N	\N
1623	Milica	16512045	\N	\N
1624	Chandler	43724897	\N	\N
1625	Jessi	47327737	\N	\N
1626	Susan	54032444	\N	\N
1627	Jennifer	3859138	\N	\N
1628	Kaycie	13057993	\N	\N
1629	Heather	14816999	\N	\N
1630	Megan	22059380	\N	\N
1631	Adriana	5879397	\N	\N
1632	Martha	7187793	\N	\N
1633	Jackie	14727061	\N	\N
1634	Haelgeweer_veertjie	21485875	\N	\N
1635	Michael	43933373	\N	\N
1636	Billy "D"	44025278	\N	\N
1637	Solveig	54042229	\N	\N
1638	Amy	4722345	\N	\N
1639	Sara	4987872	\N	\N
1640	Asasa	6177431	\N	\N
1641	Isha	7212599	\N	\N
1642	Beth	19932428	\N	\N
1643	Panagiotis	20911132	\N	\N
1644	Leah	6639670	\N	\N
1645	Traveling Diva	1167174	\N	\N
1646	Eva	6316356	\N	\N
1647	Guylaine	9251735	\N	\N
1648	Ravi	23745653	\N	\N
1649	Linda	32149770	\N	\N
1650	Bobbie	45260309	\N	\N
1651	Asha	46235403	\N	\N
1652	Claire	61144973	\N	\N
1653	Gergana	4785539	\N	\N
1654	Elida	5003939	\N	\N
1655	Nadia	22316796	\N	\N
1656	Christine	24543998	\N	\N
1657	Giselle	52172397	\N	\N
1658	Eliane	5025016	\N	\N
1659	Michelle	7482746	\N	\N
1660	Dario	20381752	\N	\N
1661	Haifa	22432321	\N	\N
1662	Rebekah	27582971	\N	\N
1663	Ana-maria	39082507	\N	\N
1664	Elizabeth	61079913	\N	\N
1665	Anna	7360704	\N	\N
1666	Kelly	23210147	\N	\N
1667	Kristin	60220111	\N	\N
1668	Melanie	851236	\N	\N
1669	Sophia B	7534953	\N	\N
1670	Mateja	11040796	\N	\N
1671	Alissa	11948096	\N	\N
1672	Myst	9037541	\N	\N
1673	Erika	11776940	\N	\N
1674	siriusedward	15034383	\N	\N
1675	Genadi	4592486	\N	\N
1676	Jeffrey	4770301	\N	\N
1677	Frankie	8161922	\N	\N
1678	Leora	21376675	\N	\N
1679	Katya	33783723	\N	\N
1680	Nats	746129	\N	\N
1681	averybiird	24303044	\N	\N
1682	David	1848162	\N	\N
1683	Ellen	2285736	\N	\N
1684	Jill	2674024	\N	\N
1685	Denitsa	4290138	\N	\N
1686	Kaitlin	4810925	\N	\N
1687	Monika	10992422	\N	\N
1688	Kashish	51690774	\N	\N
1689	Lauren	54042086	\N	\N
1690	Ellen	6692762	\N	\N
1691	Stine Kristin	9776147	\N	\N
1692	Jen 	18916088	\N	\N
1693	Lesley	1674575	\N	\N
1694	Mary	4625370	\N	\N
1695	Josh	5687551	\N	\N
1696	Maggie	7271519	\N	\N
1697	Byurakn	9475319	\N	\N
1698	Baoxian	10209547	\N	\N
1699	Marleny	16380600	\N	\N
1700	Lenna	29607447	\N	\N
1701	Kelsie	35992305	\N	\N
1702	Steph	45550244	\N	\N
1703	Imane	28945871	\N	\N
1704	Kelli	10688175	\N	\N
1705	Melia	17314597	\N	\N
1706	Sherry	51389380	\N	\N
1707	Liz	1472632	\N	\N
1708	Pat	3631551	\N	\N
1709	Beth	9526460	\N	\N
1710	Frances	17651062	\N	\N
1711	Daniel	836104	\N	\N
1712	Maggie	1039829	\N	\N
1713	Kris	1782462	\N	\N
1714	Tom	12209127	\N	\N
1715	Karen	33487505	\N	\N
1716	Laetitia	33720431	\N	\N
1717	Suzan	4298700	\N	\N
1718	Lindy-Lane	1448668	\N	\N
1719	Brian	1035284	\N	\N
1720	Darlene	1122567	\N	\N
1721	Kirsty	7261041	\N	\N
1722	Sieara	10114136	\N	\N
1723	Aryeh	26861300	\N	\N
1724	Zainab	29465222	\N	\N
1725	Motazz	52297691	\N	\N
1726	LJo	54263443	\N	\N
1727	Samantha	8916729	\N	\N
1728	Namrata	28535367	\N	\N
1729	Landi	10976344	\N	\N
1730	Mike	27649865	\N	\N
1731	Lesserknowngems	31692868	\N	\N
1732	Avram	52029577	\N	\N
1733	Lei	2434515	\N	\N
1734	samar	4091301	\N	\N
1735	Maiken	9650876	\N	\N
1736	Kristen	12955314	\N	\N
1737	Robin	5733218	\N	\N
1738	Dani	24659134	\N	\N
1739	Sarah	41063328	\N	\N
1740	Constantin	27330613	\N	\N
1741	4ZZZ	6852430	\N	\N
1742	Alina	11008951	\N	\N
1743	Cynthia	17209832	\N	\N
1744	Daria	27226789	\N	\N
1745	Matthew	51001130	\N	\N
1746	Meg	14039718	\N	\N
1747	Emilie	20416671	\N	\N
1748	Anja	50885988	\N	\N
1749	Sarah	29932900	\N	\N
1750	Daniela	56611545	\N	\N
1751	Leafkid	61409314	\N	\N
1752	Mia	3774181	\N	\N
1753	Allison	7222675	\N	\N
1754	Nir	59141253	\N	\N
1755	Andrea	989638	\N	\N
1756	Jessica	6856763	\N	\N
1757	Anjalii	18740345	\N	\N
1758	Anne	23304719	\N	\N
1759	Henrique	33538400	\N	\N
1760	Jessie	44760832	\N	\N
1761	Daniela	50632292	\N	\N
1762	Josh	21227017	\N	\N
1763	Nada	2512212	\N	\N
1764	Jerrod	31686848	\N	\N
1765	Anushree	42789261	\N	\N
1766	Madle	22067315	\N	\N
1767	Mary	1353683	\N	\N
1768	Shawn	3275985	\N	\N
1769	Simon	11003924	\N	\N
1770	Nina Diep	28900755	\N	\N
1771	Audrey	4818239	\N	\N
1772	Caraliotiscrivo	10846883	\N	\N
1773	Seda	12085922	\N	\N
1774	Emma	27283429	\N	\N
1775	Hanna	25200536	\N	\N
1776	Morgan	3116681	\N	\N
1777	Meda	8888297	\N	\N
1778	Linda	9965021	\N	\N
1779	Eoinda	41626366	\N	\N
1780	Evelyn	26926435	\N	\N
1781	Katrna	21664966	\N	\N
1782	Marija	25876620	\N	\N
1783	Jessica	1264329	\N	\N
1784	Darina	6084418	\N	\N
1785	Briane	16444747	\N	\N
1786	Brian	44150515	\N	\N
1787	Alia	47577085	\N	\N
1788	Oriana	4774370	\N	\N
1789	Xelly	10159773	\N	\N
1790	shimoz	32542568	\N	\N
1791	Tasha	3589603	\N	\N
1792	Asiacan	1839748	\N	\N
1793	Jxiang	6511864	\N	\N
1794	Kim	4750593	\N	\N
1795	Divya	14808784	\N	\N
1796	Pawan	45622584	\N	\N
1797	Laura	13310820	\N	\N
1798	Ian	28547777	\N	\N
1799	Nora	48381559	\N	\N
1800	Jess	21415260	\N	\N
1801	Heather	14772206	\N	\N
1802	Natalia	4700950	\N	\N
1803	Katarzyna	21709552	\N	\N
1804	Ashley	23125968	\N	\N
1805	James	41609617	\N	\N
1806	TTZ	29610298	\N	\N
1807	Alycia	5896305	\N	\N
1808	Ferran	61127927	\N	\N
1809	paperdollmom	13228718	\N	\N
1810	Phil	16836004	\N	\N
1811	Karin	46082840	\N	\N
1812	Anna	47105729	\N	\N
1813	Talha	8781967	\N	\N
1814	B�rbara	2404656	\N	\N
1815	Ben	13475442	\N	\N
1816	Mary	17052484	\N	\N
1817	Elena	27204798	\N	\N
1818	Tayebe	49745287	\N	\N
1819	Cristina	17337223	\N	\N
1820	Erin	1624687	\N	\N
1821	Savvina	17323407	\N	\N
1822	Joel	14715759	\N	\N
1823	Ramybe	17108252	\N	\N
1824	Erwin	21812440	\N	\N
1825	Eva	58669992	\N	\N
1826	Madge	3683727	\N	\N
1827	Katja	28305840	\N	\N
1828	Claudia	38768440	\N	\N
1829	Marie	51536461	\N	\N
1830	Joseph	10481632	\N	\N
1831	H�kon	49126210	\N	\N
1832	Mia	7334594	\N	\N
1833	Anagha	29490006	\N	\N
1834	Sudha	1348967	\N	\N
1835	Estelle	6713429	\N	\N
1836	John	42366039	\N	\N
1837	Angela	2755807	\N	\N
1838	Veregeia	5089259	\N	\N
1839	James	10183886	\N	\N
1840	Sai Kishore	23275940	\N	\N
1841	Sunny	43731550	\N	\N
1842	Renie	48457059	\N	\N
1843	Chappy	19932497	\N	\N
1844	Alberto	16902162	\N	\N
1845	Mfatima.	14581456	\N	\N
1846	Kim. E.	58415524	\N	\N
1847	Verena	2405915	\N	\N
1848	Jaana	16296119	\N	\N
1849	Jaleesa	6175918	\N	\N
1850	Fara	7670297	\N	\N
1851	Maria Jose	16197060	\N	\N
1852	Whitney	31704171	\N	\N
1853	Ayumu	26768026	\N	\N
1854	Adrian	22809267	\N	\N
1855	Eddie	58103668	\N	\N
1856	Dilja	5845573	\N	\N
1857	Gehna	15947944	\N	\N
1858	Tasneem	10618864	\N	\N
1859	Ankita	7694511	\N	\N
1860	Yuni	4231042	\N	\N
1861	William	27360667	\N	\N
1862	Irene	32644789	\N	\N
1863	Klaudia	40179561	\N	\N
1864	Bella	41140830	\N	\N
1865	Isabel	25552251	\N	\N
1866	Sammi	2619046	\N	\N
1867	Mary	3616120	\N	\N
1868	Adriano	22808141	\N	\N
1869	Viet	45634622	\N	\N
1870	Honeyeater	46011694	\N	\N
1871	Lily	16374439	\N	\N
1872	Hil Al	6870321	\N	\N
1873	Katrina	7524744	\N	\N
1874	Athina	47664220	\N	\N
1875	Ruth Noemi	7336088	\N	\N
1876	Erin the Avid Reader BFF's with the Cheshire Cat and Cthulhu	23003918	\N	\N
1877	GK	34318897	\N	\N
1878	Jennifer	4876956	\N	\N
1879	Megan	28676387	\N	\N
1880	Melanie	13887479	\N	\N
1881	ALEX	26129128	\N	\N
1882	Anna	29627834	\N	\N
1883	Kawtar	40374899	\N	\N
1884	Hannah	58782413	\N	\N
1885	Thomas	10784896	\N	\N
1886	Xrusanthi	1615129	\N	\N
1887	Radina	19843121	\N	\N
1888	Thomas	52221453	\N	\N
1889	Leanne	5145884	\N	\N
1890	Grafakos	26840794	\N	\N
1891	Israel	39349867	\N	\N
1892	Michael	58425769	\N	\N
1893	Deepak	37167574	\N	\N
1894	Nuha AlRumaih	37156302	\N	\N
1895	Kalpesh	29903477	\N	\N
1896	Brandy	7584983	\N	\N
1897	Piyush	30827781	\N	\N
1898	Josh	53613190	\N	\N
1899	stormie	3235961	\N	\N
1900	stormie	3235961	\N	\N
1901	Regine	3854100	\N	\N
1902	kilagore trout	3486226	\N	\N
1903	Quanjie	44359083	\N	\N
1904	Timothy	10464476	\N	\N
1905	Susannah	601198	\N	\N
1906	Karen	7060182	\N	\N
1907	Bruce	46420158	\N	\N
1908	Linda	47273987	\N	\N
1909	Portia	8087606	\N	\N
1910	Rituj	25061210	\N	\N
1911	Sunny	44496902	\N	\N
1912	Lavinia	30510698	\N	\N
1913	Rizki	42816017	\N	\N
1914	Vatsa	29948152	\N	\N
1915	Ahmad	4310493	\N	\N
1916	Kendra	16144778	\N	\N
1917	James	30503411	\N	\N
1918	Mercurialgem	34242951	\N	\N
1919	Anastasia	4731088	\N	\N
1920	Farah	8987841	\N	\N
1921	Janice(JG)	4151289	\N	\N
1922	Brady	7030272	\N	\N
1923	Ellie	48792233	\N	\N
1924	Luckie	52222515	\N	\N
1925	Rachel	370643	\N	\N
1926	Andee	18823491	\N	\N
1927	Paivi	33119303	\N	\N
1928	Kodelle	48302160	\N	\N
1929	Mikey	4069296	\N	\N
1930	Penny	4725576	\N	\N
1931	Jenai	52296872	\N	\N
1932	Robert	52753682	\N	\N
1933	Rachel	245387	\N	\N
1934	Nicole	6879837	\N	\N
1935	Vero	6974238	\N	\N
1936	Rita	10122178	\N	\N
1937	Audrey	18923206	\N	\N
1938	Ika	39016186	\N	\N
1939	Cathy	137094	\N	\N
1940	Miriam	21377324	\N	\N
1941	Justyna	42911905	\N	\N
1942	Felicia	126918	\N	\N
1943	Laura	15712909	\N	\N
1944	Nicole	2220455	\N	\N
1945	Faith	3024348	\N	\N
1946	Karen	4231520	\N	\N
1947	Brent	24689225	\N	\N
1948	Tara	38802558	\N	\N
1949	Cherif	7582623	\N	\N
1950	Minn	21487746	\N	\N
1951	Kim	8036318	\N	\N
1952	Bigollo	8576260	\N	\N
1953	Esther	36790797	\N	\N
1954	Kirby	14836879	\N	\N
1955	Clarion	58643815	\N	\N
1956	Bart	8210369	\N	\N
1957	Eva	10903040	\N	\N
1958	Ashley	21959354	\N	\N
1959	Victoria	28659912	\N	\N
1960	Kristen	36505279	\N	\N
1961	Ciera	4618357	\N	\N
1962	Kerstin	6897324	\N	\N
1963	Natalle	4829394	\N	\N
1964	Jennifer	7542614	\N	\N
1965	Kelli	10869520	\N	\N
1966	John	11891868	\N	\N
1967	EsposaDek	15842261	\N	\N
1968	Chrissymisha	45539797	\N	\N
1969	Jessiebee	6488416	\N	\N
1970	Andrea	15138200	\N	\N
1971	Sara (Empress Pengy)	43681471	\N	\N
1972	B�rbara	3113681	\N	\N
1973	Lesley	7108979	\N	\N
1974	Johanna	34046231	\N	\N
1975	MT	45799875	\N	\N
1976	Wen	8686221	\N	\N
1977	Jennifer	10887233	\N	\N
1978	Benish	27828691	\N	\N
1979	Ivonne	41851578	\N	\N
1980	Erica	54297286	\N	\N
1981	Shelby	61169753	\N	\N
1982	Balasana	52635571	\N	\N
1983	Dawn	4447323	\N	\N
1984	Jerry	5391778	\N	\N
1985	Melinda	28398809	\N	\N
1986	Raphael	55157377	\N	\N
1987	Martha	7212128	\N	\N
1988	Elizabeth	7956302	\N	\N
1989	Amanda	38906877	\N	\N
1990	Malavika	39194436	\N	\N
1991	Narine	348332	\N	\N
1992	LaTrica	1833981	\N	\N
1993	Hayat	6116230	\N	\N
1994	Stephanie	6141083	\N	\N
1995	Maria	26820743	\N	\N
1996	Taylor	48658258	\N	\N
1997	Ruth	10523707	\N	\N
1998	Pip	3555151	\N	\N
1999	Donna	5846646	\N	\N
2000	Rebecca	32917354	\N	\N
2001		5138550	\N	\N
2002	Megan	27191123	\N	\N
2003	Cassandra	30935802	\N	\N
2004	Luiz	41677618	\N	\N
2005	Jane	44185854	\N	\N
2006	Sarah	15087555	\N	\N
2007	Eowyn83632	49877176	\N	\N
2008	Liz	986812	\N	\N
2009	Marita	3668593	\N	\N
2010	Christopher	4934369	\N	\N
2011	Jenny	9212537	\N	\N
2012	Sandra	15971515	\N	\N
2013	Anthony	54519322	\N	\N
2014	Heather	27807422	\N	\N
2015	Camilla	45169671	\N	\N
2016	Stephanie	13155089	\N	\N
2017	Caitlin	40721211	\N	\N
2018	A.	2537196	\N	\N
2019	Chelsea	11634616	\N	\N
2020	Ritwik	24048474	\N	\N
2021	Celeste	28052742	\N	\N
2022	Sarah	28362548	\N	\N
2023	Heather	54856307	\N	\N
2024	Cindy	2785593	\N	\N
2025	Luella	39024106	\N	\N
2026	Jamie	53059987	\N	\N
2027	Kathy	3440393	\N	\N
2028	Leah	5617124	\N	\N
2029	Jeff	5947079	\N	\N
2030	Samara	6751393	\N	\N
2031	Heather	23724377	\N	\N
2032	Meg-Anne	5137397	\N	\N
2033	Catherine	12794239	\N	\N
2034	Sam F	45563106	\N	\N
2035	Marcus	4316958	\N	\N
2036	Jamie	37324421	\N	\N
2037	Arek	58288785	\N	\N
2038	Marissa	19120429	\N	\N
2039	Ilana	1839643	\N	\N
2040	Chinook	3724981	\N	\N
2041	Jamie	42922782	\N	\N
2042	Bettina	4838510	\N	\N
2043	Mikayla	11475130	\N	\N
2044	Beth	27553129	\N	\N
2045	Bree	21873325	\N	\N
2046	Matt	7090483	\N	\N
2047	Crawford	21420333	\N	\N
2048	Elizabeth	910729	\N	\N
2049	Nea	2943635	\N	\N
2050	Emma	3866433	\N	\N
2051	Trevor	15333045	\N	\N
2052	Victor	24714831	\N	\N
2053	Nathan	35397727	\N	\N
2054	Svalberd	35440184	\N	\N
2055	Dawnie	36293066	\N	\N
2056	Catherine	24835375	\N	\N
2057	Nina	30022837	\N	\N
2058	Cagliostro	12249310	\N	\N
2059	Lily	14906026	\N	\N
2060	Spoon_thief	13339000	\N	\N
2061	Anne	50911914	\N	\N
2062	Tali	20417351	\N	\N
2063	Sheryl	30673146	\N	\N
2064	Rachel	36916046	\N	\N
2065	Marquise	4674014	\N	\N
2066	Brandi	1829758	\N	\N
2067	Joey	17406605	\N	\N
2068	Natalie	4936267	\N	\N
2069	Karen	6825903	\N	\N
2070	Rebecca	7240312	\N	\N
2071	Agata	30958249	\N	\N
2072	Joseph	36070042	\N	\N
2073	James	43288991	\N	\N
2074	Melanie	5448428	\N	\N
2075	Nina (Minou)	11634281	\N	\N
2076	Annette	5877090	\N	\N
2077	Novita	6294385	\N	\N
2078	Kitty	14849216	\N	\N
2079	Andr�s	17886555	\N	\N
2080	Ruby	11807429	\N	\N
2081	Catherine	33071712	\N	\N
2082	Gregg	3410361	\N	\N
2083	Je	26997204	\N	\N
2084	Sophia	42212206	\N	\N
2085	Gloria	13905664	\N	\N
2086	Lea	7262885	\N	\N
2087	Karen	23905364	\N	\N
2514	Gresa	12944026	\N	\N
2515	KG	18731541	\N	\N
2516	Timba	27299105	\N	\N
2517	Alex	1243058	\N	\N
2518	Rita Lo	3735319	\N	\N
2519	Jamie	1900611	\N	\N
2520	Dorukhan	24299227	\N	\N
2521	Christina	16842323	\N	\N
2522	Christine	3456978	\N	\N
2523	Hicham	40268028	\N	\N
2524	Nithya Nandam	7479555	\N	\N
2525	Saphira	13357880	\N	\N
2526	Kate	17386712	\N	\N
2527	Olivia	2798760	\N	\N
2528	Johanna	23094610	\N	\N
2529	Anto5	12758747	\N	\N
2530	Eva	13947516	\N	\N
2531	Kathryn	3322614	\N	\N
2532	Aasia	44489182	\N	\N
2533	Tori	4912916	\N	\N
2534	Vasou	26524105	\N	\N
2535	Divya	45524961	\N	\N
2536	Inam	5486841	\N	\N
2537	Moot	33386928	\N	\N
2538	Shawn	52748399	\N	\N
2539	Daena	2408316	\N	\N
2540	Kat	5053114	\N	\N
2541	Sam	34066236	\N	\N
2542	Amanda	1240205	\N	\N
2543	Cindy LooHoo	2263512	\N	\N
2544	Kimberley	61187473	\N	\N
2545	Maryam	9755830	\N	\N
2546	Nathan	50231578	\N	\N
2547	Nick	50649341	\N	\N
2548	Chris	22709697	\N	\N
2549	Mahala	34916018	\N	\N
2550	Sam	53707894	\N	\N
2551	Nevey	1906287	\N	\N
2552	Erin	13550833	\N	\N
2553	Celeste	60437442	\N	\N
2554	Ronak	52181473	\N	\N
2555	dechades	56770618	\N	\N
2556	Chris	3273412	\N	\N
2557	Tegan	5145764	\N	\N
2558	Sarah	20523069	\N	\N
2559	Heda	60289731	\N	\N
2560	Jason	139817	\N	\N
2561	Tom	16977693	\N	\N
2562	Annielou	2615433	\N	\N
2563	Jessie	13755727	\N	\N
2564	Ginger	20639468	\N	\N
2565	Lauren	55093728	\N	\N
2566	Cait	1419944	\N	\N
2567	Utopia	23411880	\N	\N
2568	Alessandra	57344018	\N	\N
2569	Mel Bee	58455468	\N	\N
2570	Alexander	6052664	\N	\N
2571	Barbara	18523174	\N	\N
2572	Dilara	30878122	\N	\N
2573	Abe	59329664	\N	\N
2574	Heather	412611	\N	\N
2575	Trudy	6874915	\N	\N
2576	MMG	29480445	\N	\N
2577	Barbara	2898470	\N	\N
2578	Pascal	2032346	\N	\N
2579	Laura	1144566	\N	\N
2580	Christopher	2144714	\N	\N
2581	Stefan	5830929	\N	\N
2582	Laura	54389031	\N	\N
2583	Jacquelin	5494934	\N	\N
2584	Katie	44186833	\N	\N
2585	Dana	6687638	\N	\N
2586	Beth	17631858	\N	\N
2587	Jamie	17663807	\N	\N
2588	Bruno	23551056	\N	\N
2589	Krysta	4756056	\N	\N
2590	Carmen	7427758	\N	\N
2591	Kate	3914144	\N	\N
2592	Lori	13437851	\N	\N
2593	Avalon	19061359	\N	\N
2594	Jane	60816323	\N	\N
2595	Lori	12287348	\N	\N
2596	Vivian	30292498	\N	\N
2597	Kaila	37805016	\N	\N
2598	Nidhi	44358443	\N	\N
2599	Andrea	8974830	\N	\N
2600	Diptarup	31496645	\N	\N
2601	Sofi	28038586	\N	\N
2602	Basheer	38186846	\N	\N
2603	Charlene	9545973	\N	\N
2604	Gabriela	32052918	\N	\N
2605	Scott	4478838	\N	\N
2606	Diego	58289602	\N	\N
2607	Debra	15662981	\N	\N
2608	Alison	60478216	\N	\N
2609	Arda	61079765	\N	\N
2610	Dernica	30242486	\N	\N
2611	Alex	24756056	\N	\N
2612	Carrie	10893666	\N	\N
2613	Peter	4554949	\N	\N
2614	Allison	1652865	\N	\N
2615	Tricia	27182843	\N	\N
2616	Rosalinda	19235463	\N	\N
2617	Shelby	7256044	\N	\N
2618	Becky	23443930	\N	\N
2619	Jellila	60193648	\N	\N
2620	Candy	23860350	\N	\N
2621	Daniele	51327175	\N	\N
2622	Sara	17350820	\N	\N
2623	Annina	3784140	\N	\N
2624	Maria	16041906	\N	\N
2625	Carrie	60443066	\N	\N
2626	Line	3868645	\N	\N
2627	Lise	53380126	\N	\N
2628	C	25209542	\N	\N
2629	Chloe	2970253	\N	\N
2630	Ritsa	3360882	\N	\N
2631	Kacie	2592070	\N	\N
2632	Alexandra	7966430	\N	\N
2633	Linnea	4536799	\N	\N
2634	Talyah	5388455	\N	\N
2635	Abhinand	60309261	\N	\N
2636	Samantha	43367475	\N	\N
2637	Veera	5847268	\N	\N
2638	Jim	4082629	\N	\N
2639	Hannah	47789616	\N	\N
2640	Jennifer	19626779	\N	\N
2641	Michael	32542669	\N	\N
2642	Alishah	43286128	\N	\N
2643	Graham	17090374	\N	\N
2644	Monica	6248508	\N	\N
2645	Bani	55449929	\N	\N
2646	Robert	5670342	\N	\N
2647	Laurajean	144252	\N	\N
2648	Jeremy	982564	\N	\N
2649	Kathryn	5887585	\N	\N
2650	Julie	61094118	\N	\N
2651	Claude	6687884	\N	\N
2652	Rona	18756921	\N	\N
2653	Daniel	29842535	\N	\N
2654	Lisa	32065772	\N	\N
2655	Augustine	7313521	\N	\N
2656	Berthe	15233203	\N	\N
2657	Paul	46001897	\N	\N
2816	Nat	17510367	\N	\N
2817	Manuel	37462704	\N	\N
2818	Jon	27528290	\N	\N
2819	Nourhan |-/	42891592	\N	\N
2820	Umer	53509795	\N	\N
2821	Abhijithkrishnan	47834948	\N	\N
2822	Alfreda	23754460	\N	\N
2823	Kassandra	15896768	\N	\N
2824	Carina	25765786	\N	\N
2825	Hanssun	36294727	\N	\N
2826	Kristen	8241324	\N	\N
2827	Maaian	5445309	\N	\N
2828	Sarah	5033053	\N	\N
2829	Veronica	30202163	\N	\N
2830	Courtney	4895549	\N	\N
2831	Yuan	18705686	\N	\N
2832	S	30300326	\N	\N
2833	Biko	5854783	\N	\N
2834	Joana	56431298	\N	\N
2835	Christi	3170800	\N	\N
2836	Amber	3929930	\N	\N
2837	Brisida	21136762	\N	\N
2838	Lucy	4858527	\N	\N
2839	Carl	5935420	\N	\N
2840	Carlos	9494368	\N	\N
2841	Eliza	7791108	\N	\N
2842	Ariana	7330196	\N	\N
2843	Angana	50827820	\N	\N
2844	Julie	60835588	\N	\N
2845	Vickythesurfer	6818557	\N	\N
2846	Michelle	56060977	\N	\N
2847	Evans	32009845	\N	\N
2848	Franziska	3846556	\N	\N
2849	Kristin	11093972	\N	\N
2850	Cristopher	23221719	\N	\N
2851	Mark	8435389	\N	\N
2852	Lauren	5110295	\N	\N
2853	Thanh	43744915	\N	\N
2854	Amanda	3313458	\N	\N
2855	Adnerb	32294893	\N	\N
2856	Madeline	60270291	\N	\N
2857	Swati	4748222	\N	\N
2858	Terry	38721247	\N	\N
2859	Andrew	6030313	\N	\N
2860	Naythan	34559196	\N	\N
2861	Eve	9156880	\N	\N
2862	diemmi147	2945506	\N	\N
2863	M.	5173189	\N	\N
2864	 Crystal 	19080180	\N	\N
2865	Leigh	1971588	\N	\N
2866	Amy	3337502	\N	\N
2867	Sarah	26742320	\N	\N
2868	Michelle	2543143	\N	\N
2869	Neal	5391222	\N	\N
2870	Sam	6992813	\N	\N
2871	Bouchra	14704898	\N	\N
2872	Susie	27010091	\N	\N
2873	Bria	23617089	\N	\N
2874	Connie	12952111	\N	\N
2875	Paw	24985126	\N	\N
2876	Henry	14734360	\N	\N
2877	Daphne	5411554	\N	\N
2878	Shannon	11308083	\N	\N
2879	Kristina	15672146	\N	\N
2880	Emily	7916108	\N	\N
2881	Sigrid	2713893	\N	\N
2882	Bob	3657860	\N	\N
2883	Jennifer	5689112	\N	\N
2884	James	8017610	\N	\N
2885	Danae	14936379	\N	\N
2886	Laura	4074465	\N	\N
2887	Susan	17845658	\N	\N
2888	Jane	9920381	\N	\N
2889	Jenn	50772536	\N	\N
2890	Lanore	417475	\N	\N
2891	Malika	15852501	\N	\N
2892	Emily	1469517	\N	\N
2893	Eva	19161648	\N	\N
2894	Ozlem	41177824	\N	\N
2895	Heather	2182261	\N	\N
2896	Nicola	55919009	\N	\N
2897	Christine	1301154	\N	\N
2898	Jade	5021053	\N	\N
2899	Therese	5399643	\N	\N
2900	Liza	1207623	\N	\N
2901	Taylor	25193510	\N	\N
2902	Iliana	31395854	\N	\N
2903	Kaori	31650086	\N	\N
2904	Seamaiden	12949486	\N	\N
2905	Erich	49402139	\N	\N
2906	Kgardensnow	28222819	\N	\N
2907	Catherine	2665606	\N	\N
2908	Dana	5163786	\N	\N
2909	Anetka	42120340	\N	\N
2910	Jennifer	10374546	\N	\N
2911	Josefina	29927839	\N	\N
2912	DoriAnn	35219155	\N	\N
2913	Patricia	56726656	\N	\N
2914	Genni	4851711	\N	\N
2915	Mila	58660529	\N	\N
2916	Robin	4144627	\N	\N
2917	Missy	51264774	\N	\N
2918	Helen	28993897	\N	\N
2919	Sam	40992554	\N	\N
2920	Jennifer	992048	\N	\N
2921	Kendel	14295818	\N	\N
2922	Debbie	5665659	\N	\N
2923	Rishikesh	12830498	\N	\N
2924	Lynne	15231678	\N	\N
2925	Claudia	53450819	\N	\N
2926	Ajyram	4883380	\N	\N
2927	Alison	9420328	\N	\N
2928	Ihssane	57654055	\N	\N
2929	Mikayla	8479267	\N	\N
2930	Neha	19174496	\N	\N
2931	Daniel	41735813	\N	\N
2932	Stephanie	1790954	\N	\N
2933	Stuart	39846908	\N	\N
2934	Heavenly	21992523	\N	\N
2935	Ana	46712632	\N	\N
2936	Roudabeh	25217670	\N	\N
2937	Andreea	9500309	\N	\N
2938	Kristina	3960091	\N	\N
2939	Line	5416320	\N	\N
2940	Lisette	2031744	\N	\N
2941	Linds	59484100	\N	\N
2942	Katherine	18530277	\N	\N
2943	Kasia	44121574	\N	\N
2944	Mari	29889531	\N	\N
2945	Barbara	53226072	\N	\N
2946	Madeleine	5313528	\N	\N
2947	Jenny	1299285	\N	\N
2948	Zara	3029523	\N	\N
2949	Konark	45584717	\N	\N
2950	AJS	40807182	\N	\N
2951	Leanne	31625361	\N	\N
2952	Felipe	35153163	\N	\N
2953	Alysha	5686758	\N	\N
2954	Christian	32517362	\N	\N
2955	Nadim	46843489	\N	\N
2956	Christine	6142085	\N	\N
2957	Elizabeth	24472510	\N	\N
2958	Zheng	33597634	\N	\N
2959	Krystal	33012287	\N	\N
2960	Frank	4452539	\N	\N
2961	Carol	14156762	\N	\N
2962	MacKenzie Drury	21960813	\N	\N
2963	Ciara	7243319	\N	\N
2964	Alyssa	7951827	\N	\N
2965	Elisandra	31218639	\N	\N
2966	Maria	14470061	\N	\N
2967	Erica	8129091	\N	\N
2968	Marina	20459833	\N	\N
2969	Vanessa	5680919	\N	\N
2970	Val	44481783	\N	\N
2971	Infinity13	29910299	\N	\N
2972	Seema	19611464	\N	\N
2973	Jinlong	29777797	\N	\N
2974	Imsoo	55962911	\N	\N
2975	Gediminas	16157857	\N	\N
2976	Frau Zerstreuung	28942854	\N	\N
2977	Michael	32585194	\N	\N
2978	meryem	21374088	\N	\N
2979	Dea	42995697	\N	\N
2980	Elena	2094174	\N	\N
2981	Jahan	5598531	\N	\N
2982	Sayantani	54086893	\N	\N
2983	Gaga	29690103	\N	\N
2984	Laudafne	52714471	\N	\N
2985	Tracey	4169047	\N	\N
2986	Hafsa	31048922	\N	\N
2987	Anonymousme	40350446	\N	\N
2988	Taylor	47541932	\N	\N
2989	Tulika	5089458	\N	\N
2990	Kristie	2200334	\N	\N
2991	Nico	23180635	\N	\N
2992	Cindy	10718448	\N	\N
2993	Alan	5740615	\N	\N
2994	Tegan	13464582	\N	\N
2995	Rahe	42121646	\N	\N
2996	Catherine	20616795	\N	\N
2997	Amanda	33704626	\N	\N
2998	JenniferB	2129031	\N	\N
2999	Sandra	1384639	\N	\N
3000	Julie	16560106	\N	\N
3001	Jojolee	7441708	\N	\N
3002	Michelle	19016469	\N	\N
3003	Larissa	48481636	\N	\N
3004	Chris	4597323	\N	\N
3005	Ich	42918373	\N	\N
3006	Siobhan	4462025	\N	\N
3007	Arnaud	48272279	\N	\N
3008	Craig	20603605	\N	\N
3009	Cara	52354681	\N	\N
3010	Bluesberryfields	5764822	\N	\N
3011	Veronica	25954528	\N	\N
3012	Elisabeille	41844041	\N	\N
3013	Andrea	8336573	\N	\N
3014	Danielle	7664415	\N	\N
3015	Julia	355687	\N	\N
3016	Ruru	33675725	\N	\N
3017	Fengna	49488102	\N	\N
3018	Kelsey	2741754	\N	\N
3019	Crystal	51018702	\N	\N
3020	Miranda	5699893	\N	\N
3021	Jyotsna	1760015	\N	\N
3022	Leslie	1333573	\N	\N
3023	Scofield	46507829	\N	\N
3024	Shalin	44279413	\N	\N
3025	Dianne	3548598	\N	\N
3026	Ceren	7683053	\N	\N
3027	Mark	30160255	\N	\N
3028	Mel	5658913	\N	\N
3029	Cecilia	8664355	\N	\N
3030	Zee	13413722	\N	\N
3031	Jeffrey	15168408	\N	\N
3032	Dioni (Bookie Mee)	238527	\N	\N
3033	Petra	4924968	\N	\N
3034	James	55307901	\N	\N
3035	Yona	4591618	\N	\N
3036	Melanie	5658305	\N	\N
3037	Karina	30326538	\N	\N
3038	Caitlin	1880342	\N	\N
3039	Andrea	4748683	\N	\N
3040	Sara	25394521	\N	\N
3041	Ec�	51262897	\N	\N
3042	Mayank	16995731	\N	\N
3043	Ashley	32287550	\N	\N
3044	Jonathan	3821377	\N	\N
3045	Lena	5289798	\N	\N
3046	Kanishka	5547175	\N	\N
3047	Rachel	42110409	\N	\N
3048	Linette	2957441	\N	\N
3049	Chad	10488861	\N	\N
3050	Melanie	2925092	\N	\N
3051	Ellen	3176057	\N	\N
3052	Monica	50444951	\N	\N
3053	Jennifer	40527448	\N	\N
3054	Rajesh	13429195	\N	\N
3055	Ashley	42401940	\N	\N
3056	Gayle	753715	\N	\N
3057	Matthew	7212849	\N	\N
3058	Jeana	7412713	\N	\N
3059	Franziska	40685774	\N	\N
3060	Colin	15279880	\N	\N
3061	Emmitsuks	55090331	\N	\N
3062	Brendan	40269745	\N	\N
3063	Michaela	40378697	\N	\N
3064	sasperia	6268470	\N	\N
3065	Stefanie	12827253	\N	\N
3066	Helen	6032765	\N	\N
3067	Victoria	16184637	\N	\N
3068	Rachel	6837345	\N	\N
3069	Maria	39558917	\N	\N
3070	Jameson	24164627	\N	\N
3071	Niki	26263512	\N	\N
3072	Rebeca	25254857	\N	\N
3073	Tangina	40231478	\N	\N
3074	Ayush	9468317	\N	\N
3075	J Cassandra	55440078	\N	\N
3076	Melly	58127319	\N	\N
3077	Ada	4297445	\N	\N
3078	Anneke	1564974	\N	\N
3079	Lizzie	33599879	\N	\N
3080	Simon	23281102	\N	\N
3081	Holly	5073135	\N	\N
3082	Joana	17144716	\N	\N
3083	Vasilena	2072412	\N	\N
3084	Maria	27203218	\N	\N
3085	Vanesa	60178120	\N	\N
3086	Spiri En	5900279	\N	\N
3087	Kozmotis	8778594	\N	\N
3088	Alyssa	39820600	\N	\N
3089	Seavling_lim	20877123	\N	\N
3090	Mishek	24670912	\N	\N
3091	Windy	5682800	\N	\N
3092	Amourose	30005366	\N	\N
3093	Alexandra	53720820	\N	\N
3094	Rebecca	1027658	\N	\N
3095	Ivett	8150904	\N	\N
3096	Shoshi	24408356	\N	\N
3097	Beth	26491755	\N	\N
3098	A.	44132931	\N	\N
3099	Bianca	18141801	\N	\N
3100	Warner	51982831	\N	\N
3101	April	2123388	\N	\N
3102	Leah	30091707	\N	\N
3103	Crystal	38407005	\N	\N
3104	Stephanie	11995953	\N	\N
3105	Amber	5046197	\N	\N
3106	Angela	3987194	\N	\N
3107	Minji	28213630	\N	\N
3108	Kasey	18692459	\N	\N
3109	Rahul	46544537	\N	\N
3110	Cynthia	16402452	\N	\N
3111	Christa	11660651	\N	\N
3112	Rachel	5924346	\N	\N
3113	Monique	6854729	\N	\N
3114	Payten	8788985	\N	\N
3115	Adrian	14947029	\N	\N
3116	Kriza Isamar	43353628	\N	\N
3117	Elle	8266026	\N	\N
3118	Kristina	21580209	\N	\N
3119	Julie	3273476	\N	\N
3120	Kelle	27049250	\N	\N
3121	Megan Glass	23680393	\N	\N
3122	JT	58100888	\N	\N
3123	Sanah	32200375	\N	\N
3124	Manel	45538248	\N	\N
3125	Rebecca	7887543	\N	\N
3126	Karin	4886627	\N	\N
3127	Pernille	47919749	\N	\N
3128	Istvan	51470171	\N	\N
3129	Haniana	21250948	\N	\N
3130	Elsa	1148692	\N	\N
3131	Shanequea	26897914	\N	\N
3132	Dawn	45744913	\N	\N
3133	Maria	44411778	\N	\N
3134	Amy	675295	\N	\N
3135	Eileen	32724173	\N	\N
3136	Shanice	46028619	\N	\N
3137	Stephanie	23936346	\N	\N
3138	Heather	11988366	\N	\N
3139	Mariana	14259861	\N	\N
3140	Ana Luisa	20829016	\N	\N
3141	Abigail	13646975	\N	\N
3142	Nenya	23987412	\N	\N
3143	Alejandro	52098055	\N	\N
3144	Voonoturno	54685722	\N	\N
3145	Victoria	57843814	\N	\N
3146	Magda	5319783	\N	\N
3147	Roshio	1974093	\N	\N
3148	Monica	28208783	\N	\N
3149	amanda	75283	\N	\N
3150	Akriti	38754904	\N	\N
3151	Caitlynn	21468309	\N	\N
3152	Sharon	1131692	\N	\N
3153	Miquel	5359748	\N	\N
3154	Zane	46238461	\N	\N
3155	Andreia	5676823	\N	\N
3156	Kim	9321419	\N	\N
3157	Jaylee	48270442	\N	\N
3158	Whitney	3066901	\N	\N
3159	Luella	27401082	\N	\N
3160	Ashley	1597712	\N	\N
3161	Cat11	5886053	\N	\N
3162	Miriam	52689304	\N	\N
3163	Emily	11072723	\N	\N
3164	Nikita	32979797	\N	\N
3165	Justin	31457703	\N	\N
3166	Petuli	37906884	\N	\N
3167	Alejandra	60949973	\N	\N
3168	Jannat	13390467	\N	\N
3169	Caty	8740571	\N	\N
3170	Daniel	23857929	\N	\N
3171	Neha	30619444	\N	\N
3172	Sofie	10099925	\N	\N
3173	Karen	22364894	\N	\N
3174	Nathalie	22419350	\N	\N
3175	YingLei	23649772	\N	\N
3176	Maia	46227836	\N	\N
3177	Charlotte	46334343	\N	\N
3178	F�ona	24492876	\N	\N
3179	Tihomira	37210194	\N	\N
3180	Amber	33967135	\N	\N
3181	Sabrine	52535405	\N	\N
3182	Nicole	33775971	\N	\N
3183	yoas	1872224	\N	\N
3184	Jonas	52159860	\N	\N
3185	Angela	10207139	\N	\N
3186	Lauren	57350450	\N	\N
3187	Linda	5136242	\N	\N
3188	Jenny	8230230	\N	\N
3189	Nehal	25491935	\N	\N
3190	Sheev	14479560	\N	\N
3191	Ashton	25901320	\N	\N
3192	Anne	30979628	\N	\N
3193	James	5882550	\N	\N
3194	Sophia	30809180	\N	\N
3195	Martina	14008951	\N	\N
3196	Stacy	25669266	\N	\N
3197	Elaine	22344452	\N	\N
3198	Emily	15057277	\N	\N
3199	Mikayla	21984139	\N	\N
3200	Al	29961082	\N	\N
3201	Ali	19942983	\N	\N
3202	Austin	2055652	\N	\N
3203	Danielle	20777653	\N	\N
3204	Mark	35316542	\N	\N
3205	Charlotte	43085634	\N	\N
3206	Isabel	50729398	\N	\N
3207	Yvonne	30135802	\N	\N
3208	Angela	17100216	\N	\N
3209	CJ	25489690	\N	\N
3210	Irene	24822572	\N	\N
3211	Matthias	22481064	\N	\N
3212	Sophie	10157660	\N	\N
3213	Pat	7503990	\N	\N
3214	Beatriz	16564498	\N	\N
3215	Becca	46978198	\N	\N
3216	Thomas	18205328	\N	\N
3217	Kat	110052	\N	\N
3218	Easton	54506176	\N	\N
3219	Angelo	9903102	\N	\N
3220	Nel	18142868	\N	\N
3221	Helen	29928184	\N	\N
3222	Naz	50833189	\N	\N
3223	Suti	59982125	\N	\N
3224	Roy	22752722	\N	\N
3225	Isadora	55311010	\N	\N
3226	Katheryn	3528942	\N	\N
3227	Fahimeh	1638152	\N	\N
3228	Kat	1925111	\N	\N
3229	Bernardo	8748343	\N	\N
3230	Cathy	5324085	\N	\N
3231	Su	15960492	\N	\N
3232	Sandy	167431	\N	\N
3233	Stephanie	24052969	\N	\N
3234	Anna	53681438	\N	\N
3235	Saheed	35809994	\N	\N
3236	Kaitlyn	19421407	\N	\N
3237	Sheila	30207215	\N	\N
3238	Veronica	15756929	\N	\N
3239	Lizzie	4944191	\N	\N
3240	Lauren	3620102	\N	\N
3241	Esther	2240861	\N	\N
3242	Catherine	51878984	\N	\N
3243	Sandi	2297465	\N	\N
3244	Sonya	5594992	\N	\N
3245	Gene	10270752	\N	\N
3246	Fran	41494614	\N	\N
3247	Ben	29633904	\N	\N
3248	Craig	8967362	\N	\N
3249	Olga	30007420	\N	\N
3250	Ellen	1760886	\N	\N
3251	Phyllis	60300195	\N	\N
3252	Emily	57567199	\N	\N
3253	Monise	29435078	\N	\N
3254	Sheriden	8242228	\N	\N
3255	Tom	37653302	\N	\N
3256	Louise	31985862	\N	\N
3257	Manas	57350476	\N	\N
3258	Tara	17520467	\N	\N
3259	Gizem	19977850	\N	\N
3260	Cami	15945713	\N	\N
3261	Apoorva	55598605	\N	\N
3262	Abhas	60961241	\N	\N
3263	Teanka	37668782	\N	\N
3264	DAN	6573889	\N	\N
3265		20466778	\N	\N
3266	Hannah	30399897	\N	\N
3267	Nazanin	4417239	\N	\N
3268	Erinne	61182236	\N	\N
3269	Blanca	38996820	\N	\N
3270	Kat	38225327	\N	\N
3271	Katherine	22348453	\N	\N
3272	Duy	18927530	\N	\N
3273	James	46359754	\N	\N
3274	Pat	58833501	\N	\N
3275	Helen	3843437	\N	\N
3276	Seraina	32320102	\N	\N
3277	Melissa	4247092	\N	\N
3278	Sara	5644549	\N	\N
3279	Caroline	19789941	\N	\N
3280	Brenda	26401173	\N	\N
3281	Amy	1612151	\N	\N
3282	Caitlin	13523657	\N	\N
3283	Leslie	10371675	\N	\N
3284	Paul	3058078	\N	\N
3285	Lorraine	16359972	\N	\N
3286	Cathy	56961155	\N	\N
3287	Yun	5209798	\N	\N
3288	Paneret	13591518	\N	\N
3289	Dani	5601529	\N	\N
3290	Joshua	17225664	\N	\N
3291	Johanna	26551732	\N	\N
3292	Dawn	26216023	\N	\N
3293	Desha	38163266	\N	\N
3294	Lyalkinva	48421500	\N	\N
3295	Claire	7345722	\N	\N
3296	Meghan	57948476	\N	\N
3297	Christine	4726941	\N	\N
3298	Becki	8634468	\N	\N
3299	Alyssa	20116356	\N	\N
3300	Hannah	58461278	\N	\N
3301	Emma	22373373	\N	\N
3302	Alicia	52299192	\N	\N
3303	AmberBug	1884689	\N	\N
3304	David	9676714	\N	\N
3305	Ryan	23877377	\N	\N
3306	Alby	2209293	\N	\N
3307	Morgan	13931702	\N	\N
3308	Jonathan	59052453	\N	\N
3309	Cindy	10556368	\N	\N
3310	Farah	19317553	\N	\N
3311	Elizabeth	60086758	\N	\N
3312	Mallory	26010521	\N	\N
3313	Lisa	10169131	\N	\N
3314	Robert	25035629	\N	\N
3315	Erin	5039112	\N	\N
3316	Per	5460091	\N	\N
3317	Ben	29862976	\N	\N
3318	Julian	58230387	\N	\N
3319	Kelly	5959927	\N	\N
3320	Keri	3901520	\N	\N
3321	Aly	5045492	\N	\N
3322	mills	53332828	\N	\N
3323	Sarah	3013105	\N	\N
3324	Concepci�n	49569107	\N	\N
3325	Ina	30094960	\N	\N
3326	Stefanie	5267184	\N	\N
3327	Beta	9960324	\N	\N
3328	Katja	61031884	\N	\N
3329	Megan	9905284	\N	\N
3330	AnneGordon	46745813	\N	\N
3331	Shubhankar	25887854	\N	\N
3332	Ata	39347365	\N	\N
3333	Elena	4799089	\N	\N
3334	Andrea	15146979	\N	\N
3335	Noura	11604295	\N	\N
3336	Alexis	38623797	\N	\N
3337	Abby	37654758	\N	\N
3338	Irshana	42852766	\N	\N
3339	Jordan	32057820	\N	\N
3340	Cathy	17175934	\N	\N
3341	Dirk	58399221	\N	\N
3342	Katherine	4017525	\N	\N
3343	Ester	4604100	\N	\N
3344	Minerva	4936777	\N	\N
3345	Sachin	8136215	\N	\N
3346	Andrew	23880910	\N	\N
3347	Tuatha	20526851	\N	\N
3348	Lloyd	19848396	\N	\N
3349	pink	30212137	\N	\N
3350	Kiriko	56426377	\N	\N
3351	Sean	5353227	\N	\N
3352	Jisoo	30724606	\N	\N
3353	Forza	45679489	\N	\N
3354	Sayantoni Das	48073770	\N	\N
3355	Elizabeth	14973434	\N	\N
3356	Brandon	46743745	\N	\N
3357	Annie	3205105	\N	\N
3358	Bettina	5295200	\N	\N
3359	Jodie	39359372	\N	\N
3360	Robert	32637656	\N	\N
3361	Sharon	2805474	\N	\N
3362	Rachel	20891722	\N	\N
3363	Elizabeth	4485827	\N	\N
3364	Stephen	27237726	\N	\N
3365	Ohlane	12842935	\N	\N
3366	Chahal	6655048	\N	\N
3367	Dan	37298211	\N	\N
3368	Angela	20556204	\N	\N
3369	Rebecca	51874634	\N	\N
3370	Jesse	58442583	\N	\N
3371	Barbara	43829772	\N	\N
3372	R�	14417455	\N	\N
3373	Shannon	1069473	\N	\N
3374	Dave	31681550	\N	\N
3375	Sally J.	21012142	\N	\N
3376	Reynawaf	27548504	\N	\N
3377	Lily	6434873	\N	\N
3378	Pesadelo	8660689	\N	\N
3379	Erin	4900730	\N	\N
3380	Olga	11852753	\N	\N
3381	Jeffrey	1447155	\N	\N
3382	Sue	3981169	\N	\N
3383	Ryan	15299101	\N	\N
3384	Craig	27208604	\N	\N
3385	Amory	52957	\N	\N
3386	Vickie	11246302	\N	\N
3387	Victoria	28731091	\N	\N
3388	Negrophile	5782622	\N	\N
3389	Hope	5000356	\N	\N
3390	Felicia	29677318	\N	\N
3391	Sophie	3495166	\N	\N
3392	Kate	10175370	\N	\N
3393	Shauna	27051339	\N	\N
3394	Jamie	33195922	\N	\N
3395	Shada	56554076	\N	\N
3396	AlienBritt	43970172	\N	\N
3397	Joseph	5209699	\N	\N
3398	Kartheek	37944805	\N	\N
3399	Eileen	51259184	\N	\N
3400	Ana	57303312	\N	\N
3401	Nathan	29423989	\N	\N
3402	Whimsy	12939245	\N	\N
3403	Sarah	56517112	\N	\N
3404	Caity	31032513	\N	\N
3405	Amanda	25259967	\N	\N
3406	Janyla	9792275	\N	\N
3407	Ellen	49409616	\N	\N
3408	Sohel	41693982	\N	\N
3409	Kathy	2123998	\N	\N
3410	Antonina	32973863	\N	\N
3411	Anastasia	23222134	\N	\N
3412	Eva	35820631	\N	\N
3413	Bailey	32106314	\N	\N
3414	Natalija	2827087	\N	\N
3415	Heather	31707053	\N	\N
3416	Rishabh	50890129	\N	\N
3417	Aspiemouse	60166680	\N	\N
3418	Jen	4355099	\N	\N
3419	Dane	17338172	\N	\N
3420	Matt	54725340	\N	\N
3421	Rebecca	3061680	\N	\N
3422	Moistvomit	11469543	\N	\N
3423	Eli	3174792	\N	\N
3424	Hana	30736849	\N	\N
3425	Nick	12791149	\N	\N
3426	BobbyJo	56674133	\N	\N
3427	Anika	50834484	\N	\N
3428	Bemused Bookworm	2444654	\N	\N
3429	claire	72288	\N	\N
3430	Harry	44977607	\N	\N
3431	Jay	43567598	\N	\N
3432	Lastradaaa	46340114	\N	\N
3433	Lindsay	47179199	\N	\N
3434	Mary-Lyn	44565376	\N	\N
3435	Gustavo	28107069	\N	\N
3436	Robyn	9804141	\N	\N
3437	Mad Russian	3546937	\N	\N
3438	Ryan	5670752	\N	\N
3439	Kelly	36609694	\N	\N
3440	Kathryn	19862626	\N	\N
3441	Tha�s	26164676	\N	\N
3442	Elizabeth	18271569	\N	\N
3443	Louise	27149792	\N	\N
3444	Staci	8157811	\N	\N
3445	Lauren	5641158	\N	\N
3446	David	30770173	\N	\N
3447	Destiny	15276548	\N	\N
3448	Sarah	16602164	\N	\N
3449	Shawn	4456323	\N	\N
3450	Rac	60947543	\N	\N
3451	Theo	54757472	\N	\N
3452	Daria	30617904	\N	\N
3453	Erwin	53168268	\N	\N
3454	Debbie	5083147	\N	\N
3455	Kelsey	5670929	\N	\N
3456	Alicia	17406048	\N	\N
3457	M�nika	20542144	\N	\N
3458	Sonia	52860168	\N	\N
3459	Lewis	27043358	\N	\N
3460	Cheryl	31143366	\N	\N
3461	Ann	44312445	\N	\N
3462	Shruti	14128862	\N	\N
3463	Bren	3944108	\N	\N
3464	Koen	45995666	\N	\N
3465	Tanmoy	19949499	\N	\N
3466	Julie	32850206	\N	\N
3467	Christina	41817383	\N	\N
3468	Joshua	43731833	\N	\N
3469	Alex	5251074	\N	\N
3470	Cindia	10743215	\N	\N
3471	Veronika	55798799	\N	\N
3472	Jorge	10235869	\N	\N
3473	Shilpa	8832391	\N	\N
3474	Ali	20265966	\N	\N
3475	Mandi	269939	\N	\N
3476	Judy	6216495	\N	\N
3477	Denise	4621141	\N	\N
3478	Sush	44236694	\N	\N
3479	Logan	54439131	\N	\N
3480	March	27347022	\N	\N
3481	Erin	4250822	\N	\N
3482	Megumiwatgmail.com	30786426	\N	\N
3483	Janneth	15804575	\N	\N
3484	Jennifer	10811879	\N	\N
3485	Katrina	5824161	\N	\N
3486	Nicole	4671777	\N	\N
3487	Jeffrey	10833672	\N	\N
3488	Bruce	1449923	\N	\N
3489	Dani "The REAL Cullens_Girl since 2002"	3976165	\N	\N
3490	Jonathas	32133923	\N	\N
3491	Est�baliz	48481892	\N	\N
3492	Keighley	49286156	\N	\N
3493	Clara	14965425	\N	\N
3494	Ligita	7352457	\N	\N
3495	Helena	23766091	\N	\N
3496	Julieta	8061163	\N	\N
3497	Ann	5031118	\N	\N
3498	Cathy	30150881	\N	\N
3499	Alba Mendoza	38008618	\N	\N
3500	Cindy	27333699	\N	\N
3501	Erica	22601424	\N	\N
3502	Andy	60324391	\N	\N
3503	Mariam	4683880	\N	\N
3504	Sophie	48378888	\N	\N
3505	Libby	1010593	\N	\N
3506	Joshua	7208706	\N	\N
3507	ellen	1015994	\N	\N
3508	Kate	9541649	\N	\N
3509	Donna	4906126	\N	\N
3510	Joanne	47678155	\N	\N
3511	Amalia	12083802	\N	\N
3512	Cristina	4712342	\N	\N
3513	Ella	9150236	\N	\N
3514	Gocha	38072201	\N	\N
3515	Stanley	30620655	\N	\N
3516	Roane	4778474	\N	\N
3517	Chiara[EmmaBovary]	17275083	\N	\N
3518	Sheila	9638627	\N	\N
3519	Tricia	27224363	\N	\N
3520	Blowngrass	23601976	\N	\N
3521	Will	6300097	\N	\N
3522	CanardRoublard	30442207	\N	\N
3523	Courtney	5046099	\N	\N
3524	Lovely	60926814	\N	\N
3525	Igor	6116680	\N	\N
3526	Rosie	40883431	\N	\N
3527	Jessica	2879337	\N	\N
3528	Lucy	4541934	\N	\N
3529	Becky	3113074	\N	\N
3530	Jean	11109477	\N	\N
3531	Liane	5589738	\N	\N
3532	Jillybear	16540635	\N	\N
3533	A	54085068	\N	\N
3534	Day	28283873	\N	\N
3535	Jacqueline	29300859	\N	\N
3536	Rushna	30418606	\N	\N
3537	Chris	43788027	\N	\N
3538	Ian	32724912	\N	\N
3539	a.c.	1682209	\N	\N
3540	Tj	51224400	\N	\N
3541	James	40938419	\N	\N
3542	Wiktoria	32342708	\N	\N
3543	Kennie	28868410	\N	\N
3544	Sara	3927043	\N	\N
3545	Jesse	4636556	\N	\N
3546	Lorraine	7187670	\N	\N
3547	Michael	7437007	\N	\N
3548	Hedvig	23660352	\N	\N
3549	Ana Sofia H.	22843724	\N	\N
3550	Kuki	19419225	\N	\N
3551	Jude	25264606	\N	\N
3552	Becky	45252196	\N	\N
3553	Gaurav	39757990	\N	\N
3554	Mareike	39006056	\N	\N
3555	Bryan	5650083	\N	\N
3556	Nyx	58255180	\N	\N
3557	Rajat	60058977	\N	\N
3558	Adrienne	14593058	\N	\N
3559	Aylin	27079760	\N	\N
3560	Yosha	60766699	\N	\N
3561	Safira	49879789	\N	\N
3562	Sylvania	56937257	\N	\N
3563	Arka	19324585	\N	\N
3564	Chelsea	6260887	\N	\N
3565	Josh	45714913	\N	\N
3566	Martin	22436035	\N	\N
3567	Jolanda	11764943	\N	\N
3568	Paloma	60389173	\N	\N
3569	Alisa	40340179	\N	\N
3570	Benjamin	41427577	\N	\N
3571	Khadija	47263074	\N	\N
3572	Katy	22075731	\N	\N
3573	Reyna	27230634	\N	\N
3574	Shainna	29993290	\N	\N
3575	Justin	46684311	\N	\N
3576	Vanessa	41561609	\N	\N
3577	Paul	50832736	\N	\N
3578	Quadrell	24687946	\N	\N
3579	DK	34496834	\N	\N
3580	Lene	8043480	\N	\N
3581	Brian	4305405	\N	\N
3582	Norma	5962528	\N	\N
3583	Ashley	33092140	\N	\N
3584	Costas	24883060	\N	\N
3585	Hatice	6490768	\N	\N
3586	Audrey	2282565	\N	\N
3587	Aimee	7825303	\N	\N
3588	Kara	1150287	\N	\N
3589	Lisa	22002236	\N	\N
3590	Lakshmi	21953786	\N	\N
3591	Ashley	33283484	\N	\N
3592	Nicole	7039993	\N	\N
3593	Kelly	25565300	\N	\N
3594	Amy	759430	\N	\N
3595	Andreea	40749803	\N	\N
3596	Xxblurryface	55923167	\N	\N
3597	Carol	27005096	\N	\N
3598	Sarah	55399715	\N	\N
3599	Elena	4304044	\N	\N
3600	Jerilyn	5211378	\N	\N
3601	Michelle	1337620	\N	\N
3602	Michael	23506694	\N	\N
3603	Nathan	23512293	\N	\N
3604	Hishaam	14269144	\N	\N
3605	Alison	3141038	\N	\N
3606	Jastine	29530843	\N	\N
3607	Myrtille	4934586	\N	\N
3608	Ahmed	52876234	\N	\N
3609	Beth	36046899	\N	\N
3610	Carey	27593234	\N	\N
3611	Katharina	60933774	\N	\N
3612	Sadia	5975288	\N	\N
3613	Edward	58761115	\N	\N
3614	Anna	5827490	\N	\N
3615	Stefani	4874491	\N	\N
3616	Juni	11414603	\N	\N
3617	Wes	12794679	\N	\N
3618	Cody	5692123	\N	\N
3619	Puni	30459552	\N	\N
3620	Michelle	43556244	\N	\N
3621	Jenna	37700588	\N	\N
3622	Diana	37903179	\N	\N
3623	Rowanne	15622283	\N	\N
3624	Michael	1384364	\N	\N
3625	Cury	12760278	\N	\N
3626	Brian	31713734	\N	\N
3627	Kainzow	23631402	\N	\N
3628	Carolin	6532614	\N	\N
3629	Sheila	57865035	\N	\N
3630	Jerry	42208911	\N	\N
3631	Arya	35300614	\N	\N
3632	Sid	44772427	\N	\N
3633	Ellie	58873221	\N	\N
3634	Maria	7012190	\N	\N
3635	Sara	12403654	\N	\N
3636	Terri	27214008	\N	\N
3637	Tonya	9715720	\N	\N
3638	Megan	7648438	\N	\N
3639	Katie	49062578	\N	\N
3640	Narcisa	24165209	\N	\N
3641	Valerie	131355	\N	\N
3642	Kenna	60943784	\N	\N
3643	Sandy	23068914	\N	\N
3644	Daria	45266856	\N	\N
3645	Caitlin	32773364	\N	\N
3646	Maria	13330996	\N	\N
3647	Ndiritu	25070724	\N	\N
3648	Chiara	35037992	\N	\N
3649	Tricia	18520360	\N	\N
3650	Rasim	26116915	\N	\N
3651	Angela	12701220	\N	\N
3652	Flora	48289843	\N	\N
3653	Kaleb	34462940	\N	\N
3654	Crescencia	18915060	\N	\N
3655	Monica	30245535	\N	\N
3656	Klea	28339111	\N	\N
3657	Madison	3935127	\N	\N
3658		6029602	\N	\N
3659	Belle	47126803	\N	\N
3660	Robbie	7339324	\N	\N
3661	Marilyn	7959036	\N	\N
3662	Lori	8709241	\N	\N
3663	Lorna	27202446	\N	\N
3664	learnreadimagine	12473842	\N	\N
3665	Rebecca	30135114	\N	\N
3666	Chris	4307037	\N	\N
3667	Lauren	10719911	\N	\N
3668	Jacqueline	18245234	\N	\N
3669	Melissa	17616906	\N	\N
3670	Hayley	11662843	\N	\N
3671	Brea	41960366	\N	\N
3672	Rachel	31303225	\N	\N
3673	Molly	60405053	\N	\N
3674	Diana	22343556	\N	\N
3675	Teodora	23066927	\N	\N
3676	Laura	2097559	\N	\N
3677	Shannan	2245238	\N	\N
3678	Jess	2494128	\N	\N
3679	Lexi	30272447	\N	\N
3680	Allison	47334379	\N	\N
3681	Nastasia	44499422	\N	\N
3682	Angelica	25132782	\N	\N
3683	Kare	24030442	\N	\N
3684	K	359170	\N	\N
3685	Lilly	39922966	\N	\N
3686	Angel	10601910	\N	\N
3687	Bella	38522953	\N	\N
3688	NoteBookAndTears	37572934	\N	\N
3689	Orlanclt	56928062	\N	\N
3690	Lucas	8242875	\N	\N
3691	Rebekah	36747862	\N	\N
3692	amy	45850700	\N	\N
3693	Peg	7427422	\N	\N
3694	Beth	52773504	\N	\N
3695	Kat	31467864	\N	\N
3696	Nancy	7493377	\N	\N
3697	Amber Dawn	31034356	\N	\N
3698	Maria	5560127	\N	\N
3699	Joe	38126305	\N	\N
3700	Michael	21014331	\N	\N
3701	Toni	54502034	\N	\N
3702	Terry Bolt	56295944	\N	\N
3703	Leslie-Anne	9026584	\N	\N
3704	Motz88	51263955	\N	\N
3705	Bonnie	4610560	\N	\N
3706	Ganesh	13914981	\N	\N
3707	Gulveen	34311880	\N	\N
3708	Sue	44202419	\N	\N
3709	Amanda	33464795	\N	\N
3710	Tiffany	24458488	\N	\N
3711	M	325290	\N	\N
3712	Osai	13423822	\N	\N
3713	Dan	49610461	\N	\N
3714	Jade	2816394	\N	\N
3715	Kallie	2400951	\N	\N
3716	Becky	5875538	\N	\N
3717	Esther	29957626	\N	\N
3718	Tom	24135324	\N	\N
3719	Kayla	22606382	\N	\N
3720	Lucija	30687565	\N	\N
3721	Charlie	6614841	\N	\N
3722	Ania	31470616	\N	\N
3723	Keisha	2759641	\N	\N
3724	Marie Bilde	8802521	\N	\N
3725	Ashley	670789	\N	\N
3726	Jeane	8771293	\N	\N
3727	Alexia	5889484	\N	\N
3728	Alexandra	33358151	\N	\N
3729	Joanna	5575758	\N	\N
3730	IyasCoveRy	6831388	\N	\N
3731	Carolyn	21590715	\N	\N
3732	Shawn	21376467	\N	\N
3733	Ben	7005294	\N	\N
3734	David T. Bellaire	57551822	\N	\N
3735	Arpit	30676981	\N	\N
3736	Devotee	49668496	\N	\N
3737	Lisa	4253279	\N	\N
3738	Raluca	4317421	\N	\N
3739	Stacey	153089	\N	\N
3740	Rafaela	48978189	\N	\N
3741	Kathy	1403261	\N	\N
3742	Stacey	12388612	\N	\N
3743	John	58267167	\N	\N
3744	Glynis Jane	3439372	\N	\N
3745	Patrish	7310718	\N	\N
3746	Diana	16110230	\N	\N
3747	Barb	49693860	\N	\N
3748	Judith	4071926	\N	\N
3749	Ilaria	58516171	\N	\N
3750	Thomas	5656069	\N	\N
3751	Mihaela	7616254	\N	\N
3752	WhizKid	1773597	\N	\N
3753	Charlsie	37275174	\N	\N
3754	Yvonne	23855020	\N	\N
3755	Keelin	51137059	\N	\N
3756	Alaverge	8275630	\N	\N
3757	Renee	31191111	\N	\N
3758	Tay	55765906	\N	\N
3759	Naomi	26485771	\N	\N
3760	Ece	39353097	\N	\N
3761	Koni	12943564	\N	\N
3762	Rob	30602900	\N	\N
3763	Katie	5929630	\N	\N
3764	Nino	36223232	\N	\N
3765	Shirley	35555621	\N	\N
3766	Jessica	5851647	\N	\N
3767	Bejoy	29771698	\N	\N
3768	Louise	10530027	\N	\N
3769	nithu	41340500	\N	\N
3770	Bulu	7725159	\N	\N
3771	Shraddha	35293224	\N	\N
3772	Rebecca	4138064	\N	\N
3773	Margaret	6445880	\N	\N
3774	Anna	4654005	\N	\N
3775	Alison	15627715	\N	\N
3776	Meaghan	29172512	\N	\N
3777	Yu	42373453	\N	\N
3778	Charles	10345480	\N	\N
3779	Noelle	2664689	\N	\N
3780	Impossible A	7437974	\N	\N
3781	Miranda	7445946	\N	\N
3782	Shamin	33304239	\N	\N
3783	Ritu	31237054	\N	\N
3784	Marianne	32103209	\N	\N
3785	Glenna	10269246	\N	\N
3786	Aniqahc	13458470	\N	\N
3787	Li�n	17788933	\N	\N
3788	Cierra	2700750	\N	\N
3789	Myta	16065645	\N	\N
3790	Lois	26799440	\N	\N
3791	Athira	29396547	\N	\N
3792	Ana	55813689	\N	\N
3793	Hashir	48263477	\N	\N
3794	Ruth	8675040	\N	\N
3795	John	14810528	\N	\N
3796	Michelle	50036688	\N	\N
3797	Travis	4693756	\N	\N
3798	Xianthe	4327514	\N	\N
3799	Joshua	25563704	\N	\N
3800	Gabriela	41603684	\N	\N
3801	Noemie	17884581	\N	\N
3802	Mayson	34612148	\N	\N
3803	Belle Pace	13367845	\N	\N
3804	Crissy	22091265	\N	\N
3805	Crystal	19301083	\N	\N
3806	Rebecca (agirlirlblog, bekkilyn)	4912335	\N	\N
3807	Michelle	3963414	\N	\N
3808	Kathi	2996566	\N	\N
3809	Leticia	41528352	\N	\N
3810	Emma	16400233	\N	\N
3811	Keith	27541856	\N	\N
3812	Joseph	4573115	\N	\N
3813	Amy alice	1803381	\N	\N
3814	Angeline	50953359	\N	\N
3815	Greys	5903937	\N	\N
3816	Samantha	8287392	\N	\N
3817	Michael	57399065	\N	\N
3818	Ying Ying	38342050	\N	\N
3819	Westbankmama	854344	\N	\N
3820	Elaine	32806665	\N	\N
3821	Kathleen	15961966	\N	\N
3822	Samantha	29200176	\N	\N
3823	Zabelle	45111662	\N	\N
3824	Catherine	39895551	\N	\N
3825	Alli	30537679	\N	\N
3826	Kayshnie	56201540	\N	\N
3827	Shraddha	40513402	\N	\N
3828	Patti	10264145	\N	\N
3829	AmniconStudio	3349293	\N	\N
3830	Chrislowski	10862125	\N	\N
3831	Jaemy	17168754	\N	\N
3832	Jessica	28473017	\N	\N
3833	Rourke	38834275	\N	\N
3834	Amelia	45711226	\N	\N
3835	Mahmoud	26407418	\N	\N
3836	Kara	5188368	\N	\N
3837	Phaedra	371034	\N	\N
3838	Nastassia	53972934	\N	\N
3839	Cynthia	10660977	\N	\N
3840	Molly	5666348	\N	\N
3841	Nikki	3451606	\N	\N
3842	Brandon	6990001	\N	\N
3843	Reading Faerie	6965896	\N	\N
3844	Patrice	59798019	\N	\N
3845	Sarah	35987682	\N	\N
3846	Jada	12751264	\N	\N
3847	Chandan	18845980	\N	\N
3848	Pia	5943385	\N	\N
3849	Jaime	7319124	\N	\N
3850	carolyn.reads	8130234	\N	\N
3851	Pat	12045827	\N	\N
3852	Motheaten	4506701	\N	\N
3853	Marie	30349525	\N	\N
3854	Stephen	39906489	\N	\N
3855	Diana	17573344	\N	\N
3856	Jewel	57725614	\N	\N
3857	John	7577674	\N	\N
3858	Beyond The Cover	42015872	\N	\N
3859	Kelly	18258382	\N	\N
3860	Kedarnath	30720172	\N	\N
3861	Saurabh	15807761	\N	\N
3862	Raven	7627643	\N	\N
3863	Stella	22179470	\N	\N
3864	Tivon	5650692	\N	\N
3865	Craig	11906603	\N	\N
3866	Angela	13141924	\N	\N
3867	Liz	46353220	\N	\N
3868	Andrew	47551692	\N	\N
3869	Samantha	5653026	\N	\N
3870	Laura	60655056	\N	\N
3871	Theresa	4307953	\N	\N
3872	Ariun	50863337	\N	\N
3873	Deidra	58167410	\N	\N
3874	Madison	24893060	\N	\N
3875	Annalisa	38665724	\N	\N
3876	Brenda	3512917	\N	\N
3877	Marco	18562319	\N	\N
3878	Makenzie	46133795	\N	\N
3879	Manny	6323454	\N	\N
3880	Clara	31189457	\N	\N
3881	Arantzaje	30951029	\N	\N
3882	MRSAJONEZ	17512791	\N	\N
3883	Vronk	7433239	\N	\N
3884	Susiex	27111789	\N	\N
3885	Chauncey	7054168	\N	\N
3886	Tejas	6146307	\N	\N
3887	Laura	17729894	\N	\N
3888	Hannah	58359708	\N	\N
3889	Ashley	3058543	\N	\N
3890	Tabitha	37903197	\N	\N
3891	Ida	30769928	\N	\N
3892	Jessica	49304120	\N	\N
3893	Jeremy C.	4449371	\N	\N
3894	Elle	29546195	\N	\N
3895	Tori	35885887	\N	\N
3896	Erin	4161599	\N	\N
3897	Nadia	5706582	\N	\N
3898	Hank	5105869	\N	\N
3899	Karen	36131450	\N	\N
3900	Jasmine	49814895	\N	\N
3901	Mary	59248811	\N	\N
3902	Aliona	19818218	\N	\N
3903	Masoom	44420374	\N	\N
3904	Leah	51555985	\N	\N
3905	Christina	19237482	\N	\N
3906	JustFantasy	28429940	\N	\N
3907	Timtam	24287448	\N	\N
3908	J�ssica	19390574	\N	\N
3909	Kim	4148526	\N	\N
3910	Michelle	2326546	\N	\N
3911	Alina	3494501	\N	\N
3912	Josh	7619490	\N	\N
3913	Wendy	33887250	\N	\N
3914	Amy	5553320	\N	\N
3915	Elizabeth	39845169	\N	\N
3916	Elizabeth	14565661	\N	\N
3917	Erica	761943	\N	\N
3918	Palmina	56110635	\N	\N
3919	Bryan	12140461	\N	\N
3920	Callum	28984123	\N	\N
3921	Tom	18847730	\N	\N
3922	Bob	33713143	\N	\N
3923	The_Paperback_Peruser	22867306	\N	\N
3924	Jasniya	3568964	\N	\N
3925	Stephen	36969328	\N	\N
3926	Tohuwabohus	24750955	\N	\N
3927	Shelley	5512475	\N	\N
3928	Jadeyn	44295652	\N	\N
3929	Marina	28292616	\N	\N
3930	Tanisha	18882952	\N	\N
3931	Jess	1179177	\N	\N
3932	Nancy	6136857	\N	\N
3933	Ty	12009227	\N	\N
3934	Amber	45798401	\N	\N
3935	Lindsey	7478663	\N	\N
3936	Kathe	3633558	\N	\N
3937	Robin	4425581	\N	\N
3938	Nix	50227878	\N	\N
3939	Paul	52271419	\N	\N
3940	La�s	24498788	\N	\N
3941	Francesca	2425954	\N	\N
3942	Bianca	7701929	\N	\N
3943	Veronika	46599521	\N	\N
3944	Lotte	51692353	\N	\N
3945	Ricka	30428097	\N	\N
3946	Sophia	32459259	\N	\N
3947	Abulafia	24637604	\N	\N
3948	Shanica	30305446	\N	\N
3949	Jennifer N.	2793009	\N	\N
3950	Bloempje	40920733	\N	\N
3951	Joana	7565032	\N	\N
3952	Anca	2502426	\N	\N
3953	Clare	3656438	\N	\N
3954	Jorge	50906547	\N	\N
3955	Meriam	31389542	\N	\N
3956	Jane	30727678	\N	\N
3957	Eva	33332398	\N	\N
3958	Mariam	7752248	\N	\N
3959	Jadeley	16902626	\N	\N
3960	Lauren	11375238	\N	\N
3961	Tlffany	23649981	\N	\N
3962	Barbieb27	5688371	\N	\N
3963	Leah	28368101	\N	\N
3964	B	56325458	\N	\N
3965	The Shrewd Girl	27037508	\N	\N
3966	Victoria	28695105	\N	\N
3967	Anna	46353359	\N	\N
3968	Barbara	5668962	\N	\N
3969	The Chronicles of Cordelia	59845494	\N	\N
3970	Kristyn	52072121	\N	\N
3971	Nidhi	15286019	\N	\N
3972	Amanda	7068883	\N	\N
3973	Jaqueline	21991729	\N	\N
3974	Kate	21501045	\N	\N
3975	Elena	58589292	\N	\N
3976	Bernard	15500769	\N	\N
3977	Claudia	29189263	\N	\N
3978	Susanne	4063188	\N	\N
3979	Pui	17256283	\N	\N
3980	Saaluja	36041908	\N	\N
3981	Ely	30742012	\N	\N
3982	Sharon	4869545	\N	\N
3983	Megster	4004103	\N	\N
3984	Theresa	2826980	\N	\N
3985	Geri	5436443	\N	\N
3986	Nevena	43586960	\N	\N
3987	Jediraven	3796360	\N	\N
3988	Francesco	25768558	\N	\N
3989	Mariana	12004851	\N	\N
3990	Asmaa	17514456	\N	\N
3991	Christina	55687184	\N	\N
3992	Jackson	51251636	\N	\N
3993	Suzanne	17704798	\N	\N
3994	Amy	42563225	\N	\N
3995	Kim	22679134	\N	\N
3996	Larissa	4919107	\N	\N
3997	SALIH	19090868	\N	\N
3998	Maria Isabel	8320596	\N	\N
3999	Sumedh	35543632	\N	\N
4000	Lori	11059743	\N	\N
4001	Mibi	7258920	\N	\N
4002	Lakis	42466330	\N	\N
4003	Cynthia	44247475	\N	\N
4004	Holly	552285	\N	\N
4005	Krystal	7020972	\N	\N
4006	Zmaja	4910181	\N	\N
4007	Aerials	167436	\N	\N
4008	Arpit	23254115	\N	\N
4009	Marianne	55828591	\N	\N
4010	James	2332456	\N	\N
4011	Jo	30532424	\N	\N
4012	Farah	38594241	\N	\N
4013	Sue	34621307	\N	\N
4014	Pedro	56268439	\N	\N
4015	Annie	4422398	\N	\N
4016	Hallie	9275811	\N	\N
4017	Celeste	16475520	\N	\N
4018	Ashley	13611904	\N	\N
4019	Cri	33048448	\N	\N
4020	Tom	59984902	\N	\N
4021	Shubham	5317038	\N	\N
4022	J.D.	49484357	\N	\N
4023	Karlijn	55163575	\N	\N
4024	Steph	20448511	\N	\N
4025	Madeline	28121559	\N	\N
4026	AMAL M	58790916	\N	\N
4027	Nicole	42842220	\N	\N
4028	Marcos	27324803	\N	\N
4029	Bethany	57849844	\N	\N
4030	Kendall	27220218	\N	\N
4031	Natali	45289240	\N	\N
4032	Elizabeth	4167343	\N	\N
4033	Aitazaz	30405662	\N	\N
4034	Raunak Roy	7738611	\N	\N
4035	23skadoo40	15120242	\N	\N
4036	Nur	50662816	\N	\N
4037	Maureen	36968251	\N	\N
4038	Tesoro	5949104	\N	\N
4039	Laura	4236824	\N	\N
4040	Teresa	27933272	\N	\N
4041	Heather	5678709	\N	\N
4042	Denisse	15839596	\N	\N
4043	Brenden	52399716	\N	\N
4044	Janine	10130760	\N	\N
4045	Yesenia	5538186	\N	\N
4046	Alyssa Maldonado	39089165	\N	\N
4047	Marsha	10519866	\N	\N
4048	Kayleen	30653392	\N	\N
4049	Mark	47787318	\N	\N
4050	Kelly	58037206	\N	\N
4051	Idramoro	4995369	\N	\N
4052	Laila	46954638	\N	\N
4053	Kim	5283164	\N	\N
4054	Tanika	9098373	\N	\N
4055	Alexis	20731915	\N	\N
4056	Emma	3937404	\N	\N
4057	Knowelle	60007772	\N	\N
4058	Megan	57755518	\N	\N
4059	Erick	8415577	\N	\N
4060	Jimmy	6320401	\N	\N
4061	Nimrodel	11084359	\N	\N
4062	Louis	52326756	\N	\N
4063	Alex	36690111	\N	\N
4064	Melissa	10342808	\N	\N
4065	Nikol	4796857	\N	\N
4066	Hannah	28098389	\N	\N
4067	Jahnn	23743505	\N	\N
4068	Olga	34162916	\N	\N
4069	Jane	52235514	\N	\N
4070	Powder River Rose	22923455	\N	\N
4071	Emily	4941984	\N	\N
4072	Angela	2265638	\N	\N
4073	Yuniie	25501481	\N	\N
4074	Thula	36742058	\N	\N
4075	Vivien	17288545	\N	\N
4076	Sangeeta	60318256	\N	\N
4077	Emma	45634653	\N	\N
4078	Christine	22086974	\N	\N
4079	pek	47184095	\N	\N
4080	Cassia	30978957	\N	\N
4081	Nina	3115449	\N	\N
4082	Ana	12193039	\N	\N
4083	Nina	46338474	\N	\N
4084	Jen	2850003	\N	\N
4085	Jodie	5197496	\N	\N
4086	Poyan	1778945	\N	\N
4087	Souj_rm	19889933	\N	\N
4088	Erin	3989457	\N	\N
4089	Teo	22152011	\N	\N
4090	Nadine	9977024	\N	\N
4091	Lacey	5641508	\N	\N
4092	Nahelli	4677478	\N	\N
4093	Lupi	55846991	\N	\N
4094	 (Polina)	29871413	\N	\N
4095	Franciny	9924554	\N	\N
4096	Earn	15772142	\N	\N
4097	Michael	10112807	\N	\N
4098	Pepi	34647477	\N	\N
4099	Clara	10631550	\N	\N
4100	Dhwani	16341887	\N	\N
4101	Sya Zee	14109580	\N	\N
4102	Janice	6412211	\N	\N
4103	Emma	57874216	\N	\N
4104	Nallev	5658488	\N	\N
4105	Karin	21494542	\N	\N
4106	Wally	5515793	\N	\N
4107	Pixie	5577905	\N	\N
4108	Mina	56309325	\N	\N
4109	Leon	23125059	\N	\N
4110	Zuzana	20512045	\N	\N
4111	Carol	28561556	\N	\N
4112	Veronika	38691156	\N	\N
4113	Carla	42742604	\N	\N
4114	Abbey	32476213	\N	\N
4115	Telemmaite	54197121	\N	\N
4116	V	45410372	\N	\N
4117	Michelle	1994372	\N	\N
4118	Dena	38773435	\N	\N
4119	Ryan	6573867	\N	\N
4120	Sophie	27316292	\N	\N
4121	Ali	60053277	\N	\N
4122	Kristen	5325427	\N	\N
4123	Kurt	31622840	\N	\N
4124	Sunil	12926347	\N	\N
4125	Kristyna	57877373	\N	\N
4126	Georgia	42306689	\N	\N
4127	Ella	5693652	\N	\N
4128	Catrin	28797385	\N	\N
4129	Kitty	13115543	\N	\N
4130	Jackie	7370532	\N	\N
4131	Melodywebster68yahoo.com	14176213	\N	\N
4132	Megan	28403404	\N	\N
4133	Alison	2751472	\N	\N
4134	Brooke	57541500	\N	\N
4135	Kenzom	38491379	\N	\N
4136	Zachary	19066294	\N	\N
4137	Cheung	6014304	\N	\N
4138	Corina	15419660	\N	\N
4139	Isabelle	29261279	\N	\N
4140	Mati	6847461	\N	\N
4141	Aryan	59415550	\N	\N
4142	Ustink	53076535	\N	\N
4143	Laura	28108612	\N	\N
4144	Rhonda	30884518	\N	\N
4145	Aditya	13889964	\N	\N
4146	Kieth	59919437	\N	\N
4147	Ben	54074436	\N	\N
4148	Kristina	49686771	\N	\N
4149	Jessica (bitsy 55)	50664915	\N	\N
4150	Courtney	13123878	\N	\N
4151	Bella	32987668	\N	\N
4152	B	46667695	\N	\N
4153	Mark	36517630	\N	\N
4154	Megan	9250005	\N	\N
4155	Maria	59248189	\N	\N
4156	Kristin	52455118	\N	\N
4157	Hamish	18892002	\N	\N
4158	Ketty	41118448	\N	\N
4159	Ginny	3521385	\N	\N
4160	Shadi	11953893	\N	\N
4161	Robert	50919511	\N	\N
4162	Jonah	23299701	\N	\N
4163	Patrick	15863730	\N	\N
4164	Monica	17468799	\N	\N
4165	Melissa	4284928	\N	\N
4166	Matthew	11062916	\N	\N
4167	Jos�	18671024	\N	\N
4168	Fernando	30159743	\N	\N
4169	Himanshi	15819617	\N	\N
4170	Noemi	39233008	\N	\N
4171	Arieta	16025186	\N	\N
4172	Calum	54789844	\N	\N
4173	Hannah	5497724	\N	\N
4174	Ankit	13133225	\N	\N
4175	Monica	58500880	\N	\N
4176	Sue	60089729	\N	\N
4177	Thet Hnin	21534977	\N	\N
4178	Hallgr�mur	44127678	\N	\N
4179	#Booksareawesome	49426066	\N	\N
4180	Aynur	56713472	\N	\N
4181	Dominika	27683953	\N	\N
4182	Jihen	57626729	\N	\N
4183	Kelly	52846199	\N	\N
4184	Meghan	58520541	\N	\N
4185	Tara	22747799	\N	\N
4186	Eleonora	17842428	\N	\N
4187	Raphaella	48190385	\N	\N
4188	Marilyn	27531874	\N	\N
4189	Ashley	42764303	\N	\N
4190	Alyona	32291909	\N	\N
4191	Rachel	11633984	\N	\N
4192	Misou	5897970	\N	\N
4193	Egl	7246203	\N	\N
4194	Kristine	16104005	\N	\N
4195	Xristina	4325740	\N	\N
4196	Yacine	39192406	\N	\N
4197	Symone	32461713	\N	\N
4198	Loh	55387225	\N	\N
4199	Rehmat	22078421	\N	\N
4200	Elpida	59969551	\N	\N
4201	Lena	26205994	\N	\N
4202	Priyanshi	16420934	\N	\N
4203	Bishal	57110727	\N	\N
4204	Ashley (Weets)	31270885	\N	\N
4205	Sameer	16615637	\N	\N
4206	Marten	58750802	\N	\N
4207	Xiaoli	52205999	\N	\N
4208	Ragle	4050320	\N	\N
4209	Chris	6340791	\N	\N
4210	Aino	51358068	\N	\N
4211	Petra	50981843	\N	\N
4212	Alexandrina	12620476	\N	\N
4213	Alexander	2167379	\N	\N
4214		49709232	\N	\N
4215	John	25930134	\N	\N
4216	Nicholas	44159484	\N	\N
4217	Yvonne	5692555	\N	\N
4218	Kenny	49055463	\N	\N
4219	Jeanna	6914919	\N	\N
4220	Shannon	34059594	\N	\N
4221	Faustine	34015956	\N	\N
4222	Hailie	34843459	\N	\N
4223	Manon	29049038	\N	\N
4224	Ludmilla	18872304	\N	\N
4225	Tammy	45467823	\N	\N
4226	Midnight	23037292	\N	\N
4227	Isabel	5206760	\N	\N
4228	Amelina	5209859	\N	\N
4229	Hatem	9463926	\N	\N
4230	Jocelyn	30360842	\N	\N
4231	Robin	51520967	\N	\N
4232	C	35795947	\N	\N
4233	Heather	43967561	\N	\N
4234	Duyen	4054679	\N	\N
4235	Darrell-marie	24040209	\N	\N
4236	Sarah	2636573	\N	\N
4237	Ken	23768999	\N	\N
4238	Rachel	30405710	\N	\N
4239	Abigail	35149392	\N	\N
4240	Shahid	5504867	\N	\N
4241	Arya	59061864	\N	\N
4242	Jenna	35053404	\N	\N
4243	Bohohobo	50287953	\N	\N
4244	Amanda	25272281	\N	\N
4245	Steph	55148358	\N	\N
4246	David	4666529	\N	\N
4247	JeanMarieT	45954674	\N	\N
4248	Paulaines	32682924	\N	\N
4249	Sean	14252756	\N	\N
4250	Melissa	5146459	\N	\N
4251	Nancy Higazy	53020554	\N	\N
4252	Irum	8351790	\N	\N
4253	Christine	600602	\N	\N
4254	Barbara	2361277	\N	\N
4255	Dana	4915678	\N	\N
4256	Mohamed	24584840	\N	\N
4257	A�sha	26765857	\N	\N
4258	Reham	5682084	\N	\N
4259	Jerika	5003070	\N	\N
4260	Simran	31759820	\N	\N
4261	Shanning	8737802	\N	\N
4262	Yoana	28521087	\N	\N
4263	Tahca	23452455	\N	\N
4264	B.j.	19580264	\N	\N
4265	Selma	32671928	\N	\N
4266	Anne	28594900	\N	\N
4267	Alexis	22258368	\N	\N
4268	Sky	23406508	\N	\N
4269	Minaxi	12166078	\N	\N
4270	Donna-Marie	3868248	\N	\N
4271	Dirk	50937789	\N	\N
4272	Christin	58221001	\N	\N
4273	Cassidy	47701649	\N	\N
4274	John Kim	39658989	\N	\N
4275	Kate	35961260	\N	\N
4276	Nicky	12200960	\N	\N
4277	Mary	5713799	\N	\N
4278	Bre	15861093	\N	\N
4279	Jade	31065573	\N	\N
4280	Stephen	15997669	\N	\N
4281	Melissandre	54899721	\N	\N
4282	Feier	1062262	\N	\N
4283	Mickey	2753671	\N	\N
4284	David	5568647	\N	\N
4285	Amy	3168017	\N	\N
4286	Nicole	56298446	\N	\N
4287	Mr. Park	11354051	\N	\N
4288	Santina	5519683	\N	\N
4289	Ivan	17147669	\N	\N
4290	Skyler	14867861	\N	\N
4291	Amyskyer	57370271	\N	\N
4292	Hilal	58415622	\N	\N
4293	James	16584271	\N	\N
4294	Rachel	21437502	\N	\N
4295	Ashley Quintero	37997938	\N	\N
4296	Susana	26693879	\N	\N
4297	Mackenzie	18974202	\N	\N
4298	Paul	7017921	\N	\N
4299	Nathaniel	53972810	\N	\N
4300	Shruti	56273663	\N	\N
4301	Tanu	51229159	\N	\N
4302	Heather	5565282	\N	\N
4303	Kaitlyn	30547314	\N	\N
4304	Sandra	20016028	\N	\N
4305	Parth	5066789	\N	\N
4306	Lesley-Anne	14810944	\N	\N
4307	Raffael	13393769	\N	\N
4308	Felicia	10222771	\N	\N
4309	Keryne	41102084	\N	\N
4310	Yegor	45755243	\N	\N
4311	Poonam	31990866	\N	\N
4312	Nora	6149136	\N	\N
4313	Samantha	15310943	\N	\N
4314	Pranav	49323257	\N	\N
4315	Rachel	29098248	\N	\N
4316	Stephenie	44465607	\N	\N
4317	Tatiana	8751570	\N	\N
4318	Kateina	53964492	\N	\N
4319	Disha	12110776	\N	\N
4320	"J"	42529686	\N	\N
4321	Katie	40447381	\N	\N
4322	Summer	59627907	\N	\N
4323	Abby	52828310	\N	\N
4324	Amber	5107895	\N	\N
4325	Melanie	11965402	\N	\N
4326	Tammy	24648524	\N	\N
4327	Rebecca	58885441	\N	\N
4328	Carol	5572355	\N	\N
4329	G	5649121	\N	\N
4330	William	34091312	\N	\N
4331	Minthang	13577307	\N	\N
4332	Ang	22086775	\N	\N
4333	Zachary	29739389	\N	\N
4334	Aubrey	57022666	\N	\N
4335	Kirsty	5706883	\N	\N
4336	Carly	55129453	\N	\N
4337	Leonardo	5938640	\N	\N
4338	Katie	2127291	\N	\N
4339	Shirley	3852212	\N	\N
4340	Isha	8268968	\N	\N
4341	Camilla	51525306	\N	\N
4342	Ariel	34399456	\N	\N
4343	Felicia	24736121	\N	\N
4344	LJ	57843240	\N	\N
4345	Garima	23982614	\N	\N
4346	Pinokyo	25194392	\N	\N
4347	Yasha	10619477	\N	\N
4348	Elena	59513962	\N	\N
4349	Ali	5872724	\N	\N
4350	Charisse	4575101	\N	\N
4351	Kelly	7267307	\N	\N
4352	Christina	5698508	\N	\N
4353	Richard	3381491	\N	\N
4354	Jessica	38386484	\N	\N
4355	Alana	7029710	\N	\N
4356	Hailey	41961963	\N	\N
4357	Zoie	6000180	\N	\N
4358	Aimee	46537192	\N	\N
4359	Nikita	26733271	\N	\N
4360	Hanne	34460902	\N	\N
4361	Mark	21232600	\N	\N
4362	Bronwyn	25232130	\N	\N
4363	Jennifer	51920484	\N	\N
4364	Kristen	5745127	\N	\N
4365	Piscesrenewed	1846965	\N	\N
4366	Clara	18596761	\N	\N
4367	Lyndsie	12633212	\N	\N
4368	Adrienne	2087365	\N	\N
4369	Jamie	28740680	\N	\N
4370	Akshay	9198918	\N	\N
4371	Jayme	26468661	\N	\N
4372	Nayeomi	10553315	\N	\N
4373	Emma	5327236	\N	\N
4374	Marjana	4871508	\N	\N
4375	Azalea	4936913	\N	\N
4376	Krishnan	59501954	\N	\N
4377	Shraddha	6097904	\N	\N
4378	Sadia	36454545	\N	\N
4379	Bjarni	27382248	\N	\N
4380	Jacquie	3004366	\N	\N
4381	Gabriella	30823266	\N	\N
4382	Ellen Rory	50631744	\N	\N
4383	Diana	39601465	\N	\N
4384	Marlana	3273321	\N	\N
4385	Jill	20855073	\N	\N
4386	Ibra	26835372	\N	\N
4387	Andre	1668920	\N	\N
4388	Felipe	18157526	\N	\N
4389	A�cha	58296190	\N	\N
4390	Carter	44171278	\N	\N
4391	Akanksha Patel	46400268	\N	\N
4392	Freja	34133915	\N	\N
4393	Taylor	27044314	\N	\N
4394	Roberto	22357383	\N	\N
4395	Genevieve	3689141	\N	\N
4396	Lulu	1323124	\N	\N
4397	Harrison	59429488	\N	\N
4398	Leila	5787196	\N	\N
4399	Sherri	27154735	\N	\N
4400	Jasmine	33518649	\N	\N
4401	Sheridan	3875933	\N	\N
4402	Rohan	30667808	\N	\N
4403	Brinn	58571627	\N	\N
4404	Rosalinda	52739344	\N	\N
4405	ms goodreads	8178113	\N	\N
4406	Nadia	18843102	\N	\N
4407	Marcus	20981907	\N	\N
4408	Michael	17518134	\N	\N
4409	Laurentia	24590875	\N	\N
4410	Tatiana	46065236	\N	\N
4411	Stephanie	11864529	\N	\N
4412	Rahul	18966525	\N	\N
4413	Cindy	3964737	\N	\N
4414	Ping	5594056	\N	\N
4415	Kevin	22530841	\N	\N
4416	Exlibris	40645696	\N	\N
4417	Eliza	5999799	\N	\N
4418	Aycarambitax3	52055816	\N	\N
4419	In�s	30470756	\N	\N
4420	Aly	59312431	\N	\N
4421	Daisy	54347574	\N	\N
4422	Carter	8923639	\N	\N
4423	Kristi	28246212	\N	\N
4424	Laura	58402281	\N	\N
4425	Isobella	5711352	\N	\N
4426	Meg	53623041	\N	\N
4427	Misha	1244343	\N	\N
4428	Shannon	17080498	\N	\N
4429	Shamese	20956563	\N	\N
4430	Lisa	6063124	\N	\N
4431	Kelly	28278733	\N	\N
4432	Victoria	53686141	\N	\N
4433	Sasa	15217710	\N	\N
4434	Leah	30702806	\N	\N
4435	Lohit.c	6679453	\N	\N
4436	Jenna	4992440	\N	\N
4437	Leci	54799392	\N	\N
4438	Courtney	48960308	\N	\N
4439	Michelle	25075734	\N	\N
4440	Nazl	46018283	\N	\N
4441	Kasper Moestrup	26378160	\N	\N
4442	miss yelp	11656047	\N	\N
4443	Jamie	53225650	\N	\N
4444	Rosa	24500422	\N	\N
4445	Tanya	5043495	\N	\N
4446	Knihomolka	33358847	\N	\N
4447	Damaris	3486816	\N	\N
4448	Michelle	27717340	\N	\N
4449	Nadine	4809130	\N	\N
4450	Stephanie	58487846	\N	\N
4451	Emilyjungian	21794825	\N	\N
4452	Lana	25179230	\N	\N
4453	Sarah	58563838	\N	\N
4454	RRPI	47635720	\N	\N
4455	Courtney	1092454	\N	\N
4456	Lars	30442992	\N	\N
4457	Ankit	7927756	\N	\N
4458	Sara	7197984	\N	\N
4459	Chelsea	57752741	\N	\N
4460	Felicitee	28677201	\N	\N
4461	Gweneviere	54904947	\N	\N
4462	Julia	13116292	\N	\N
4463	Stefanie	57182336	\N	\N
4464	Nolana	34607778	\N	\N
4465	Owieeeczka	20635893	\N	\N
4466	Carina	58743756	\N	\N
4467	Leana	52105807	\N	\N
4468	annie	32045073	\N	\N
4469	Hunter	6479694	\N	\N
4470	Georgia	17533863	\N	\N
4471	Anthony	25891626	\N	\N
4472	Rebecca	57377383	\N	\N
4473	Re	46109806	\N	\N
4474	Camilo	7814908	\N	\N
4475	Jessica	42790949	\N	\N
4476	Mark	34187	\N	\N
4477	Sue	5098964	\N	\N
4478	Juli	29623682	\N	\N
4479	Kim	22159776	\N	\N
4480	Vanja	30594324	\N	\N
4481	Anna	15569677	\N	\N
4482	Valerie	40151506	\N	\N
4483	Ana	53587604	\N	\N
4484	Rosalynn	6574397	\N	\N
4485	Nat	15567363	\N	\N
4486	Ellen	3214608	\N	\N
4487	Jessica	37163572	\N	\N
4488	Liz	30346221	\N	\N
4489	Nicole	869557	\N	\N
4490	Ana	18657180	\N	\N
4491	Becky	5676366	\N	\N
4492	Deirdre	8524433	\N	\N
4493	Drlaw00	50253941	\N	\N
4494	Katie	29930130	\N	\N
4495	Tania	23607686	\N	\N
4496	Leah	56880395	\N	\N
4497	Sarah	15828853	\N	\N
4498	Jennie Alice	13416610	\N	\N
4499	Kari	38279648	\N	\N
4500	Fat and Emo Nerd	42624529	\N	\N
4501	Ginger	23560776	\N	\N
4502	David	16567673	\N	\N
4503	Noname	4221210	\N	\N
4504	Suzanne	40697002	\N	\N
4505	Melissa	37763386	\N	\N
4506	Claraa	57321329	\N	\N
4507	Rehab	23698890	\N	\N
4508	Enakshi	28491035	\N	\N
4509	Pailin	8834656	\N	\N
4510	Catarina	3874392	\N	\N
4511	Sarah	19861605	\N	\N
4512	Sam	14930067	\N	\N
4513	Iota	49412120	\N	\N
4514	Rachel	41591640	\N	\N
4515	Daniel	49388113	\N	\N
4516	Hannuschkaa	6952910	\N	\N
4517	Blu Tulips	19870917	\N	\N
4518	Hannah	5672169	\N	\N
4519	Sofie	2371708	\N	\N
4520	Emily	57768720	\N	\N
4521	C.J.	661202	\N	\N
4522	Brandy	3005701	\N	\N
4523	Martha	1551395	\N	\N
4524	Naela	58817866	\N	\N
4525	Rahul	37592996	\N	\N
4526	Samia	30477530	\N	\N
4527	Lily	7441304	\N	\N
4528	Nuccia	5695866	\N	\N
4529	Claire	46963898	\N	\N
4530	Joshuanna-Marie	33482059	\N	\N
4531	Saurabh	42850984	\N	\N
4532	Danielle	26626180	\N	\N
4533	Rafe	33674651	\N	\N
4534	Crystal	54258523	\N	\N
4535	Tarinla	20130665	\N	\N
4536	Amy	13694201	\N	\N
4537	Andrea	58060981	\N	\N
4538	Omar	3786776	\N	\N
4539	Trig	52281160	\N	\N
4540	lucy	31839050	\N	\N
4541	Peter	7865683	\N	\N
4542	Semsem	53181502	\N	\N
4543	Cansu	7405390	\N	\N
4544	Amaara	57957366	\N	\N
4545	Yolanda	363035	\N	\N
4546	Brenda	17732696	\N	\N
4547	G�rkem	58410897	\N	\N
4548	Jenn	924427	\N	\N
4549	Jon	15943843	\N	\N
4550	Gwilym	9076503	\N	\N
4551	Rosa	11769355	\N	\N
4552	Divya	3687181	\N	\N
4553	Melissa	29945780	\N	\N
4554	Shivan	12743395	\N	\N
4555	John	43791999	\N	\N
4556	Shanteal	31480729	\N	\N
4557	Judith	30467038	\N	\N
4558	Janet	22826340	\N	\N
4559	Heather	4713140	\N	\N
4560	Annie	26480239	\N	\N
4561	Abby	25220916	\N	\N
4562	Beau	6684290	\N	\N
4563	Keira	9581774	\N	\N
4564	Nancy	26808468	\N	\N
4565	Rob	28017846	\N	\N
4566	Chris	3110601	\N	\N
4567	Margie	5311564	\N	\N
4568	Kobra	25867927	\N	\N
4569	Houston	52135667	\N	\N
4570	Kimberly	40804503	\N	\N
4571	Yuki	37743112	\N	\N
4572	Yasmin	52375551	\N	\N
4573	Shawn	56152729	\N	\N
4574	Kimberly	34373220	\N	\N
4575	Shelby	5214858	\N	\N
4576	Linda	57870153	\N	\N
4577	Setalpgninnpsekil	24893938	\N	\N
4578	Maura	51708755	\N	\N
4579	Nakita	30179283	\N	\N
4580	Xujia	46112794	\N	\N
4581	Zakir	15186239	\N	\N
4582	Geoff	30723328	\N	\N
4583	Emma	57812489	\N	\N
4584	Sydney	33045391	\N	\N
4585	Kristina	1120784	\N	\N
4586	Elena	15505822	\N	\N
4587	Jenmartini	9587934	\N	\N
4588	Ekaterina Lukianova	51748042	\N	\N
4589	Emarosa89	34094385	\N	\N
4590	Mona	25063592	\N	\N
4591	Susan	33121953	\N	\N
4592	Anna	46369654	\N	\N
4593	Kryz	51598822	\N	\N
4594	Anglina	37131936	\N	\N
4595	Susi	27900676	\N	\N
4596	Al	4995027	\N	\N
4597	Amanda	17537806	\N	\N
4598	Krollo	23748469	\N	\N
4599	Craig	56413999	\N	\N
4600	Ashley	11295273	\N	\N
4601	Opalgem	4714640	\N	\N
4602	Vipiflower	1369105	\N	\N
4603	Scott	4821569	\N	\N
4604	Emily	5132834	\N	\N
4605	Rajesh	20480842	\N	\N
4606	Mary	5692696	\N	\N
4607	Tracy	7086446	\N	\N
4608	Fleur	8089988	\N	\N
4609	Eleanore	58082631	\N	\N
4610	Sasha	58328777	\N	\N
4611	Tracy	1639037	\N	\N
4612	DanyK	45536801	\N	\N
4613	Justine	33930900	\N	\N
4614	Anderson	31798331	\N	\N
4615	Megan	32038955	\N	\N
4616	Shelbey	53452466	\N	\N
4617	Michelle	14570443	\N	\N
4618	Sushmith	24746455	\N	\N
4619	Ana	17128726	\N	\N
4620	India	43582829	\N	\N
4621	Julia	30141515	\N	\N
4622	Mel	56288934	\N	\N
4623	Wendy	35126173	\N	\N
4624	Sage	12994305	\N	\N
4625	Dawn	6699567	\N	\N
4626	Rebekka	5681393	\N	\N
4627	Constance	2162991	\N	\N
4628	Jessie	39362400	\N	\N
4629	Joakim	31831813	\N	\N
4630	Saige	26235836	\N	\N
4631	Cassandra	53126834	\N	\N
4632	Jess	41867951	\N	\N
4633	Danielle	22837838	\N	\N
4634	Strawb	15782002	\N	\N
4635	Wendy	6763144	\N	\N
4636	Katie	5592756	\N	\N
4637	Susagna	42963818	\N	\N
4638	Katie	7686088	\N	\N
4639	Jordyn	5904800	\N	\N
4640	Alexander	41074893	\N	\N
4641	Metapen	25624252	\N	\N
4642	Christian	50602401	\N	\N
4643	Sonja	22017849	\N	\N
4644	Daniya	52920359	\N	\N
4645	Doris	12267573	\N	\N
4646	Byron	26859648	\N	\N
4647	Blanka	45225889	\N	\N
4648	Jenna	5712995	\N	\N
4649	Paul	41726661	\N	\N
4650	Brenda	30798158	\N	\N
4651	Kingsylar	55902764	\N	\N
4652	Charles	11157014	\N	\N
4653	Michelle	2589664	\N	\N
4654	Shivani	21815271	\N	\N
4655	Harith	26862990	\N	\N
4656	Angie	5663671	\N	\N
4657	J	30775521	\N	\N
4658	Danielle	20110702	\N	\N
4659	Rachel	5407079	\N	\N
4660	Sairam	57150407	\N	\N
4661	Oishika	16112230	\N	\N
4662	Katie	48167009	\N	\N
4663	Tara	32274227	\N	\N
4664	Asha	30181223	\N	\N
4665	David	32087377	\N	\N
4666	Tammy	4732305	\N	\N
4667	Beatriz	31937564	\N	\N
4668	Angela	25088239	\N	\N
4669	Izzuddin	50329380	\N	\N
4670	Lindsey	5272746	\N	\N
4671	Ruthshaffer2000	13052723	\N	\N
4672	Heidi	4779381	\N	\N
4673	Selina	27006247	\N	\N
4674	Debra	29712299	\N	\N
4675	Superstar	57941659	\N	\N
4676	Aleks	16562866	\N	\N
4677	Gena	44775635	\N	\N
4678	Juste	16011492	\N	\N
4679	Sakshi	41075013	\N	\N
4680	Govind	11132693	\N	\N
4681	Mariana	20936215	\N	\N
4682	Ana	6103526	\N	\N
4683	Hollyinnnv	18666673	\N	\N
4684	Josie	2918016	\N	\N
4685	Darja	55654977	\N	\N
4686	Hala	57853416	\N	\N
4687	Amalia	23566884	\N	\N
4688	Oana	5673812	\N	\N
4689	Michael	11375602	\N	\N
4690	K.L.	49659188	\N	\N
4691	Daniel	32895188	\N	\N
4692	Ariana	22152142	\N	\N
4693	Lokesh	44750577	\N	\N
4694	Caroline	52523388	\N	\N
4695	Layal	9312834	\N	\N
4696	Amber	57585350	\N	\N
4697	Edte	7232158	\N	\N
4698	Tanya	56612671	\N	\N
4699	Lily	57733707	\N	\N
4700	Kat	3692111	\N	\N
4701	Ira	57573047	\N	\N
4702	Jackie	28739503	\N	\N
4703	Ayse	3908675	\N	\N
4704	Deb	7605216	\N	\N
4705	Zach	5582641	\N	\N
4706	Abbi	57530655	\N	\N
4707	Dafinka	56645935	\N	\N
4708	Parth	15361131	\N	\N
4709	Souha	18909285	\N	\N
4710	Kimberly	47407667	\N	\N
4711	Sophie	56203243	\N	\N
4712	Mielbees	44315758	\N	\N
4713	Conor	51489172	\N	\N
4714	Stephanie (LitLoversLane.com)	28341667	\N	\N
4715	D	48423570	\N	\N
4716	Sari	5687145	\N	\N
4717	Iqra	36603107	\N	\N
4718	Mike The Pirate	1313784	\N	\N
4719	Ingrid	44794926	\N	\N
4720	Ankita	52040413	\N	\N
4721	Madhuri	5529227	\N	\N
4722	Cindy	7055152	\N	\N
4723	Caroline	9825958	\N	\N
4724	Adrianne	55711368	\N	\N
4725	Marshal	34747773	\N	\N
4726	Averel	616030	\N	\N
4727	Orley	12118529	\N	\N
4728	Maeve O'Donnell	38134728	\N	\N
4729	Cay	47138174	\N	\N
4730	Scott101	54676164	\N	\N
4731	Lorena	5915396	\N	\N
4732	Neveen	49911033	\N	\N
4733	Wiam	18081568	\N	\N
4734	Aaron	49399051	\N	\N
4735	Meriem	30455513	\N	\N
4736	Jeremy	5787027	\N	\N
4737	Erdem.Duru17	57349698	\N	\N
4738	Amanda	49344712	\N	\N
4739	Teja	32724714	\N	\N
4740	Rachel	2863410	\N	\N
4741	alba	5982984	\N	\N
4742	Mani	44225993	\N	\N
4743	Dagnija	18485325	\N	\N
4744	Desiree	5930781	\N	\N
4745	Leeba	44635939	\N	\N
4746	Kelsey	32848272	\N	\N
4747	Susan	35344822	\N	\N
4748	Bahar	5586548	\N	\N
4749	Andrea	29153523	\N	\N
4750	TIVAH	57228209	\N	\N
4751	Holly	9821369	\N	\N
4752	Kimberly	22089055	\N	\N
4753	Jaganya	35750764	\N	\N
4754	Chaohua	7594648	\N	\N
4755	Diana	52942062	\N	\N
4756	Ramesh	56643737	\N	\N
4757	Marilia	41341485	\N	\N
4758	Hailee	22476816	\N	\N
4759	Zack	34741381	\N	\N
4760	Alex	56789614	\N	\N
4761	Becca	30544249	\N	\N
4762	Michelle	11228529	\N	\N
4763	Jessica	4357626	\N	\N
4764	Bhumika	7946566	\N	\N
4765	Lisa	6803200	\N	\N
4766	Krist�n	24571721	\N	\N
4767	Brianna	21324813	\N	\N
4768	Zeinab	49109604	\N	\N
4769	MOHAMMED	56990183	\N	\N
4770	Paul	3269748	\N	\N
4771	Anni	49514034	\N	\N
4772	Myo	16985105	\N	\N
4773	Charissa	18143754	\N	\N
4774	Stephanie	23753302	\N	\N
4775	Katie	5552409	\N	\N
4776	Caroline	1937442	\N	\N
4777	Mark	31353414	\N	\N
4778	Zafar	3317151	\N	\N
4779	Tonje	45667645	\N	\N
4780	Steve	10647224	\N	\N
4781	Elizabeth	55428410	\N	\N
4782	Anshul	5617896	\N	\N
4783	Alexm	23356303	\N	\N
4784	Kellie	5760322	\N	\N
4785	Sandy	12255925	\N	\N
4786	Kons	44782844	\N	\N
4787	Alyse	15241968	\N	\N
4788	Renee	56431749	\N	\N
4789	Grace	7229727	\N	\N
4790	Alicia	18109501	\N	\N
4791	V	21779254	\N	\N
4792	Rebecca	16113118	\N	\N
4793	Ronynjege	56783936	\N	\N
4794	Tracy	8233182	\N	\N
4795	Nana	8246448	\N	\N
4796	Sam	46560395	\N	\N
4797	Sarah	48322377	\N	\N
4798	Agnes	2473572	\N	\N
4799	Jess	23328975	\N	\N
4800	David	29717489	\N	\N
4801	Mathew	19296026	\N	\N
4802	Jenn	5547455	\N	\N
4803	Stephen	5615020	\N	\N
4804	Leo	13225218	\N	\N
4805	Ankita	54544970	\N	\N
4806	Splen	180415	\N	\N
4807	Arpy	23690098	\N	\N
4808	Elia	30201794	\N	\N
4809	Lavanya	6074249	\N	\N
4810	Stella	7614497	\N	\N
4811	Greg	55060567	\N	\N
4812	Stephanie	1187816	\N	\N
4813	Dan	50182135	\N	\N
4814	Tea	5966282	\N	\N
4815	Kit	44453670	\N	\N
4816	Marianne	3225260	\N	\N
4817	Betina	35377513	\N	\N
4818	Robert	3762078	\N	\N
4819	Emma	52412314	\N	\N
4820	Ritu	30511720	\N	\N
4821	Kathleen	4821715	\N	\N
4822	Isha	42891988	\N	\N
4823	Justin	577736	\N	\N
4824	Gabriela	7074781	\N	\N
4825	Sierra	56574478	\N	\N
4826	Millie	6260810	\N	\N
4827	Aparna	16750513	\N	\N
4828	Michael	5482230	\N	\N
4829	Verity	21278509	\N	\N
4830	Mari	29643032	\N	\N
4831	Lisa	21759392	\N	\N
4832	Amber	5447365	\N	\N
4833	Debbie	16384166	\N	\N
4834	Abbey	53657390	\N	\N
4835	Kendall	5355668	\N	\N
4836	Sean	29055423	\N	\N
4837	Stine	52694052	\N	\N
4838	Elka	56498677	\N	\N
4839	Eliza	55111476	\N	\N
4840	Neha	24813465	\N	\N
4841	Kari	38608022	\N	\N
4842	Andrea	1398416	\N	\N
4843	Michele	3822242	\N	\N
4844	Miriusa	6596823	\N	\N
4845	Rohith	42781816	\N	\N
4846	Annette	4930655	\N	\N
4847	Jennifer	3788794	\N	\N
4848	Margaret	4666367	\N	\N
4849	Camila	1152022	\N	\N
4850	John	11334711	\N	\N
4851	Amanda	7737979	\N	\N
4852	Chlo�	42693764	\N	\N
4853	marie	5566438	\N	\N
4854	Sara	3797127	\N	\N
4855	Ashley	15084608	\N	\N
4856	Wathingira	28663495	\N	\N
4857	Shannon	6676472	\N	\N
4858	Chris	16830734	\N	\N
4859	Teresa	8597733	\N	\N
4860	Sarah	50968545	\N	\N
4861	Stephanie	9860080	\N	\N
4862	Lizzy	37730603	\N	\N
4863	Eric	3052843	\N	\N
4864	Casey	3941926	\N	\N
4865	Alireza	56186583	\N	\N
4866	Amola	16724092	\N	\N
4867	evelyn	33359613	\N	\N
4868	Asif	34790358	\N	\N
4869	Ash	26483018	\N	\N
4870	Connor	4637804	\N	\N
4871	Oz	19056132	\N	\N
4872	Asma	40988982	\N	\N
4873	Ann Shin	3726333	\N	\N
4874	Nicole	7530873	\N	\N
4875	Michael	55638260	\N	\N
4876	Brandon	47635410	\N	\N
4877	Melissa	15660879	\N	\N
4878	Greta	16779090	\N	\N
4879	Leanne	12550885	\N	\N
4880	LisaQK	5701200	\N	\N
4881	Oliver Thompson	55281033	\N	\N
4882	Sarah	5400115	\N	\N
4883	Eusebius	15212771	\N	\N
4884	Patrick	1383849	\N	\N
4885	Cleo	41738067	\N	\N
4886	Eduardo	32191566	\N	\N
4887	Anita	5676630	\N	\N
4888	Alison	6081250	\N	\N
4889	Reema	27510144	\N	\N
4890	Amy	4972190	\N	\N
4891	Fabiana	38476573	\N	\N
4892	Lynne	41670689	\N	\N
4893	Dan	27382954	\N	\N
4894	Nidhi	29767550	\N	\N
4895	Archana	12829663	\N	\N
4896	Aida	14643900	\N	\N
4897	Donna	50694502	\N	\N
4898	Maya	40004843	\N	\N
4899	Dayton	20449936	\N	\N
4900	Katie	17365602	\N	\N
4901	Shash	47228586	\N	\N
4902	Hrw	16538987	\N	\N
4903	Sarah	49710483	\N	\N
4904	Shayla	19206992	\N	\N
4905	Louiza	5567255	\N	\N
4906	PaperPages	54816750	\N	\N
4907	Sara	31434345	\N	\N
4908	Stacy	10345017	\N	\N
4909	Martina	17145945	\N	\N
4910	Lori	3240819	\N	\N
4911	Kalin	38971121	\N	\N
4912	Lisa	52155001	\N	\N
4913	Lisa	8509960	\N	\N
4914	Karen	6032567	\N	\N
4915	Kara	27329889	\N	\N
4916	Mike	2711657	\N	\N
4917	Mihae	26198537	\N	\N
4918	Kimberley	54815741	\N	\N
4919	Maria	55265136	\N	\N
4920	Michele	45830426	\N	\N
4921	Matt	30631723	\N	\N
4922	Laarni	15989972	\N	\N
4923	Nina	51269375	\N	\N
4924	PANKAJ	55321240	\N	\N
4925	Nancy	55281624	\N	\N
4926	Emily	17855499	\N	\N
4927	Donna	45159697	\N	\N
4928	Carmn_sm	33192867	\N	\N
4929	Erik	32198500	\N	\N
4930	Meenal	13433277	\N	\N
4931	Shuchita	39446779	\N	\N
4932	Kira	5447367	\N	\N
4933	Kelly	53414366	\N	\N
4934	�ngel	54766542	\N	\N
4935	Jedi	39600589	\N	\N
4936	Jonathan	31764118	\N	\N
4937	Melanie	16117454	\N	\N
4938	Casey	54834194	\N	\N
4939	Feli	31274639	\N	\N
4940	Luz	48061255	\N	\N
4941	Rui	31733319	\N	\N
4942	Xander	20227943	\N	\N
4943	Victoria	1797099	\N	\N
4944	Anne	6247322	\N	\N
4945	Jeff	4607896	\N	\N
4946	Lia	44005555	\N	\N
4947	Lemon	3314873	\N	\N
4948	Lacey	7828733	\N	\N
4949	Rebecca	46412064	\N	\N
4950	Debie	1602362	\N	\N
4951	Chris	32691620	\N	\N
4952	Mie	14682927	\N	\N
4953	Laura	4256613	\N	\N
4954	Littymol	54721873	\N	\N
4955	Katie	47987547	\N	\N
4956	Juliet	5677244	\N	\N
4957	Bilge	40040191	\N	\N
4958	Alexandra	12632436	\N	\N
4959	Julia	19672121	\N	\N
4960	Colin	53989616	\N	\N
4961	RanaSelin	54854305	\N	\N
4962	Treyci	6859709	\N	\N
4963	Julie	5074828	\N	\N
4964	Ana	18389263	\N	\N
4965	Ally	30538226	\N	\N
4966	Maria	51689613	\N	\N
4967	Christina	46378540	\N	\N
4968	Joanne	8387893	\N	\N
4969	Emily	6235482	\N	\N
4970	Humaira	20281211	\N	\N
4971	Zamora	31310464	\N	\N
4972	Kelsey	24450106	\N	\N
4973	Vijay	30954254	\N	\N
4974	Leah	1798874	\N	\N
4975	Julie	51388513	\N	\N
4976	Melissa	21714722	\N	\N
4977	Akshra	31109990	\N	\N
4978	Jade	43870233	\N	\N
4979	Jade	21515953	\N	\N
4980	shivali	14693666	\N	\N
4981	Arvidson	52606403	\N	\N
4982	Janhavi	29504700	\N	\N
4983	Shirley	43059074	\N	\N
4984	Nikhil	28593565	\N	\N
4985	Brooke	7297928	\N	\N
4986	Adhisty	54543093	\N	\N
4987	Jonathan	39353246	\N	\N
4988	Rachel	52681675	\N	\N
4989	Aria	11974387	\N	\N
4990	Abmis	28326431	\N	\N
4991	Hannah	12577426	\N	\N
4992	Danielle	5619205	\N	\N
4993	Xxiao8	28582489	\N	\N
4994	Kamille	4102730	\N	\N
4995	Emily	30483608	\N	\N
4996	Hannah	11063486	\N	\N
4997	Kimberley	52139598	\N	\N
4998	Jakky	50287019	\N	\N
4999	Stephenie	2632320	\N	\N
5000	Maahi	23936169	\N	\N
5001	Harold	54225779	\N	\N
5002	Shelby	45262923	\N	\N
5003	Olga	7285718	\N	\N
5004	Anbrill	5674216	\N	\N
5005	Grant	5658955	\N	\N
5006	S	13233218	\N	\N
5007	Idougala	21792097	\N	\N
5008	Michael	17276570	\N	\N
5009	Sara	5557319	\N	\N
5010	JS	26930526	\N	\N
5011	Hythlodaeus	35073437	\N	\N
5012	July	32653428	\N	\N
5013	Hacska	52786933	\N	\N
5014	April	22292821	\N	\N
5015	Shambhavi	48389554	\N	\N
5016	Joris	21824796	\N	\N
5017	Clinton	4117748	\N	\N
5018	Arianna7	45658118	\N	\N
5019	Emma	52062890	\N	\N
5020	Kimberly	28249592	\N	\N
5021	Nurlan	26451084	\N	\N
5022	Livia	25192064	\N	\N
5023	Laura	30332565	\N	\N
5024	Heather	52206607	\N	\N
5025	umbirko	31416185	\N	\N
5026	Nandhiny	32612179	\N	\N
5027	Vmnichols	8038191	\N	\N
5028	Renata	38037856	\N	\N
5029	Den	42013542	\N	\N
5030	Bromide	49667508	\N	\N
5031	Nadine	26677535	\N	\N
5032	Aditi	53219346	\N	\N
5033	Aleksa	9485482	\N	\N
5034	Haley	23242337	\N	\N
5035	Mar'yana	5778056	\N	\N
5036	Katarina	18678548	\N	\N
5037	SONYA	53034908	\N	\N
5038	Nyasha	52963266	\N	\N
5039	Richa	53047442	\N	\N
5040	Denise	5655161	\N	\N
5041	Graceanne	6329864	\N	\N
5042	Sharon	5706862	\N	\N
5043	Misst	31413924	\N	\N
5044	Colton	19066856	\N	\N
5045	Shoshana	6821141	\N	\N
5046	Esteban	28978202	\N	\N
5047	Kitty	24307245	\N	\N
5048	Amy	51891764	\N	\N
5049	Neha	11818969	\N	\N
5050	L-H	4981230	\N	\N
5051	Diana	43256249	\N	\N
5052	Leanne	4264193	\N	\N
5053	Katerina	10953562	\N	\N
5054	Ken	30006419	\N	\N
5055	April	17462365	\N	\N
5056	Michelle	4030826	\N	\N
5057	Christina	47231413	\N	\N
5058	Vicci	51929185	\N	\N
5059	S.T.	23135217	\N	\N
5060	Kiwilena	51345379	\N	\N
5061	Jayzzah	37635804	\N	\N
5062	Bella	4239856	\N	\N
5063	Olivia	5786432	\N	\N
5064	Yy	5351781	\N	\N
5065	Camilo	23323913	\N	\N
5066	Lucy	50752659	\N	\N
5067	Kalsee	51419222	\N	\N
5068	Conscience	30380593	\N	\N
5069	Amy	20552281	\N	\N
5070	Charlotte	15717040	\N	\N
5071	Mark	51397850	\N	\N
5072	Lee	49564770	\N	\N
5073	Jessica	45287811	\N	\N
5074	Stephanie	31477743	\N	\N
5075	Lisa	1408937	\N	\N
5076	John	3890860	\N	\N
5077	Morgan	4996802	\N	\N
5078	Jason	7020383	\N	\N
5079	Sarp	36872519	\N	\N
5080	Saad	51217392	\N	\N
5081	Matthew	30255138	\N	\N
5082	Quanjun	2852560	\N	\N
5083	Kelly	14943345	\N	\N
5084	Michael	48649854	\N	\N
5085	Perla	51397493	\N	\N
5086	Cisco	49364234	\N	\N
5087	Lindsey	33970906	\N	\N
5088	Harriet	51379957	\N	\N
5089	Ian	48267541	\N	\N
5090	Samantha	4927335	\N	\N
5091	Erin	28115236	\N	\N
5092	Aly	7371224	\N	\N
5093	Kaylani	4219738	\N	\N
5094	Ana	5245977	\N	\N
5095	Adrien	22120803	\N	\N
5096	Holly	51332371	\N	\N
5097	Teodora	34581642	\N	\N
5098	Bettina	737269	\N	\N
5099	Kristi	24587894	\N	\N
5100	Hayley	12027850	\N	\N
5101	Daniela	32954061	\N	\N
5102	Ashleigh	17582798	\N	\N
5103	Ada	34389646	\N	\N
5104	Alice	7145535	\N	\N
5105	Carrie	16210268	\N	\N
5106	Manel	32965191	\N	\N
5107	Kari	22187302	\N	\N
5108	Megan	47850274	\N	\N
5109	Terri	3279841	\N	\N
5110	Valter	12627335	\N	\N
5111	Jean-Paul	39332816	\N	\N
5112	Lina	4773202	\N	\N
5113	Jane	32913947	\N	\N
5114	Inna	10890475	\N	\N
5115	Tracy	47804014	\N	\N
5116	MJ Gist	47735810	\N	\N
5117	Laura	1957771	\N	\N
5118	Impeachbush	10613655	\N	\N
5119	Vineeth	5181518	\N	\N
5120	Susie	7718670	\N	\N
5121	Clotilde	30340139	\N	\N
5122	Lauryn	47547645	\N	\N
5123	Megan	1084267	\N	\N
5124	Diana	36517499	\N	\N
5125	Cassandra	31747868	\N	\N
5126	Julia	29363685	\N	\N
5127	Ashwini	31093254	\N	\N
5128	Miguel	27578413	\N	\N
5129	Allison	5663796	\N	\N
5130	Kerri	20768413	\N	\N
5131	Coby	35930851	\N	\N
5132	Stella	47565453	\N	\N
5133	Anoop	17523675	\N	\N
5134	mosquitobaite	46520491	\N	\N
5135	Laura	31304093	\N	\N
5136	Adina	50323175	\N	\N
5137	Dani	12604800	\N	\N
5138	Rick	19342026	\N	\N
5139	Mark	33788002	\N	\N
5140	Gabriela Hirschberg	48755049	\N	\N
5141	Maryann	10565584	\N	\N
5142	Lucy	33969547	\N	\N
5143	Humayun	49910570	\N	\N
5144	Jane	5699449	\N	\N
5145	Meghan	33627369	\N	\N
5146	Marumarku	45557698	\N	\N
5147	Chaizani	5704949	\N	\N
5148	Sophia	12941422	\N	\N
5149	Symone	28001120	\N	\N
5150	Apoorv	48912421	\N	\N
5151	Tad	28583367	\N	\N
5152	Brandon	28663631	\N	\N
5153	Bahram	47152751	\N	\N
5154	Honora	25937705	\N	\N
5155	Teresa	25861241	\N	\N
5156	Chaewon	12420232	\N	\N
5157	Alessandra	30910349	\N	\N
5158	Margarita	42580543	\N	\N
5159	Alex	37508776	\N	\N
5160	Joe	43876394	\N	\N
5161	Leonardo	6847179	\N	\N
5162	Heather	3894357	\N	\N
5163	Christian	39812743	\N	\N
5164	Emily	29261199	\N	\N
5165	YQ	32767195	\N	\N
5166	Aaron	25838273	\N	\N
5167	Sib�al	5714216	\N	\N
5168	KK	48331583	\N	\N
5169	Nina	22089142	\N	\N
5170	Agueda	47660964	\N	\N
5171	Martin	24181712	\N	\N
5172	Matthew	44454198	\N	\N
5173	Briana	20345181	\N	\N
5174	Nabeela	14344637	\N	\N
5175	Mahak	48160475	\N	\N
5176	Naduni	48390820	\N	\N
5177	Edward	47922779	\N	\N
5178	Ishita	30684023	\N	\N
5179	Nick	9117886	\N	\N
5180	Ashwin	28099157	\N	\N
5181	Mmb	30333779	\N	\N
5182	Brandon	47350468	\N	\N
5183	Adriana	47991120	\N	\N
5184	Ramona	47920128	\N	\N
5185	Daniela	4732921	\N	\N
5186	Ozmerican	28558295	\N	\N
5187	Kamila	23629743	\N	\N
5188	Mirela	5217789	\N	\N
5189	Imen	21475829	\N	\N
5190	Carlos	9363142	\N	\N
5191	Hanna	5636339	\N	\N
5192	Jessica	40017849	\N	\N
5193	Alysson	15990998	\N	\N
5194	MariLo	29028059	\N	\N
5195	Alba	29107798	\N	\N
5196	Alexis	38563857	\N	\N
5197	Lucy	8226990	\N	\N
5198	Miranda	32094540	\N	\N
5199	Kelly	15731755	\N	\N
5200	Nick	44339095	\N	\N
5201	Seracettin	31179246	\N	\N
5202	Timothy	5637461	\N	\N
5203	Niva	27284924	\N	\N
5204	Casey	37912561	\N	\N
5205	The Classics Campaign	45441329	\N	\N
5206	Wishnu	30368221	\N	\N
5207	Suzette	18740665	\N	\N
5208	Sunshine	27713981	\N	\N
5209	Wesley	3279826	\N	\N
5210	Lili	20828611	\N	\N
5211	Julia	33334776	\N	\N
5212	Amandeep	20595229	\N	\N
5213	Yagmur	7268567	\N	\N
5214	Juliana	6510566	\N	\N
5215	Carla	38173929	\N	\N
5216	Iris66	2452415	\N	\N
5217	Samantha	28668663	\N	\N
5218	Lauren	32385399	\N	\N
5219	Dawn	32807197	\N	\N
5220	Jeffner77	1542481	\N	\N
5221	Chris	28512655	\N	\N
5222	Rachael	5668762	\N	\N
5223	Emilie	23712265	\N	\N
5224	Karen	42558186	\N	\N
5225	Maude	3468701	\N	\N
5226	Opal	35075763	\N	\N
5227	Maomao	10899772	\N	\N
5228	Lauren	45700575	\N	\N
5229	Neaz	45663400	\N	\N
5230	Moinuby	26137324	\N	\N
5231	Savina	37529093	\N	\N
5232	MaryAnn	5639720	\N	\N
5233	Jancarlo	33002476	\N	\N
5234	Christina	17002614	\N	\N
5235	Ev	25678993	\N	\N
5236	Cynthia	30445706	\N	\N
5237	Vasiliki	34852178	\N	\N
5238	Molly	5658648	\N	\N
5239	Eleni	3770463	\N	\N
5240	Arb	18405085	\N	\N
5241	Sarah	19263243	\N	\N
5242	Rabin	30041627	\N	\N
5243	Anthony	6966283	\N	\N
5244	Natalia	9587319	\N	\N
5245	Joan	44322070	\N	\N
5246	Helen	20767784	\N	\N
5247	Melanie	7663939	\N	\N
5248	Hayley	5528697	\N	\N
5249	Kat	15365284	\N	\N
5250	ioana.	7276601	\N	\N
5251	Maria	33461847	\N	\N
5252	Cera	1533140	\N	\N
5253	Jennifer	24026797	\N	\N
5254		30682208	\N	\N
5255	Mokashfe	38841580	\N	\N
5256	Zizo	44540622	\N	\N
5257	Lauren	20270107	\N	\N
5258	Brian	17431443	\N	\N
5259	Lynette	11349778	\N	\N
5260	Gayle	32044456	\N	\N
5261	Chrissy	44388320	\N	\N
5262	Marie	28702276	\N	\N
5263	Sophia	30015817	\N	\N
5264	Andie	29374023	\N	\N
5265	Aritri	37691296	\N	\N
5266	Nirupama	37344926	\N	\N
5267	Heather	4995684	\N	\N
5268	Anne	5163980	\N	\N
5269	Kate	4031600	\N	\N
5270	Shannen	2271218	\N	\N
5271	Shirley	18649385	\N	\N
5272	Chelsea	13091859	\N	\N
5273	Diwan	42155519	\N	\N
5274	Sarah	26292933	\N	\N
5275	Robert	2778958	\N	\N
5276	Dan	18101035	\N	\N
5277	Adrienne	3652071	\N	\N
5278	marcos	29890375	\N	\N
5279	Aidan	5631986	\N	\N
5280	Erin	26607988	\N	\N
5281	Surfergal7	31387943	\N	\N
5282	Rachel	1433982	\N	\N
5283	Vic	30682863	\N	\N
5284	Hinna	12379561	\N	\N
5285	Christian	24129883	\N	\N
5286	Regina Eiriksdottir	34819049	\N	\N
5287	Mahmoud	21840293	\N	\N
5288	Veronica	17980257	\N	\N
5289	Srinidhi	30588969	\N	\N
5290	Meaghan	30295084	\N	\N
5291	Yingda	5508168	\N	\N
5292	Amy	4967671	\N	\N
5293	Mohsin	31593449	\N	\N
5294	Orbiter	928524	\N	\N
5295	Mango Bookworm	24277496	\N	\N
5296	Noelle	6838159	\N	\N
5297	Sar	11562934	\N	\N
5298	Jamie	30495895	\N	\N
5299	Aroma	5268668	\N	\N
5300	Selin	15181576	\N	\N
5301	John	25079290	\N	\N
5302	Hjpalmer3	41373637	\N	\N
5303	Elora	41158767	\N	\N
5304	Whitley	27508510	\N	\N
5305	Kieran	14906965	\N	\N
5306	Tyka	9764015	\N	\N
5307	Carrie	5428659	\N	\N
5308	Charity	20828513	\N	\N
5309	Mrs	17721560	\N	\N
5310	Anissa	28499275	\N	\N
5311	Megan	14165005	\N	\N
5312	Amanda	5693296	\N	\N
5313	Eva	40211576	\N	\N
5314	Mark	2175620	\N	\N
5315	Margo	30315960	\N	\N
5316	Zabasha	28486732	\N	\N
5317	Eirian	30436705	\N	\N
5318	Jassmin	7606196	\N	\N
5319	Marianna	39810434	\N	\N
5320	Elizabeth	30661630	\N	\N
5321	Christy	3094887	\N	\N
5322	Amber	40564947	\N	\N
5323	Ahauntedsoul	1976233	\N	\N
5324	Blackrose	25114454	\N	\N
5325	Ria	18105466	\N	\N
5326	Olivia	28542440	\N	\N
5327	Muhannad	30428804	\N	\N
5328	Lois	25286090	\N	\N
5329	Coconuttie	5041715	\N	\N
5330	Sarah	40119080	\N	\N
5331	Messa	30443149	\N	\N
5332	Priscilla	31552030	\N	\N
5333	John	19132596	\N	\N
5334	Chy	30156225	\N	\N
5335	Katie	30136255	\N	\N
5336	Liza	30744631	\N	\N
5337	Jefferson	30676702	\N	\N
5338	Ally	39885754	\N	\N
5339	Claire	26118988	\N	\N
5340	Jamstrill	35227589	\N	\N
5341	Allison	28676965	\N	\N
5342	Bookish	32691000	\N	\N
5343	Chris	5378611	\N	\N
5344	Brigham	25858328	\N	\N
5345	Lady J	5680149	\N	\N
5346	Suzana Ahmad Emery	40268931	\N	\N
5347	Julie	20832270	\N	\N
5348	Andrew	2693893	\N	\N
5349	Lucas	31496844	\N	\N
5350	Frederico	31497087	\N	\N
5351	Polyana	32342717	\N	\N
5352	Emma	32342884	\N	\N
5353	Zou	23819011	\N	\N
5354	Eoghan	21277281	\N	\N
5355	Susan	2279490	\N	\N
5356	Amber	29067665	\N	\N
5357	Oscar	5598377	\N	\N
5358	Nadine	30602916	\N	\N
5359	Sierra	5640491	\N	\N
5360	Nauna	25624525	\N	\N
5361	Joel	5692160	\N	\N
5362	Linda	30534530	\N	\N
5363	Louie	30443066	\N	\N
5364	Emelia{Get out. I need to go to my mind palace} {geronimo!}	26837190	\N	\N
5365	Stipe	38500406	\N	\N
5366	Kana	37708705	\N	\N
5367	Ahmed	8707178	\N	\N
5368	Jo	15163791	\N	\N
5369	Lillian	34914038	\N	\N
5370	Kieran	30074104	\N	\N
5371	Glenda	38170858	\N	\N
5372	Msnyka	11694560	\N	\N
5373	Eunice	22920919	\N	\N
5374	Wang	25354681	\N	\N
5375	Caitlin	22161239	\N	\N
5376	Valorie	5544145	\N	\N
5377	Neville	37811804	\N	\N
5378	Harmony	28954875	\N	\N
5379	Elisa	13621200	\N	\N
5380	Amani	30067525	\N	\N
5381	D Ren�e	30203854	\N	\N
5382	Becky	3819209	\N	\N
5383	Barbara	32652964	\N	\N
5384	Cate	991177	\N	\N
5385	Jasper	35884868	\N	\N
5386	Sara	25094851	\N	\N
5387	Gene	36792289	\N	\N
5388	Scott	23974348	\N	\N
5389	Elena	18990022	\N	\N
5390	swwords	18771584	\N	\N
5391	Catscradle	33541332	\N	\N
5392	Kelli	5682741	\N	\N
5393	Kon24	30537132	\N	\N
5394	Fazilet	10328682	\N	\N
5395	Cynthia	5375408	\N	\N
5396	Lacrecia	25252967	\N	\N
5397	Irlana	35447009	\N	\N
5398	Amir	5694627	\N	\N
5399	tpsilopoulos	1293383	\N	\N
5400	Gaurav	27170886	\N	\N
5401	Gaetano	30507567	\N	\N
5402	Ann	35536490	\N	\N
5403	Lori-Anne	16410250	\N	\N
5404	Jeff	5720420	\N	\N
5405	Jatniel	31618379	\N	\N
5406	Kat	5282988	\N	\N
5407	Mark	34737658	\N	\N
5408	La Sheila	148685	\N	\N
5409	Jake	32561129	\N	\N
5410	K_ann	9379932	\N	\N
5411	Misha	21260013	\N	\N
5412	Habib	29818742	\N	\N
5413	Kathryn	35010256	\N	\N
5414	Sara	20686428	\N	\N
5415	Marisa	30205908	\N	\N
5416	Monica	11338557	\N	\N
5417	Rosa	2117623	\N	\N
5418	Chu	30611958	\N	\N
5419	Made	23221763	\N	\N
5420	Deborah	23908978	\N	\N
5421	Andre	29170429	\N	\N
5422	Matthew	16427243	\N	\N
5423	Naaneater	4434657	\N	\N
5424	Donna	33601720	\N	\N
5425	Alina	12606868	\N	\N
5426	Jimmy4reading	5615845	\N	\N
5427	Coco	23949487	\N	\N
5428	Father	23664719	\N	\N
5429	Kate	32555095	\N	\N
5430	Sheetal	19439930	\N	\N
5431	Andrea	30532743	\N	\N
5432	Sarah	31707221	\N	\N
5433	Margy	5744395	\N	\N
5434	Nicole	30482915	\N	\N
5435	Amber	31135207	\N	\N
5436	Ilearnenglish	6610949	\N	\N
5437	Anastasia	30500900	\N	\N
5438	Protagonist	30419701	\N	\N
5439	Mani	7421552	\N	\N
5440	Nina	25402121	\N	\N
5441	Angelo	27867579	\N	\N
5442	Mahima	30039259	\N	\N
5443	Jessica	30457883	\N	\N
5444	Kitty	25933630	\N	\N
5445	Alexis	32245146	\N	\N
5446	Gretchen	5076014	\N	\N
5447	Lisa	11622258	\N	\N
5448	Kyle	4559079	\N	\N
5449	Galacticpizza	31897807	\N	\N
5450	Dipali	31877186	\N	\N
5451	Ana	30402055	\N	\N
5452	Jihan	30368204	\N	\N
5453	Lydia	28607526	\N	\N
5454	Alan	30290715	\N	\N
5455	Music1estate.solve360.com	30386786	\N	\N
5456	Betty	31538061	\N	\N
5457	Sparkle	5695533	\N	\N
5458	Judy	4922964	\N	\N
5459	Corinne	8514634	\N	\N
5460	Lina	30613223	\N	\N
5461	Gaelen	31075947	\N	\N
5462	Alvit0	30439669	\N	\N
5463	Hana	24175743	\N	\N
5464	Caroline	29432185	\N	\N
5465	Stijn	30673127	\N	\N
5466	Angelique	12833791	\N	\N
5467	Ccshop	30420487	\N	\N
5468	Suchitra	20653386	\N	\N
5469	Danny	30563881	\N	\N
5470	Emily	21973003	\N	\N
5471	Mitch	30464070	\N	\N
5472	Amber	11619778	\N	\N
5473	Julie	7104710	\N	\N
5474	J	30274510	\N	\N
5475	Rajiv	12304446	\N	\N
5476	Gabe	16241015	\N	\N
5477	Steph	873896	\N	\N
5478	Gnijoahz	20143059	\N	\N
5479	Beth	5422062	\N	\N
5480	Kimberly	5646473	\N	\N
5481	Chloe	26292759	\N	\N
5482	Ella	28634134	\N	\N
5483	Sara	25840813	\N	\N
5484	Sary	8811644	\N	\N
5485	Kim	5709216	\N	\N
5486	Zoietisha	5705230	\N	\N
5487	Jonathan	17347466	\N	\N
5488	Renata	4884506	\N	\N
5489	Kathy	5753707	\N	\N
5490	Sarah	13327421	\N	\N
5491	Keelan	15702942	\N	\N
5492	Vijay Singh	4228584	\N	\N
5493	Zaid	5670400	\N	\N
5494	Maihassan	2280731	\N	\N
5495	Jordan	5666059	\N	\N
5496	Helen	18900981	\N	\N
5497	Desiree	2054881	\N	\N
5498	Blondey	20578391	\N	\N
5499	Brett	11924248	\N	\N
5500	Kate	5679322	\N	\N
5501	Najoua	5658338	\N	\N
5502	Branyn	5388902	\N	\N
5503	Osman87	7183972	\N	\N
5504	Isabela	6886248	\N	\N
5505	Brandon	5684269	\N	\N
5506	Planetstruck	1157689	\N	\N
5507	Sylvia	5654911	\N	\N
5508	Annabree	4791971	\N	\N
5509	Christine	5687426	\N	\N
5510	Jenn	3997699	\N	\N
5511	Julie	5687544	\N	\N
5512	Mackenzie	7314458	\N	\N
5513	Daniel	5884861	\N	\N
5514	Aira	1879796	\N	\N
5515	Mari	5814395	\N	\N
5516	Caidy	16803699	\N	\N
5517	Lovie	4138634	\N	\N
5518	Samira	5656315	\N	\N
5519	Manuela	5322670	\N	\N
5520	Debra	5687320	\N	\N
5521	Frank	5696642	\N	\N
5522	Ginger	5808231	\N	\N
5523	Kohi	5657343	\N	\N
5524	Christina	5684017	\N	\N
5525	Gabby	11688766	\N	\N
5526	Diana	6332791	\N	\N
5527	Laura	5743523	\N	\N
5528	Scarlett	5089419	\N	\N
5529	Kirsten	5726986	\N	\N
5530	Tiffany	5700406	\N	\N
5531	Dreamergirl	4961397	\N	\N
5532	Mark	3107287	\N	\N
5533	Sarah	5646677	\N	\N
5534	Lovestories	5671252	\N	\N
5535	Julianna	4911794	\N	\N
5536	Zoe	5704016	\N	\N
5537	Wasdax	7255031	\N	\N
5538	Becky	5670909	\N	\N
5539	Bernard	7276068	\N	\N
5540	Lsuttles	4134333	\N	\N
5541	Marina	3022648	\N	\N
5542	Claire	6086853	\N	\N
5543	Eliasson	1734869	\N	\N
5544	Julie	4772930	\N	\N
5545	Fran	5685379	\N	\N
5546	Johnnybgoode	5705858	\N	\N
5547	Tutulibtus	2841755	\N	\N
5548	Josh	2225802	\N	\N
5549	Renee	6425151	\N	\N
5550	Bethany	5548793	\N	\N
5551	Clare	5666461	\N	\N
5552	Rose	5704455	\N	\N
5553	Kandle	5673637	\N	\N
5554	Pearl	5622141	\N	\N
5555	Erika	5697719	\N	\N
5556	Quinnifer	5701712	\N	\N
5557	Delia	5713849	\N	\N
5558	Elizabeth	5685865	\N	\N
5559	Jessica	5663834	\N	\N
5560	Denise	4149119	\N	\N
5561	Martha	5763067	\N	\N
5562	Spring	5670039	\N	\N
5563	Onetd	5679862	\N	\N
5564	Esther	2830817	\N	\N
5565	Kristy	5697137	\N	\N
5566	Manaulia	5708178	\N	\N
5567	Pramod	5699155	\N	\N
5568	Nestor94	5697159	\N	\N
5569	Christine	5598114	\N	\N
5570	Myrtle	5688957	\N	\N
5571	Elisheva	5678240	\N	\N
5572	Carole	5679049	\N	\N
5573	Kim	5678090	\N	\N
5574	Michelle	5677976	\N	\N
5575	Nevada	5665634	\N	\N
5576	Chris	5665143	\N	\N
5577	Francine	5659200	\N	\N
5578	Vera	5656714	\N	\N
5579	noelis	\N	noelis@coolcat.com	123testing
5580	noelis	\N	noelis@cool.com	123testing
5581	noelis	\N	blah@gmail.com	123
5582	noelis	\N	noelis@email.com	12345678
5583	Noelis	\N	noelis@super.com	$2b$14$2tUiT.KJleNNZFzeDPtn1eyIc22BdCW7IHaFRMyj8AFd4DS/Rwxxe
5584	Scott	\N	scott@coolcat.com	$2b$14$J1ak/t.ojFOUGiJNtZ3qFudbm3nkB1/rqQ6MYeSdXBqpiwux3Kuru
5585	Noelis Test	\N	test@testing.com	$2b$14$YjJWgnjrzS8./2MY2n0V/efDIqrBwwXZSfzsQeuZOq/00NUZSYUam
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('users_user_id_seq', 5585, true);


--
-- Name: authors_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- Name: book_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY book_authors
    ADD CONSTRAINT book_authors_pkey PRIMARY KEY (book_author_id);


--
-- Name: book_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY book_genres
    ADD CONSTRAINT book_genres_pkey PRIMARY KEY (book_genre_id);


--
-- Name: books_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);


--
-- Name: genres_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre_id);


--
-- Name: user_books_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY user_books
    ADD CONSTRAINT user_books_pkey PRIMARY KEY (user_book_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: book_authors_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY book_authors
    ADD CONSTRAINT book_authors_author_id_fkey FOREIGN KEY (author_id) REFERENCES authors(author_id);


--
-- Name: book_authors_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY book_authors
    ADD CONSTRAINT book_authors_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(book_id);


--
-- Name: book_genres_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY book_genres
    ADD CONSTRAINT book_genres_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(book_id);


--
-- Name: book_genres_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY book_genres
    ADD CONSTRAINT book_genres_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES genres(genre_id);


--
-- Name: user_books_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY user_books
    ADD CONSTRAINT user_books_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(book_id);


--
-- Name: user_books_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY user_books
    ADD CONSTRAINT user_books_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

