# Arkusz 11 — TEORIA (szybka powtórka, 56 pytań zamkniętych)

Pytania zebrane z 11 rozwiązanych quizów (mogą się powtórzyć 1:1). Zakres zgodny z
kolokwium (pominięto Shiny/FlexDashboard — prowadzący: „nie będzie"). Klucz:
`rozwiazania.md`. Zasłoń go i sprawdzaj się.

## A. Podstawy R

1. Co najlepiej opisuje R? *język do statystyki · system operacyjny · edytor „wskaż i kliknij"*
2. Najłatwiejszy sposób zapisu kodu na przyszłość? *konsola · panel skryptów RStudio · Word*
3. (P/F) R po okresie próbnym kosztuje setki dolarów.
4. Które NIE są typami **atomowymi**? *matrix · numeric · list · integer · table · array · data frame · character · logical · complex*
5. Co robi `class()`? *tworzy klasę · przypisuje klasę · zwraca klasę obiektu*
6. Klasa obiektu `x <- 4`? *integer · numeric · complex · vector*
7. Co zrobi `10variable1 <- c(5,19,"a")`? *zapisze wektor · błąd: zła nazwa · błąd: mieszane typy*
8. Klasa `c(4, TRUE)`? *logical · numeric · character · list*
9. Wynik `rbind(c(1,3,5), c(3,2,10))`? *wektor dł. 3 · macierz 3×2 · macierz 2×3 · błąd*
10. Kluczowa właściwość wektora atomowego? *elementy różnych klas · elementy tej samej klasy · max dł. 32768*
11. `x <- list(2,"a","b",TRUE)`; co da `x[[2]]`? *lista z "a" · wektor znakowy "a" (dł. 1) · wektor "a","b"*
12. `x <- 1:4; y <- 2`; wynik `x + y`? *3,2,3,4 · 3,4,5,6 · 1,2,3,6*
13. Jak ustawić elementy `x` > 10 na 4? *`x[x>10] <- 4` · `x[x>10] == 4` · `x[x<10] <- 4`*

## B. Grafika bazowa i urządzenia

14. Zasada grafiki analitycznej? *pokazuj porównania · rysuj max 2 zmienne · używaj kolorów*
15. Rola wykresów eksploracyjnych? *zamiast modelowania · osobiste zrozumienie · czyste osie i legendy*
16. Prawda o base plotting? *tworzone oddzielnymi funkcjami · zawsze 1 wywołanie · auto-marginesy*
17. Prawidłowe urządzenie graficzne? *klawiatura · plik PDF · CSV · folder*
18. Które jest **wektorowe**? *TIFF · PNG · JPEG · Postscript*
19. Formaty bitmapowe najlepsze do? *scatterplot z mnóstwem punktów · zmiana rozmiaru · animacje*
20. Funkcja **dodająca** do istniejącego wykresu? *hist() · points() · boxplot() · plot()*
21. Urządzenie ekranowe w Windows? *postscript() · jpeg() · windows()*
22. Co kontroluje `pch` w `par()`? *etykiety osi · symbol punktu · szerokość linii*
23. Zapis wykresu z ekranu do PDF? *dev.copy2pdf() · png()+dev.off() · pdf.save()*

## C. ggplot2

24. `ggplot()` — `data` musi być? *data frame · lista · wektor znakowy · geom*
25. Błąd, gdy `+` jest na początku 2. linii? *brak danych · R uznał wywołanie za zakończone · zła kolumna*
26. Kolor punktów wg `id` (numeric)? *zostaw numeric + color() · factor(id) + color=id w aes() · color=id w geom_point*
27. Zapis ggplota do PDF? *pdf("f"){...} · dev.on()→dev.off() · pdf("f")→kod→dev.off()*
28. Scatterplot kolorowany wg `variety`? *aes(...,color=variety) bez geom · geom_point(aes(color=variety))*
29. „Małe wielokrotności" (small multiples)? *facet_wrap/facet_grid · wiele geomów · scales*
30. `geom_smooth(method="lm")` dodaje? *linię regresji liniowej · przezroczystość · paletę*
31. Domyślna metoda `geom_smooth` (bez `method`)? *lm · loess · glm · gam*
32. Kolejność paneli przy facetowaniu? *losowa · alfabetycznie/wg poziomów · wg liczby punktów*
33. Ograniczenie zakresu osi x? *scale() · scale_x_continuous() · geom_scale()*
34. Estetyka do **skumulowanego** wykresu obszarowego? *stack · color · fill*
35. geom do wypełnienia pod linią? *geom_area() · geom_fill_line() · geom_stack_line()*
36. Dane do wykresu **hantelkowego** (dumbbell)? *wide · long · nested*
37. Rola `type=` w `ggcorrplot()`? *współczynnik korelacji · pełna/górna/dolna macierz · kształt*

## D. Mapy

38. geom do granic geograficznych? *geom_spatial() · geom_map() · geom_polygon()*
39. aes do kolorowania choropleth? *color · map · fill · shape*
40. Punkty po szer./dł. geograficznej? *geom_bubble() · geom_point() · geom_spatial()*
41. Pakiet do simple features? *rmaps · sf · maps · simplefeatures*
42. geom dla simple features? *geom_sf() · geom_polygon() · geom_map()*
43. Etykiety punktów bez nakładania? *geom_label · geom_text · geom_text_repel*

## E. Debugowanie i wydajność

44. Debugowanie to proces? *szybkiego kodu · obsługi błędów · zgodności oczekiwań z rzeczywistością*
45. Interaktywne krokowe debugowanie? *browser() · stop() · tryCatch()*
46. Tymczasowe wstawianie kodu do funkcji? *browser() · trace() · debug()*
47. Co robi `traceback()`? *flaga debug · stos wywołań po błędzie · wstrzymuje funkcję*
48. Do czego `microbenchmark`? *debugowanie · porównanie szybkości kilku funkcji · obsługa błędów*
49. Analiza wolnych fragmentów **jednej** funkcji? *microbenchmark · profvis*
50. `user time` w `system.time()`? *czas CPU na obliczenia · czas oczekiwania · opóźnienie sieci*

## F. stringr / tidymodels / testthat

51. `str_detect(x, "wzór")` zwraca? *pasujące elementy · TRUE/FALSE · indeksy*
52. Różnica `gsub` vs `sub`? *gsub pierwsze · gsub wszystkie · gsub tylko liczby*
53. Regex „zaczyna się od United"? *grep("United$") · grep("^United") · grep("*United")*
54. Podział na train/test (tidymodels)? *split() · initial_split() · train_test_split()*
55. `facet_grid` siatka 2 zmiennych, free? *facet_grid(v1+v2,scales="free") · facet_grid(v1~v2,scales="free")*
56. `expect_error()` w testthat? *sprawdza równość · czy rzuca błąd · czy zwraca TRUE*
