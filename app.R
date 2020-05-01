library(shiny)
library(shinydashboard)

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
    tabItem(tabName = 'prepared', "here will be some prepared plots."),
    tabItem(tabName = 'interactive', "here will be some interactive plots.")
  )
)

ui <- dashboardPage(dbHeader, dbSidebar, dbBody, skin = "black")

server <- function(input, output) {}

shinyApp(ui = ui, server = server)
