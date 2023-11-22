SELECT nazwisko, adres FROM rozliczenia.pracownicy;
SELECT kwota as kwota_brutto, (kwota/1.23) as kwota_netto FROM rozliczenia.pensje
SELECT DATEPART(WEEKDAY, date) as dzien_tygodnia,
DATEPART(MONTH, date) as miesiac
FROM rozliczenia.godziny;