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
