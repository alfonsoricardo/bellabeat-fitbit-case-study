# 02_scripts/01_prepare.R — read raw data and basic checks

source("02_scripts/00_setup.R")

raw_dir <- here::here("00_data_raw")
stopifnot(dir.exists(raw_dir))

daily <- readr::read_csv(
  here::here("00_data_raw/dailyActivity_merged.csv"),
  show_col_types = FALSE
) |>
  janitor::clean_names()

sleep <- readr::read_csv(
  here::here("00_data_raw/sleepDay_merged.csv"),
  show_col_types = FALSE
) |>
  janitor::clean_names()

message(glue::glue("daily rows: {nrow(daily)}; sleep rows: {nrow(sleep)}"))

# Save skim summaries for quick inspection
if (!dir.exists(here::here("03_outputs/tables"))) {
  dir.create(here::here("03_outputs/tables"), recursive = TRUE)
}

skimr::skim(daily) |>
  capture.output(file = here::here("03_outputs/tables/skim_daily.txt"))

skimr::skim(sleep) |>
  capture.output(file = here::here("03_outputs/tables/skim_sleep.txt"))

message("Skim summaries written to 03_outputs/tables/")