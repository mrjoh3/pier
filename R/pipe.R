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
#' pier(mdeaths) %>% pie.size(width=300, height=200)
`%>%` <- magrittr::`%>%`
