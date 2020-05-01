library(shiny)
library(shinydashboard)

dbHeader <- dashboardHeader()

dbSidebar <- dashboardSidebar()

dbBody <- dashboardBody()

ui <- dashboardPage(dbHeader, dbSidebar, dbBody, "A Mean and a Median", "black")

server <- function(input, output) {}

shinyApp(ui = ui, server = server)
