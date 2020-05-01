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
        column(6, plotOutput('dplot3')),
        column(6, plotOutput('dplot4'))
      )
      
    ),
    
    tabItem(tabName = 'interactive', "here will be some interactive plots.")
    
  )
)

ui <- dashboardPage(dbHeader, dbSidebar, dbBody, skin = "black")

server <- function(input, output) {
  
  showModal(
    modalDialog(
      'Good to see you! Let\'s look at some plots.',
      title = 'Welcome')
  )
  
  output$dplot1 <- renderPlot({ dplot1() })
  output$dplot2 <- renderPlot({ dplot2() })
  output$dplot3 <- renderPlot({ dplot3() })
  output$dplot4 <- renderPlot({ dplot4() })
  
}

shinyApp(ui = ui, server = server)
