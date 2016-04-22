#' @import htmlwidgets
#' @export
pier <- function(data,
                 width=400, height=400, header=NULL,
                 sortOrder = NULL, smallSegmentGrouping = FALSE,
                 settings = NULL, ...) {

    stopifnot(all(c('label','value','color') %in% colnames(data)))

    data <- list(sortOrder = sortOrder,
                 content = toJSON(data))

    if (smallSegmentGrouping) {
        smallSegmentGrouping <- list(enabled = TRUE,
                                    value = 1,
                                    valueType = 'percentage',
                                    label = 'Other',
                                    color = '#cccccc')
        smallSegmentGrouping <- modifyList(smallSegmentGrouping, list(...))

        data$smallSegmentGrouping <- smallSegmentGrouping
    }


    # pass the data and settings using 'x'
    x <- list(
        data = Filter(Negate(function(x) is.null(unlist(x))), data) ,
        settings = settings
    )

    if (!is.null(header)) {
        x$header = list(title=list(text=header))
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
