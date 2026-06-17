# Arkusz 04 — stringr / regex + filtrowanie i grupy

**Dane:** `data/cel_volden_wiseman.csv` (codebook: `data/cel_data_codebook.txt`).
**Czas:** ~40 min.

Ustaw katalog roboczy na ten folder. Rozwiązania: `rozwiazania.md`.

> Zbiór: kongresmeni USA. Kluczowe kolumny: `thomas_name` (format `"Nazwisko, Imię"`),
> `congress`, `dem` (1 = demokrata), `female` (1 = kobieta), `st_name` (stan),
> `les` (Legislative Effectiveness Score).

**Zad. 1.** Wczytaj dane. Dla `congress == 110` policz średni `les` osobno dla demokratów
i republikanów (`dem`).

**Zad. 2.** Z kolumny `thomas_name` wyciągnij samo **nazwisko** (część przed przecinkiem)
do nowej kolumny `nazwisko`. Użyj `stringr`.

**Zad. 3.** Ilu kongresmenów w `congress == 110` ma nazwisko zaczynające się na literę **„M"**?

**Zad. 4.** Ile kobiet (`female == 1`) zasiadało w `congress == 110`?

**Zad. 5.** Dla `congress == 110` znajdź stan (`st_name`) o najwyższej średniej `les`
(weź tylko stany z co najmniej 5 obserwacjami).

**Zad. 6.** Ile różnych stanów (`st_name`) jest reprezentowanych w `congress == 110`?

**Zad. 7.** Ilu kongresmenów w `congress == 110` ma `les` **powyżej średniej swojego
stanu**? (policz średnią stanu i porównaj z indywidualnym `les`)

**Zad. 8.** Kto był najskuteczniejszym (max `les`) kongresmenem w `congress == 110`?

**Zad. 9.** Wyciągnij ze `thomas_name` także **imię** (część po przecinku) do kolumny
`imie` i usuń wiodącą spację.

**Zad. 10.** Czy w `congress == 110` kobiety miały wyższy średni `les` niż mężczyźni?

**Zad. 11.** (zamknięte) Którą funkcją `stringr` sprawdzisz, czy element tekstu
**zawiera** wzorzec?

- `str_extract()`
- `str_detect()`
- `str_replace()`
- `str_sub()`

**Zad. 12.** (zamknięte) Wyrażenie regularne dla napisów zaczynających się od „United":

- `grep("United$", x)`
- `grep("*United", x)`
- `grep("^United", x)`

**Zad. 13.** (zamknięte) `gsub("a","b",x)` w przeciwieństwie do `sub("a","b",x)`:

- zamienia tylko pierwsze
- zamienia wszystkie
- usuwa litery
