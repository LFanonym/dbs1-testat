/*
 * Sample data
 * Insert order: person, produkt, zahlungsart, bestellung,
 *               bestellposition, zahlung, review
 */
SET client_encoding TO 'UTF8';

-- ---------------------------------------------------------
-- person: ids 1-5 = employees, ids 6-15 = customers
-- ---------------------------------------------------------
INSERT INTO person (pers_id, name, mitarbeiternummer, pensum, vorname, adresse, postleitzahl, ort) VALUES
                                                                                                       (1,  'Müller',    1001, 1.00, 'Anna',    'Bahnhofstrasse 12',    9470, 'Buchs'),
                                                                                                       (2,  'Meier',     1002, 0.80, 'Thomas',  'Hauptstrasse 5',       9000, 'St. Gallen'),
                                                                                                       (3,  'Schmid',    1003, 0.60, 'Laura',   'Seestrasse 33',        8640, 'Rapperswil'),
                                                                                                       (4,  'Keller',    1004, 0.50, 'Marco',   'Industriestrasse 8',   9200, 'Gossau'),
                                                                                                       (5,  'Weber',     1005, 0.20, 'Sabrina', 'Rosenweg 2',           7000, 'Chur'),
                                                                                                       (6,  'Huber',     NULL, NULL, 'Peter',   'Dorfstrasse 14',       9470, 'Buchs'),
                                                                                                       (7,  'Frei',      NULL, NULL, 'Julia',   'Gartenweg 7',          9500, 'Wil'),
                                                                                                       (8,  'Baumann',   NULL, NULL, 'Daniel',  'Birkenallee 21',       8400, 'Winterthur'),
                                                                                                       (9,  'Fischer',   NULL, NULL, 'Nina',    'Marktgasse 3',         3000, 'Bern'),
                                                                                                       (10, 'Brunner',   NULL, NULL, 'Lukas',   'Letzigraben 90',       8000, 'Zürich'),
                                                                                                       (11, 'Gerber',    NULL, NULL, 'Sophie',  'Steinenvorstadt 18',   4000, 'Basel'),
                                                                                                       (12, 'Steiner',   NULL, NULL, 'Reto',    'Pilatusstrasse 41',    6000, 'Luzern'),
                                                                                                       (13, 'Moser',     NULL, NULL, 'Elena',   'Hafenstrasse 6',       9400, 'Rorschach'),
                                                                                                       (14, 'Zimmermann',NULL, NULL, 'Florian', 'Kirchgasse 9',         9200, 'Gossau'),
                                                                                                       (15, 'Hofmann',   NULL, NULL, 'Mia',     'Talstrasse 27',        7000, 'Chur');

-- ---------------------------------------------------------
-- produkt
-- ---------------------------------------------------------
INSERT INTO produkt (produkt_id, bezeichnung, preis, gewicht) VALUES
                                                                  (1,  'Wireless Mouse',            29.90,  0.085),
                                                                  (2,  'Mechanical Keyboard',      119.00,  0.950),
                                                                  (3,  'USB-C Hub 7-in-1',          49.90,  0.120),
                                                                  (4,  '27" Monitor 4K',           289.00,  5.800),
                                                                  (5,  'Laptop Stand Aluminium',    39.50,  0.780),
                                                                  (6,  'Webcam Full HD',            69.90,  0.150),
                                                                  (7,  'Headset mit Mikrofon',      89.00,  0.320),
                                                                  (8,  'Externe SSD 1 TB',         109.90,  0.060),
                                                                  (9,  'LED Schreibtischlampe',     34.90,  0.900),
                                                                  (10, 'Ergonomischer Bürostuhl',  349.00, 14.500),
                                                                  (11, 'Mousepad XL',               19.90,  0.350),
                                                                  (12, 'HDMI-Kabel 2 m',            12.90,  0.080);

-- ---------------------------------------------------------
-- zahlungsart
-- ---------------------------------------------------------
INSERT INTO zahlungsart (zahlungsart_id, bezeichnung) VALUES
                                                          (1,  'Kreditkarte'),
                                                          (2,  'Debitkarte'),
                                                          (3,  'TWINT'),
                                                          (4,  'PayPal'),
                                                          (5,  'Rechnung'),
                                                          (6,  'Vorkasse'),
                                                          (7,  'Nachnahme'),
                                                          (8,  'Apple Pay'),
                                                          (9,  'Google Pay'),
                                                          (10, 'Bargeld');

-- ---------------------------------------------------------
-- bestellung (kunde_id = 6-15, mitarbeiter_id = 1-5)
-- ---------------------------------------------------------
INSERT INTO bestellung (bestellung_id, bestelldatum, kunde_id, mitarbeiter_id) VALUES
                                                                                   (1,  '2026-09-01 09:15:00',  6, 1),
                                                                                   (2,  '2026-09-03 14:30:00',  7, 2),
                                                                                   (3,  '2026-09-07 11:05:00',  8, 1),
                                                                                   (4,  '2026-09-10 16:45:00',  9, 3),
                                                                                   (5,  '2026-09-14 10:20:00', 10, 4),
                                                                                   (6,  '2026-09-18 13:00:00', 11, 2),
                                                                                   (7,  '2026-09-22 15:40:00', 12, 5),
                                                                                   (8,  '2026-09-25 08:55:00', 13, 1),
                                                                                   (9,  '2026-10-02 12:10:00', 14, 3),
                                                                                   (10, '2026-10-08 17:25:00', 15, 4),
                                                                                   (11, '2026-10-15 09:50:00',  6, 2),
                                                                                   (12, '2026-10-21 14:15:00',  9, 1);

-- ---------------------------------------------------------
-- bestellposition (preis = Produktpreis zum Bestellzeitpunkt)
-- ---------------------------------------------------------
INSERT INTO bestellposition (bestellposition_id, bestellung_id, produkt_id, menge, preis) VALUES
                                                                                                                (1,  1,  1, 1,  29.90),
                                                                                                                (2,  1, 11, 1,  19.90),
                                                                                                                (3,  2,  2, 1, 119.00),
                                                                                                                (4,  2, 12, 2,  12.90),
                                                                                                                (5,  3,  4, 2, 289.00),
                                                                                                                (6,  4,  7, 1,  89.00),
                                                                                                                (7,  4,  6, 1,  69.90),
                                                                                                                (8,  5,  8, 2, 109.90),
                                                                                                                (9,  6, 10, 1, 349.00),
                                                                                                                (10, 6,  9, 1,  34.90),
                                                                                                                (11, 7,  3, 1,  49.90),
                                                                                                                (12, 7,  5, 1,  39.50),
                                                                                                                (13, 8,  1, 3,  29.90),
                                                                                                                (14, 9,  2, 1, 119.00),
                                                                                                                (15, 9, 11, 2,  19.90),
                                                                                                                (16, 9,  1, 1,  29.90),
                                                                                                                (17, 10,12, 4,  12.90),
                                                                                                                (18, 11, 4, 1, 289.00),
                                                                                                                (19, 11, 3, 1,  49.90),
                                                                                                                (20, 11,12, 1,  12.90),
                                                                                                                (21, 12, 6, 1,  69.90),
                                                                                                                (22, 12, 7, 1,  89.00),
                                                                                                                (23, 12, 8, 1, 109.90);

-- ---------------------------------------------------------
-- zahlung (one per order, betrag = sum of the order's positions)
-- ---------------------------------------------------------
INSERT INTO zahlung (zahlung_id, bestellung_id, zahlungsart_id, datum, betrag, status) VALUES
                                                                                           (1,  1,  3, '2026-09-01 09:20:00',  49.80, 'bezahlt'),
                                                                                           (2,  2,  1, '2026-09-03 14:35:00', 144.80, 'bezahlt'),
                                                                                           (3,  3,  5, '2026-09-20 10:00:00', 578.00, 'bezahlt'),
                                                                                           (4,  4,  4, '2026-09-10 16:50:00', 158.90, 'bezahlt'),
                                                                                           (5,  5,  2, '2026-09-14 10:25:00', 219.80, 'bezahlt'),
                                                                                           (6,  6,  6, '2026-09-18 13:05:00', 383.90, 'bezahlt'),
                                                                                           (7,  7,  8, '2026-09-22 15:45:00',  89.40, 'bezahlt'),
                                                                                           (8,  8,  3, '2026-09-25 09:00:00',  89.70, 'storniert'),
                                                                                           (9,  9,  9, '2026-10-02 12:15:00', 188.70, 'bezahlt'),
                                                                                           (10, 10, 7, '2026-10-12 11:00:00',  51.60, 'bezahlt'),
                                                                                           (11, 11, 5, '2026-10-15 09:55:00', 351.80, 'ausstehend'),
                                                                                           (12, 12, 1, '2026-10-21 14:20:00', 268.80, 'ausstehend');

-- ---------------------------------------------------------
-- review (written by either a customer or an employee)
-- ---------------------------------------------------------
INSERT INTO review (review_id, produkt_id, kunde_id, mitarbeiter_id, titel, text, erstelldatum) VALUES
                                                                                                    (1,  1,  6,   NULL, 'Sehr präzise',         'Die Maus liegt gut in der Hand und der Akku hält ewig.',                     '2026-09-10'),
                                                                                                    (2,  2,  7,   NULL, 'Tolles Tippgefühl',    'Die Tasten haben einen angenehmen Druckpunkt, etwas laut im Grossraumbüro.', '2026-09-15'),
                                                                                                    (3,  4,  8,   NULL, 'Gestochen scharf',     'Farben und Schärfe sind top. Der Standfuss könnte stabiler sein.',           '2026-09-20'),
                                                                                                    (4,  7,  9,   NULL, 'Gute Sprachqualität',  'Für Videocalls perfekt, nach mehreren Stunden drückt der Bügel leicht.',     '2026-09-25'),
                                                                                                    (5,  8,  10,  NULL, 'Blitzschnell',         'Datenübertragung ist sehr schnell, das Gehäuse bleibt auch kühl.',           '2026-09-28'),
                                                                                                    (6,  10, 11,  NULL, 'Rücken sagt danke',    'Nach einer Woche merke ich schon den Unterschied. Aufbau dauert 30 Minuten.','2026-10-01'),
                                                                                                    (7,  3,  12,  NULL, 'Praktischer Hub',      'Alle Anschlüsse funktionieren, wird bei längerer Nutzung etwas warm.',       '2026-10-05'),
                                                                                                    (8,  9,  NULL, 2,   'Empfehlung vom Team',  'Gleichmässiges Licht, dimmbar und stromsparend. Verkauft sich sehr gut.',    '2026-10-06'),
                                                                                                    (9,  6,  NULL, 3,   'Solide Webcam',        'Gutes Bild bei normalem Licht, Autofokus manchmal etwas träge.',             '2026-10-09'),
                                                                                                    (10, 12, 15,  NULL, 'Macht, was es soll',   'Kein Bildflackern, saubere Verarbeitung.',                                   '2026-10-14'),
                                                                                                    (11, 11, 14,  NULL, 'Gross und rutschfest', 'Platz für Maus und Tastatur, die Oberfläche ist angenehm glatt.',            '2026-10-18'),
                                                                                                    (12, 5,  NULL, 1,   'Stabil und leicht',    'Der Laptopständer wackelt nicht und lässt sich flach zusammenklappen.',      '2026-10-22');