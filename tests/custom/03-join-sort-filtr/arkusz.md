# Arkusz 03 — łączenie ramek (join), sortowanie, filtrowanie, NA

**Dane:** `data/outcome-of-care-measures.csv`, `data/hospital-data.csv`. **Czas:** ~40 min.

Ustaw katalog roboczy na ten folder. Rozwiązania: `rozwiazania.md`.

> Pliki „amerykańskie" → `read.csv()`. Kolumny ze śmiertelnością zawierają tekst
> `"Not Available"` → po `as.numeric()` powstają `NA`. Kolumna 11 = śmiertelność po
> zawale serca (Heart Attack).

**Zad. 1.** Wczytaj oba pliki. Połącz je po kluczu `Provider.Number` (inner join). Ile
rekordów pasuje?

**Zad. 2.** Przekonwertuj kolumnę 11 na liczbę. Ile powstaje braków (`NA`) i dlaczego?

**Zad. 3.** Dla stanu **TX** znajdź szpital o **najniższej** śmiertelności po zawale.
Jak się nazywa i jaka to wartość? (Pomiń `NA`.)

**Zad. 4.** Który stan ma najwięcej szpitali w zbiorze `outcome`? Podaj top 3.

**Zad. 5.** Jaka jest **krajowa** średnia śmiertelności po zawale (z pominięciem `NA`)?

**Zad. 6.** Który szpital ma **najwyższą** (najgorszą) śmiertelność po zawale i w jakim
jest stanie?

**Zad. 7.** Który szpital jest **drugim** najlepszym (2. najniższa wartość) w TX?

**Zad. 8.** Ile szpitali w TX ma śmiertelność po zawale `<= 14`?

**Zad. 9.** (zamknięte) Którą funkcją dplyr zostawisz tylko rekordy pasujące w OBU ramkach?
`left_join()` · `full_join()` · `inner_join()` · `bind_rows()`

**Zad. 10.** (zamknięte) Jak policzyć, ile wartości w wektorze `x` to braki?
`length(x == NA)` · `sum(is.na(x))` · `count(NA, x)`

**Zad. 11.** (zamknięte) Przykładem **wektorowego** urządzenia graficznego jest:
PNG · JPEG · PDF · TIFF

**Zad. 12.** (zamknięte) Po `initial_split()` zbiór treningowy wyciągasz funkcją:
`train()` · `training()` · `get_train()` · `analysis_set()`

**Zad. 13.** (zamknięte) W tym zbiorze (każdy rekord `out` ma parę w `hos`)
`left_join(out, hos)` vs `inner_join(out, hos)`:
dadzą różną liczbę wierszy · dadzą tę samą liczbę wierszy · left_join zgłosi błąd
