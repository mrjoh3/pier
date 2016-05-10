# pier

The `pier` package (pronounced pie-r) is a wrapper, or [htmlwidget](http://www.htmlwidgets.org/), for the [d3pie](http://d3pie.org/) javascript library by [Benjamin Keen](https://github.com/benkeen). If you are just wanting to generate a pie chart the d3pie website has a fantastic [generator](http://d3pie.org/#generator) that will create the code that you need. If you are wanting create a chart using [R](https://www.r-project.org/) for embedding in a Rmarkdown document or Shiny App, then you are in the right place.  

The `d3pie` library is very versatile and includes a lot of options. Currently this package only wraps the [configuration object](http://d3pie.org/#docs-configuration). Even with this current limitation a wide range of options are available. 

Currently the intention is to wrap the entire [`d3pie` api](http://d3pie.org/#docs-api). 


## Installation

You probably already guesssed this bit.


```r
devtools::install_github("mrjoh3/pier")
```


## Usage

The `pier` package is intended to be as simple and lightweight as possible. As a starting point the data input must be a `data.frame` with three required columns: `label`, `value` and `color`. From this point most of the defaults from `d3pie` are carried over.  


```r
library(pier)

data <- data.frame(label = c('Environment','Education','Business','Community'),
                   value = c(104,19,638,1250),
                   color = RColorBrewer::brewer.pal(4, 'Spectral'))

pier(data)
```

<!--html_preserve--><div id="htmlwidget-913" style="width:400px;height:400px;" class="pier html-widget"></div>
<script type="application/json" data-for="htmlwidget-913">{"x":{"data":{"sortOrder":"none","content":[{"label":"Environment","value":104,"color":"#D7191C"},{"label":"Education","value":19,"color":"#FDAE61"},{"label":"Business","value":638,"color":"#ABDDA4"},{"label":"Community","value":1250,"color":"#2B83BA"}]},"settings":null},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


## Piping

The package also imports the [migrittr](https://cran.r-project.org/web/packages/magrittr/vignettes/magrittr.html) piping function (`%>%`) to simplify syntax.


```r
data %>%
    pier() %>%
    pie.header('My New Header')
```

<!--html_preserve--><div id="htmlwidget-7793" style="width:400px;height:400px;" class="pier html-widget"></div>
<script type="application/json" data-for="htmlwidget-7793">{"x":{"data":{"sortOrder":"none","content":[{"label":"Environment","value":104,"color":"#D7191C"},{"label":"Education","value":19,"color":"#FDAE61"},{"label":"Business","value":638,"color":"#ABDDA4"},{"label":"Community","value":1250,"color":"#2B83BA"}]},"settings":null,"header":{"title":{"text":"My New Header"}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

