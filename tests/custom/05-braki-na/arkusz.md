# Arkusz 05 — braki danych (NA), grupowanie, teoria typów

**Dane:** `data/q1_data.csv` (zbiór `airquality`: Ozone, Solar.R, Wind, Temp, Month, Day).
**Czas:** ~35 min.

Ustaw katalog roboczy na ten folder. Rozwiązania: `rozwiazania.md`.

**Zad. 1.** Wczytaj `data/q1_data.csv`. Oblicz średnie stężenie ozonu (`Ozone`). Dlaczego
samo `mean(Ozone)` zwraca `NA` i jak to naprawić? Ile jest braków w `Ozone`?

**Zad. 2.** Oblicz średnią temperaturę (`Temp`) w każdym miesiącu (`Month`).

**Zad. 3.** W którym miesiącu średnie stężenie ozonu było najwyższe (pomijając `NA`)?

**Zad. 4.** Jaka jest korelacja między `Ozone` a `Temp` (na pełnych obserwacjach)?

**Zad. 5.** Ile wierszy jest **kompletnych** (bez żadnego `NA`)? Z ilu wszystkich?

**Zad. 6.** Jaka jest średnia `Ozone` w ciepłe dni (`Temp > 80`, z pominięciem `NA`)?

**Zad. 7.** Policz macierz korelacji dla `Ozone, Solar.R, Wind, Temp` (na pełnych
obserwacjach). Która para jest najsilniej skorelowana **dodatnio**, a która **ujemnie**?

**Zad. 8.** (zamknięte) Jaka jest klasa obiektu `x <- c(4, TRUE)`?

- logical
- character
- numeric
- list

**Zad. 9.** (zamknięte) Co da `x[[2]]` dla `x <- list(2, "a", "b", TRUE)`?

- lista z „a" i „b"
- wektor znakowy z literą „a"
- liczba 2

**Zad. 10.** (zamknięte) Co zwróci `rbind(c(1,3,5), c(3,2,10))`?

- wektor długości 3
- macierz 3×2
- macierz 2×3

**Zad. 11.** (zamknięte) Domyślna metoda dopasowania linii w `geom_smooth()` (bez `method`)?

- lm
- loess
- glm
- gam

**Zad. 12.** (zamknięte) Aby `cor()` policzyło korelację mimo `NA`, używasz:

- `cor(x, y, na.rm = TRUE)`
- `cor(x, y, use = "complete.obs")`
- `cor(na.omit(x), y)`
