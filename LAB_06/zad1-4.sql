--zad1
UPDATE produkty
SET ilosc_magazyn = ilosc_magazyn + 50
WHERE kategoria_id = 3;

--UPDATE 13
--Query returned successfully in 45 msec.

--zad2
DELETE FROM pozycje_zamowien WHERE ilosc = 1
AND zamowienie_id IN (
    SELECT id FROM zamowienia
    WHERE data_zamowienia < CURRENT_DATE - INTERVAL '180 days'
);

--DELETE 209
--Query returned successfully in 52 msec.

--zad3
--Sprawdzenie iliosci zamowien
SELECT MAX(id) FROM zamowienia;

BEGIN;
INSERT INTO zamowienia (klient_id, pracownik_id)
VALUES (1, 1);
INSERT INTO pozycje_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa)
VALUES (1001, 1, 2, 199.99);
INSERT INTO pozycje_zamowien (zamowienie_id, produkt_id, ilosc, cena_jednostkowa)
VALUES (1001, 2, 1, 299.99);
COMMIT;

--COMMIT
--Query returned successfully in 69 msec.

--OPIS:
--Transakcje  zabezpiecza bazę danych przed błędami. 
--Dzięki niej operacje są wykonywane w spójny sposób, 
--a baza nie pozwala na tworzenie nieprawidłowych powiązań między danymi.