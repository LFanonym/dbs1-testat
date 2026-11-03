/*
 * Tabellen erzeugen
 */

CREATE TABLE person (
    pers_id INTEGER  PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    vorname VARCHAR(50) NOT NULL,
    adresse VARCHAR(100) NOT NULL,
    postleitzahl INTEGER NOT NULL,
    ort VARCHAR(40) NOT NULL
);

CREATE TABLE kunde (
    kunde_id INTEGER  PRIMARY KEY,
    CONSTRAINT fk_kunde_person
       FOREIGN KEY (kunde_id) REFERENCES person (pers_id)
);

CREATE TABLE mitarbeiter (
    mitarbeiter_id INTEGER  PRIMARY KEY,
    mitarbeiternummer INTEGER NOT NULL UNIQUE,
    pensum            DECIMAL(3,2) NOT NULL CHECK (pensum BETWEEN 0.2 AND 1),
    CONSTRAINT fk_mitarbeiter_person
        FOREIGN KEY (mitarbeiter_id) REFERENCES person (pers_id)
);

CREATE TABLE produkt (
    produkt_id INTEGER PRIMARY KEY,
    bezeichnung VARCHAR(200) NOT NULL ,
    preis DECIMAL(10,2) NOT NULL CHECK (preis >= 0),
    gewicht DECIMAL(8,3)  NOT NULL CHECK (gewicht > 0)
);

CREATE TABLE bestellung (
    bestellung_id INTEGER PRIMARY KEY,
    bestelldatum TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    kunde_id INTEGER  NOT NULL ,
    mitarbeiter_id INTEGER  NOT NULL,
    CONSTRAINT fk_bestellung_kunde
        FOREIGN KEY (kunde_id) REFERENCES kunde (kunde_id),
    CONSTRAINT fk_bestellung_mitarbeiter
        FOREIGN KEY (mitarbeiter_id) REFERENCES mitarbeiter (mitarbeiter_id)
);

CREATE Table bestellposition (
    bestellposition_id INTEGER PRIMARY KEY,
    bestellung_id INTEGER NOT NULL,
    produkt_id INTEGER NOT NULL ,
    menge INTEGER NOT NULL CHECK ( menge > 0),
    preis DECIMAL(10,2) NOT NULL  CHECK ( preis >=0 ),
    bestellzeitpunkt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_bestellposition_bestellung
        FOREIGN KEY (bestellung_id) REFERENCES bestellung (bestellung_id),
    CONSTRAINT fk_bestellposition_produkt
        FOREIGN KEY (produkt_id) REFERENCES produkt (produkt_id)
);

CREATE TABLE zahlungsart (
    zahlungsart_id INTEGER PRIMARY KEY,
    bezeichnung VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE zahlung (
    zahlung_id INTEGER PRIMARY KEY,
    bestellung_id INTEGER NOT NULL UNIQUE ,
    zahlungsart_id INTEGER NOT NULL ,
    datum TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    betrag DECIMAL(10,2) NOT NULL,
    status VARCHAR(20)   NOT NULL
        CHECK (status IN ('ausstehend', 'bezahlt', 'storniert')),
    CONSTRAINT fk_zahlung_bestellung
        FOREIGN KEY (bestellung_id)  REFERENCES bestellung (bestellung_id),
    CONSTRAINT fk_zahlung_zahlungsart
        FOREIGN KEY (zahlungsart_id) REFERENCES zahlungsart (zahlungsart_id)
);

CREATE TABLE review(
    review_id INTEGER PRIMARY KEY,
    produkt_id INTEGER NOT NULL,
    kunde_id INTEGER,
    mitarbeiter_id INTEGER,
    titel VARCHAR(200) NOT NULL ,
    text VARCHAR(400) NOT NULL ,
    erstelldatum DATE DEFAULT CURRENT_DATE,
    CONSTRAINT fk_produkt
        FOREIGN KEY (produkt_id) REFERENCES produkt (produkt_id),
    CONSTRAINT fk_kunde
        FOREIGN KEY (kunde_id) REFERENCES kunde (kunde_id),
    CONSTRAINT fk_mitarbeiter
        FOREIGN KEY (mitarbeiter_id) REFERENCES mitarbeiter (mitarbeiter_id)
);
