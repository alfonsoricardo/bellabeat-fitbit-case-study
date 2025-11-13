# 02_scripts/03_analyze.R — produce tables & charts for slides

source("02_scripts/00_setup.R")

dm <- readr::read_csv(
  here::here("01_data_clean/daily_master.csv"),
  show_col_types = FALSE
)

# Ensure output folders exist
if (!dir.exists(here::here("03_outputs/tables"))) {
  dir.create(here::here("03_outputs/tables"), recursive = TRUE)
}
if (!dir.exists(here::here("03_outputs/charts"))) {
  dir.create(here::here("03_outputs/charts"), recursive = TRUE)
}

# ---- User summary table ----
user_summary <- dm |>
  dplyr::group_by(user_id) |>
  dplyr::summarise(
    days_logged = dplyr::n(),
    avg_steps = mean(total_steps, na.rm = TRUE),
    avg_active_min = mean(active_min, na.rm = TRUE),
    avg_sedentary_min = mean(sedentary_minutes, na.rm = TRUE),
    avg_sleep_min = mean(total_minutes_asleep, na.rm = TRUE),
    sleep_eff = mean(sleep_efficiency, na.rm = TRUE)
  )

readr::write_csv(
  user_summary,
  here::here("03_outputs/tables/user_summary.csv")
)

# ---- Weekday summary table ----
weekday_summary <- dm |>
  dplyr::group_by(weekday) |>
  dplyr::summarise(
    avg_steps = mean(total_steps, na.rm = TRUE),
    avg_sleep_min = mean(total_minutes_asleep, na.rm = TRUE),
    avg_sedentary_min = mean(sedentary_minutes, na.rm = TRUE)
  )

readr::write_csv(
  weekday_summary,
  here::here("03_outputs/tables/weekday_summary.csv")
)

# ---- Charts ----

# 1) Steps histogram
p_steps_hist <- ggplot2::ggplot(dm, ggplot2::aes(x = total_steps)) +
  ggplot2::geom_histogram(bins = 30) +
  ggplot2::labs(
    title = "Distribution of Daily Steps",
    x = "Steps",
    y = "Count"
  )

ggplot2::ggsave(
  filename = here::here("03_outputs/charts/steps_hist.png"),
  plot = p_steps_hist,
  width = 8,
  height = 5,
  dpi = 150
)

# 2) Intensity boxplot
intensity <- dm |>
  dplyr::select(
    very_active_minutes,
    fairly_active_minutes,
    lightly_active_minutes,
    sedentary_minutes
  ) |>
  tidyr::pivot_longer(
    dplyr::everything(),
    names_to = "type",
    values_to = "minutes"
  )

p_intensity <- ggplot2::ggplot(intensity, ggplot2::aes(x = type, y = minutes)) +
  ggplot2::geom_boxplot() +
  ggplot2::labs(
    title = "Daily Intensity Minutes",
    x = "",
    y = "Minutes per day"
  )

ggplot2::ggsave(
  filename = here::here("03_outputs/charts/intensity_box.png"),
  plot = p_intensity,
  width = 8,
  height = 5,
  dpi = 150
)

# 3) Weekday steps line chart
weekday_summary$weekday <- factor(
  weekday_summary$weekday,
  levels = c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat")
)

p_weekday_steps <- ggplot2::ggplot(
  weekday_summary,
  ggplot2::aes(x = weekday, y = avg_steps, group = 1)
) +
  ggplot2::geom_line() +
  ggplot2::geom_point() +
  ggplot2::labs(
    title = "Average Steps by Weekday",
    x = "",
    y = "Average Steps"
  )

ggplot2::ggsave(
  filename = here::here("03_outputs/charts/weekday_steps.png"),
  plot = p_weekday_steps,
  width = 8,
  height = 5,
  dpi = 150
)

message("Analysis complete. Tables in 03_outputs/tables, charts in 03_outputs/charts.")