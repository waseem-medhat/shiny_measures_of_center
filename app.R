library(shiny)
library(shinydashboard)
library(ggplot2)

theme_set(theme_minimal(base_size = 16))

dplot1 <- reactive({ ggplot(mtcars, aes(x = mpg)) + geom_dotplot() })
dplot2 <- reactive({ ggplot(mtcars, aes(x = wt)) + geom_dotplot() })
dplot3 <- reactive({ ggplot(mtcars, aes(x = disp)) + geom_dotplot() })

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
        column(plotOutput('dplot1'), width = 6),
        column(plotOutput('dplot2'), width = 6)
      ),
      
      fluidRow( plotOutput('dplot3') )
      
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
