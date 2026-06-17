# Arkusz 10 — rozwiązania

```r
out <- read.csv("data/outcome-of-care-measures.csv", stringsAsFactors = FALSE)
hos <- read.csv("data/hospital-data.csv", stringsAsFactors = FALSE)
out$ha <- as.numeric(out[[11]]); out$hf <- as.numeric(out[[17]]); out$pn <- as.numeric(out[[23]])
library(dplyr)
```

**Zad. 1.** → **4706**
```r
j <- inner_join(out, hos, by = "Provider.Number"); nrow(j)
```

**Zad. 2.** → **120** szpitali w `hos` bez wyników; **0** rekordów `out` bez pary.
```r
nrow(anti_join(hos, out, by = "Provider.Number"))   # 120
nrow(anti_join(out, hos, by = "Provider.Number"))   # 0
```

**Zad. 3.** → **Acute Care Hospitals** (≈ 12,0)
```r
j %>% filter(!is.na(pn)) %>% group_by(Hospital.Type) %>%
  summarise(n = n(), pn = mean(pn)) %>% arrange(pn)
# Acute Care 12.0 | VA 12.1 | Critical Access 12.4
```

**Zad. 4.** → **Government Federal** (≈ 10,9)
```r
j %>% filter(!is.na(hf)) %>% group_by(Hospital.Ownership) %>%
  summarise(n = n(), hf = mean(hf)) %>% arrange(hf) %>% head(1)
```

**Zad. 5.** → **53 z 54 stanów**
```r
best <- out %>% filter(!is.na(ha)) %>%
  group_by(State) %>% slice_min(ha, n = 1, with_ties = FALSE) %>%
  inner_join(hos, by = "Provider.Number")
nrow(best)                                         # 54 (stany + terytoria)
sum(best$Hospital.Type == "Acute Care Hospitals")  # 53
```

**Zad. 6.** → **wiersze `a` które NIE mają pary w `b`**.

**Zad. 7.** → **`group_by() %>% slice_min(x, n=1)`**.

**Zad. 8.** → **zostawia wszystkie wiersze `a`, dokleja `b`, braki = NA**.
