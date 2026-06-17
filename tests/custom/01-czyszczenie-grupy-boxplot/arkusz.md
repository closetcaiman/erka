# Arkusz 01 — czyszczenie danych, grupy, boxplot

**Dane:** `data/Polisy.csv`, `data/Korozja.csv`. **Czas:** ~35 min.

Ustaw katalog roboczy na ten folder (RStudio: Session → Set Working Directory → To Source
File Location). Pełne rozwiązania: `rozwiazania.md`.

> Pliki są polskie (separator `;`, przecinek dziesiętny) — uważaj na funkcję wczytującą.

**Zad. 1.** Wczytaj `data/Polisy.csv`. Ile jest obserwacji (wierszy)? Co się stanie,
jeśli użyjesz `read.csv()` zamiast `read.csv2()`?

**Zad. 2.** Jaki jest średni wiek kierowcy (`Wiek_kierowcy`) osobno dla kobiet i mężczyzn?

**Zad. 3.** Jaki procent polis zakończył się szkodą (`Szkoda == "Tak"`)?

**Zad. 4.** Czy kierowcy ze szkodą mają dłuższy, czy krótszy średni czas eksploatacji
(`Czas_eksploatacji`) niż ci bez szkody? Podaj obie średnie.

**Zad. 5.** Wczytaj `data/Korozja.csv`. Narysuj boxplot głębokości uszkodzenia w
zależności od rodzaju powłoki. Jaka jest **mediana** głębokości dla powłoki A, a jaka
dla B? Czy gruba kreska w pudełku to mediana, czy średnia?

**Zad. 6.** Policz średni wiek kierowcy w rozbiciu na `Plec` **i** `Szkoda` jednocześnie
(4 grupy). Co zaskakującego widać u mężczyzn?

**Zad. 7.** Jaka jest korelacja między `Wiek_kierowcy` a `Czas_eksploatacji`?

**Zad. 8.** Wśród polis ze szkodą (`Szkoda == "Tak"`) jaki procent stanowią kobiety?

**Zad. 9.** Dla `Korozja.csv`: która powłoka ma większy **rozrzut** głębokości
uszkodzenia? Porównaj odchylenie standardowe i IQR dla A i B.

**Zad. 10.** Narysuj boxplot głębokości wg powłoki w **ggplot2**, z powłoką na osi x
i wypełnieniem (`fill`) wg powłoki.

**Zad. 11.** (zamknięte) Która funkcja w `tidymodels` dzieli dane na zbiór treningowy
i testowy?
`split_test_train()` · `train_test_split()` · `initial_split()` · `data_split()`

**Zad. 12.** (zamknięte) Jakich argumentów użyć w `facet_grid()`, aby podzielić wykres
na siatkę wg dwóch zmiennych `var1` i `var2` ze skalami „free"?
`facet_grid(var1 + var2, scales="free")` · `facet_grid(var1 ~ var2, scales="free")` ·
`facet_grid(var1 | var2, scales="free")`

**Zad. 13.** (zamknięte) Co jest kluczową właściwością wektora atomowego w R?
elementy różnych klas · elementy tej samej klasy · długość < 32768 · brak nazw
