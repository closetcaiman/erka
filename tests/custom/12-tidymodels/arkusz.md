# Arkusz 12 — tidymodels (ML): klasyfikacja oliwy

**Dane:** `data/olive.rda` (obiekt `olive`). **Czas:** ~35 min.

Ustaw katalog roboczy na ten folder. Rozwiązania: `rozwiazania.md`.

> `olive`: 572 próbek oliwy, skład 8 kwasów tłuszczowych + `Region` (1/2/3) i `Area` (1–9).
> Cel: nauczyć model rozpoznawać **Region** na podstawie kwasów tłuszczowych.
> Uwaga: `Area` jest pochodną Regionu („ściąga") — usuwamy ją z predyktorów.
> Wczytanie: `load("data/olive.rda")` tworzy obiekt `olive` (NIE `x <- load(...)`).

## Część teoretyczna (zamknięte — to najczęściej pyta prowadzący)

**T1.** Funkcja dzieląca dane na zbiór treningowy i testowy:
`split()` · `train_test_split()` · `initial_split()` · `data_partition()`

**T2.** Po `initial_split()` zbiory wyciągasz funkcjami:
`train()` / `test()` · `training()` / `testing()` · `get_train()` / `get_test()`

**T3.** Przygotowanie/transformacja cech (np. normalizacja) w tidymodels:
`recipe()` + `step_*()` · `prep_data()` · `mutate()` · `transform()`

**T4.** Definicję modelu (typ + silnik + tryb) tworzysz w pakiecie:
`parsnip` · `ggplot2` · `dplyr` · `caret`

**T5.** Połączenie przepisu i modelu w jeden obiekt:
`pipeline()` · `workflow()` · `bind_rows()` · `merge()`

**T6.** Trenowanie modelu / predykcja:
`fit()` / `predict()` · `train()` / `guess()` · `learn()` / `apply()`

**T7.** Ocena jakości (accuracy, rmse, roc_auc) — pakiet:
`yardstick` · `metrics2` · `scales` · `broom`

**T8.** Walidacja krzyżowa k-krotna:
`vfold_cv()` · `crossval()` · `kfold()` · `cv_split()`

## Część praktyczna (do uruchomienia)

**P1.** Wczytaj `data/olive.rda`. Zamień `Region` na `factor`, usuń kolumnę `Area`.

**P2.** Podziel dane 75/25 ze stratyfikacją po `Region` (ustaw `set.seed(123)`).

**P3.** Zbuduj przepis: `Region ~ .` + normalizacja predyktorów numerycznych.

**P4.** Zdefiniuj model drzewa decyzyjnego (silnik `rpart`, tryb klasyfikacja), zepnij
w `workflow`, wytrenuj i policz **accuracy** na zbiorze testowym.
