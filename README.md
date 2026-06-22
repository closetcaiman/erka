# erka — R course materials

AGH R course. Cheat sheets, practice exams, flashcards.

## What's where

```
cheatsheets/     one .Rmd per topic — runnable code + output + reference PDF
lab-exams/
  mock/          practice sheets (arkusz.Rmd + rozwiazania.Rmd + data/)
  past/          real past exams
materials/
  quiz-upel/     UPeL quiz PDFs
  swirl/         swirl lab packages (Lab*.zip)
drill/           flashcard file for drill2 + coverage table
scripts/         R scripts used by make and CI
```

## Cheat sheets

Open any file in RStudio, hit Knit.

| Folder             | Topic                                               |
| ------------------ | --------------------------------------------------- |
| `01-basics`        | Vectors, subsetting, data frames, NA, logic         |
| `02-import`        | read.csv, read.csv2, readxl, RDS, FWF, bz2          |
| `03-performance`   | Functions, apply family, loops, debugging, testthat |
| `04-stringr-dates` | stringr, regex, base R dates, lubridate             |
| `05-dplyr`         | filter, mutate, joins, anti_join, slice_max         |
| `06-tidyr`         | pivot_longer/wider, separate, unite                 |
| `07-base-plots`    | plot, boxplot, hist, par, saving                    |
| `08-ggplot2`       | geoms, facets, geom_smooth, ggsave                  |
| `09-rmarkdown`     | chunk options, inline R, output formats             |
| `10-advanced-viz`  | gganimate, sf maps, plotly, ggrepel                 |
| `11-statistics`    | t-test, chi-square, ANOVA, correlation              |
| `12-tidymodels`    | split → recipe → workflow → fit → accuracy          |
| `13-shiny`         | reference PDF only                                  |

## Exercise sheets

Set working directory to the sheet folder first (_Session → Set Working Directory → To Source File Location_). Empty `{r}` chunks to fill in; `rozwiazania.Rmd` has the solutions.

## Drill

Closed questions from UPeL quizzes in [drill2](https://gronostajo.github.io/drill2/) format. Load `drill/JR.txt` in the app. See `drill/README.md` for topic coverage.

## Setup

```bash
make setup   # R packages (renv) + git hooks, run once after clone
```

```bash
make fmt     # auto-format
make check   # lint
```

Commits follow [Conventional Commits](https://www.conventionalcommits.org): `type(scope): description`. See [CONTRIBUTING.md](CONTRIBUTING.md).
