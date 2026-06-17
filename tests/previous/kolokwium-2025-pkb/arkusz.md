# Kolokwium z zeszłego roku — PKB (GDP + FEDSTATS)

**Dane:** `data/GDP.csv`, `data/FEDSTATS_Country.csv`. **Czas:** ~40 min.

Ustaw katalog roboczy na ten folder. Rozwiązania: `rozwiazania.md`.

> Odtworzenie kolokwium z zeszłego roku na realnych plikach (GDP 2024). `GDP.csv` jest
> „brudny": 5 śmieciowych wierszy nagłówka, PKB z przecinkami i spacjami, puste wiersze
> na końcu — najpierw trzeba go oczyścić. Wzorzec wczytania jest w `rozwiazania.md`.

**Zad. 1.** Wczytaj `data/GDP.csv`. Ile krajów jest w zestawieniu? Usuń przecinki z PKB
(w mln USD) i policz **średni** PKB.

**Zad. 2.** Jakie wyrażenie regularne policzy kraje, których nazwa zaczyna się od
„United"? Ile ich jest?

**Zad. 3.** Wczytaj `data/FEDSTATS_Country.csv`. Połącz oba zbiory po kodzie kraju
(`kod` ↔ `CountryCode`). Ile identyfikatorów pasuje?

**Zad. 4.** Posortuj złączoną ramkę **malejąco** wg rankingu PKB (tak, by USA były na
końcu). Jaki jest **13.** kraj w wyniku?

**Zad. 5.** Jaki jest średni **ranking** PKB dla grup „High income: OECD" oraz
„High income: nonOECD"?

**Zad. 6.** Spośród krajów z informacją o końcu roku fiskalnego (kolumna `Special.Notes`),
ile kończy rok fiskalny w **czerwcu** (June)?

**Zad. 7.** (zamknięte) Funkcja `tidymodels` do podziału na zbiór treningowy i testowy:
`split()` · `train_test_split()` · `initial_split()` · `data_partition()`

**Zad. 8.** (zamknięte) Argumenty `facet_grid()` dla siatki wg `var1` i `var2` ze skalami
„free":
`facet_grid(var1 + var2, scales="free")` · `facet_grid(var1 ~ var2, scales="free")` ·
`facet_grid(var1 | var2, scales="free")`
