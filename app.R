library(tidyverse)
library(shiny)
library(shinydashboard)
library(shinycssloaders)
library(lubridate)
library(DT)

body <- dashboardBody(
                      
                      column(width = 3,
                          
                             box(width = 12,
                              
                                 sliderInput(inputId = 'date_range', label = 'Date Range', )
                              
                              )
                          
                          ),
                      
                      column(width = 9,
                             
                             box(width = 12,
                                 
                                 DT::dataTableOutput(outputId = 'sales_table')
                                 
                                 )
                             )
                      )

header <- dashboardHeader(disable = TRUE)
sidebar <- dashboardSidebar(disable = TRUE)

ui <- dashboardPage(header, sidebar, body)


server <- function(input, output, session) {
  
  sales_data <- read_rds('sales dashboard/sales_cleaned.rds')
  
  output$sales_table <- renderDataTable({
    
    DT::datatable(sales_data)
    
  })
  
}

runApp(list(ui = ui, server = server), launch.browser = TRUE)





