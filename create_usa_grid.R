#' Grid points that fall within the contiguous USA
#'
#' This function generates a grid of points covering the contiguous
#' United States (USA) at a specified resolution. It identifies which grid
#' points fall within the boundaries of the USA polygon and plots them over
#' the USA map.
#'
#' @param resolution The resolution of the grid, i.e., the distance between
#'    consecutive grid points (default: 1).
#' @return a list containing the following components:
#' \itemize{
#'    \item \code{grid} grid points data frame including indicator of which
#'    points lie within the contiguous USA.
#'    \item \code{plot} ggplot of the contiguous USA with grid points that lie
#'    within USA borders.
#' }
#' @examples
#'
#' grid_data <- create_usa_grid(resolution = 10)
#'
#' @export

create_usa_grid <- function(resolution = 1) {

  #Creates US Grid Points
  usa_map <- ggplot2::map_data("usa", region = "main")
  lon <- seq(from = min(usa_map$long), to = max(usa_map$long), by = resolution)
  lat <- seq(from = min(usa_map$lat), to = max(usa_map$lat), by = resolution)

  grid_points <- expand.grid(lon = lon, lat = lat)
  grid_points$in_usa <- sp::point.in.polygon(grid_points$lon, grid_points$lat,
                                             usa_map$long, usa_map$lat)

  grid_usa <- grid_points[grid_points$in_usa != 0,]

  #Plots the US with Grid Points within
  plot <- ggplot2::ggplot() +
    ggplot2::geom_polygon(data = usa_map, ggplot2::aes(x = long, y = lat)) +
    ggplot2::geom_point(data = grid_usa, ggplot2::aes(x = lon, y = lat),
    color = "dodgerblue", size = 0.9) +
    ggplot2::coord_equal() +
    ggplot2::theme_minimal()

  return(list(grid = grid_points, plot = plot))
}

