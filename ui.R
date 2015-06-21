library(shiny)
library(markdown)
library(knitr)

shinyUI(
        navbarPage(
                title = 'Navigation Bar',
                
                tabPanel(
                        'Summary',
                        #includeMarkdown("summary.md")
                        includeMarkdown("summary.Rmd")
                ),
                tabPanel(
                        'Table',
                        dataTableOutput("table")
                ),
                tabPanel('Plots',
                         plotOutput("plot"),
                         
                         plotOutput("map")
                )
        )
)