-- 1
SELECT nazwa, cena FROM produkty
WHERE cena > 200 
ORDER BY cena DESC;
-- 2
SELECT imie, nazwisko, miasto FROM klienci
WHERE miasto IN ('Wroclaw', 'Poznan');

-- 3
SELECT nazwa, cena FROM produkty
ORDER BY cena ASC LIMIT 10;

-- 4
SELECT * FROM zamowienia
WHERE status = 'anulowane'
ORDER BY data_zamowienia DESC;

-- 5
SELECT * FROM produkty
WHERE nazwa LIKE 'P%';

-- 6
SELECT * FROM produkty
WHERE ilosc_magazyn < 5;

-- 7
SELECT * FROM klienci
WHERE data_rejestracji > CURRENT_DATE - INTERVAL '500 days';

-- 8
SELECT nazwa, cena FROM produkty
ORDER BY cena DESC LIMIT 5;

-- 9
SELECT nazwa, cena FROM produkty
ORDER BY cena ASC LIMIT 5;

-- 10
SELECT * FROM produkty
WHERE data_dodania >= CURRENT_DATE - INTERVAL '30 days';

-- 11
SELECT DISTINCT miasto FROM klienci;

-- 12
SELECT nazwisko, UPPER(nazwisko) AS nazwisko_duze FROM klienci;

-- 13
SELECT * FROM produkty
WHERE ROUND(cena) BETWEEN 90 AND 110;

-- 14
SELECT * FROM klienci
WHERE imie LIKE 'A%' OR nazwisko LIKE 'ski%';

-- 15
SELECT * FROM zamowienia
ORDER BY data_zamowienia ASC LIMIT 5;

-- 16
SELECT * FROM produkty
WHERE cena NOT BETWEEN 100 AND 300;

-- 17
SELECT nazwa, CURRENT_DATE - data_dodania AS dni_od_dodania FROM produkty
ORDER BY dni_od_dodania DESC;