# Arkusz 06 — daty, sortowanie, ekstrakcja

**Dane:** `data/gaData.csv` (kolumny: `date` jako tekst „RRRR-MM-DD", `visitsTumblr`).
**Czas:** ~35 min.

Ustaw katalog roboczy na ten folder. Rozwiązania: `rozwiazania.md`.

**Zad. 1.** Wczytaj `data/gaData.csv`. Przekonwertuj `date` na klasę `Date`. Jaki jest
zakres dat (od–do)? Jaka jest suma wszystkich wizyt?

**Zad. 2.** W ilu dniach liczba wizyt była większa od 0?

**Zad. 3.** Ile łącznie wizyt zebrano w **2012** roku? (Wyciągnij rok z daty.)

**Zad. 4.** Który **dzień tygodnia** ma największą sumę wizyt?

**Zad. 5.** Który **miesiąc** (w formacie RRRR-MM) miał największą sumę wizyt?

**Zad. 6.** Który pojedynczy **dzień** miał najwięcej wizyt i ile?

**Zad. 7.** Ile dni przypada na rok 2011, a ile na 2012?

**Zad. 8.** (zamknięte) Jak wyciągnąć rok z obiektu klasy `Date` o nazwie `d`?

- `year(d)` z base R
- `format(d, "%Y")`
- `substr(d, 1, 2)`
- `d$year`

**Zad. 9.** (zamknięte) Co robi `weekdays(as.Date("2012-01-02"))`?

- zwraca numer dnia
- zwraca nazwę dnia tygodnia
- zwraca miesiąc

**Zad. 10.** (zamknięte) Poprawna kolejność zapisu wykresu do PDF:

- `pdf("f.pdf")` → kod → `dev.off()`
- kod → `pdf("f.pdf")` → `dev.off()`
- `dev.on("f.pdf")` → kod → `dev.off()`

**Zad. 11.** (zamknięte) Funkcja `traceback()` służy do:

- ustawienia punktu wstrzymania
- pokazania stosu wywołań po błędzie
- pomiaru czasu

**Zad. 12.** (zamknięte) Aby z tekstu „2012-01-02" wyciągnąć sam rok (4 znaki):

- `substr(x, 1, 4)`
- `str_extract(x, "^[0-9]{4}")`
- oba działają
