--zad1
SELECT z.id, z.data_zamowienia, z.status, k.imie, k.nazwisko 
FROM zamowienia z 
JOIN klienci k ON z.klient_id = k.id;

--zad2
SELECT k.nazwa AS kategoria,
    ROUND(AVG(p.cena), 2) AS srednia_cena
FROM kategorie k
JOIN produkty p ON p.kategoria_id = k.id
GROUP BY k.id, k.nazwa;

--zad3
SELECT k.id, k.imie, k.nazwisko,
    SUM(pz.ilosc * pz.cena_jednostkowa) AS suma_wydatkow
FROM klienci k
JOIN zamowienia z ON z.klient_id = k.id
JOIN pozycje_zamowien pz ON pz.zamowienie_id = z.id
GROUP BY k.id, k.imie, k.nazwisko
ORDER BY suma_wydatkow DESC
LIMIT 5;

--zad4
SELECT k.nazwa, COUNT(p.id) AS liczba_produktow
FROM kategorie k
JOIN produkty p ON p.kategoria_id = k.id
GROUP BY k.id, k.nazwa
HAVING COUNT(p.id) > 5;

--zad5
SELECT p.id, p.nazwa FROM produkty p
LEFT JOIN pozycje_zamowien pz ON pz.produkt_id = p.id
WHERE pz.id IS NULL;

--zad6
SELECT status, COUNT(*) AS liczba_zamowien FROM zamowienia
GROUP BY status;

--zad7
SELECT p.id, p.imie, p.nazwisko, COUNT(z.id) AS liczba_zamowien
FROM pracownicy p
JOIN zamowienia z ON z.pracownik_id = p.id
GROUP BY p.id, p.imie, p.nazwisko
ORDER BY liczba_zamowien DESC
LIMIT 1;

--zad8
SELECT k.id, k.imie, k.nazwisko, COUNT(z.id) AS liczba_zamowien
FROM klienci k
LEFT JOIN zamowienia z ON z.klient_id = k.id
GROUP BY k.id, k.imie, k.nazwisko;

--zad9
SELECT k.nazwa AS kategoria, 
    SUM(pz.ilosc * pz.cena_jednostkowa) AS wartosc_sprzedazy
FROM kategorie k
JOIN produkty p ON p.kategoria_id = k.id
JOIN pozycje_zamowien pz ON pz.produkt_id = p.id
GROUP BY k.id, k.nazwa
ORDER BY wartosc_sprzedazy DESC
LIMIT 5;

--zad10
SELECT p.id, p.nazwa, p.cena, k.nazwa AS kategoria
FROM produkty p
JOIN kategorie k ON p.kategoria_id = k.id
WHERE p.cena > (
    SELECT AVG(p2.cena)
    FROM produkty p2
    WHERE p2.kategoria_id = p.kategoria_id
);

--zad11
SELECT k.id, k.imie, k.nazwisko FROM klienci k
LEFT JOIN zamowienia z ON z.klient_id = k.id
WHERE z.id IS NULL;

--zad12
SELECT k.nazwa AS kategoria, SUM(pz.ilosc) AS liczba_sprzedanych_sztuk
FROM pozycje_zamowien pz
JOIN produkty p ON pz.produkt_id = p.id
JOIN kategorie k ON p.kategoria_id = k.id
GROUP BY k.id, k.nazwa;

--zad13
SELECT p.id, p.imie, p.nazwisko, COUNT(z.id) AS liczba_zamowien
FROM pracownicy p
LEFT JOIN zamowienia z ON z.pracownik_id = p.id
GROUP BY p.id, p.imie, p.nazwisko
HAVING COUNT(z.id) < (
    SELECT AVG(liczba)
    FROM (
        SELECT COUNT(z2.id) AS liczba
        FROM pracownicy p2
        LEFT JOIN zamowienia z2
        ON z2.pracownik_id = p2.id
        GROUP BY p2.id
    ) AS srednia
);

--zad14
SELECT p.id, p.nazwa, COUNT(pz.id) AS liczba_wystapien
FROM produkty p
JOIN pozycje_zamowien pz
ON pz.produkt_id = p.id
GROUP BY p.id, p.nazwa
ORDER BY liczba_wystapien DESC
LIMIT 3;