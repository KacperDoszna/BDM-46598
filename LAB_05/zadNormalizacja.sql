--zad1
SELECT * FROM sprzedaz_flat LIMIT 20;
SELECT COUNT(*), COUNT(DISTINCT klient_email) FROM sprzedaz_flat;

---zad2
--Stworzenie tabel
CREATE TABLE klienci_normalizacja (
    id SERIAL PRIMARY KEY,
    imie VARCHAR(50),
    nazwisko VARCHAR(50),
    email VARCHAR(150) UNIQUE,
    miasto VARCHAR(100)
);

CREATE TABLE produkty_normalizacja (
    id SERIAL PRIMARY KEY,
    nazwa VARCHAR(150),
    kategoria VARCHAR(100),
    cena NUMERIC(10,2)
);

CREATE TABLE sprzedaz_normalizacja (
    id SERIAL PRIMARY KEY,
    klient_id INTEGER REFERENCES klienci_normalizacja(id),
    produkt_id INTEGER REFERENCES produkty_normalizacja(id),
    data_sprzedazy DATE,
    ilosc INTEGER
);

--Przeniesienie danych do tabel
INSERT INTO klienci_normalizacja (imie, nazwisko, email, miasto)
SELECT DISTINCT klient_imie, klient_nazwisko, klient_email, klient_miasto
FROM sprzedaz_flat;

INSERT INTO produkty_normalizacja (nazwa, kategoria, cena)
SELECT DISTINCT produkt_nazwa, produkt_kategoria, produkt_cena
FROM sprzedaz_flat;

INSERT INTO sprzedaz_normalizacja (klient_id, produkt_id, data_sprzedazy, ilosc)
SELECT k.id, p.id, sf.data_sprzedazy, sf.ilosc
FROM sprzedaz_flat sf
JOIN klienci_normalizacja k ON k.email = sf.klient_email
JOIN produkty_normalizacja p ON p.nazwa = sf.produkt_nazwa;

--Uzasadnienie:
--Podział tabeli na osobne tabele eliminuje anomalie aktualizacji, 
--ponieważ dane klienta i produktu przechowywane są tylko w jednym miejscu. 
--Można dodać klienta lub produkt bez konieczności tworzenia sprzedaży produktu. 
--Zapobiega anomaliom usuwania, ponieważ usunięcie pojedynczej sprzedaży nie powoduje utraty danych klienta ani produktu. 
--Dzięki normalizacji dane są uporządkowane, nie powtarzają się i łatwiej zachować ich spójność. 