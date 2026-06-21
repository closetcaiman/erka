#!/usr/bin/env Rscript
# Install all R packages used across cheatsheets and sheets.

pkgs <- c(
  # --- tidyverse core ---
  "dplyr", "tidyr", "stringr", "readr", "lubridate", "ggplot2",

  # --- data import ---
  "readxl",

  # --- tidymodels ecosystem ---
  # meta-package: rsample, recipes, parsnip, workflows, yardstick, ...
  "tidymodels",

  # --- ML backends ---
  "rpart", # decision trees (default engine for decision_tree())

  # --- visualization ---
  "gganimate",
  "ggrepel",
  "plotly",
  "maps",
  "sf",
  "mapsf",

  # --- reporting ---
  "rmarkdown",
  "knitr",
  "flexdashboard",

  # --- dev / quality ---
  "styler",
  "lintr",
  "testthat",

  # --- benchmarking ---
  "microbenchmark",
  "profvis",

  # --- finance (exam: AMZN quantmod question) ---
  "quantmod"
)

already <- rownames(installed.packages())
to_install <- pkgs[!pkgs %in% already]

if (length(to_install) == 0) {
  message("All packages already installed.")
} else {
  message(
    "Installing ", length(to_install), " package(s): ",
    paste(to_install, collapse = ", ")
  )
  install.packages(to_install, repos = "https://cloud.r-project.org")
}
