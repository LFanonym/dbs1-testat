SELECT name, salaer FROM angestellter WHERE salaer > 5000;

SELECT name, salaer FROM angestellter WHERE wohnort = 'Luzern' AND (salaer < 5000 OR salaer > 8000);

SELECT name, tel FROM angestellter WHERE tel IS NOT NULL ORDER BY name ASC;

SELECT name, persnr FROM angestellter WHERE name LIKE 'Widmer%';

SELECT DISTINCT wohnort, name FROM angestellter WHERE abtnr=3 ORDER BY wohnort ASC;

SELECT chef, count(*), avg(salaer) FROM angestellter WHERE chef IS NOT NULL GROUP BY chef
ORDER BY count(*) DESC, avg(salaer);

SELECT name,salaer AS "tiefstes Salaer" FROM angestellter
WHERE salaer = (SELECT min(salaer) FROM angestellter);

SELECT count(*), sum (salaer)
FROM angestellter 
WHERE persnr IN
  (SELECT persnr
   FROM projektzuteilung
   WHERE projnr =
     (SELECT projnr
      FROM projekt
      WHERE bezeichnung='Mars'
      )
  );

SELECT abtnr, avg(salaer), count(*)
FROM angestellter
GROUP BY abtnr
  HAVING avg(salaer) <= ALL
   (SELECT avg(salaer) FROM angestellter
     GROUP BY abtnr);

SELECT   name,
         SUM(zeitanteil)
FROM     (SELECT name,
                 zeitanteil,
                 bezeichnung
          FROM   angestellter
                 INNER JOIN projektzuteilung
                   ON angestellter.persnr = projektzuteilung.persnr
                 INNER JOIN projekt
                   ON projektzuteilung.projnr = projekt.projnr
          WHERE  projekt.bezeichnung LIKE '%Uranus%'
          UNION
          SELECT name,
                 zeitanteil,
                 bezeichnung
          FROM   angestellter
                 INNER JOIN projektzuteilung
                   ON angestellter.persnr = projektzuteilung.persnr
                 INNER JOIN projekt
                   ON projektzuteilung.projnr = projekt.projnr
          WHERE  projekt.bezeichnung LIKE '%Mars%') AS projekte
GROUP BY name
ORDER BY name;

SELECT persnr
FROM   angestellter
WHERE  chef IS NULL
EXCEPT
SELECT persnr
FROM   projektzuteilung
       INNER JOIN projekt
         ON projektzuteilung.projnr = projekt.projnr
WHERE  bezeichnung LIKE '%Uranus%';

-- do not alter contents of the database persistently
BEGIN;

CREATE VIEW gutverdienende AS
SELECT * FROM angestellter
WHERE salaer > 8000;

SELECT * FROM gutverdienende;

UPDATE angestellter SET salaer = salaer*1.2;

SELECT * FROM gutverdienende;

-- forget all changes made since BEGIN
ROLLBACK;
