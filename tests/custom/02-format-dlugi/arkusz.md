# Arkusz 02 — format szeroki → długi (pivot_longer)

**Dane:** `data/Czas reakcji.csv`. **Czas:** ~35 min.

Ustaw katalog roboczy na ten folder. Rozwiązania: `rozwiazania.md`.

> To arkusz „pod prowadzącego": wczytaj dane, **przerób format**, dopiero potem licz.
> Plik ma format szeroki: dwie kolumny pomiarów (`Reakcja_przed`, `Reakcja_po`) dla tej
> samej osoby.

**Zad. 1.** Wczytaj `data/Czas reakcji.csv`. Ile osób badano? Jaka jest średnia reakcja
przed i po (osobno)?

**Zad. 2.** Przekształć dane z formatu **szerokiego na długi**: zamiast kolumn
`Reakcja_przed` i `Reakcja_po` utwórz kolumnę `moment` (przed/po) i kolumnę `czas`.
Pokaż pierwsze wiersze.

**Zad. 3.** Na danych w formacie długim policz średni czas reakcji w każdym momencie
(grupowanie po `moment`). Czy wynik zgadza się z zad. 1?

**Zad. 4.** U ilu osób reakcja się **poprawiła** (czas po < czas przed)? Jaka była
średnia różnica (`po − przed`)? Jaki był procent osób z poprawą i największe pogorszenie?

**Zad. 5.** Z danych długich wróć do formatu szerokiego za pomocą `pivot_wider`. Sprawdź,
że odzyskałeś oryginalne kolumny.

**Zad. 6.** Dorób kolumnę `roznica = Reakcja_po − Reakcja_przed`, posortuj malejąco wg
pogorszenia i pokaż 3 osoby z największym pogorszeniem.

**Zad. 7.** Zrób wykres „przed–po": dane długie, `ggplot` z `moment` na osi x, `czas`
na osi y, połącz pomiary tej samej osoby linią (`group = id`).

**Zad. 8.** (zamknięte) Którą funkcją `tidyr` przechodzisz z formatu szerokiego na długi?
`pivot_wider()` · `pivot_longer()` · `separate()` · `unite()`

**Zad. 9.** (zamknięte) Aby z kolumny `"PL-KRK"` zrobić kolumny `kraj` i `miasto`:
`unite(df, kraj, miasto, sep="-")` · `separate(df, kol, into=c("kraj","miasto"), sep="-")` ·
`str_split(df$kol)`

**Zad. 10.** (zamknięte) Wykres hantelkowy (dumbbell, `geom_dumbbell` z `ggalt`) wymaga
danych w formacie:
długim (long) · szerokim (wide) · zagnieżdżonym (nested)

**Zad. 11.** (zamknięte) `pivot_wider()` zastosowane do danych z zad. 2:
wróci do formatu szerokiego · da to samo co pivot_longer · zwróci błąd
