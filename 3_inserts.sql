
/*
 * Testdaten einfüllen
 */
-- TABLE  abteilung

INSERT INTO abteilung VALUES
(1, 'Verkauf'),
(2, 'Marketing'),
(3, 'Entwicklung'),
(4, 'Finanzen'),
(5, 'QS');
 
-- TABLE  angestellter

INSERT INTO angestellter (persnr, name, tel, salaer, chef, abtnr, wohnort) VALUES
(1001, 'Marxer, Markus', 234, 10580.00, NULL, 1, 'Luzern'),
(1002, 'Widmer, Anna', 301, 12010.00, NULL, 2, 'Adligenswil'),
(1010, 'Steiner, Hans', 409, 10867.00, NULL, 3, 'Hitzkirch'),
(1019, 'Affolter, Vreni', 233, 4123.00, 1001, 1, 'Zürich'),
(1100, 'Widmer, Karl', 450, 7500.00, 1010, 3, 'Emmen'),
(1123, 'Meier, Franz', 240, 9765.00, 1001, 1, 'Zug'),
(2098, 'Zürcher, Hedi', 249, 10019.00, 1001, 1, 'Horw'),
(2109, 'Heiniger, Urs', 345, 4098.00, 1002, 2, 'Luzern'),
(2298, 'Pauli, Monika', 478, 5089.00, 1010, 3, 'Luzern'),
(2345, 'Becker, Fritz', 310, 6346.00, 1002, 2, 'Hochdorf'),
(2567, 'Ammann, Fritz', 467, 7890.00, 1010, 3, 'Baar'),
(2601, 'Wehrli, Anton', NULL, 5980.00, 2567, 3, 'Luzern'),
(2666, 'Beeler, Hans', NULL, 3780.00, 2567, 3, 'Rotkreuz'),
(2701, 'Graber, Berta', 451, 4590.00, 1100, 3, 'Sursee'),
(3000, 'Aarburg, Werner', 400, 9000.00, 1100, 4, 'Abtwil'),
(3019, 'Kern, Veronika', 401, 4800.00, 3000, 3, 'Sins'),
(3333, 'Wernli, Peter', 112, 8978.00, 1001, 1, 'Luzern'),
(3338, 'Kramer, Luise', NULL, 4000.00, 3000, 3, 'Luzern'),
(4000, 'Rey, Herbert', 480, 15000.00, NULL, 4, 'Adligenswil'),
(4010, 'Danuser, Vreni', 481, 5100.00, 4000, 4, 'Luzern'),
(2000, 'Schnell, Marie', 601, 5100.00, 4000, 4, 'Luzern'),
(2010, 'Gschwind, Fritz', 602, 5900.00, 4000, 4, 'Luzern'),
(2020, 'Test, Hans', 602, 5900.00, 4000, 4, 'Luzern');
 
-- TABLE  abteilungsleitung (abtchef, abtnr)

INSERT INTO abteilungsleitung VALUES
(1, 1001),
(2, 1002),
(3, 1010),
(4, 3000);
 
-- TABLE  projekt 

INSERT INTO projekt VALUES
(25, 'Saturn              ', to_date('1994-01-01', 'YYYY-MM-DD'), 30, 120, 1001),
(26, 'Mars                ', to_date('1992-12-01', 'YYYY-MM-DD'), 500, 1000, 1100),
(27, 'Uranus              ', NULL, NULL, NULL, 1100),
(30, 'Jupiter             ', to_date('1993-02-12', 'YYYY-MM-DD'), 10, 50, 1001);
 
-- TABLE  projektzuteilung (persnr,projnr,zeitanteil, startzeit, dauer)

INSERT INTO projektzuteilung VALUES
(1001, 26, 30, to_date('1992-12-01', 'YYYY-MM-DD'), 250),
(1001, 27, 30, NULL, NULL),
(1001, 30, 10, to_date('1993-02-12', 'YYYY-MM-DD'), 2),
(1019, 25, 90, to_date('1994-01-01', 'YYYY-MM-DD'), 15),
(1100, 26, 50, to_date('1992-12-01', 'YYYY-MM-DD'), 390),
(1123, 25, 50, to_date('1994-01-01', 'YYYY-MM-DD'), 30),
(1123, 30, 90, NULL, NULL),
(2098, 26, 20, NULL, 500),
(2098, 27, 31, NULL, NULL),
(2298, 26, 89, to_date('1992-12-05', 'YYYY-MM-DD'), 500),
(2601, 25, 30, to_date('1994-11-01', 'YYYY-MM-DD'), 8),
(2601, 26, 40, to_date('1992-12-05', 'YYYY-MM-DD'), 500),
(2601, 30, 40, to_date('1993-02-12', 'YYYY-MM-DD'), NULL),
(2701, 26, 90, to_date('1993-01-27', 'YYYY-MM-DD'), 330);
