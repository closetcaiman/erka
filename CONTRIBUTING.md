# Contributing

## Setup

Some packages (`sf`, `mapsf`, `gganimate`) require system libraries before `make deps` will work:

```bash
# Arch Linux
sudo pacman -S gdal proj geos gcc-fortran
yay -S udunits          # AUR

# Ubuntu / Debian
sudo apt install libgdal-dev libproj-dev libgeos-dev libudunits2-dev gfortran
```

Then:

```bash
make setup   # restores renv lockfile and installs git hooks
```

Dependencies are managed with [renv](https://rstudio.github.io/renv/). The `renv.lock` file pins every package version — no manual `install.packages()` needed.

## Making changes

1. Create a branch: `git switch -c feat/your-topic`
2. Make your changes
3. Format: `make fmt`
4. Lint: `make check`
5. Commit using Conventional Commits:
   ```
   feat(cheatsheets): add sf maps section to 10-advanced-viz
   fix(sheets): correct pivot_wider duplicate key example
   docs(drill): add 10 statistics questions
   ```
6. Push and open a PR — the PR title must also follow the same format

## Commit types

| Type       | When to use                                              |
| ---------- | -------------------------------------------------------- |
| `feat`     | new content (sheet, cheatsheet section, drill questions) |
| `fix`      | correcting wrong code or answers                         |
| `docs`     | README, CONTRIBUTING, comments                           |
| `style`    | formatting only, no logic change                         |
| `refactor` | restructuring without changing content                   |
| `chore`    | deps, tooling, CI config                                 |

## Adding a new exercise sheet

1. Create `lab-exams/mock/<number>-<slug>/`
2. Add `arkusz.Rmd`, `rozwiazania.Rmd`, and a `data/` folder with all required datasets
3. Use `**Ex. X.**` for task numbering and `**Ans.:**` for answers in solutions
4. Add closed questions to `drill.txt` with `>>>` marking the correct option
5. Run `make check` before committing

## CI

Two workflows run on push and pull request:

- **lint** — lintr on all R/Rmd files
- **fmt** — styler dry-run (fails if any file is unformatted)
