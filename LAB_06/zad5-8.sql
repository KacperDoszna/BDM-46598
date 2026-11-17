--zad5
--ON DELETE CASCADE
CREATE TABLE dzialy (
    id SERIAL PRIMARY KEY,
    nazwa VARCHAR(100)
);

CREATE TABLE pracownicy (
    id SERIAL PRIMARY KEY,
    imie VARCHAR(100),
    dzial_id INTEGER REFERENCES dzialy(id)
    ON DELETE CASCADE
);

INSERT INTO dzialy (id, nazwa) VALUES (1, 'IT');
INSERT INTO pracownicy (imie, dzial_id) VALUES ('Kacper', 1), ('Daria', 1);

DELETE FROM dzialy WHERE id = 1;


--ON DELETE SET NULL
CREATE TABLE dzialy2 (
    id SERIAL PRIMARY KEY,
    nazwa VARCHAR(100)
);

CREATE TABLE pracownicy2    (
    id SERIAL PRIMARY KEY,
    imie VARCHAR(100),
    dzial_id INTEGER REFERENCES dzialy2(id)
    ON DELETE SET NULL
);

INSERT INTO dzialy2 (id, nazwa) VALUES (1, 'IT');
INSERT INTO pracownicy2 (imie, dzial_id) VALUES ('Kacper', 1), ('Daria', 1);

DELETE FROM dzialy2 WHERE id = 1;

--Wniosek:
--Po usunięciu działu pracownicy również zostali usunięci.(ON DELETE CASCADE) 
--Natomiast przy zastosowaniu  ON DELETE SET NULL po usunięciu działu pracownicy zostali zachowani, ale nie były już do niego przypisani.

--zad6
UPDATE zamowienia SET status = 'w realizacji' WHERE status = 'nowe' 
AND data_zamowienia < CURRENT_DATE - INTERVAL '7 days';

--zad7
DELETE FROM pozycje_zamowien WHERE produkt_id IN (
    SELECT id FROM produkty
    WHERE ilosc_magazyn < 5
);

--Moim zdaniem nie jest to bezpieczne działanie, ponieważ stan magazynu może się zmieniać i nie oznacza, że produkt nie był wcześniej sprzedawany. 
--Usuwając takie pozycje, możemy stracić informacje o wcześniejszych zamówieniach i sprzedaży.

--zad8
--a)
SELECT MAX(id) FROM zamowienia;

BEGIN;
INSERT INTO zamowienia (klient_id, pracownik_id) VALUES (1, 1);
INSERT INTO pozycje_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa) VALUES (1001, 1, 2, 199.99), (1001, 2, 1, 299.99);
COMMIT;

--b)
BEGIN;
INSERT INTO zamowienia (klient_id, pracownik_id) VALUES (1, 1);
INSERT INTO pozycje_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa) VALUES (1002, 1, 2, 199.99), (1002, -111, 1, 299.99);

--ERROR:  insert or update on table "pozycje_zamowien" violates foreign key constraint "pozycje_zamowien_produkt_id_fkey"
--Key (produkt_id)=(-111) is not present in table "produkty". 
--SQL state: 23503
--Detail: Key (produkt_id)=(-111) is not present in table "produkty".

ROLLBACK;
--ROLLBACK
--Query returned successfully in 64 msec.

--W pierwszym przypadku zamówienie i jego dwie pozycje zostały zapisane w bazie dzięki COMMIT.
--W drugim przypadku wystąpił błąd, ponieważ podany produkt nie istniał, po użyciu ROLLBACK wszystkie zmiany zostały cofnięte. 
