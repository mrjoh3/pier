## ----data----------------------------------------------------------------

library(pier)

data <- data.frame(label = c('Environment','Education','Business','Community'),
                   value = c(104,19,638,1250),
                   color = c("#A6CEE3","#1F78B4","#B2DF8A","#33A02C"))


## ----simple--------------------------------------------------------------

pier(data)


## ----small---------------------------------------------------------------

data %>%
    pier(smallSegmentGrouping = TRUE, value = 10)


## ----advanced------------------------------------------------------------

data %>%
    pier() %>%
    pie.size(inner=70, outer=100, width=500, height=500) %>%
    pie.header(text='Segments', font='Impact', location='pie-center') %>%
    pie.subtitle(text='by Type') %>%
    pie.footer(text='Economic Segments using fake data.',
               location = 'bottom-left') %>%
    pie.tooltips()


