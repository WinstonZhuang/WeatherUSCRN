#' Interpolates Values Based on Provided Pre-Existing Data
#'
#' This function interpolates coordinates with missing values based on
#' pre-existing data.
#'
#' @param data The data frame being passed in as the available data.
#' @param data_to_predict A data frame containing coordinates to estimate
#'    values for. Assumes the first column contains longitude and second column
#'    contains latitude values.
#' @param variable The variable of interest you want to interpolate values for.
#' @return A data frame containing the entire dataset provided (data),
#'    including the newly estimated points (data_to_predict) along with the
#'    values interpolated for. This data frame combines the interpolated
#'    points with the available points, preserving their respective coordinates
#'    (longitude and latitude) and the values of interest.
#'
#' @examples
#'
#' usa_grid <- create_usa_grid(resolution = 5)
#' points <- usa_grid$grid[usa_grid$grid$in_usa != 0,]
#' data <- interpolate(daily_weather, points, "T_DAILY_AVG")
#'
#' @export

interpolate <- function(data, data_to_predict, variable){

  #Gets locations to use
  available_data <- !is.na(data[variable])
  locs <- cbind(data$LONGITUDE[available_data], data$LATITUDE[available_data])

  #Fits the model
  X <- cbind(rep(1, times = sum(available_data)), locs)
  gpfit_model <- GpGp::fit_model(y = data[variable][available_data,],
                                 locs = locs, X = X,
                                 "matern_sphere", silent = TRUE)

  #Predicts value of interest based on previous data
  pred_inds <- data_to_predict
  locs_pred <- as.matrix(cbind(pred_inds[,1], pred_inds[,2]))
  X_pred <- cbind(rep(1, nrow(locs_pred)), locs_pred)
  prediction_data <- GpGp::predictions(fit = gpfit_model, locs_pred = locs_pred,
                            X_pred = X_pred, m = 30)

  #Creates data frame
  interpolated <- data.frame(LONGITUDE = data_to_predict[,1],
                             LATITUDE = data_to_predict[,2],
                             VALUE = prediction_data)

  names(interpolated)[3] <- variable

  return(interpolated)
}

