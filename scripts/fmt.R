#!/usr/bin/env Rscript
styler::style_dir(
  ".",
  filetype     = c("R", "Rmd"),
  recursive    = TRUE,
  exclude_dirs = c(".git", "temp")
)
