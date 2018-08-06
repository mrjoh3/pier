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
            pier() %>% pie.size()
    })
}

shinyApp(ui = ui, server = server)
