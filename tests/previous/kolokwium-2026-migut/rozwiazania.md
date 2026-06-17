# Kolokwium z innej grupy — rozwiązania

**Zad. 1.**
```r
out <- read.csv("data/outcome-of-care-measures.csv", stringsAsFactors = FALSE)
hos <- read.csv("data/hospital-data.csv", stringsAsFactors = FALSE)
library(dplyr)
nrow(inner_join(out, hos, by = "Provider.Number"))   # 4706
out$ha <- as.numeric(out[[11]])
mean(out$ha, na.rm = TRUE)                            # 15.449
```
**Odp.: 4706 dopasowań; krajowa średnia ≈ 15,45.**

**Zad. 2.**
```r
out %>% filter(State == "TX", !is.na(ha)) %>% arrange(ha) %>% slice(1) %>% pull(Hospital.Name)
```
**Odp.: CYPRESS FAIRBANKS MEDICAL CENTER (śmiertelność 12).**

**Zad. 3.**
```r
library(tidyr)
cr <- read.csv2("data/Czas reakcji.csv")
cr %>% mutate(id = row_number()) %>%
  pivot_longer(c(Reakcja_przed, Reakcja_po), names_to = "moment", values_to = "czas") %>%
  group_by(moment) %>% summarise(srednia = mean(czas))
```
**Odp.: Reakcja_przed ≈ 0,2012; Reakcja_po ≈ 0,2688.**

**Zad. 4.**
```r
library(stringr)
cel <- read.csv("data/cel_volden_wiseman.csv", stringsAsFactors = FALSE)
cel$nazwisko <- str_extract(cel$thomas_name, "^[^,]+")
sum(str_detect(cel$thomas_name[cel$congress == 110], "^M"))    # 48
```
**Odp.: 48.**

**Zad. 5.**
```r
pr <- read.csv2("data/Prochnica.csv")
boxplot(Próchnica ~ Substancja_słodząca, data = pr)
tapply(pr$Próchnica, pr$Substancja_słodząca, mean)
```
**Odp.: Sacharoza (≈ 38,7).**

**Zad. 6.**
```r
pol <- read.csv2("data/Polisy.csv")     # PL: ; + , dziesiętne
nrow(pol)                               # 348
mean(pol$Szkoda == "Tak") * 100         # 20.40 %
```
**Odp.: 348 obserwacji; ≈ 20,4% szkód.**

**Zad. 7.** → **`initial_split()`**.

**Zad. 8.** → **`facet_grid()`** (`facet_wrap()` to jedna zmienna).
