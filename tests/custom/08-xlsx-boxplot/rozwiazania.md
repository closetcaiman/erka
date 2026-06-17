# Arkusz 08 — rozwiązania

**Zad. 1.**
```r
pr <- read.csv2("data/Prochnica.csv")
table(pr$Substancja_słodząca)
```
**Odp.: 4 poziomy (Glicyna, Glukoza, Sacharoza, Sorbitol) po 12 obserwacji.**

**Zad. 2.**
```r
boxplot(Próchnica ~ Substancja_słodząca, data = pr)
tapply(pr$Próchnica, pr$Substancja_słodząca, mean)
# Glicyna 20.18 · Glukoza 13.01 · Sacharoza 38.70 · Sorbitol 13.09
```
**Odp.: Sacharoza (≈ 38,7).**

**Zad. 3.**
```r
library(readxl)
za <- read_excel("data/Zawaly.xlsx")
dim(za)        # 239 15
```
**Odp.: 239 wierszy, 15 kolumn.**

**Zad. 4.**
```r
library(dplyr)
za %>% group_by(Plec) %>% summarise(srednie_BMI = mean(BMI, na.rm = TRUE))
```
**Odp.: Kobieta ≈ 26,5; Mężczyzna ≈ 27,2.**

**Zad. 5.**
```r
za %>% group_by(Palenie) %>%
  summarise(chol = mean(`Cholesterol calkowity`, na.rm = TRUE))
```
**Odp.: palący ≈ 243, niepalący ≈ 245 → palący mają nieco NIŻSZY (różnica minimalna).**

**Zad. 6.**
```r
tapply(pr$Próchnica, pr$Substancja_słodząca, sd)
# Glicyna 2.73 · Glukoza 2.85 · Sacharoza 4.80 · Sorbitol 2.62
```
**Odp.: Sacharoza (sd ≈ 4,80).**

**Zad. 7.**
```r
library(tidyr)
za %>% select(HDL, LDL, Tg) %>%
  pivot_longer(everything(), names_to = "frakcja", values_to = "wartosc") %>%
  group_by(frakcja) %>% summarise(srednia = mean(wartosc, na.rm = TRUE))
```
**Odp.: HDL ≈ 44,8 · LDL ≈ 166 · Tg ≈ 168.**

**Zad. 8.**
```r
table(za[["Rodzaj zawalu"]])
```
**Odp.: bez zawału 103 · niepełnościenny 51 · pełnościenny 85.**

**Zad. 9.** → **`readxl::read_excel("p.xlsx")`**.

**Zad. 10.** → **backticki** `` `Cholesterol calkowity` ``.

**Zad. 11.** → **`expect_error()`**.

**Zad. 12.** → **`read_excel("p.xlsx", sheet = "Dane")`**.
