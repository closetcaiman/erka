# Arkusz 12 — rozwiązania

## Teoria

- **T1** → `initial_split()`
- **T2** → `training()` / `testing()`
- **T3** → `recipe()` + `step_*()`
- **T4** → `parsnip`
- **T5** → `workflow()`
- **T6** → `fit()` / `predict()`
- **T7** → `yardstick`
- **T8** → `vfold_cv()`

## Praktyka — pełny, działający kod

```r
library(tidymodels)   # albo: rsample, recipes, parsnip, workflows, yardstick
load("data/olive.rda")

# P1 — przygotowanie
ol <- olive %>% mutate(Region = factor(Region)) %>% select(-Area)

# P2 — podział train/test (stratyfikacja po klasie)
set.seed(123)
podzial    <- initial_split(ol, prop = 0.75, strata = Region)
treningowe <- training(podzial)     # 428 obs.
testowe    <- testing(podzial)      # 144 obs.

# P3 — przepis (recipe): formuła + kroki przetwarzania
przepis <- recipe(Region ~ ., data = treningowe) %>%
  step_normalize(all_numeric_predictors())

# P4 — model + workflow + trenowanie + ocena
model  <- decision_tree() %>% set_engine("rpart") %>% set_mode("classification")
wf     <- workflow() %>% add_recipe(przepis) %>% add_model(model)
fit_wf <- fit(wf, data = treningowe)

pred <- predict(fit_wf, new_data = testowe) %>%
  bind_cols(testowe %>% select(Region))

accuracy(pred, truth = Region, estimate = .pred_class)   # accuracy = 1.00
conf_mat(pred, truth = Region, estimate = .pred_class)   # idealna macierz

# (opcjonalnie) walidacja krzyżowa:
set.seed(1)
folds <- vfold_cv(treningowe, v = 5, strata = Region)
```

**Wynik: accuracy ≈ 1,00** (kwasy tłuszczowe bardzo dobrze rozdzielają regiony).
Inne modele zamiast `decision_tree()`: `rand_forest()` (silnik `"ranger"`),
`multinom_reg()` / `logistic_reg()`, `nearest_neighbor()`.

## Wariant BEZ tidymodels (gdyby pakietów nie było)

```r
load("data/olive.rda")
ol <- olive; ol$Region <- factor(ol$Region); ol$Area <- NULL
set.seed(123)
idx <- sample(nrow(ol), round(0.75 * nrow(ol)))
train <- ol[idx, ]; test <- ol[-idx, ]

library(rpart)                                  # drzewo decyzyjne
m    <- rpart(Region ~ ., data = train, method = "class")
pred <- predict(m, test, type = "class")
mean(pred == test$Region)                       # ≈ 0,986
table(pred, test$Region)

library(class)                                  # k-NN
knn(scale(train[,-1]), scale(test[,-1]), train$Region, k = 5)   # ≈ 1,00
```

## Łańcuch tidymodels (zapamiętaj kolejność!)

`initial_split` → `training`/`testing` → `recipe` + `step_*` → model (`parsnip`) →
`workflow` (`add_recipe` + `add_model`) → `fit` → `predict` → `metrics`/`accuracy`.
