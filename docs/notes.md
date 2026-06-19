# NOTATKI — kolokwium z R (ściąga / schematy)

Reguła nr 1 na kolokwium: **zawsze dołącz kod** (nawet do pytań zamkniętych).
Sama odpowiedź bez kodu = nie zaliczone (tak piszą wytyczne).

Nagłówek pliku z kodem (wymagany):

```r
# Imię Nazwisko, nr indeksu: ......, grupa: ......
# Data: ....-..-..
# Kolokwium R
# --- Zadanie 1 ---
```

Spis treści:

1. Wczytywanie danych
2. Czyszczenie / zmiana formatu danych
3. Szybkie poznanie ramki
4. dplyr — przetwarzanie ramek
5. tidyr — szeroki ↔ długi
6. stringr / wyrażenia regularne
7. Wektory, listy, typy (podstawy R)
8. Wykresy bazowe + boxplot
9. ggplot2 (w tym facety)
10. tidymodels (ML)
11. Debugowanie i profilowanie
12. testthat
13. „Przepisy" pod 8 typowych zadań

---

## 1. Wczytywanie danych

```r
# PL: średnik + przecinek dziesiętny           USA: przecinek + kropka
read.csv2("plik.csv")                          read.csv("plik.csv")
read.csv("plik.csv", sep=";", dec=",")         readr::read_csv("plik.csv")
readr::read_csv2("plik.csv")

readxl::read_excel("plik.xlsx", sheet = 1)     # Excel
readRDS("plik.rds")            -> x <- readRDS("plik.rds")   # 1 obiekt
load("plik.rda")               # ładuje obiekty pod ich nazwami
unzip("dane.zip")              # rozpakuj, potem read.*
read.csv("plik.csv.bz2")       # R sam rozpakuje .bz2/.gz
readr::read_fwf("p.txt", readr::fwf_widths(c(6,5,4), c("a","b","c")))  # stała szerokość

# Przydatne argumenty:
read.csv("p.csv",
         stringsAsFactors = FALSE,   # nie zamieniaj tekstu na factor (domyślnie i tak FALSE w R>=4)
         na.strings = c("NA","","?","Not Available"),  # co traktować jako brak
         header = TRUE,
         encoding = "UTF-8")         # albo fileEncoding = "latin1" dla polskich znaków

setwd("ścieżka")        # katalog roboczy; getwd() pokazuje obecny
list.files("specdata")  # lista plików (np. do pętli)
```

Wczytanie wielu plików (jak specdata 001.csv..332.csv):

```r
pliki <- list.files("specdata", full.names = TRUE)      # wektor ścieżek
lista <- lapply(pliki, read.csv)                        # lista ramek
all   <- do.call(rbind, lista)                          # sklej w jedną ramkę
# lub: all <- dplyr::bind_rows(lista)
```

---

## 2. Czyszczenie / zmiana formatu danych

```r
# Przecinki jako separator TYSIĘCY ("1,234,567" -> 1234567):
x <- gsub(",", "", df$pkb)          # usuń przecinki (tekst)
df$pkb <- as.numeric(x)             # zamień na liczbę
mean(df$pkb, na.rm = TRUE)

# Przecinek jako kropka DZIESIĘTNA w tekście ("0,17" -> 0.17):
as.numeric(sub(",", ".", "0,17"))   # 0.17  (sub = pierwsze wystąpienie)
# (zwykle lepiej od razu read.csv2, które robi to za Ciebie)

# Konwersje typów:
as.numeric(x); as.integer(x); as.character(x); as.factor(x); as.logical(x)
as.numeric(as.character(f))         # factor -> liczba: NAJPIERW na character!

# Czynniki (factor) i ich poziomy:
f <- factor(v, levels = c("niski","średni","wysoki"))   # własna kolejność
levels(f); nlevels(f); table(f)

# Daty:
d <- as.Date("2011-01-15")                  # domyślny format ISO
as.Date("15/01/2011", format = "%d/%m/%Y")  # inny format
format(d, "%Y")          # rok jako tekst "2011"
weekdays(d)              # "sobota"
months(d)                # "styczeń"
as.numeric(format(d, "%Y")) == 2012         # filtr po roku
# Zliczenie poniedziałków w 2012 (wzorzec quantmod):
sum(format(daty,"%Y")=="2012" & weekdays(daty)=="poniedziałek")

# Braki danych (NA):
is.na(x); sum(is.na(x)); complete.cases(df)
mean(x, na.rm = TRUE); na.omit(df); tidyr::drop_na(df)
```

---

## 3. Szybkie poznanie ramki

```r
str(df)        # struktura: typy kolumn — RÓB TO ZAWSZE NA START
head(df, 3); tail(df)
dim(df); nrow(df); ncol(df)
names(df) / colnames(df)
summary(df)            # min/max/kwartyle/średnia/NA
class(df$kol); sapply(df, class)
table(df$grupa)        # liczności kategorii
unique(df$grupa); length(unique(df$grupa))
```

---

## 4. dplyr — przetwarzanie ramek

```r
library(dplyr)
df %>%                          # potok: wynik lewej strony -> 1. argument prawej
  filter(wiek > 30, plec == "Kobieta") %>%   # wiersze spełniające warunki (AND)
  select(imie, wiek, pensja) %>%             # wybór kolumn (lub -kolumna by usunąć)
  mutate(pensja_tys = pensja/1000) %>%       # nowa/zmieniona kolumna
  arrange(desc(pensja)) %>%                  # sortowanie malejąco (bez desc = rosnąco)
  group_by(dzial) %>%
  summarise(n = n(),
            srednia = mean(pensja, na.rm = TRUE),
            mediana = median(pensja, na.rm = TRUE)) %>%
  ungroup()

# Inne częste:
distinct(df, kol)            # unikalne
count(df, grupa)             # = group_by + summarise(n=n())
slice(df, 13)                # 13. wiersz (po posortowaniu = 13. kraj/obs.)
slice_max(df, kol, n = 5)    # top 5 wg kol
rename(df, nowa = stara)
pull(df, kol)                # kolumna jako wektor

# Inne pomocne:
n_distinct(df$kol)                       # liczba unikalnych (= length(unique()))
slice_min(df, kol, n = 1)                # wiersz(e) o najmniejszej wartości kol
slice_max(df, kol, n = 5)                # 5 o największej
df %>% group_by(g) %>% slice_min(x, n=1) # najlepszy W KAŻDEJ grupie
# mutate W OBRĘBIE grupy (porównanie z średnią grupy):
df %>% group_by(g) %>% mutate(sr = mean(x)) %>% ungroup() %>%
  summarise(ilu = sum(x > sr))           # ile rekordów powyżej średniej swojej grupy

# Łączenie ramek (JOIN) po wspólnym kluczu:
inner_join(a, b, by = "kod")             # tylko pasujące w obu
left_join(a, b, by = "kod")              # wszystkie z a (braki -> NA)
full_join(a, b, by = "kod")              # wszystkie z obu
inner_join(a, b, by = c("kodA" = "kodB")) # różne nazwy klucza
semi_join(a, b, by = "kod")              # wiersze a, które MAJĄ parę w b (nie dokleja kolumn)
anti_join(a, b, by = "kod")              # wiersze a, które NIE mają pary w b
# Ile pasuje: nrow(inner_join(a, b, by="kod"))
# Klucz ZŁOŻONY (kilka kolumn): by = c("State","County","Site")
# PUŁAPKA: jeśli klucz w jednej ramce to tekst "06"/"081", a w drugiej liczba 6/81,
#   join rzuci błąd typów. Ujednolic: mutate(k = as.integer(kol)) po obu stronach.

# Bez dplyr (baza R) — to samo:
df[df$wiek > 30, ]                       # filtr
df[order(df$pensja, decreasing = TRUE), ]# sort
aggregate(pensja ~ dzial, df, mean)      # grupowa średnia
tapply(df$pensja, df$dzial, mean)        # średnia pensji wg działu
merge(a, b, by = "kod")                  # join (domyślnie inner)
```

---

## 5. tidyr — szeroki ↔ długi (BARDZO PRAWDOPODOBNE)

```r
library(tidyr)
# SZEROKI -> DŁUGI: kilka kolumn-wartości -> kolumna "typ" + kolumna "wartość"
# Dane: produkt | Q1 | Q2 | Q3 | Q4   ->   produkt | kwartal | sprzedaz
long <- df %>%
  pivot_longer(cols = c(Q1, Q2, Q3, Q4),   # albo cols = Q1:Q4 / starts_with("Q")
               names_to = "kwartal",
               values_to = "sprzedaz")
# starszy odpowiednik: gather(df, kwartal, sprzedaz, Q1:Q4)

# DŁUGI -> SZEROKI: odwrotnie
wide <- long %>%
  pivot_wider(names_from = kwartal, values_from = sprzedaz)
# starszy odpowiednik: spread(long, kwartal, sprzedaz)

# Rozbicie / sklejenie kolumn:
separate(df, kol, into = c("a","b"), sep = "-")   # "PL-KRK" -> "PL","KRK"
unite(df, "razem", a, b, sep = "-")

# Typowy ciąg "przerób format, potem licz":
df %>%
  pivot_longer(Q1:Q4, names_to="kwartal", values_to="x") %>%
  group_by(kwartal) %>%
  summarise(srednia = mean(x, na.rm = TRUE))

# pivot_wider gdy na klucz przypada WIELE wartości (np. kilka pomiarów w dniu):
# najpierw zagreguj (uśrednij), bo inaczej dostaniesz listy zamiast liczb:
df %>% group_by(data, typ) %>% summarise(v = mean(wartosc), .groups="drop") %>%
  pivot_wider(names_from = typ, values_from = v)
# albo od razu: pivot_wider(..., values_fn = mean)
```

---

## 6. stringr / wyrażenia regularne (prowadzący zapowiadał stringr)

```r
library(stringr)
str_detect(x, "wzor")        # TRUE/FALSE czy zawiera     (baza: grepl)
str_subset(x, "wzor")        # zwraca pasujące elementy    (baza: grep(..., value=TRUE))
str_which(x, "wzor")         # indeksy pasujących          (baza: grep)
str_extract(x, "[0-9]+")     # pierwszy pasujący fragment
str_extract_all(x, "[0-9]+") # wszystkie (lista)
str_replace(x, "a", "b")     # zamiana 1. (baza: sub)
str_replace_all(x, "a", "b") # zamiana wszystkich (baza: gsub)
str_split(x, "-")            # podział na listę
str_sub(x, 1, 3)             # podciąg po pozycjach (baza: substr)
str_length(x); str_to_lower(x); str_to_upper(x); str_trim(x)
str_pad(x, 3, pad="0")       # "1" -> "001"

# Wyrażenia regularne (regex):
"^United"     # zaczyna się od "United"      grep("^United", v)
"land$"       # kończy się na "land"
"[0-9]+"      # jedna lub więcej cyfr
"[A-Za-z]+"   # litery
"\\."         # kropka dosłownie (escape)
"a.b"         # a, dowolny znak, b
"colou?r"     # opcjonalne u
"(cat|dog)"   # alternatywa
# Zliczenie ilu pasuje:  length(grep("^United", v))  albo  sum(str_detect(v,"^United"))

# Wyciągnięcie liczby z tekstu "temp: 23.5C" -> 23.5
as.numeric(str_extract("temp: 23.5C", "[0-9]+\\.?[0-9]*"))
# Nazwisko z "Kowalski, Jan" -> "Kowalski"
str_extract("Kowalski, Jan", "^[^,]+")     # wszystko do pierwszego przecinka
word("Kowalski Jan", 1)                    # pierwsze słowo
```

---

## 7. Wektory, listy, typy (z quizu „podstawy R")

```r
# Typy atomowe: logical, integer, numeric (double), complex, character.
#   NIE są atomowe: list, data.frame, matrix, array, factor, table.
# Wektor: wszystkie elementy TEJ SAMEJ klasy. Mieszanie -> KOERCJA (wymuszenie):
c(4, TRUE)            # -> numeric  c(4, 1)
c(1, "a")             # -> character
c(1L, 2L)             # integer
class(x <- 4)         # "numeric" (NIE integer! 4L byłoby integer)

# Nazwa zmiennej NIE może zaczynać się od cyfry: 10var <- 5  # BŁĄD

# Indeksowanie / podstawianie warunkowe:
x[x > 10] <- 4        # ustaw elementy >10 na 4
x[c(1,3)]; x[-1]; x[x %% 2 == 0]

# Lista — może mieszać typy:
l <- list(2, "a", TRUE)
l[[2]]                # "a"  (pojedynczy element, wektor długości 1)
l[2]                  # lista z jednym elementem

# Recycling (zawijanie): x + y dopasowuje krótszy do dłuższego
1:4 + 2               # 3 4 5 6   (2 powtórzone)

# rbind / cbind:
rbind(c(1,3,5), c(3,2,10))   # macierz 2x3 (2 wiersze, 3 kolumny)
cbind(a, b)                  # kolumnami
```

---

## 8. Wykresy bazowe + boxplot (z quizu „podstawy grafiki")

```r
# Boxplot wg grupy + ODCZYT mediany/średniej:
boxplot(Głębokość.uszkodzenia ~ Rodzaj.powłoki, data = df)
# Gruba kreska w pudełku = MEDIANA (nie średnia!). Liczbowo:
tapply(df$Głębokość.uszkodzenia, df$Rodzaj.powłoki, median)
tapply(df$Głębokość.uszkodzenia, df$Rodzaj.powłoki, mean)
boxplot(x)$stats     # min, Q1, mediana, Q3, max (dokładne wartości pudełka)

# System bazowy:
plot(x, y)                  # tworzy wykres (jedno wywołanie)
points(x, y); lines(x, y); abline(h=0); title("Tytuł")   # DODAJĄ do istniejącego
hist(x); barplot(t); pairs(df)
par(pch = 19, mfrow = c(1,2))   # pch = kształt punktu; mfrow = siatka 1x2

# Urządzenia graficzne (devices):
#  Bitmapowe (rastrowe): png, jpeg, tiff, bmp — dobre dla MNÓSTWA punktów.
#  Wektorowe: pdf, postscript (svg) — skalowalne bez utraty jakości.
# Zapis do pliku — schemat ZAWSZE:
pdf("rys.pdf")              # 1) otwórz urządzenie
plot(x, y)                 # 2) rysuj
dev.off()                  # 3) zamknij (BEZ tego plik się nie zapisze!)
# albo skopiuj z ekranu:  dev.copy2pdf(file = "rys.pdf")
```

---

## 9. ggplot2 (w tym FACETY — prawie pewne pytanie)

```r
library(ggplot2)
ggplot(data = df, aes(x = ht, y = wt)) +   # + MUSI być na końcu linii, nie na początku!
  geom_point()
# data MUSI być data.frame/tibble.

# Kolor wg kategorii — zmienną kategoryczną wrzuć do aes():
ggplot(df, aes(x=h, y=w, color = factor(id))) + geom_point()
# (numeric id -> najpierw factor(id), żeby dostać paletę dyskretną)
# Stały kolor (nie wg danych) -> POZA aes():  geom_point(color = "red")

geom_point(aes(size = Volume))   # rozmiar wg zmiennej
geom_line(); geom_col(); geom_histogram(); geom_boxplot(); geom_area()
geom_smooth(method = "lm")       # prosta regresji (OLS). domyślnie method="loess"

# FACETY = małe wielokrotności:
facet_wrap(~ zmienna)                       # jedna zmienna, panele „zawijane"
facet_grid(wiersz ~ kolumna)                # SIATKA wg dwóch zmiennych
facet_grid(var1 ~ var2, scales = "free")    # osie niezależne w panelach
#   ^ to była odpowiedź w zeszłorocznym kolokwium! tylda ~ rozdziela zmienne.
facet_grid(. ~ var2)   # tylko kolumny;   facet_grid(var1 ~ .) tylko wiersze

# Skale / zakresy osi:
scale_x_continuous(limits = c(0, 100))   # ogranicz oś x
xlim(0,100); ylim(0,10); labs(title="...", x="...", y="...")

# Zapis ggplota do PDF:
pdf("MyFig.pdf"); print(ggplot(...) + geom_point()); dev.off()
ggsave("MyFig.pdf", width = 6, height = 4)   # wygodniejsze
```

---

## 10. tidymodels (ML — zapowiedziane 1 pytanie, zwykle ZAMKNIĘTE o nazwę funkcji)

```r
library(tidymodels)
set.seed(123)
podzial   <- initial_split(dane, prop = 0.75, strata = Region)  # PODZIAŁ train/test
treningowe <- training(podzial)     # zbiór treningowy
testowe    <- testing(podzial)      # zbiór testowy

# Przepis (recipe) — przygotowanie cech:
przepis <- recipe(Region ~ ., data = treningowe) %>%
  step_normalize(all_numeric_predictors())

# Model (parsnip):
model <- rand_forest() %>% set_engine("ranger") %>% set_mode("classification")
# logistic_reg(), linear_reg(), decision_tree(), nearest_neighbor()...

# Workflow = przepis + model, potem trenowanie i predykcja:
wf  <- workflow() %>% add_recipe(przepis) %>% add_model(model)
fit <- fit(wf, data = treningowe)
pred <- predict(fit, new_data = testowe)
metrics(bind_cols(testowe, pred), truth = Region, estimate = .pred_class)

# Walidacja krzyżowa:  vfold_cv(treningowe, v = 5)
```

**Najczęstsze pytania zamknięte (zapamiętaj nazwy!):**

- podział na train/test → `initial_split()` (potem `training()` / `testing()`)
- przygotowanie cech → `recipe()` + `step_*()`
- definicja modelu → `parsnip` (`rand_forest`, `linear_reg`, `set_engine`, `set_mode`)
- spięcie → `workflow()`; trenowanie → `fit()`; predykcja → `predict()`
- metryki → pakiet `yardstick` (`metrics`, `accuracy`, `rmse`, `roc_auc`)
- walidacja krzyżowa → `vfold_cv()`

---

## 11. Debugowanie i profilowanie (z quizu „debugowanie")

```r
traceback()        # stos wywołań TUŻ PO błędzie (gdzie pękło)
browser()          # wstaw w funkcję -> interaktywne krokowe debugowanie
debug(f)           # wchodzi w debuger przy każdym wywołaniu f; undebug(f)
trace("f")         # komunikat / wstrzyknięcie kodu przy każdym wywołaniu f; untrace
recover()          # wybór ramki ze stosu po błędzie
tryCatch(expr, error = function(e) ...)   # własna obsługa błędów
try(expr)          # kontynuuj mimo błędu (zwraca "try-error")

# Wydajność:
system.time(expr)       # user (czas CPU) / system / elapsed (czas zegara)
microbenchmark::microbenchmark(f1(), f2())   # porównaj szybkość kilku funkcji
Rprof()  ...  Rprof(NULL); summaryRprof()    # próbkowanie stosu w czasie
profvis::profvis(expr)  # interaktywna wizualizacja profilu w RStudio
# microbenchmark -> porównanie funkcji; profvis -> które fragmenty JEDNEJ funkcji są wolne
```

---

## 12. testthat (prowadzący: „zaawansowane możliwości testthat")

```r
library(testthat)
test_that("opis testu", {
  expect_equal(suma(2,2), 4)              # równość (z tolerancją na liczby)
  expect_identical(x, y)                  # ścisła identyczność
  expect_true(is.numeric(x))
  expect_error(log("a"))                  # czy rzuca błąd
  expect_warning(as.numeric("a"))
  expect_length(v, 3)
  expect_match("abc", "b")                # pasuje do regex
  expect_equal(nrow(df), 100)
})
test_file("testy.R")    # uruchom plik z testami
# Zaawansowane: expect_snapshot(), skip_if_not(), fixtures, expect_setequal()
```

---

## 13. „Przepisy" pod 8 typowych zadań kolokwium

1. **Wczytaj + oczyść + średnia** → `read.csv2(...)`; jeśli liczby jako tekst:
   `as.numeric(gsub(",","",kol))`; potem `mean(..., na.rm=TRUE)`.

2. **Połącz 2 ramki + policz** → `inner_join(a,b,by="kod")`; ile pasuje =
   `nrow(...)`; potem `summarise(mean(...))`.

3. **Sortuj + filtruj + odczytaj wartość** → `arrange(desc(x))` / `order()`,
   `filter(...)`, a potem `slice(n)` lub `df[n, "kol"]` (np. „13. kraj").

4. **Szeroki → długi** → `pivot_longer(cols=..., names_to=, values_to=)`,
   potem `group_by` + `summarise`.

5. **Ekstrakcja ze stringa** → `str_extract`, `separate`, `grep`/`grepl`,
   regex `^`, `$`, `[0-9]+`. Liczba pasujących = `length(grep(...))`.

6. **Boxplot + odczyt** → `boxplot(y ~ grupa)`; kreska = MEDIANA;
   liczbowo `tapply(y, grupa, median)` / `mean`.

7. **tidymodels** → zwykle ZAMKNIĘTE: `initial_split`, `training`/`testing`,
   `recipe`, `workflow`, `fit`, `predict`.

8. **ggplot facet** → `facet_grid(var1 ~ var2, scales="free")` /
   `facet_wrap(~ var)`.

### Zadania na DWA datasety (nieoczywiste złączenia)

```r
# 1) wczytaj oba (uwaga na read.csv vs read.csv2 vs read_excel)
# 2) ZNAJDŹ wspólny klucz (czasem złożony: State+County+Site)
# 3) ujednolić typy klucza (zera wiodące "06"->6: mutate(k=as.integer(kol)))
# 4) wybierz join: inner_ (wspólne), left_ (wszystko z a), semi_ (filtr a wg b),
#    anti_ (a bez pary w b)
b_klucz <- meta %>% filter(warunek) %>% distinct(k1, k2, k3)
duze %>% semi_join(b_klucz, by = c("k1","k2","k3")) %>%
  filter(...) %>% group_by(...) %>% summarise(...)
# Miesiąc z daty:  mutate(m = as.integer(format(data, "%m")))
```

### Najczęstsze błędy do uniknięcia

- `read.csv` zamiast `read.csv2` na polskim pliku → wszystko w jednej kolumnie / liczby jako tekst.
- Zapomniany `na.rm = TRUE` → `mean` zwraca `NA`.
- `+` na początku linii w ggplot zamiast na końcu poprzedniej → błąd.
- Brak `dev.off()` → plik PDF/PNG się nie zapisuje.
- `factor` → liczba bez `as.character` w środku → dostajesz kody poziomów, nie wartości.
- Mylenie `sub` (1. wystąpienie) z `gsub` (wszystkie).
- W boxplot kreska to **mediana**, nie średnia.
