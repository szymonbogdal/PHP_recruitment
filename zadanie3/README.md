# Zadanie 3
Masz do przygotowania formularz do rejestracji dla użytkownika. W formularzu tym, dla osoby
fizycznej, wymagane są takie dane jak imię, adres e-mail, data urodzenia, w przypadku firm: nazwa
firmy, adres e-mail, NIP. Zaproponuj pola w tabeli bazy danych, a także możliwe metody weryfikacyjne,
aby nie dopuścić do redundancji danych, błędów w danych, niespójności w danych.

## Schemat bazy danych
[Schemat bazy danych](db.sql)

## Elementy weryfikacyjne
 - walidacja adresu email
 - sprawdzenie które wartości są wymagane w zależności od typu rejestracji.
 - sprawdzanie czy data urodzenia nie jest datą przyszłą, bądź zbyt odległom.
 - walidacja NIPu.