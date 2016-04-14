

#' @export
pie.size <- function(pier,
                     width = NULL, height = NULL,
                     inner = NULL, outer = NULL) {

    size = list(canvasWidth=width,
                canvasHeight=height,
                pieInnerRadius=sprintf('%s%%', inner),
                pieOuterRadius=sprintf('%s%%', outer))

    pier$x$size <- Filter(Negate(function(x) is.null(unlist(x))), size)

    return(pier)
}


#' @export
pie.title <- function(pier,
                      text = NULL,
                      size = NULL,
                      font = NULL,
                      colour = NULL,
                      location = NULL) {
    title = list(text = text,
                 fontSize = size,
                 font = font,
                 color = colour)
    title <- Filter(Negate(function(x) is.null(unlist(x))), title)

    header <- list(title = title,
                   location = location)

    pier$x$header <- Filter(Negate(function(x) is.null(unlist(x))), header)

    return(pier)
}



#' @export
pie.subtitle <- function(pier,
                      text = NULL,
                      size = NULL,
                      font = NULL,
                      colour = NULL,
                      padding = NULL) {
    subtitle = list(text = text,
                 fontSize = size,
                 font = font,
                 color = colour)
    subtitle <- Filter(Negate(function(x) is.null(unlist(x))), subtitle)

    header = pier$x$header

    header$subtitle <- subtitle
    header$titleSubtitlePadding <- padding


    pier$x$header <- Filter(Negate(function(x) is.null(unlist(x))), header)

    return(pier)
}

#' @export
pie.footer <- function(pier,
                       text = NULL,
                       size = NULL,
                       font = NULL,
                       colour = NULL,
                       location = NULL) {

    stopifnot(location %in% c('bottom-left','bottom-center','bottom-right'))

    footer = list(text = text,
                    fontSize = size,
                    font = font,
                    color = colour,
                  location = location)

    pier$x$footer <- Filter(Negate(function(x) is.null(unlist(x))), footer)

    return(pier)
}


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



    tooltips = list(enabled = enabled,
                    type = type, #caption|placeholder
                    string = string,
                    placeholderParser = placeholderParser)
    tooltips <- Filter(Negate(function(x) is.null(unlist(x))), tooltips)

    styles = list(fadeInSpeed = fadeInSpeed,
                  backgroundColor = backgroundColor,
                  backgroundOpacity = backgroundOpacity,
                  color = color,
                  borderRadius = borderRadius,
                  font = font,
                  fontSize = fontSize,
                  padding = padding)
    styles <- Filter(Negate(function(x) is.null(unlist(x))), styles)

    if (length(styles) > 0) tooltips$styles = styles

    pier$x$tooltips <- tooltips #toJSON(tooltips, auto_unbox = TRUE)

    return(pier)
}










