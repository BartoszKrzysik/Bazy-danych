/*CREATE SCHEMA Ksiegowosc;
CREATE TABLE IF NOT EXISTS Ksiegowosc.premie
(
    id_premii integer NOT NULL,
    rodzaj character varying(255) NOT NULL,
    kwota money NOT NULL,
    CONSTRAINT premie_pkey PRIMARY KEY (id_premii)
);
CREATE TABLE IF NOT EXISTS Ksiegowosc.pracownicy
(
    id_pracownika integer NOT NULL,
    imie character varying(255) NOT NULL,
    nazwisko character varying(255) NOT NULL,
    adres character varying(255) NOT NULL,
    telefon integer NOT NULL,
    CONSTRAINT pracownicy_pkey PRIMARY KEY (id_pracownika)
);
CREATE TABLE IF NOT EXISTS Ksiegowosc.godziny
(
	id_godziny integer NOT NULL,
	data date NOT NULL,
	liczba_godzin integer NOT NULL,
	id_pracownika integer NOT NULL,
	CONSTRAINT godziny_pkey PRIMARY KEY (id_godziny),
	CONSTRAINT id_pracownika FOREIGN KEY (id_pracownika)
        REFERENCES ksiegowosc.pracownicy (id_pracownika) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);
CREATE TABLE IF NOT EXISTS Ksiegowosc.pensje
(
	id_pensji integer NOT NULL,
	stanowisko character varying(255) NOT NULL,
	kwota money NOT NULL,
	CONSTRAINT pensje_pkey PRIMARY KEY (id_pensji)
);
CREATE TABLE IF NOT EXISTS Ksiegowosc.wynagrodzenie
(
	id_wynagrodzenia integer NOT NULL,
	data date NOT NULL,
	id_pracownika integer NOT NULL,
	id_godziny integer NOT NULL,
	id_pensji integer NOT NULL,
	id_premii integer,
	CONSTRAINT wynagrodzenia_pkey PRIMARY KEY (id_wynagrodzenia),
	CONSTRAINT id_pracownika FOREIGN KEY (id_pracownika)
        REFERENCES ksiegowosc.pracownicy (id_pracownika) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
	CONSTRAINT id_pensji FOREIGN KEY (id_pensji)
        REFERENCES ksiegowosc.pensje (id_pensji) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
	CONSTRAINT id_premii FOREIGN KEY (id_premii)
        REFERENCES ksiegowosc.premie (id_premii) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
	CONSTRAINT id_godziny FOREIGN KEY (id_godziny)
        REFERENCES ksiegowosc.godziny (id_godziny) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);
INSERT INTO Ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
VALUES
    (1, 'Jan', 'Kowalski', 'ul. Prosta 1', 123456789),
    (2, 'Anna', 'Nowak', 'ul. Kwiatowa 2', 987654321),
    (3, 'Piotr', 'Dąbrowski', 'ul. Główna 3', 555111333),
    (4, 'Katarzyna', 'Wójcik', 'ul. Słoneczna 4', 444222111),
    (5, 'Marek', 'Lis', 'ul. Polna 5', 111222333),
    (6, 'Alicja', 'Kaczor', 'ul. Leśna 6', 999888777),
    (7, 'Robert', 'Zając', 'ul. Ogrodowa 7', 666777888),
    (8, 'Ewa', 'Olszewska', 'ul. Parkowa 8', 333444555),
    (9, 'Tomasz', 'Kołodziej', 'ul. Radosna 9', 222333444),
    (10, 'Magdalena', 'Pawłowska', 'ul. Wiosenna 10', 777555111);
INSERT INTO Ksiegowosc.pensje (id_pensji, stanowisko, kwota)
VALUES
    (1, 'Kierownik', 6000.00),
    (2, 'Specjalista ds. Sprzedaży', 4500.00),
    (3, 'Księgowy', 5000.00),
    (4, 'Inżynier', 5500.00),
    (5, 'Asystentka Biura', 3500.00),
    (6, 'Pracownik Produkcji', 4000.00),
    (7, 'Analityk Finansowy', 4800.00),
    (8, 'Programista', 5500.00),
    (9, 'Sekretarka', 3800.00),
    (10, 'Technik', 4200.00);
INSERT INTO Ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES
    (1, '2023-01-01', 8, 1),
    (2, '2023-01-02', 7, 2),
    (3, '2023-01-03', 6, 3),
    (4, '2023-01-04', 8, 4),
    (5, '2023-01-05', 7, 5),
    (6, '2023-01-06', 6, 1),
    (7, '2023-01-07', 8, 2),
    (8, '2023-01-08', 7, 3),
    (9, '2023-01-09', 6, 4),
    (10, '2023-01-10', 8, 5);
INSERT INTO Ksiegowosc.premie (id_premii, rodzaj, kwota)
VALUES
    (1, 'Premia świąteczna', 1000.00),
    (2, 'Premia za wyniki', 500.00),
    (3, 'Premia jubileuszowa', 2000.00),
    (4, 'Premia za staż', 800.00),
    (5, 'Premia za nadgodziny', 700.00),
    (6, 'Premia motywacyjna', 1200.00),
    (7, 'Premia za efektywność', 600.00),
    (8, 'Premia za zasługi', 1500.00),
    (9, 'Premia za awans', 900.00),
    (10, 'Premia za innowacje', 1100.00);
INSERT INTO Ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
VALUES
    (1, '2023-01-01', 1, 1, 1, NULL),
    (2, '2023-01-02', 2, 2, 2, NULL),
    (3, '2023-01-03', 3, 3, 3, 1),
    (4, '2023-01-04', 4, 4, 4, 2),
    (5, '2023-01-05', 5, 5, 5, NULL),
    (6, '2023-01-06', 1, 6, 1, 3),
    (7, '2023-01-07', 2, 7, 2, NULL),
    (8, '2023-01-08', 3, 8, 3, 4),
    (9, '2023-01-09', 4, 9, 4, NULL),
    (10, '2023-01-10', 5, 10, 5, 5);
SELECT id_pracownika, nazwisko FROM Ksiegowosc.pracownicy*/

/*SELECT kw.id_pracownika, kpen.kwota, kprem.kwota
FROM ksiegowosc.pracownicy kp
INNER JOIN ksiegowosc.wynagrodzenie kw
	ON kp.id_pracownika=kw.id_pracownika
LEFT JOIN ksiegowosc.premie kprem
	ON kprem.id_premii=kw.id_premii
INNER JOIN ksiegowosc.pensje kpen
	ON kpen.id_pensji=kw.id_pensji
WHERE COALESCE(kprem.kwota,CAST(0 as money))+COALESCE(kpen.kwota,CAST(0 as money)) > CAST(3000 as money);*/

/*SELECT kw.id_pracownika, kpen.kwota
FROM ksiegowosc.pracownicy kp
INNER JOIN ksiegowosc.wynagrodzenie kw
	ON kp.id_pracownika=kw.id_pracownika
LEFT JOIN ksiegowosc.premie kprem
	ON kprem.id_premii=kw.id_premii
INNER JOIN ksiegowosc.pensje kpen
	ON kpen.id_pensji=kw.id_pensji
WHERE kw.id_premii IS NULL
AND kpen.kwota > CAST(2000 as money)*/

/*SELECT kp.imie
FROM ksiegowosc.pracownicy kp
WHERE kp.imie LIKE 'J%'*/

/*SELECT kp.imie, kp.nazwisko
FROM ksiegowosc.pracownicy kp
WHERE kp.imie LIKE '%a'
AND kp.nazwisko LIKE '%N%'
OR kp.nazwisko LIKE '%n%'*/

/*SELECT kp.imie, 
kp.nazwisko, 
kp.id_pracownika, 
SUM (kg.liczba_godzin) - 6 as nadgodziny
,DATE_PART('month', kg.data)
FROM ksiegowosc.pracownicy kp
INNER JOIN ksiegowosc.godziny kg
	ON kp.id_pracownika = kg.id_pracownika
GROUP BY kp.id_pracownika, DATE_PART('month', kg.data)
ORDER BY DATE_PART('month', kg.data);*/

/*SELECT kp.imie,kp.nazwisko, kpen.kwota
FROM ksiegowosc.pracownicy kp
INNER JOIN ksiegowosc.wynagrodzenie kw
	ON kp.id_pracownika=kw.id_pracownika
LEFT JOIN ksiegowosc.premie kprem
	ON kprem.id_premii=kw.id_premii
INNER JOIN ksiegowosc.pensje kpen
	ON kpen.id_pensji=kw.id_pensji
WHERE kpen.kwota > CAST(1000 as money)
AND kpen.kwota < CAST(4000 as money)*/

/*SELECT kp.imie, 
kp.nazwisko, 
kp.id_pracownika,
kw.id_premii,
SUM (kg.liczba_godzin) - 6 as nadgodziny
,DATE_PART('month', kg.data)
FROM ksiegowosc.pracownicy kp
LEFT JOIN ksiegowosc.godziny kg
	ON kp.id_pracownika = kg.id_pracownika
LEFT JOIN ksiegowosc.wynagrodzenie kw
	ON kp.id_pracownika = kw.id_pracownika
WHERE kw.id_premii IS NULL
GROUP BY kp.id_pracownika, DATE_PART('month', kg.data), kw.id_premii
ORDER BY DATE_PART('month', kg.data);*/

/*SELECT kpen.kwota, kw.id_pracownika
FROM ksiegowosc.wynagrodzenie kw
INNER JOIN ksiegowosc.pensje kpen
	ON kpen.id_pensji = kw.id_pensji
ORDER BY kpen.kwota ASC;*/

/*SELECT kpen.kwota,kprem.kwota, kw.id_pracownika
FROM ksiegowosc.wynagrodzenie kw
INNER JOIN ksiegowosc.pensje kpen
	ON kpen.id_pensji = kw.id_pensji
LEFT JOIN ksiegowosc.premie kprem
	ON kw.id_premii = kprem.id_premii
ORDER BY kpen.kwota DESC, kprem.kwota DESC;*/

/*SELECT stanowisko,
	COUNT (stanowisko)
FROM ksiegowosc.pensje
GROUP BY
	stanowisko;*/
	
/*SELECT stanowisko,
AVG(CAST(kwota AS decimal(10,2))) AS srednia_plac,
MIN(CAST(kwota AS decimal(10,2))) AS minimalna_placa,
MAX(CAST(kwota AS decimal(10,2))) AS maxymalna_placa
FROM ksiegowosc.pensje
WHERE stanowisko = 'Kierownik'
GROUP BY stanowisko;*/

/*SELECT SUM (kpen.kwota) as suma_pensji,
SUM (kprem.kwota) as suma_premii,
SUM (kprem.kwota + kpen.kwota) as suma
FROM ksiegowosc.wynagrodzenie kw
INNER JOIN ksiegowosc.pensje kpen
	ON kw.id_pensji = kpen.id_pensji
LEFT JOIN ksiegowosc.premie kprem
	ON kw.id_premii = kprem.id_premii*/
	
/*SELECT kpen.stanowisko, SUM(kpen.kwota+kprem.kwota) as kwoty
FROM ksiegowosc.wynagrodzenie kw
LEFT JOIN ksiegowosc.premie kprem
	ON kw.id_premii = kprem.id_premii 
LEFT JOIN ksiegowosc.pensje kpen
	ON kw.id_pensji = kpen.id_pensji
GROUP BY kpen.stanowisko;*/
/*SELECT kpen.stanowisko, kprem.kwota
FROM ksiegowosc.wynagrodzenie kw
LEFT JOIN ksiegowosc.premie kprem
	ON kw.id_premii = kprem.id_premii
LEFT JOIN ksiegowosc.pensje kpen
	ON kw.id_pensji = kpen.id_pensji;*/
/*DELETE FROM ksiegowosc.wynagrodzenie
USING ksiegowosc.pensje kpen
WHERE ksiegowosc.wynagrodzenie.id_pensji = kpen.id_pensji
AND kpen.kwota < CAST(1200 as money);*/