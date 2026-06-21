#!/usr/bin/env Rscript
# Renders all cheatsheets to PDF. Intended for CI use only.
# Requires tinytex: tinytex::install_tinytex()

files <- list.files(
  "cheatsheets",
  pattern    = "\\.Rmd$",
  full.names = TRUE,
  recursive  = TRUE
)

for (f in files) {
  message("Rendering to PDF: ", f)
  tryCatch(
    rmarkdown::render(f, output_format = "pdf_document", quiet = TRUE),
    error = function(e) {
      message("FAIL: ", f, "\n", e$message)
      quit(status = 1)
    }
  )
}

message("Done: ", length(files), " PDFs rendered")
