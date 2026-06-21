#!/usr/bin/env Rscript
# Usage: Rscript scripts/fmt.R        -- apply formatting
#        Rscript scripts/fmt.R --check -- dry-run, exit 1 if anything would change (CI)
args <- commandArgs(trailingOnly = TRUE)
dry <- if ("--check" %in% args) "fail" else "off"

styler::style_dir(
  ".",
  filetype     = c("R", "Rmd"),
  recursive    = TRUE,
  exclude_dirs = c(".git", "temp"),
  dry          = dry
)
