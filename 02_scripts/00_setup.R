# 02_scripts/00_setup.R — install & load packages

if (!requireNamespace("pacman", quietly = TRUE)) install.packages("pacman")

pacman::p_load(
  tidyverse,
  lubridate,
  janitor,
  readr,
  ggplot2,
  dplyr,
  tidyr,
  skimr,
  here,
  glue,
  stringr,
  forcats,
  knitr,
  rmarkdown,
  duckdb
)

message("Packages loaded successfully.")
