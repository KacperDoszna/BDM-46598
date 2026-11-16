--DDL zadania
--zad 1
CREATE TABLE recenzje (
    id SERIAL PRIMARY KEY,
    produkt_id INTEGER REFERENCES produkty(id),
    klient_id INTEGER REFERENCES klienci(id),
    ocena INTEGER,
    tresc VARCHAR(500)
);

---zad 2
ALTER TABLE recenzje
ADD CONSTRAINT sprawdz_ocene
CHECK (ocena BETWEEN 1 AND 5);

--zad3
ALTER TABLE recenzje
ADD CONSTRAINT unikalna_recenzja
UNIQUE (produkt_id, klient_id);

---zad4
--Kolumna z datą recenzji
ALTER TABLE recenzje
ADD COLUMN data_recenzji DATE DEFAULT CURRENT_DATE;

--Zmiana typu kolumny varchar--> TEXT
ALTER TABLE recenzje
ALTER COLUMN tresc TYPE TEXT;

--Zmiana nazwy kolumny
ALTER TABLE recenzje
RENAME COLUMN tresc TO tresc_recenzji;

--zad5
INSERT INTO recenzje (produkt_id, klient_id, ocena, tresc_recenzji)
VALUES (1, 1, 6, 'Test nieprawidlowej oceny');
--Komunikat Błędu:
--ERROR:  new row for relation "recenzje" violates check constraint "sprawdz_ocene"
--Failing row contains (1, 1, 1, 6, Test nieprawidlowej oceny, 2026-11-16). 

--SQL state: 23514
--Detail: Failing row contains (1, 1, 1, 6, Test nieprawidlowej oceny, 2026-11-16).

INSERT INTO recenzje (produkt_id, klient_id, ocena, tresc_recenzji)
VALUES (1, 1, 5, 'Bardzo dobry produkt');

INSERT INTO recenzje (produkt_id, klient_id, ocena, tresc_recenzji)
VALUES (1, 1, 4, 'Kolejna recenzja produktu');
--Komunikat Błędu:
--ERROR:  duplicate key value violates unique constraint "unikalna_recenzja"
--Key (produkt_id, klient_id)=(1, 1) already exists. 

--SQL state: 23505
--Detail: Key (produkt_id, klient_id)=(1, 1) already exists.

