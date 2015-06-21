library(shiny)
library(plyr)
library(knitr)
library(markdown)
source("map.R")
library(maps)
library(mapproj)
data <- read.csv("./data/universityinfo.csv")
options(scipen=999)
stCount <- count(data$STABBR)

shinyServer(
    function(input, output) {
        
        data <- data[,c("INSTNM","IALIAS","ADDR","CITY","STABBR","ZIP","GENTELE","WEBADDR")]
        names(data) <- c("NAME","ALIAS","ADDRESS","CITY","STATE","ZIP","PHONE","URL")
        
        output$table <- renderDataTable(data, options = list(
            lengthMenu = list(c(10, 20, -1), c('10', '20', 'All')),
            pageLength = 10,
            pageWidth = 15)
        )
        output$plot <- renderPlot({barplot(stCount$freq, names.arg = stCount$x, 
                                           main = "Facilities By State",ylab = "Total Facilities", 
                                           cex.names = .8, cex.axis = .9, las = 2,
                                           col = c("blue","green"))
        })
        output$map <- renderPlot({percent_map(stCount$freq, "blue", "County Density")
        })
    })



