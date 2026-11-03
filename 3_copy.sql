-- Beispieldaten
SET client_encoding TO 'UTF8';

-- TABLE  person  (1-10 Kunden, 11-20 Mitarbeiter)
COPY person (pers_id, name, vorname, adresse, postleitzahl, ort) FROM stdin;
1	Müller	Anna	Hauptstrasse 12	8001	Zürich
2	Meier	Peter	Bahnhofweg 5	9000	St. Gallen
3	Schmid	Laura	Lindenallee 23	3011	Bern
4	Keller	Thomas	Seestrasse 78	6003	Luzern
5	Weber	Sarah	Dorfplatz 3	4051	Basel
6	Huber	Michael	Rosenweg 14	8400	Winterthur
7	Schneider	Julia	Gartenstrasse 9	7000	Chur
8	Fischer	Daniel	Kirchgasse 21	9500	Wil
9	Brunner	Nina	Birkenweg 6	5000	Aarau
10	Baumann	Lukas	Schulstrasse 17	8200	Schaffhausen
11	Frei	Sandra	Mühlegasse 4	8001	Zürich
12	Gerber	Marco	Alpenstrasse 31	3011	Bern
13	Steiner	Petra	Industriestrasse 8	9000	St. Gallen
14	Moser	Andreas	Talstrasse 52	6003	Luzern
15	Roth	Claudia	Waldweg 11	4051	Basel
16	Graf	Stefan	Ringstrasse 40	8400	Winterthur
17	Zimmermann	Monika	Sonnenhof 2	7000	Chur
18	Hofmann	Reto	Bergstrasse 19	9500	Wil
19	Lehmann	Eva	Marktgasse 27	5000	Aarau
20	Wyss	Beat	Gerberweg 33	8200	Schaffhausen
\.

-- TABLE  kunde
COPY kunde (kunde_id) FROM stdin;
1
2
3
4
5
6
7
8
9
10
\.

-- TABLE  mitarbeiter
COPY mitarbeiter (mitarbeiter_id, mitarbeiternummer, pensum) FROM stdin;
11	1001	1.00
12	1002	0.80
13	1003	0.60
14	1004	1.00
15	1005	0.50
16	1006	0.90
17	1007	0.40
18	1008	1.00
19	1009	0.70
20	1010	0.20
\.

-- TABLE  produkt
COPY produkt (produkt_id, bezeichnung, preis, gewicht) FROM stdin;
1	Laptop Pro 15	1299.00	2.100
2	Kabellose Maus	29.90	0.085
3	Mechanische Tastatur	89.50	0.950
4	USB-C Dockingstation	119.00	0.420
5	Monitor 27 Zoll	349.00	5.800
6	Webcam Full HD	59.90	0.150
7	Bluetooth-Kopfhörer	149.00	0.280
8	Externe SSD 1 TB	99.00	0.060
9	Bürostuhl Ergonomic	289.00	14.500
10	Schreibtischlampe LED	45.50	0.900
11	Laptoprucksack	69.90	0.750
12	Powerbank 20000 mAh	39.90	0.440
\.

-- TABLE  zahlungsart
COPY zahlungsart (zahlungsart_id, bezeichnung) FROM stdin;
1	Kreditkarte
2	Rechnung
3	PayPal
4	Vorkasse
5	Lastschrift
6	Debitkarte
7	Twint
8	Apple Pay
9	Google Pay
10	Banküberweisung
\.

-- TABLE  bestellung
COPY bestellung (bestellung_id, bestelldatum, kunde_id, mitarbeiter_id) FROM stdin;
1	2026-01-12 09:15:00	1	11
2	2026-01-20 14:30:00	2	12
3	2026-02-03 11:05:00	3	13
4	2026-02-14 16:45:00	4	14
5	2026-03-01 10:20:00	5	15
6	2026-03-18 13:10:00	6	16
7	2026-04-02 08:55:00	7	17
8	2026-04-22 15:40:00	8	18
9	2026-05-09 12:00:00	9	19
10	2026-05-27 17:25:00	10	20
11	2026-06-10 09:35:00	1	12
12	2026-06-25 14:50:00	3	11
\.

-- TABLE  bestellposition
COPY bestellposition (bestellposition_id, bestellung_id, produkt_id, menge, preis, bestellzeitpunkt) FROM stdin;
1	1	1	1	1299.00	2026-01-12 09:15:00
2	1	2	2	29.90	2026-01-12 09:15:00
3	2	3	1	89.50	2026-01-20 14:30:00
4	2	6	1	59.90	2026-01-20 14:30:00
5	3	5	2	349.00	2026-02-03 11:05:00
6	3	4	1	119.00	2026-02-03 11:05:00
7	4	7	1	149.00	2026-02-14 16:45:00
8	5	9	1	289.00	2026-03-01 10:20:00
9	5	10	2	45.50	2026-03-01 10:20:00
10	6	8	3	99.00	2026-03-18 13:10:00
11	6	12	1	39.90	2026-03-18 13:10:00
12	7	11	1	69.90	2026-04-02 08:55:00
13	7	2	1	29.90	2026-04-02 08:55:00
14	8	1	1	1299.00	2026-04-22 15:40:00
15	8	4	1	119.00	2026-04-22 15:40:00
16	8	5	1	349.00	2026-04-22 15:40:00
17	9	3	2	89.50	2026-05-09 12:00:00
18	9	6	2	59.90	2026-05-09 12:00:00
19	10	7	1	149.00	2026-05-27 17:25:00
20	10	12	2	39.90	2026-05-27 17:25:00
21	11	10	1	45.50	2026-06-10 09:35:00
22	11	8	1	99.00	2026-06-10 09:35:00
23	12	9	2	289.00	2026-06-25 14:50:00
24	12	2	1	29.90	2026-06-25 14:50:00
\.

-- TABLE  zahlung
COPY zahlung (zahlung_id, bestellung_id, zahlungsart_id, datum, betrag, status) FROM stdin;
1	1	1	2026-01-12 09:20:00	1358.80	bezahlt
2	2	2	2026-01-30 10:00:00	149.40	bezahlt
3	3	3	2026-02-03 11:10:00	817.00	bezahlt
4	4	4	2026-02-14 17:00:00	149.00	storniert
5	5	5	2026-03-02 08:00:00	380.00	bezahlt
6	6	6	2026-03-18 13:15:00	336.90	bezahlt
7	7	7	2026-04-02 09:00:00	99.80	bezahlt
8	8	8	2026-04-22 15:45:00	1767.00	bezahlt
9	9	9	2026-05-09 12:05:00	298.80	ausstehend
10	10	10	2026-05-28 09:00:00	228.80	bezahlt
11	11	2	2026-06-24 10:00:00	144.50	ausstehend
12	12	1	2026-06-25 14:55:00	607.90	ausstehend
\.

-- TABLE  review  (entweder kunde_id oder mitarbeiter_id gesetzt, sonst \N)
COPY review (review_id, produkt_id, kunde_id, mitarbeiter_id, titel, text, erstelldatum) FROM stdin;
1	1	1	\N	Sehr schnell	Der Laptop ist leistungsstark und der Akku hält einen ganzen Arbeitstag durch.	2026-01-25
2	2	\N	11	Solide Maus	Liegt gut in der Hand und die Verbindung ist stabil. Für den Preis top.	2026-02-02
3	3	2	\N	Tolles Tippgefühl	Die Tasten haben einen angenehmen Druckpunkt, etwas laut im Büro.	2026-02-05
4	5	3	\N	Scharfes Bild	Farben und Schärfe sind sehr gut, der Standfuss ist allerdings wackelig.	2026-02-18
5	7	4	\N	Guter Klang	Starker Bass und gute Geräuschunterdrückung, sitzt aber etwas eng.	2026-03-01
6	9	5	\N	Rückenschonend	Nach einer Woche merke ich den Unterschied, der Aufbau dauerte etwa 30 Minuten.	2026-03-20
7	8	\N	16	Schnell und kompakt	Dateien werden in Sekunden kopiert, ideal für Backups.	2026-04-01
8	4	8	\N	Praktisch	Alle Anschlüsse an einem Kabel, wird im Dauerbetrieb aber warm.	2026-05-03
9	6	9	\N	Okay für Meetings	Bildqualität ist ordentlich bei gutem Licht, das Mikrofon ist durchschnittlich.	2026-05-20
10	12	10	\N	Hält lange	Lädt mein Handy mehr als viermal komplett auf.	2026-06-05
11	10	1	\N	Schönes Licht	Blendfrei und stufenlos dimmbar, der Arm ist gut verstellbar.	2026-06-18
12	11	\N	17	Viel Platz	Passt ein 15-Zoll-Laptop plus Zubehör, die Polsterung ist gut.	2026-06-22
\.

