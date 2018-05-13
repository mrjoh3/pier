
#' @title pier
#' @description create D3 pie charts
#' @param data data.frame must contain colnames value, label and color
#' @param width integer width, pixel-width
#' @param height integer height, pixel-height
#' @param header character, simple header above plot with no formatting. For more
#' control use `pier.title()`
#' @param sortOrder character must be one of 'none', 'random', 'value-asc', 'value-desc'
#' 'label- asc', 'label-desc'
#' @param smallSegmentGrouping booleen option to combine segments below percent threshold
#' @param value smallSegmentGrouping option threshold for grouping segments
#' @param valueType smallSegmentGrouping option must be 'percentage' or 'value'
#' @param label character smallSegmentGrouping option default is 'Other'
#' @param color character smallSegmentGrouping option default is '#cccccc'
#' @param ... variables passed via ...
#' @importFrom utils modifyList
#' @importFrom htmlwidgets createWidget sizingPolicy
#' @examples
#'\dontrun{
#' data.frame(value = c(40, 20, 30),
#'            label = c('red', 'green', 'blue'),
#'            color = c('red', 'green', 'blue')) %>%
#'   pier()
#'   }
#' @import htmlwidgets
#' @export
pier <- function(data,
                 width=NULL, height=NULL, header=NULL,
                 sortOrder = 'none', smallSegmentGrouping = FALSE,
                 settings = NULL, ...) {

    stopifnot(all(c('label','value','color') %in% colnames(data)),
              sortOrder %in% c('none','random',
                               'value-asc', 'value-desc',
                               'label- asc', 'label-desc')
              )

    data <- list(sortOrder = sortOrder,
                 content = jsonlite::toJSON(data))

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
        x$header <- list(title=list(text=header))
    }

    # create the widget
    htmlwidgets::createWidget("pier",
                              x,
                              width = width,
                              height = height,
                              sizingPolicy = htmlwidgets::sizingPolicy(
                                  #viewer.padding = 0,
                                  #viewer.paneHeight = 500,
                                  browser.fill = TRUE,
                                  viewer.fill = TRUE,
                                  knitr.defaultWidth = 800,
                                  knitr.defaultHeight = 400
                              ))
}



#' Shiny bindings for pier
#'
#' Output and render functions for using pier within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a pier
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name pier-shiny
#'
#' @export
pierOutput <- function(outputId, width = "100%", height = "100%") {
    shinyWidgetOutput(outputId, "pier", width, height, package = "pier")
}

#' @rdname pier-shiny
#' @export
renderpier <- function(expr, env = parent.frame(), quoted = FALSE) {
    if (!quoted) { expr <- substitute(expr) } # force quoted
    shinyRenderWidget(expr, pierOutput, env, quoted = TRUE)
}
