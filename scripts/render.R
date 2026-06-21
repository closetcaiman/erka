#!/usr/bin/env Rscript
files <- list.files(
  "cheatsheets",
  pattern = "\\.Rmd$",
  full.names = TRUE,
  recursive = TRUE
)
for (f in files) {
  message("Rendering: ", f)
  tryCatch(
    rmarkdown::render(f, quiet = TRUE),
    error = function(e) {
      message("FAIL: ", f, "\n", e$message)
      quit(status = 1)
    }
  )
}
message("Done: ", length(files), " files rendered")
