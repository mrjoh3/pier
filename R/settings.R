
#' @title pie.size
#' @description modify the size of the pie canvas
#' @param pier object
#' @param outer integer value converted to percentage size of pie radius within dimensions.
#' default set to 90 which is enough for most labels
#' @param inner integer value converted to percentage size of pie inner radius
#' @param width integer width, pixel-width
#' @param height integer height, pixel-height
#' @examples
#'\dontrun{
#' data.frame(value = c(40, 20, 30),
#'            label = c('red', 'green', 'blue'),
#'            color = c('red', 'green', 'blue')) %>%
#'   pier() %>%
#'   pie.size(outer = 80, inner = 50, width = 200, height = 200)
#'   }
#' @export
pie.size <- function(pier,
                     outer = 90, inner = NULL,
                     width = NULL, height = NULL) {

    size <- list(canvasWidth=width,
                canvasHeight=height,
                pieInnerRadius=sprintf('%s%%', inner),
                pieOuterRadius=sprintf('%s%%', outer))

    pier$x$size <- Filter(Negate(function(x) is.null(unlist(x))), size)

    return(pier)
}

#' @title pie.header
#' @description Add header to pie
#' @param pier object
#' @param text character main title text
#' @param size integer font size
#' @param font character font name; eg. "Impact"
#' @param colour character colour name or hex value
#' @param location character; must be one of 'top-center', 'top-left' or 'pie-center'
#' @examples
#'\dontrun{
#' data.frame(value = c(40, 20, 30),
#'            label = c('red', 'green', 'blue'),
#'            color = c('red', 'green', 'blue')) %>%
#'   pier() %>%
#'   pie.header(text = 'My New Title', font = 'Impact',
#'              size = 18, colour = 'grey',
#'              location = 'top-center')
#'   }
#' @export
pie.header <- function(pier,
                      text = NULL,
                      size = NULL,
                      font = NULL,
                      colour = NULL,
                      location = NULL) {
    title <- list(text = text,
                 fontSize = size,
                 font = font,
                 color = colour)
    title <- Filter(Negate(function(x) is.null(unlist(x))), title)

    header <- list(title = title,
                   location = location)

    pier$x$header <- Filter(Negate(function(x) is.null(unlist(x))), header)

    return(pier)
}



#' @title pie.subtitle
#' @description Add subtitle to the pie
#' @param pier object
#' @param text character main title text
#' @param size integer font size
#' @param font character font name; eg. "Impact"
#' @param colour character colour name or hex value
#' @param padding integer pixels
#' @examples
#'\dontrun{
#' data.frame(value = c(40, 20, 30),
#'            label = c('red', 'green', 'blue'),
#'            color = c('red', 'green', 'blue')) %>%
#'   pier() %>%
#'   pie.header(text = 'My New Title', font = 'Impact',
#'              size = 18, colour = 'grey',
#'              location = 'top-center') %>%
#'   pie.subtitle('with some additional explanation')
#'   }
#' @export
pie.subtitle <- function(pier,
                      text = NULL,
                      size = NULL,
                      font = NULL,
                      colour = NULL,
                      padding = NULL) {
    subtitle <- list(text = text,
                 fontSize = size,
                 font = font,
                 color = colour)
    subtitle <- Filter(Negate(function(x) is.null(unlist(x))), subtitle)

    header <- pier$x$header

    header$subtitle <- subtitle
    header$titleSubtitlePadding <- padding


    pier$x$header <- Filter(Negate(function(x) is.null(unlist(x))), header)

    return(pier)
}

#' @title pie.footer
#' @description Add footer to pie
#' @param pier object
#' @param text character main title text
#' @param size integer font size
#' @param font character font name; eg. "courier"
#' @param colour character colour name or hex value
#' @param location character; must be one of 'bottom-left','bottom-center','bottom-right'
#' @examples
#'\dontrun{
#' data.frame(value = c(40, 20, 30),
#'            label = c('red', 'green', 'blue'),
#'            color = c('red', 'green', 'blue')) %>%
#'   pier() %>%
#'   pie.footer('with some additional explanation')
#'   }
#' @export
pie.footer <- function(pier,
                       text = NULL,
                       size = NULL,
                       font = NULL,
                       colour = NULL,
                       location = NULL) {

    stopifnot(location %in% c('bottom-left','bottom-center','bottom-right'))

    footer <- list(text = text,
                    fontSize = size,
                    font = font,
                    color = colour,
                  location = location)

    pier$x$footer <- Filter(Negate(function(x) is.null(unlist(x))), footer)

    return(pier)
}


#' @title pie.tooltips
#' @description Add tooltips to pie segments
#' @param pier object
#' @param enabled booleen; default = TRUE
#' @param type character type of tooltip used, must be 'placeholder' or 'caption'; default = 'placeholder'. For description see [d3pie docs](http://d3pie.org/#docs-tooltips)
#' @param string character gives methed to structure content and format of tootip; default = "\{label\}: \{value\}, \{percentage\}\%"
#' @param placeholderParser NOT YET FUNCTIONAL
#' @param fadeInSpeed integer value milliseconds; default = 250
#' @param backgroundColor character colour name or hex; default = '#000000',
#' @param backgroundOpacity numeric proportion must be between 0 and 1; default = 0.5,
#' @param color character colour name or hex; default = '#efefef',
#' @param borderRadius integer pixels; default = 2,
#' @param font character name; default = "arial",
#' @param fontSize integer pixels; default = 10,
#' @param padding integer pixels; default = 4
#' @examples
#'\dontrun{
#' data.frame(value = c(40, 20, 30),
#'            label = c('red', 'green', 'blue'),
#'            color = c('red', 'green', 'blue')) %>%
#'   pier() %>%
#'   pie.tooltips()
#'   }
#' @export
pie.tooltips <- function(pier,
                       enabled = TRUE,
                       type = 'placeholder',
                       string = "{label}: {value}, {percentage}%",
                       placeholderParser = NULL,
                       fadeInSpeed = 250,
                       backgroundColor = '#000000',
                       backgroundOpacity = 0.5,
                       color = '#efefef',
                       borderRadius = 2,
                       font = "arial",
                       fontSize = 10,
                       padding = 4) {

    stopifnot(type %in% c('placeholder', 'caption'))

    tooltips <- list(enabled = enabled,
                    type = type,
                    string = string,
                    placeholderParser = placeholderParser)
    tooltips <- Filter(Negate(function(x) is.null(unlist(x))), tooltips)

    styles <- list(fadeInSpeed = fadeInSpeed,
                  backgroundColor = backgroundColor,
                  backgroundOpacity = backgroundOpacity,
                  color = color,
                  borderRadius = borderRadius,
                  font = font,
                  fontSize = fontSize,
                  padding = padding)
    styles <- Filter(Negate(function(x) is.null(unlist(x))), styles)

    if (length(styles) > 0) tooltips$styles <- styles

    pier$x$tooltips <- tooltips #toJSON(tooltips, auto_unbox = TRUE)

    return(pier)
}


#' @title Label Options
#' @description Pass Labelling options to pier object
#' @importFrom utils modifyList
#' @param pier object
#' @param outer list with options:
##' \itemize{
##'  \item{format}{character default 'label'}
##'  \item{hideWhenLessThanPercentage}{: boolean default NULL}
##'  \item{pieDistance}{: numeric pixels}
##' }
#' @param inner list with options:
##' \itemize{
##'  \item{format}{: character default 'percentage'}
##'  \item{hideWhenLessThanPercentage}{: boolean default NULL}
##' }
#' @param mainLabel list with options:
##' \itemize{
##'  \item{color}{: character default '#333333'}
##'  \item{font}{: character default 'arial'}
##'  \item{fontSize}{: integer pixels}
##' }
#' @param percentage list with options:
##' \itemize{
##'  \item{color}{: character default '#dddddd'}
##'  \item{font}{: character default 'arial'}
##'  \item{fontSize}{: integer pixels}
##'  \item{decimalPlaces}{: integer}
##' }
#' @param value list with options:
##' \itemize{
##'  \item{color}{: character default '#cccc44'}
##'  \item{font}{: character default 'arial'}
##'  \item{fontSize}{: integer pixels}
##' }
#' @param lines list with options:
##' \itemize{
##'  \item{enabled}{: boolean}
##'  \item{style}{: character default }
##'  \item{color}{: character "segment" or a hex color}
##' }
##' @param ... all variables passed via ...
#' @examples
#' data.frame(value = c(40, 20, 30),
#'            label = c('red', 'green', 'blue'),
#'            color = c('red', 'green', 'blue')) %>%
#'   pier() %>%
#'   pie.labels(mainLabel = list(font = 'Impact',
#'                               fontSize = 14))
#'
#' @export
pie.labels <- function(pier, ...) {

    labels <- list(
        outer = list(
            format = "label",
            hideWhenLessThanPercentage = NULL,
            pieDistance = 30
        ),
        inner = list(
            format = "percentage",
            hideWhenLessThanPercentage = NULL
        ),
        mainLabel = list(
            color = "#333333",
            font = "arial",
            fontSize = 10
        ),
        percentage = list(
            color = "#dddddd",
            font = "arial",
            fontSize = 10,
            decimalPlaces = 0
        ),
        value = list(
            color = "#cccc44",
            font = "arial",
            fontSize = 10
        ),
        lines = list(
            enabled = TRUE,
            style = "curved",
            color = "segment" # "segment" or a hex color
        )
    )

    labels <- modifyList(labels, list(...))

    pier$x$labels <- labels #toJSON(tooltips, auto_unbox = TRUE)

    return(pier)
}


#' @title pie.effects
#' @description Pass effects options to pier object
#'
#' @param pier object
#' @param load list with options:
##' \itemize{
##'  \item{effect}{: character one of 'none', 'default}
##'  \item{speed}{: numeric milliseconds}
##' }
#' @param pullOutSegmentOnClick list with options:
##' \itemize{
##'  \item{effect}{: character one of 'none', 'linear', 'bounce', 'elastic', 'back'}
##'  \item{speed}{: integer milliseconds}
##'  \item{size}{: integer pixels}
##' }
#' @param highlightSegmentOnMouseover boolean
#' @param highlightLuminosity numeric
#' @param ... variables all passed via ...
#' @importFrom utils modifyList
#' @examples
#'\dontrun{
#' data.frame(value = c(40, 20, 30),
#'            label = c('red', 'green', 'blue'),
#'            color = c('red', 'green', 'blue')) %>%
#'   pier() %>%
#'   pie.effects(load  = list(speed = 2000),
#'               highlightLuminosity = .2)
#'   }
#' @export
pie.effects <- function(pier, ...) {

    effects <- list(
        load = list(
            effect = "default", #// none / default
            speed = 1000
        ),
        pullOutSegmentOnClick = list(
            effect = "bounce", #// none / linear / bounce / elastic / back
            speed = 300,
            size = 10
        ),
        highlightSegmentOnMouseover = TRUE,
        highlightLuminosity = -0.2
    )

    effects <- modifyList(effects, list(...))

    pier$x$effects <- effects #toJSON(tooltips, auto_unbox = TRUE)

    return(pier)
}


#' @title Miscellaneous Settings
#' @description Pass miscellaneous options to pier object
#' @param pier object
#' @param colors list with options:
##' \itemize{
##'  \item{background}{: character color name or hex. Default is NULL results in tansparent}
##'  \item{segments}{: character vector segment colors only works where not defined in data}
##'  \item{segmentStroke}{: character color name or hex}
##' }
#' @param gradient list with options:
##' \itemize{
##'  \item{enabled}{: boolean}
##'  \item{percentage}{: integer gradient percent}
##'  \item{color}{: character color name or hex}
##' }
#' @param canvasPadding list with options:
##' \itemize{
##'  \item{top}{: integer pixels}
##'  \item{right}{: integer pixels}
##'  \item{bottom}{: integer pixels}
##'  \item{left}{: integer pixels}
##' }
#' @param pieCenterOffset list with options:
##' \itemize{
##'  \item{x}{: integer pixels}
##'  \item{y}{: integer pixels}
##' }
#' @param cssPrefix NULL
#' @param ... variables all passed via ...
#' @importFrom utils modifyList
#' @examples
#' data.frame(value = c(40, 20, 30),
#'            label = c('red', 'green', 'blue'),
#'            color = c('red', 'green', 'blue')) %>%
#'   pier() %>%
#'   pie.misc(gradient  = list(enabled = TRUE))
#'
#' @export
pie.misc <- function(pier, ...) {

    misc <- list(
        colors = list(
            background = NULL, #// transparent
            segments = c(
                "#2484c1", "#65a620", "#7b6888", "#a05d56", "#961a1a",
                "#d8d23a", "#e98125", "#d0743c", "#635222", "#6ada6a",
                "#0c6197", "#7d9058", "#207f33", "#44b9b0", "#bca44a",
                "#e4a14b", "#a3acb2", "#8cc3e9", "#69a6f9", "#5b388f",
                "#546e91", "#8bde95", "#d2ab58", "#273c71", "#98bf6e",
                "#4daa4b", "#98abc5", "#cc1010", "#31383b", "#006391",
                "#c2643f", "#b0a474", "#a5a39c", "#a9c2bc", "#22af8c",
                "#7fcecf", "#987ac6", "#3d3b87", "#b77b1c", "#c9c2b6",
                "#807ece", "#8db27c", "#be66a2", "#9ed3c6", "#00644b",
                "#005064", "#77979f", "#77e079", "#9c73ab", "#1f79a7"
                ),
            segmentStroke = "#ffffff"
        ),
        gradient = list(
            enabled = FALSE,
            percentage = 95,
            color = "#000000"
        ),
        canvasPadding = list(
            top = 5,
            right = 5,
            bottom = 5,
            left = 5
        ),
        pieCenterOffset = list(
            x = 0,
            y = 0
        ),
        cssPrefix = NULL
    )

    misc <- modifyList(misc, list(...))

    pier$x$misc <- misc #toJSON(tooltips, auto_unbox = TRUE)

    return(pier)
}












