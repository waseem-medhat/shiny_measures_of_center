library(shiny)
library(shinydashboard)
library(ggplot2)

source("prep.R")

dbHeader <- dashboardHeader(
  title = "A Mean and a Median"
)

dbSidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem('Prepared plots', tabName = 'prepared'),
    menuItem('Interactive', tabName = 'interactive')
  )
)

dbBody <- dashboardBody(
  tabItems(
    
    tabItem(
      tabName = 'prepared',
      
      infoBox(
        title = "Prepared plots",
        subtitle = "Look at these plots, which are pre-made for you.",
        color = "green",
        width = 12
      ),
      
      fluidRow(
        column(6, plotOutput('dplot1')),
        column(6, plotOutput('dplot2'))
      ),
      
      fluidRow(br()),
      
      fluidRow(
        column(3),
        column(6, plotOutput('dplot3')),
        column(3)
      )
      
    ),
    
    tabItem(tabName = 'interactive', "here will be some interactive plots.")
    
  )
)

ui <- dashboardPage(dbHeader, dbSidebar, dbBody, skin = "black")

server <- function(input, output) {
  output$dplot1 <- renderPlot({ dplot1() })
  output$dplot2 <- renderPlot({ dplot2() })
  output$dplot3 <- renderPlot({ dplot3() })
}

shinyApp(ui = ui, server = server)
