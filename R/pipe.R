#' Pipe operator
#'
#' Imports the pipe operator from magrittr.
#'
#' @importFrom magrittr %>%
#' @export
#' @param lhs a \code{\link{d3pie}} object
#' @param rhs a pie settings function
#' @rdname pipe
#' @examples
#'\dontrun{
#' data.frame(value = c(40, 20, 30),
#'            label = c('red', 'green', 'blue'),
#'            color = c('red', 'green', 'blue')) %>%
#'   pier() %>%
#'   pie.size(inner = 50, outer = 90)
#'   }
`%>%` <- magrittr::`%>%`
