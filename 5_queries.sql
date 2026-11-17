---------------
-- AUFGABE 1 --
---------------

-- d) Zahlungen welche storniert oder ausstehend sind (zuerst ausstehend dann stornierte) in sich Älteste zuerst
SELECT z.bestellung_id, z.datum, z.betrag, z.status
FROM zahlung z
WHERE z.status IN ('storniert', 'ausstehend')
ORDER BY status, datum
;

-- e) Find reviews of all persons and anonymus reviews
SELECT p.pers_id, p.vorname, p.name, r.review_id, r.produkt_id, r.titel, r.erstelldatum
FROM review r
FULL OUTER JOIN person p on p.pers_id = r.person_id
ORDER BY p.pers_id
;

-- f) Bestellungen der letzen 40 Tage
SELECT b.*
FROM bestellung b
WHERE b.bestelldatum >= NOW() - INTERVAL '40 days'
;

---------------
-- AUFGABE 2 --
---------------
-- c) Show count of persons living (per PLZ/Ort)
SELECT p.postleitzahl, p.ort, count(p.postleitzahl) as personenzahl
FROM person p
GROUP BY p.postleitzahl, p.ort
ORDER BY personenzahl DESC, p.postleitzahl
;

-- d) Anteile der Zahlungsarten (nur bezahlte gewertet)
SELECT
    za.bezeichnung as bezeichnung,
    SUM(z.betrag) as umsatz,
    round(100 * SUM(z.betrag) / SUM(SUM(z.betrag)) OVER (), 2) AS "anteil [%]"
FROM zahlungsart za
JOIN zahlung z
    on za.zahlungsart_id = z.zahlungsart_id
    and z.status = 'bezahlt'
GROUP BY za.zahlungsart_id, za.bezeichnung
ORDER BY 3 DESC
;

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

-- Alle reviews von mitarbeitern mit name, datum, bezeichnung, titel und text
SELECT pe.vorname, pe.name, r.erstelldatum, pr.bezeichnung, r.titel, r.text
FROM review r
JOIN person pe on r.person_id = pe.pers_id
JOIN produkt pr on r.produkt_id = pr.produkt_id
WHERE pe.mitarbeiternummer IS NOT NULL
