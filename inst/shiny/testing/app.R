library(shiny)
library(pier)

ui <- fluidPage(
    pierOutput("pier_example")
)

server <- function(input, output) {

    output$pier_example <- renderpier({
        data.frame(
            value = c(30, 70),
            label = c('Red', 'Blue'),
            color = c('Red', 'Blue')
        ) %>%

            # no options will default to 500px default
            # pier()

            # suggest defining size for initial render
            pier() %>% pie.size(inner=70, outer=100, width = 800, height = 750)
    })
}

shinyApp(ui = ui, server = server)
