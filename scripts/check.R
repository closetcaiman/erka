#!/usr/bin/env Rscript
issues <- lintr::lint_dir(
  ".",
  pattern    = "\\.(R|Rmd)$",
  exclusions = list("temp", "renv", "packrat", "lab-exams/past")
)
if (length(issues) > 0) {
  print(issues)
  quit(status = 1)
} else {
  message("OK: no lint issues")
}
