library(shiny)
library(shinydashboard)

dbHeader <- dashboardHeader(
  title = "A Mean and a Median"
)

dbSidebar <- dashboardSidebar()

dbBody <- dashboardBody()

ui <- dashboardPage(dbHeader, dbSidebar, dbBody, skin = "black")

server <- function(input, output) {}

shinyApp(ui = ui, server = server)
