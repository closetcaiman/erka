# Arkusz 09 — DWA zbiory: codzienne pomiary PM2.5 + metadane stacji

**Dane:** `data/daily_SPEC_2014.csv.bz2` (pomiary), `data/aqs_sites.xlsx` (metadane stacji).
**Czas:** ~50 min. **Poziom: trudny.**

Ustaw katalog roboczy na ten folder. Rozwiązania: `rozwiazania.md`.

> Odtworzony „Quiz z codziennych pomiarów". Wczytaj pomiary przez `readr::read_csv`
> (R sam rozpakuje `.bz2`), metadane przez `readxl::read_excel`. We wszystkich średnich
> pomijaj braki (`na.rm = TRUE`).
>
> **Pułapka klucza:** w pomiarach `State Code`/`County Code`/`Site Num` wczytują się jako
> tekst z zerami wiodącymi ("06", "081"), a w metadanych jako liczby. Przed złączeniem
> ujednolić typy (np. `as.integer()` po obu stronach).

**Zad. 1.** Jaka jest średnia `Arithmetic Mean` dla `"Bromine PM2.5 LC"` w stanie
**Wisconsin**?
0.003960 · 1.485826 · 0.515084 · 0.458098

**Zad. 2.** Który składnik (`Parameter Name`) ma najwyższą średnią?
Sulfur PM2.5 LC · OC CSN Unadjusted PM2.5 LC TOT · EC2 PM2.5 LC · Sodium PM2.5 LC

**Zad. 3.** Które miejsce (State/County/Site) ma najwyższy średni `"Sulfate PM2.5 LC"`?
48/203/0002 · 31/055/0019 · 10/001/0003 · 39/081/0017

**Zad. 4.** Bezwzględna różnica średnich `"EC PM2.5 LC TOR"` między Kalifornią a Arizoną?
0.018567 · 0.06320775 · 0.17648069 · 0.09476190

**Zad. 5.** Mediana `"OC PM2.5 LC TOR"` na **zachodzie** (Longitude < −100)?
0.5175 · 0.4300 · 0.2600 · 0.0269

**Zad. 6.** (2 zbiory) Ile stacji ma jednocześnie `Land Use == "RESIDENTIAL"` i
`Location Setting == "SUBURBAN"`?
3527 · 1610 · 2233 · 1008

**Zad. 7.** (2 zbiory) Mediana `"EC PM2.5 LC TOR"` wśród stacji RESIDENTIAL+SUBURBAN na
**wschodzie** (Longitude ≥ −100)?
0.6100 · 0.0460 · 0.5880 · 0.1740

**Zad. 8.** (2 zbiory) Wśród stacji `Land Use == "COMMERCIAL"`, który **miesiąc** ma
najwyższy średni `"Sulfate PM2.5 LC"`?
listopad · luty · sierpień · czerwiec

**Zad. 9.** Dla monitora State 6 / County 65 / Site 8001: przez ile **dni** suma
`"Sulfate PM2.5 LC"` i `"Total Nitrate PM2.5 LC"` przekracza 10? (gdy dzień ma wiele
wartości składnika — uśrednij je najpierw)
5 · 11 · 24 · 50
