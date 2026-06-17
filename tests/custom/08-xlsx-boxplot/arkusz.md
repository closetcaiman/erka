# Arkusz 08 — Excel (xlsx), boxplot, grupy, teoria

**Dane:** `data/Prochnica.csv` (separator `;`), `data/Zawaly.xlsx`. **Czas:** ~40 min.

Ustaw katalog roboczy na ten folder. Rozwiązania: `rozwiazania.md`.

**Zad. 1.** Wczytaj `data/Prochnica.csv`. Ile jest poziomów zmiennej `Substancja_słodząca`
i ile obserwacji na poziom?

**Zad. 2.** Narysuj boxplot `Próchnica` w zależności od `Substancja_słodząca`. Która
substancja ma najwyższą **średnią** próchnicę?

**Zad. 3.** Wczytaj `data/Zawaly.xlsx` (pakiet `readxl`). Ile jest wierszy i kolumn?

**Zad. 4.** Oblicz średnie `BMI` osobno dla kobiet i mężczyzn (kolumna `Plec`).

**Zad. 5.** Czy palący mają wyższy średni `Cholesterol calkowity` niż niepalący
(kolumna `Palenie`)?

**Zad. 6.** Która substancja w `Prochnica.csv` daje najbardziej **zmienne** wyniki
(najwyższe odchylenie standardowe)?

**Zad. 7.** Kolumny `HDL`, `LDL`, `Tg` w `Zawaly` to panel lipidowy (format szeroki).
Przekształć je na **długi** (`frakcja`, `wartosc`) i policz średnią każdej frakcji.

**Zad. 8.** Ile pacjentów przypada na każdy `Rodzaj zawalu`?

**Zad. 9.** (zamknięte) Którą funkcją wczytasz plik `.xlsx`?
`read.csv("p.xlsx")` · `readxl::read_excel("p.xlsx")` · `load("p.xlsx")`

**Zad. 10.** (zamknięte) Kolumna z nazwą zawierającą spację (`Cholesterol calkowity`)
w dplyr wymaga ujęcia w:
cudzysłowy `"..."` · backticki `` `...` `` · nawiasy `(...)`

**Zad. 11.** (zamknięte) W `testthat` sprawdzenie, że funkcja **rzuca błąd**, to:
`expect_equal()` · `expect_true()` · `expect_error()`

**Zad. 12.** (zamknięte) Aby wczytać konkretny arkusz „Dane" z xlsx:
`read_excel("p.xlsx", tab="Dane")` · `read_excel("p.xlsx", sheet="Dane")` ·
`read_excel("p.xlsx", page="Dane")`
