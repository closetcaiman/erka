# Arkusz 11 — klucz odpowiedzi

**A. Podstawy R**

1. język do statystyki
2. panel skryptów RStudio
3. **Fałsz** (R jest darmowy)
4. **matrix, list, table, array, data frame** (atomowe: logical/integer/numeric/complex/character)
5. zwraca klasę obiektu
6. **numeric** (4L byłoby integer)
7. błąd: zła nazwa (nie może zaczynać się od cyfry)
8. **numeric** (TRUE → 1)
9. **macierz 2×3**
10. elementy tej samej klasy
11. wektor znakowy „a" dł. 1
12. **3,4,5,6** (recycling)
13. `x[x>10] <- 4`

**B. Grafika bazowa i urządzenia**

14. pokazuj porównania
15. osobiste zrozumienie
16. tworzone oddzielnymi funkcjami
17. plik PDF
18. **Postscript**
19. scatterplot z mnóstwem punktów
20. **points()**
21. windows()
22. symbol punktu
23. dev.copy2pdf()

**C. ggplot2**

24. data frame
25. R uznał wywołanie za zakończone (`+` musi być na końcu linii)
26. factor(id) + color=id w aes()
27. pdf("f") → kod → dev.off()
28. geom_point(aes(color=variety))
29. facet_wrap / facet_grid
30. linia regresji liniowej
31. **loess**
32. alfabetycznie / wg poziomów
33. scale_x_continuous()
34. **fill**
35. geom_area()
36. **wide**
37. pełna / górna / dolna macierz korelacji

**D. Mapy**

38. geom_polygon()
39. fill
40. geom_point()
41. **sf**
42. geom_sf()
43. geom_text_repel

**E. Debugowanie i wydajność**

44. zgodność oczekiwań z rzeczywistością
45. browser()
46. trace()
47. stos wywołań po błędzie
48. porównanie szybkości funkcji
49. **profvis**
50. czas CPU na obliczenia

**F. stringr / tidymodels / testthat**

51. TRUE/FALSE
52. gsub = wszystkie (sub = pierwsze)
53. `grep("^United", x)`
54. `initial_split()`
55. `facet_grid(v1 ~ v2, scales="free")`
56. sprawdza, czy kod rzuca błąd
