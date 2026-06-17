# Opis datasetów (data-bank)

Katalog wszystkich danych z laboratoriów: każdy zbiór z **gotowym sposobem wczytania**
i wskazaniem, jaką umiejętność trenuje. To Twoja ściąga „czym to otworzyć" na kolokwium.

> Dane są skopiowane do poszczególnych testów: każdy `tests/<nazwa>/` ma podkatalog
> `data/` z plikami, których potrzebuje. W kodzie czytaj je ścieżką `data/...`
> (po ustawieniu katalogu roboczego na folder testu).

> ⚠️ Najważniejsza pułapka: polskie pliki używają separatora `;` i przecinka
> dziesiętnego (`0,17`). Wczytujesz je przez `read.csv2()` / `readr::read_csv2()`,
> **nie** `read.csv()`. Pliki „amerykańskie" mają `,` jako separator i `.` jako
> kropkę dziesiętną → `read.csv()` / `read_csv()`.

---

## Polskie datasety statystyczne (separator `;`, przecinek dziesiętny)

| Plik | Wczytanie | Kolumny | Trenuje |
|------|-----------|---------|---------|
| `Polisy.csv` | `read.csv2("Polisy.csv")` | Szkoda(Tak/Nie), Plec, Wiek_kierowcy, Czas_eksploatacji | filtrowanie, grupowanie, średnie wg grup, join |
| `Korozja.csv` | `read.csv2("Korozja.csv")` | Rodzaj.powłoki (A/B), Głębokość.uszkodzenia | **boxplot wg grupy + odczyt mediany/średniej** |
| `Prochnica.csv` | `read.csv2("Prochnica.csv")` | Próchnica (num), Substancja_słodząca (4 poziomy) | boxplot, `tapply`/`group_by` średnie |
| `Czas reakcji.csv` | `read.csv2("Czas reakcji.csv")` | Reakcja_przed, Reakcja_po | dane **szerokie → długie** (`pivot_longer`), różnice par |
| `Zawaly.xlsx` | `readxl::read_excel("Zawaly.xlsx")` | 15 kolumn medycznych (Plec, Wiek, BMI, Cholesterol...) | Excel, filtr/grupy, statystyki wg płci |

Uwaga: po `read.csv2` nazwy z polskimi znakami i spacjami stają się np.
`Rodzaj.powłoki`, `Głębokość.uszkodzenia`. Sprawdzaj `names(df)`.

---

## Datasety z kursu Johns Hopkins (separator `,`, kropka dziesiętna)

| Plik | Wczytanie | Co to | Trenuje |
|------|-----------|-------|---------|
| `q1_data.csv` | `read.csv("q1_data.csv")` | zbiór `airquality` (Ozone, Solar.R, Wind, Temp, Month, Day) | **NA (`na.rm=TRUE`)**, grupy wg Month |
| `gaData.csv` | `read.csv("gaData.csv")` | date + visitsTumblr (601 dni) | **daty** (`as.Date`, `format`, `weekdays`), regresja |
| `GDP.csv` | `read.csv("GDP.csv", skip=5, header=FALSE)` + czyszczenie | ranking PKB krajów (2024); liczby z **przecinkami** i spacjami, śmieci w nagłówku | `gsub` przecinki, `as.numeric`, sort, regex nazw |
| `FEDSTATS_Country.csv` | `read.csv("FEDSTATS_Country.csv")` | metadane krajów: `CountryCode`, `Income.Group`, `Special.Notes` (rok fiskalny) | **join z GDP** po kodzie kraju, grupy, regex roku fiskalnego |
| `cel_volden_wiseman.csv` | `read.csv(...)` | kongresmeni USA: les, congress, dem, female, st_name, thomas_name | filtr/grupy, **parsowanie nazwisk stringr**, facety |
| `cces_sample.csv` | `read.csv(...)` | ankieta (kody liczbowe), codebook w `cces_sample_codebook.txt` | rekodowanie czynników, `factor`, `recode` |
| `szpitale_usa.zip` | `unzip` → `read.csv("outcome-of-care-measures.csv")` | 2 pliki: outcome + hospital-data | **join** po `Provider.Number`, sort/filtr, NA |
| `olive_data.zip` | `unzip` → `load("olive.rda")` → obiekt `olive` | skład kwasów oliwy + Region/Area | **tidymodels** (klasyfikacja Region), EDA |
| `CUsers...specdata.zip` | `unzip` → folder `specdata/` z 332 plikami `001.csv`..`332.csv` | pomiary pyłów (Date, sulfate, nitrate, ID) | **pętla po plikach**, funkcje `pollutantmean/complete/corr` |
| `hurricanes_data.zip` | `unzip` → `read_fwf("ebtrk_atlc_1988_2015.txt", ...)` | huragany, format **stałej szerokości**, promienie wiatru w 4 ćwiartkach × 3 progi (szeroki!) | `read_fwf`, **wide → long** |
| `MIE.zip` | `unzip` → `read.csv("MIE.csv")` | dane do wizualizacji | ggplot |
| `quiz_data.zip` | `unzip` → `aqs_sites.xlsx` + `daily_SPEC_2014.csv.bz2` | stacje pomiarowe EPA | join, xlsx, `.bz2` |
| `aqs_sites.xlsx` | `readxl::read_excel(...)` | metadane stacji pomiarowych | Excel |

---

## Duże datasety (projekty EDA / Reproducible Research — raczej nie na kolokwium, ale warto znać)

| Plik | Wczytanie | Co to |
|------|-----------|-------|
| `data_household_power_consumption.zip` | `read.csv2("household_power_consumption.txt", na.strings="?")` (separator `;`!) | zużycie energii, projekt EDA #1 |
| `data_NEI_data.zip` | `readRDS("summarySCC_PM25.rds")`, `readRDS("Source_Classification_Code.rds")` | emisje PM2.5, projekt EDA #2 (`.rds`!) |
| `data_StormData.csv.bz2` | `read.csv("data_StormData.csv.bz2")` (R czyta `.bz2` wprost) | zdarzenia pogodowe, Reproducible Research |

---

## Pary datasetów do złączeń (zadania „2 zbiory naraz")

- **`GDP.csv` + `FEDSTATS_Country.csv`** — po kodzie kraju (`kod` ↔ `CountryCode`).
  Ćwiczysz w `tests/kolokwium-2025-pkb/`.
- **`daily_SPEC_2014.csv.bz2` + `aqs_sites.xlsx`** — po złożonym kluczu
  (State Code + County Code + Site Num/Number). Ćwiczysz w `tests/09-daily-spec-2-zbiory/`.
- **`outcome-of-care-measures.csv` + `hospital-data.csv`** — po `Provider.Number`.
  Ćwiczysz w `tests/03-join-sort-filtr/` i `tests/10-szpitale-2-zbiory/`.

## Ściąga: który `read.*` do czego

```r
read.csv("plik.csv")                 # , separator + . dziesiętne (USA)
read.csv2("plik.csv")                # ; separator + , dziesiętne (PL/EU)
read.csv("plik.csv", sep=";", dec=",")   # ręcznie to samo co read.csv2
readr::read_csv("plik.csv")          # tibble, , separator
readr::read_csv2("plik.csv")         # tibble, ; separator + , dziesiętne
readxl::read_excel("plik.xlsx")      # Excel; arkusz: sheet = "Arkusz1"
readRDS("plik.rds")                  # pojedynczy obiekt R -> przypisz: x <- readRDS(...)
load("plik.rda")                     # wczytuje obiekt(y) pod ICH nazwami do środowiska
readr::read_fwf("plik.txt", fwf_widths(c(...)))  # stała szerokość kolumn
unzip("archiwum.zip")                # rozpakowanie; potem zwykłe read.*
read.csv("plik.csv.bz2")             # R rozpakowuje bz2/gz w locie
```
