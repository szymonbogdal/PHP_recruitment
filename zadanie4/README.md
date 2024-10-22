# Zadanie 4
Od Testera Oprogramowania otrzymujesz dokument z poniższymi komunikatami błędów. Twoim
zadaniem jest wytłumaczeniem przyczyny pojawienia się błędu oraz zaproponowanie sposobu
obsługi danego defektu.

## Podpunkt A
[42P01] BŁĄD: relacja "cregisters.creg" nie istnieje

#### Przyczyna
 - Tabela o nazwie "cregisters.creg" nie istnieje

#### Rozwiązanie
  - Sprawdzić poprawność nazwy tabeli w zapytaniu
  - Zweryfikować czy tabela została utworzona

## Podpunkt B
Nie można wpisać wniosku na dzień w którym nie ma okresu zatrudnienia

#### Przyczyna
  - Błąd walidacji - próba utworzenia wniosku dla daty, która nie pokrywa się z okresem zatrudnienia pracownika
#### Rozwiązanie
  - Zweryfikować czy walidacja działa poprawnie
  - Wyświetlić użytkownikowi informację o dostępnym okresie zatrudnienia
## Podpunkt C
[22P02] BŁĄD: invalid input syntax for integer: "30B"

#### Przyczyna
  - Próba wstawienia wartości "30B" do pola typu integer. Litera "B" nie może zostać przekonwertowana na liczbę
#### Rozwiązanie
  - Dodać walidacje wprowadzanych wartości po stronie frontendu
  - Zaimplementować sanityzację danych przed zapisem do bazy danych
## Podpunkt D
[25-Nov-2022 15:50:02 Europe/Warsaw] Eksport danych do Sage ERP FK -1

#### Przyczyna
  - Błąd wskazujący na nieudany eksport danych do systemu finansowo-księgowego Sage ERP. Kod błędu "-1" zazwyczaj oznacza ogólny błąd wykonania operacji
#### Rozwiązanie
  - Wprowadzenie mechanizmu obłsugi błędów
  - Implementacja szczegółowego logowania
  - Walidacja danych przed eksportem
## Podpunkt E
Failed to load resource: net::ERR_FAILED

#### Przyczyna
  - Ogólny błąd sieciowy który mógł zostać spowodowany przez:
    - Problemy z połączeniem sieciowym
    - Błedy CORS
    - Niedostępnośc zasobu
    - Problemy z certyfikatem SSL
#### Rozwiązanie
  - Dodać obługę błędów wraz z komuniaktami dla użytkownika
  - Jeżeli aplikacja korzysta z różnych domen sprawdzić konfigurację CORS
  - Zaimplementować mechanizm ponowncyh prób