#' Estimate Temperature Trend Over Time
#'
#' Given a valid WBAN Station ID, estimates the trend in temperature over time.
#' It calculates the slope of the temperature trend and its standard error
#' based on the provided time series data.
#'
#'
#' @param station_id The identifier of the weather station for which the
#'    temperature trend is to be estimated.
#' @param start_date The start date of the time period for analyzing
#'    the temperature trend (optional).
#' @param end_date The end date of the time period for analyzing
#'    the temperature trend (optional).
#' @return A list containing the estimated slope of the temperature
#'    trend by year and its corresponding standard error.
#'
#' @examples
#'   trend_result <- estimate_temperature_trend(station_id = 53878,
#'                                              start_date = "2023-01-01",
#'                                              end_date = "2023-12-31")
#'
#' @export

estimate_temperature_trend <- function(station_id, start_date = NULL,
                                       end_date = NULL) {
  # Extract time series data for the station
  time_series <- extract_timeseries(station_id,
                                    start_date,
                                      end_date)

  time_series$years_since_2000 <- as.numeric(difftime(time_series$LST_DATE,
                                                      as.Date("2000-01-01"),
                                                      units = "days")) / 365.25

  # Create sine and cosine transformations of the date
  time_series$sine_date <- sin(2 * pi * time_series$years_since_2000)
  time_series$cosine_date <- cos(2 * pi * time_series$years_since_2000)

  # Fit linear regression model
  lm_model <- lm(T_DAILY_AVG ~ years_since_2000 + sine_date + cosine_date,
                 data = time_series)

  # Extract coefficient for Date (slope)
  slope <- coef(lm_model)["years_since_2000"]

  # Convert daily slope to yearly slope
  days_per_year <- 365.25
  slope_per_year <- slope * days_per_year
  std_error <- summary(lm_model)$coefficients[4] * days_per_year
  names(slope_per_year) <- NULL

  return(list( slope = slope_per_year,
               standard_error = std_error))
}
