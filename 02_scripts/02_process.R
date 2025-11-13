# 02_scripts/02_process.R — clean & merge data

source("02_scripts/00_setup.R")

# Load daily activity
daily <- readr::read_csv(
  here::here("00_data_raw/dailyActivity_merged.csv"),
  show_col_types = FALSE
) |>
  janitor::clean_names() |>
  dplyr::mutate(
    date = lubridate::mdy(activity_date),
    user_id = as.character(id),
    active_min = very_active_minutes + fairly_active_minutes + lightly_active_minutes
  ) |>
  dplyr::distinct(user_id, date, .keep_all = TRUE)

# Load sleep data
sleep <- readr::read_csv(
  here::here("00_data_raw/sleepDay_merged.csv"),
  show_col_types = FALSE
) |>
  janitor::clean_names() |>
  dplyr::mutate(
    # THIS is the correct parsing for your file
    date = lubridate::mdy_hms(sleep_day),
    user_id = as.character(id),
    sleep_efficiency = total_minutes_asleep / pmax(total_time_in_bed, 1)
  ) |>
  dplyr::distinct(user_id, date, .keep_all = TRUE)

# Merge into daily_master
daily_master <- daily |>
  dplyr::select(
    user_id, date, total_steps, calories,
    very_active_minutes, fairly_active_minutes,
    lightly_active_minutes, sedentary_minutes,
    active_min
  ) |>
  dplyr::left_join(
    sleep |>
      dplyr::select(
        user_id, date,
        total_minutes_asleep,
        total_time_in_bed,
        sleep_efficiency
      ),
    by = c("user_id", "date")
  ) |>
  dplyr::mutate(
    weekday = lubridate::wday(date, label = TRUE, abbr = TRUE),
    is_weekend = weekday %in% c("Sat", "Sun"),
    steps_bin = cut(
      total_steps,
      breaks = c(-Inf, 5000, 7500, 10000, 12500, Inf),
      labels = c("<5k", "5–7.5k", "7.5–10k", "10–12.5k", "≥12.5k")
    )
  )

if (!dir.exists(here::here("01_data_clean"))) {
  dir.create(here::here("01_data_clean"), recursive = TRUE)
}

readr::write_csv(daily_master, here::here("01_data_clean/daily_master.csv"))
message("Saved 01_data_clean/daily_master.csv")