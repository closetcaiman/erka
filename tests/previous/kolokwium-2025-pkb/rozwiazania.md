# Kolokwium PKB — rozwiązania (dla GDP 2024)

> Liczby policzone w R na tych plikach. Gdyby prowadzący dał plik z innego roku, metoda
> jest identyczna — zmienią się tylko wartości.

Wczytanie i oczyszczenie GDP.csv:

```r
raw <- read.csv("data/GDP.csv", skip = 5, header = FALSE, stringsAsFactors = FALSE)
gdp <- raw[, c(1, 2, 4, 5)]
names(gdp) <- c("kod", "ranking", "kraj", "pkb")
gdp <- gdp[!is.na(suppressWarnings(as.integer(gdp$ranking))) & gdp$kod != "", ]
gdp$ranking <- as.integer(gdp$ranking)
gdp$kraj    <- trimws(gdp$kraj)
gdp$pkb     <- as.numeric(gsub("[ ,]", "", gdp$pkb))   # usuń przecinki I spacje
```

**Zad. 1.** → **209 krajów; średni PKB ≈ 526 206,5 mln USD** (mediana 37 094)

```r
nrow(gdp)                     # 209
mean(gdp$pkb, na.rm = TRUE)   # 526206.5
```

Sedno: `as.numeric(gsub(",", "", x))` — usunięcie przecinków tysięcy.

**Zad. 2.** → **`grep("^United", gdp$kraj)` → 3** (United States, United Kingdom,
United Arab Emirates).

**Zad. 3.** → **199 dopasowań**

```r
fed <- read.csv("data/FEDSTATS_Country.csv", stringsAsFactors = FALSE)
m <- merge(gdp, fed, by.x = "kod", by.y = "CountryCode")
nrow(m)    # 199
```

**Zad. 4.** → **St. Vincent and the Grenadines**

```r
m2 <- m[order(m$ranking, decreasing = TRUE), ]   # albo dplyr::arrange(m, desc(ranking))
m2$kraj[13]
```

(Na samym GDP, bez złączenia, 13. byłby St. Kitts and Nevis — złączenie odsiewa część
krajów, więc kolejność jest inna.)

**Zad. 5.** → **OECD ≈ 32,0; nonOECD ≈ 122,1**

```r
library(dplyr)
m %>% filter(Income.Group %in% c("High income: OECD","High income: nonOECD")) %>%
  group_by(Income.Group) %>% summarise(sredni_ranking = mean(ranking))
```

**Zad. 6.** → **13**

```r
library(stringr)
sum(str_detect(m$Special.Notes, regex("fiscal year end", ignore_case = TRUE)) &
    str_detect(m$Special.Notes, "June"), na.rm = TRUE)
# baza R: sum(grepl("Fiscal year end.*June", m$Special.Notes))
```

**Zad. 7.** → **`initial_split()`**.

**Zad. 8.** → **`facet_grid(var1 ~ var2, scales = "free")`**.
