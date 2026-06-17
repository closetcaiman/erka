# Arkusz 05 — rozwiązania

**Zad. 1.**
```r
aq <- read.csv("data/q1_data.csv")
mean(aq$Ozone)                 # NA — każde działanie z NA daje NA
mean(aq$Ozone, na.rm = TRUE)   # 42.1293
sum(is.na(aq$Ozone))           # 37
```
**Odp.: `mean` zwraca `NA`, bo w kolumnie są braki; trzeba `na.rm = TRUE`. Średnia
≈ 42,13; braków 37.**

**Zad. 2.**
```r
library(dplyr)
aq %>% group_by(Month) %>% summarise(srednia_temp = mean(Temp))
# baza: tapply(aq$Temp, aq$Month, mean)
```
**Odp.: V 65,6 · VI 79,1 · VII 83,9 · VIII 84,0 · IX 76,9.**

**Zad. 3.**
```r
aq %>% group_by(Month) %>%
  summarise(o = mean(Ozone, na.rm = TRUE)) %>% arrange(desc(o)) %>% head(1)
```
**Odp.: miesiąc 8 (sierpień), ≈ 60,0.**

**Zad. 4.**
```r
cor(aq$Ozone, aq$Temp, use = "complete.obs")   # 0.6984
```
**Odp.: ≈ 0,70.**

**Zad. 5.**
```r
sum(complete.cases(aq))    # 111
nrow(aq)                   # 153
```
**Odp.: 111 z 153.**

**Zad. 6.**
```r
mean(aq$Ozone[aq$Temp > 80], na.rm = TRUE)   # 64.148
```
**Odp.: ≈ 64,15.**

**Zad. 7.**
```r
cor(aq[, c("Ozone","Solar.R","Wind","Temp")], use = "complete.obs")
```
**Odp.: najsilniej DODATNIO Ozone–Temp (0,699); najsilniej UJEMNIE Ozone–Wind (−0,612).**

**Zad. 8.** → **numeric** (`TRUE` → `1`).

**Zad. 9.** → **wektor znakowy z literą „a"** (`[[ ]]` wyciąga element).

**Zad. 10.** → **macierz 2×3** (każdy wektor = wiersz).

**Zad. 11.** → **loess**.

**Zad. 12.** → **`cor(x, y, use = "complete.obs")`** (`cor` nie ma `na.rm`).
