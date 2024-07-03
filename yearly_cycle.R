#' Yearly cycle for a specific USCRN Weather Station's daily weather
#'
#' Given a valid WBAN Station ID, estimates the yearly daily weather cycle
#' of the specified station (expected temperature on each day of the year).
#'
#'
#' @param station_id the station of interest's WBAN number.
#' @return a data frame containing the expected yearly cycle weather
#'    data for the inquired weather station.
#'
#' @examples
#'
#' station_cycle <- yearly_cycle(53878)
#'
#' @export

yearly_cycle <- function(station_id){
  #Extracts data from a specific USCRN Station
  station_full_data <- dplyr::filter(daily_weather, WBANNO == station_id)

  #Extracts month and day
  stripped_days <- strptime(station_full_data$LST_DATE,
                                           format = "%Y-%m-%d")
  station_full_data$month_day <- format(stripped_days, format = "%m-%d")

  #Calculates expected average temperature on each day
  grouped_dates <- station_full_data |>
    dplyr::group_by(month_day) |>
    dplyr::summarise(avg_expected_temp = mean(T_DAILY_AVG,
                                       na.rm = TRUE))

  names(grouped_dates) <- c("DAY_NUMBER", "EXPECTED_TEMPERATURE")
  grouped_dates$DAY_NUMBER <- seq(from = 1, to = 366, by = 1)

  return(grouped_dates)
}

