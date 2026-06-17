# Arkusz 10 — DWA zbiory: szpitale (wyniki leczenia + dane szpitali)

**Dane:** `data/outcome-of-care-measures.csv` (śmiertelność), `data/hospital-data.csv`
(typ/własność/lokalizacja). **Czas:** ~40 min. **Poziom: średni→trudny.**

Ustaw katalog roboczy na ten folder. Rozwiązania: `rozwiazania.md`.

> Łączenie po `Provider.Number`. Kolumny śmiertelności to tekst z `"Not Available"` →
> `as.numeric()` daje `NA`. Schorzenia: kol. 11 = zawał serca (HA), 17 = niewydolność
> serca (HF), 23 = zapalenie płuc (PN).

**Zad. 1.** Połącz oba zbiory (inner join) po `Provider.Number`. Ile rekordów pasuje?

**Zad. 2.** Ile szpitali z `hospital-data.csv` NIE ma odpowiednika w `outcome` (anti-join)?
A ile rekordów `outcome` nie ma pary w `hospital-data`?

**Zad. 3.** Po złączeniu policz średnią śmiertelność po **zapaleniu płuc** (`pn`) wg
`Hospital.Type`. Który typ ma najniższą?

**Zad. 4.** Który `Hospital.Ownership` ma najniższą średnią śmiertelność po
**niewydolności serca** (`hf`)?

**Zad. 5.** Dla każdego stanu znajdź szpital o najniższej śmiertelności po **zawale**
(`ha`). W ilu stanach ten najlepszy szpital jest typu `"Acute Care Hospitals"`?

**Zad. 6.** (zamknięte) `anti_join(a, b, by="k")` zwraca:
wiersze `a` które MAJĄ parę w `b` · wiersze `a` które NIE mają pary w `b` · wiersze wspólne

**Zad. 7.** (zamknięte) Aby dla każdej grupy zostawić wiersz o najmniejszej wartości `x`:
`filter(min(x))` · `group_by() %>% slice_min(x, n=1)` · `summarise(min(x))`

**Zad. 8.** (zamknięte) `left_join(a, b)` w odróżnieniu od `inner_join(a, b)`:
zostawia tylko wspólne klucze · zostawia wszystkie wiersze `a` (braki = NA) ·
zostawia wszystkie wiersze `b`
