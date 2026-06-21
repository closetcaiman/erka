.PHONY: help fmt check deps hooks setup

help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "  setup    install R packages and git hooks (run once after clone)"
	@echo "  deps     install R package dependencies"
	@echo "  hooks    install lefthook git hooks"
	@echo ""
	@echo "  fmt      auto-format all R/Rmd files (styler)"
	@echo "  check    lint all R/Rmd files (lintr)"

.DEFAULT_GOAL := help

fmt:
	Rscript scripts/fmt.R

check:
	Rscript scripts/check.R

deps:
	Rscript scripts/install-deps.R

hooks:
	@command -v lefthook >/dev/null 2>&1 || { \
		echo ""; \
		echo "  lefthook not found. Install with one of:"; \
		echo "    pacman -S lefthook          (Arch)"; \
		echo "    brew install lefthook       (macOS)"; \
		echo "    go install github.com/evilmartians/lefthook@latest"; \
		echo "    cargo install lefthook"; \
		echo ""; \
		exit 1; \
	}
	lefthook install
	@echo "Hooks installed (pre-commit, commit-msg, pre-push)."

setup: deps hooks
