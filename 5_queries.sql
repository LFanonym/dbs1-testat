-- List top ten priced bestellungen
SELECT b.bestellung_id, SUM(bp.menge * bp.preis) as preis
FROM bestellung b
JOIN bestellposition bp ON b.bestellung_id = bp.bestellung_id
GROUP BY b.bestellung_id
ORDER BY preis DESC
LIMIT 10;


-- show ordered items per bestellung
SELECT bp.bestellung_id, bp.menge, bp.preis, p.bezeichnung
FROM bestellposition bp
JOIN produkt p on bp.produkt_id = p.produkt_id
ORDER BY bp.bestellung_id;

-- b) Alle reviews von mitarbeitern mit name, datum, bezeichnung, titel und text
SELECT pe.vorname, pe.name, r.erstelldatum, pr.bezeichnung, r.titel, r.text
FROM review r
JOIN person pe on r.person_id = pe.pers_id
JOIN produkt pr on r.produkt_id = pr.produkt_id
WHERE pe.mitarbeiternummer IS NOT NULL;

-- Aufgabe 1 Testat 3
-- a) Sucht alle Orte wo Mitarbeiterwohnen heraus
SELECT DISTINCT ort
FROM person pe
WHERE pe.mitarbeiternummer IS NOT NULL;

-- c) Derjenige Angestellte (Name) mit dem kleinsten Pensum: Hiebei ist die Subquery unkorreliert
SELECT pe.vorname, pe.name, pe.pensum
FROM person pe
WHERE pe.pensum = (SELECT MIN (pensum)
    FROM person);

-- Aufgabe 2 Testat 3
-- a)
SELECT *
FROM (SELECT MAX (pensum)FROM person) AS sub;

WITH task23table AS (SELECT MAX (pensum)FROM person)
SELECT * FROM task23table;

-- Aufgabe 3 Testat 3
DROP VIEW IF EXISTS ersteView;
-- a)
CREATE VIEW ersteView (Mitarbeiternummer,Name,Ort)AS
    SELECT pe.mitarbeiternummer,pe.name,pe.ort from person pe;
-- b)
SELECT DISTINCT ort
FROM ersteView ve
WHERE ve.mitarbeiternummer IS NOT NULL;

