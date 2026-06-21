#!/usr/bin/env Rscript
# Checks formatting without modifying files. Exits with status 1 if any
# file would be changed. Intended for CI use; run scripts/fmt.R locally.
styler::style_dir(
  ".",
  filetype     = c("R", "Rmd"),
  recursive    = TRUE,
  exclude_dirs = c(".git", "temp"),
  dry          = "fail"
)
