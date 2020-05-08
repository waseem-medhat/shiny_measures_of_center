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
            h3('Generated sample'),
            textOutput('sample')
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
  iplot_data$cnt_normal  <- 0
  iplot_data$cnt_extreme <- 0
  iplot_data$data <- numeric()
  
  sample_acc <- reactive({
    c(normal_points[0:input$add_normal], extreme_points[0:input$add_extreme])
  })
  
  sample_mean <- reactive({
    mean(sample_acc())
  })
  
  sample_median <- reactive({
    median(sample_acc())
  })
  
  iplot <- reactive({
    dotplot(
      sample_acc(),
      sample_mean(),
      sample_median()
    )
  })
  
  output$iplot  <- renderPlot({ dplot1() })
  output$sample <- renderText({ paste(sample_acc(), collapse = ' ') })
  
}

shinyApp(ui = ui, server = server)
