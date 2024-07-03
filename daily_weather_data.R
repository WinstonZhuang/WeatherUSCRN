#' @title Daily Weather Data from the U.S. Climate Reference Network (USCRN)
#'
#' @description {A dataset with the daily weather data across all USCRN Weather Stations from
#' the years 2000 to Present}
#'
#' @format A data frame with 1134352 rows and 28 columns
#' \describe{
#'   \item{WBANNO}{The station WBAN number}
#'   \item{LST_DATE}{The Local Standard Time date of the observation}
#'   \item{CRX_VN}{The version number of the station data logger program that
#'   was in effect at the time of the observation.}
#'   \item{LONGITUDE}{Station longitude}
#'   \item{LATITUDE}{Station latitude}
#'   \item{T_DAILY_MAX}{Maximum air temperature, in degrees C}
#'   \item{T_DAILY_MIN}{Minimum air temperature, in degrees C}
#'   \item{T_DAILY_MEAN}{Mean air temperature, in degrees C, calculated using
#'   the typical historical approach: T_DAILY_MAX + T_DAILY_MIN / 2}
#'   \item{T_DAILY_AVG}{Average air temperature, in degrees C}
#'   \item{P_DAILY_CALC}{Total amount of precipitation, in mm}
#'   \item{SOLARAD_DAILY}{Total solar energy, in MJ/meter^2, calculated from
#'   the hourly average global solar radiation rates and converted to energy
#'   by integrating over time}
#'   \item{SUR_TEMP_DAILY_TYPE}{Type of infrared surface temperature
#'   measurement. 'R' denotes raw measurements, 'C' denotes corrected
#'   measurements, and 'U' indicates unknown/missing}
#'   \item{SUR_TEMP_DAILY_MAX}{Maximum infrared surface temperature,
#'   in degrees C}
#'   \item{SUR_TEMP_DAILY_MIN}{Minimum infrared surface temperature,
#'   in degrees C}
#'   \item{SUR_TEMP_DAILY_AVG}{Average infrared surface temperature,
#'   in degrees C}
#'   \item{RH_DAILY_MAX}{Maximum relative humidity, in \%}
#'   \item{RH_DAILY_MIN}{Minimum relative humidity, in \%}
#'   \item{RH_DAILY_AVG}{Average relative humidity, in \%}
#'   \item{SOIL_MOISTURE_5_DAILY}{Average soil moisture, in fractional
#'   volumetric water content, at 5 cm below the surface}
#'   \item{SOIL_MOISTURE_10_DAILY}{Average soil moisture, in fractional
#'   volumetric water content, at 10 cm below the surface}
#'   \item{SOIL_MOISTURE_20_DAILY}{Average soil moisture, in fractional
#'   volumetric water content, at 20 cm below the surface}
#'   \item{SOIL_MOISTURE_50_DAILY}{Average soil moisture, in fractional
#'   volumetric water content, at 50 cm below the surface}
#'   \item{SOIL_MOISTURE_100_DAILY}{Average soil moisture, in fractional
#'   volumetric water content, at 100 cm below the surface}
#'   \item{SOIL_TEMP_5_DAILY}{Average soil temperature,
#'   in degrees C, at 5 cm below the surface}
#'   \item{SOIL_TEMP_10_DAILY}{Average soil temperature,
#'   in degrees C, at 10 cm below the surface}
#'   \item{SOIL_TEMP_20_DAILY}{Average soil temperature,
#'   in degrees C, at 20 cm below the surface}
#'   \item{SOIL_TEMP_50_DAILY}{Average soil temperature,
#'   in degrees C, at 50 cm below the surface}
#'   \item{SOIL_TEMP_100_DAILY}{Average soil temperature,
#'   in degrees C, at 100 cm below the surface}
#' }
"daily_weather"
