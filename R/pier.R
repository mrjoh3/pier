#' @import htmlwidgets
#' @export
pier <- function(data, width=400, height=400, header=NULL, settings= NULL) {

    data = toJSON(data)
    # pass the data and settings using 'x'
    x <- list(
        data = data,
        settings = settings
    )

    if (!is.null(header)) {
        title = list(title=list(text=header))
        x$header = toJSON(title, auto_unbox = TRUE)
    }

    # create the widget
    htmlwidgets::createWidget("pier", x, width = width, height = height)
}



#' @export
pierOutput <- function(outputId, width = "100%", height = "400px") {
    shinyWidgetOutput(outputId, "pier", width, height, package = "pier")
}
#' @export
renderpier <- function(expr, env = parent.frame(), quoted = FALSE) {
    if (!quoted) { expr <- substitute(expr) } # force quoted
    shinyRenderWidget(expr, pierOutput, env, quoted = TRUE)
}
