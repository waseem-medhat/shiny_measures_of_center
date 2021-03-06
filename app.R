library(shiny)
library(shinydashboard)
library(ggplot2)

source('prep.R')

dbHeader <- dashboardHeader(
  title = 'A Mean and a Median'
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
        title = 'Prepared plots',
        subtitle = 'Look at these plots, which are pre-made for you.',
        color = 'green',
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
    
    tabItem(
      tabName = 'interactive',
      
      infoBox(
        title = 'Interactive plot',
        subtitle = 'Try on you own! Generate normal and extreme data
        and notice the mean and median.',
        icon = icon('mouse-pointer'),
        color = 'green',
        width = 12
      ),
      
      box(
        width = 12,
        
        sidebarLayout(
          
          sidebarPanel(
            actionButton(
              'add_normal',
              'Add normal data',
              icon = icon('chart-bar')
            ),
            actionButton(
              'add_extreme',
              'Add outlier',
              icon = icon('chart-bar')
            ),
            br(),
            actionButton(
              'reset',
              'Clear data',
              icon = icon('recycle')
            ),
            h3('Generated sample'),
            textOutput('sample'),
            br(),
            textOutput('stats')
          ),
          
          mainPanel(plotOutput('iplot'))
          
        )
      )
    )
  )
)

ui <- dashboardPage(dbHeader, dbSidebar, dbBody, skin = 'black')

server <- function(input, output) {
  
  showModal(
    modalDialog(
      'Good to see you! Let\'s look at some plots.',
      title = h3(icon('star'), 'Welcome'))
  )
  
  
  output$dplot1 <- renderPlot({ dplot1() })
  output$dplot2 <- renderPlot({ dplot2() })
  output$dplot3 <- renderPlot({ dplot3() })
  output$dplot4 <- renderPlot({ dplot4() })
  
  
  iplot_data <- reactiveValues()
  iplot_data$data <- numeric()
  
  observeEvent(input$add_normal, {
    iplot_data$data <- c(iplot_data$data, sample(1:5, 1))
    iplot_data$mean <- round(mean(iplot_data$data), 1)
    iplot_data$median <- median(iplot_data$data)
  })
  
  observeEvent(input$add_extreme, {
    iplot_data$data <- c(iplot_data$data, sample(10:12, 1))
    iplot_data$mean <- round(mean(iplot_data$data), 1)
    iplot_data$median <- median(iplot_data$data)
  })
  
  observeEvent(input$reset, { iplot_data$data <- numeric() })
  
  
  output$sample <- renderText({ paste(iplot_data$data, collapse = ' ') })
  
  output$stats  <- renderText({
    if (length(iplot_data$data > 0)) 
    paste0('mean = ', iplot_data$mean, ', median = ', iplot_data$median)
  })
  
  output$iplot  <- renderPlot({
    if (length(iplot_data$data > 0)) 
    dotplot(iplot_data$data, iplot_data$mean, iplot_data$median)
  })
  
}

shinyApp(ui = ui, server = server)
