# Arkusz 07 — wiele plików, pętle, własne funkcje (specdata)

**Dane:** `data/specdata/` — pliki `001.csv` … `332.csv` (każdy: `Date`, `sulfate`,
`nitrate`, `ID`). **Czas:** ~45 min.

Ustaw katalog roboczy na ten folder. Rozwiązania: `rozwiazania.md`.

> Typ zadania z quizu „zanieczyszczenia powietrza": wczytać wiele plików i operować na
> połączonych danych.

**Zad. 1.** Napisz funkcję `pollutantmean(directory, pollutant, id = 1:332)`, która
wczytuje pliki o numerach `id`, skleja je i zwraca średnią wskazanego zanieczyszczenia
(pomijając `NA`). Ile wynosi `pollutantmean("data/specdata", "sulfate", 1:10)`?
(zaokrąglij do 3 miejsc)

**Zad. 2.** Ile wynosi `pollutantmean("data/specdata", "nitrate", 70:72)`? (3 miejsca)

**Zad. 3.** Napisz funkcję `complete(directory, id)` zwracającą ramkę `id, nobs` (liczba
kompletnych wierszy). Ile kompletnych obserwacji ma plik 54?

**Zad. 4.** Korzystając z `complete`, ile kompletnych obserwacji mają łącznie pliki 1–10?

**Zad. 5.** Napisz funkcję `corr(directory, threshold = 0)`, która dla każdego monitora
o liczbie **kompletnych** obserwacji większej od `threshold` liczy korelację `sulfate`
vs `nitrate` i zwraca wektor tych korelacji. Ile wynosi `length(corr("data/specdata", 150))`?

**Zad. 6.** Ile wynosi `length(corr("data/specdata", 400))` oraz `length(corr("data/specdata", 1000))`?

**Zad. 7.** Jaka jest **średnia** korelacja dla progu 150?

**Zad. 8.** (zamknięte) Jak wczytać wszystkie ścieżki plików z katalogu?
`read.csv("specdata")` · `list.files("specdata", full.names = TRUE)` · `dir.exists("specdata")`

**Zad. 9.** (zamknięte) Jak skleić listę ramek `lista` w jedną ramkę?
`do.call(rbind, lista)` · `rbind(lista)` · `merge(lista)`

**Zad. 10.** (zamknięte) `complete.cases(df)` zwraca:
liczbę kolumn · wektor logiczny TRUE dla wierszy bez `NA` · ramkę bez `NA`

**Zad. 11.** (zamknięte) Aby porównać szybkość dwóch implementacji funkcji, użyjesz:
`profvis()` · `microbenchmark()` · `traceback()`

**Zad. 12.** (zamknięte) W funkcji `corr` `complete.cases(d)` służy do:
usunięcia kolumn z NA · wybrania wierszy bez `NA` (do liczenia korelacji) · policzenia NA
