#' Timeseries for a specific USCRN Weather Station's daily weather
#'
#' Given a valid WBAN Station ID, return the time series of the specified
#' station within the (optional) date constraints.
#'
#' @param station_id the station of interest's WBAN number.
#' @param start_date the starting date of the requested time series (optional).
#' @param end_date the ending date of the requested time series (optional).
#' @return a data frame containing daily weather data for the inquired
#'    weather station.
#'
#' @examples
#'
#' #Using two date constraints, start and end dates
#' station_data <- extract_timeseries(station_id = 3047,
#'    start_date = "2020-01-01",
#'    end_date = "2023-01-1")
#'
#' #Using one date constraint, only start date
#' station_data <- extract_timeseries(station_id = 96409,
#'    start_date = "2017-02-07")
#'
#' @export

extract_timeseries <- function(station_id, start_date = NULL, end_date = NULL){

  #Extracts data from a specific USCRN Station
    station_timeseries <- dplyr::filter(daily_weather,
                                        WBANNO == station_id)

  #Enacts the date constraints
  if (!is.null(start_date)){
    station_timeseries <- dplyr::filter(station_timeseries,
                                        LST_DATE >= start_date)
  }

  if (!is.null(end_date)){
    station_timeseries <- dplyr::filter(station_timeseries,
                                        LST_DATE <= end_date)
  }
  return(station_timeseries)
}


