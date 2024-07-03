#' Plots Interpolated Data Values onto a Map of the contiguous USA
#'
#' This function plots the interpolated variable of interest for US grid
#' points based on the data that is passed in. The resolution of the plot can be
#' adjusted.
#'
#' @param data The data frame being passed in as the available data.
#' @param variable The variable of interest to interpolate values for.
#' @param resolution The resolution of the plot, lower value means higher
#'    resolution plot (default: 1).
#' @param title The desired title for the plot
#' @return A geospatial heatmap ggplot of the contiguous USA based on
#'    the provided weather data and variable of interest.
#'
#' @examples
#'
#' plot <- interpolate_plot(daily_weather, "T_DAILY_AVG", resolution = 0.1,
#' title = "Daily Temperature Spatial Map")
#' plot
#'
#' @export

interpolate_plot <- function(data, variable, resolution = 1, title){

  #Gets points to interpolate for within the US
  usa_grid <- create_usa_grid(resolution)
  points <- usa_grid$grid[usa_grid$grid$in_usa != 0,]
  data <- interpolate(data, points, variable)

  #Plots the data
  geo_plot <- ggplot2::ggplot(data = data, ggplot2::aes_string(x = "LONGITUDE",
                                         y = "LATITUDE",
                                         fill = variable)) +
    ggplot2::labs(title = title) +
    ggplot2::geom_raster() +
    ggplot2::scale_fill_viridis_c() +
    ggplot2::coord_equal() +
    ggplot2::theme_minimal()
  return(geo_plot)
}
