CREATE TABLE klienci (
    id SERIAL PRIMARY KEY,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    data_urodzenia DATE,
    aktywny BOOLEAN DEFAULT TRUE
);

CREATE TABLE wypozyczenia (
    id SERIAL PRIMARY KEY,
    nazwa_gry VARCHAR(100) NOT NULL,
    platforma VARCHAR(30) NOT NULL,
    data_wypozyczenia DATE NOT NULL,
    data_zwrotu DATE,
    cena_za_dzien NUMERIC(6,2) NOT NULL,
    zwrocona BOOLEAN DEFAULT FALSE,
    klient_id INTEGER NOT NULL REFERENCES klienci(id)
);

INSERT INTO klienci (imie, nazwisko, email, data_urodzenia, aktywny) VALUES
    ('Anna', 'Kowalska', 'anna.kowalska@example.com', '2002-04-12', TRUE),
    ('Jan', 'Nowak', 'jan.nowak@example.com', '2001-08-23', TRUE),
    ('Maria', 'Wisniewska', 'maria.wisniewska@example.com', '2003-01-15', TRUE),
    ('Piotr', 'Wojcik', 'piotr.wojcik@example.com', '2000-11-05', FALSE),
    ('Katarzyna', 'Kaminska', 'katarzyna.kaminska@example.com', '2002-06-30', TRUE),
    ('Tomasz', 'Lewandowski', 'tomasz.lewandowski@example.com', '1999-03-19', TRUE),
    ('Aleksandra', 'Zielinska', 'aleksandra.zielinska@example.com', '2004-09-08', TRUE),
    ('Michal', 'Szymanski', 'michal.szymanski@example.com', '2001-12-21', FALSE),
    ('Julia', 'Dabrowska', 'julia.dabrowska@example.com', '2003-07-14', TRUE),
    ('Pawel', 'Kozlowski', 'pawel.kozlowski@example.com', '2000-02-27', TRUE);

INSERT INTO wypozyczenia (nazwa_gry, platforma, data_wypozyczenia, data_zwrotu, cena_za_dzien, zwrocona, klient_id) VALUES
    ('Minecraft', 'PC', '2026-10-01', '2026-10-04', 8.50, TRUE, 1),
    ('The Witcher 3', 'PC', '2026-10-02', '2026-10-06', 10.00, TRUE, 2),
    ('FIFA 26', 'PS5', '2026-10-03', NULL, 12.00, FALSE, 3),
    ('GTA V', 'Xbox', '2026-10-04', '2026-10-08', 9.50, TRUE, 4),
    ('Cyberpunk 2077', 'PC', '2026-10-05', NULL, 11.00, FALSE, 5),
    ('Red Dead Redemption 2', 'PS5', '2026-10-06', '2026-10-10', 10.50, TRUE, 6),
    ('The Sims 4', 'PC', '2026-10-07', NULL, 7.00, FALSE, 7),
    ('Forza Horizon 5', 'Xbox', '2026-10-08', '2026-10-12', 9.00, TRUE, 8),
    ('Hogwarts Legacy', 'PS5', '2026-10-09', NULL, 10.00, FALSE, 9),
    ('Stardew Valley', 'PC', '2026-10-10', '2026-10-13', 6.50, TRUE, 10);