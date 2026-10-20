/*
 * Tabellen erzeugen
 */

CREATE TABLE abteilung (
  abtnr INTEGER  PRIMARY KEY,
  name VARCHAR(20)
);

CREATE TABLE angestellter (
  persnr INTEGER  PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  tel INTEGER ,
  salaer DECIMAL (7,2) NOT NULL,
  chef INTEGER ,
  abtnr INTEGER  NOT NULL,
  wohnort VARCHAR(20),
  eintrittsdatum DATE DEFAULT CURRENT_DATE,
  bonus DECIMAL (7,2) DEFAULT 0
);

CREATE TABLE abteilungsleitung (
  abtnr INTEGER,
  abtchef INTEGER  NOT NULL,
  PRIMARY KEY(abtnr),
  UNIQUE(abtchef)
);

CREATE TABLE projekt (
  projnr INTEGER PRIMARY KEY,
  bezeichnung char(20),
  startzeit DATE,
  dauer INTEGER ,
  aufwand INTEGER ,
  projleiter INTEGER 
);

CREATE TABLE projektzuteilung (
  persnr INTEGER  NOT NULL,
  projnr INTEGER   NOT NULL,
  zeitanteil INTEGER  NOT NULL,
  startzeit DATE,
  dauer INTEGER ,
  PRIMARY KEY (persnr, projnr)
);
