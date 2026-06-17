# Kolokwium z innej grupy — arkusz

**Dane (w `data/`):** `outcome-of-care-measures.csv`, `hospital-data.csv`,
`Czas reakcji.csv`, `cel_volden_wiseman.csv`, `Prochnica.csv`, `Polisy.csv`.
**Czas:** ~40 min.

Ustaw katalog roboczy na ten folder. Rozwiązania: `rozwiazania.md`.

> Złożone z 8 typów zadań opisanych przez kolegę z innej grupy. Każde zadanie to inny typ.

**Zad. 1.** (połącz 2 ramki + policz) Połącz `outcome-of-care-measures.csv` z
`hospital-data.csv` po `Provider.Number`. Ile rekordów pasuje? Jaka jest krajowa średnia
śmiertelności po zawale (kolumna 11, pomiń `NA`)?

**Zad. 2.** (sortuj + filtruj + odczytaj) W stanie TX wskaż szpital o najniższej
śmiertelności po zawale. Jak się nazywa?

**Zad. 3.** (format długi) Wczytaj `Czas reakcji.csv`. Przekształć na format długi
(`moment`, `czas`) i policz średni czas w każdym momencie.

**Zad. 4.** (ekstrakcja ze stringa) W `cel_volden_wiseman.csv` wyciągnij nazwisko z
`thomas_name`. Ilu kongresmenów w `congress == 110` ma nazwisko na literę „M"?

**Zad. 5.** (boxplot + średnia) Dla `Prochnica.csv` zrób boxplot próchnicy wg substancji
słodzącej. Która substancja ma najwyższą średnią?

**Zad. 6.** (wczytanie + oczyszczenie) Wczytaj `Polisy.csv` właściwą funkcją. Ile jest
obserwacji i jaki procent polis zakończył się szkodą?

**Zad. 7.** (zamknięte) Funkcja z tidymodels do podziału na train/test:

- `initial_split()`
- `train_test_split()`
- `data_split()`

**Zad. 8.** (zamknięte) Funkcja ggplot2 robiąca siatkę wykresów wg dwóch kategorii:

- `facet_wrap()`
- `facet_grid()`
- `facet_panel()`
