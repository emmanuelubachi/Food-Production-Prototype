#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinipsum)
library(shinydashboard)
library(lintr)

# Define UI for application that draws a histogram
ui <- fluidPage(shinydashboard::box(
  width = 12,
  solidHeader = TRUE,
  column(
    12,
    column(
      9,
      column(
        12,
        column(
          3,
          # Application title
          titlePanel("Food Production"),
          tags$p(
            "This dashboard explores the global production of food crops and live stock by region."
          )
        ),
        column(
          9,
          column(
            12,
            tags$p(
              "This dashboard explores the global production of food crops and live stock by region."
            )
          ),
          column(
            12,
            valueBoxOutput("vbox1"),
            valueBoxOutput("vbox2"),
            valueBoxOutput("vbox3")
            #valueBoxOutput("vbox4")
          )
          
        )
        
      ),
      
      column(12,
             column(
               4,
               h4("A Random Plot"),
               plotOutput("plot1"),
             ),
             column(
               8,
               h3("A Random Plot"),
               plotOutput("plot2"),
             )),
      
      column(12,
             h3("A Random Plot"),
             plotOutput("plot3"))
      
    ),
    
    column(3,
           column(
             12,
             h3("A Random Image"),
             plotOutput("image", height = "300px")
           ),
           column(
             12,
             h3("A Random Plot"),
             plotOutput("plot4")
           ))
    
  )
))

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$vbox1 <- renderValueBox({
    valueBox("4000 tons",
             "Title",
             icon = icon("credit-card"))
  })
  
  output$vbox2 <- renderValueBox({
    valueBox("4000 tons",
             "Title",
             icon = icon("credit-card"))
  })
  
  output$vbox3 <- renderValueBox({
    valueBox("4000 tons",
             "Title",
             icon = icon("credit-card"))
  })
  
  output$vbox4 <- renderValueBox({
    valueBox("4000 tons",
             "Title",
             icon = icon("credit-card"))
  })
  
  output$image <- renderImage({
    random_image()
  })
  
  output$plot1 <- renderPlot({
    random_ggplot()
  })
  
  output$plot2 <- renderPlot({
    random_ggplot()
  })
  
  output$plot3 <- renderPlot({
    random_ggplot()
  })
  
  output$plot4 <- renderPlot({
    random_ggplot()
  })
  
}

# Run the application
shinyApp(ui = ui, server = server)


## Sidebar with a slider input for number of bins
# sidebarLayout(
#   sidebarPanel(
#     sliderInput(
#       "bins",
#       "Number of bins:",
#       min = 1,
#       max = 50,
#       value = 30)
#   ),
#   mainPanel(
#     plotOutput("distPlot")
#   )
# )


# output$distPlot <- renderPlot({
#     # generate bins based on input$bins from ui.R
#     x    <- faithful[, 2]
#     bins <- seq(min(x), max(x), length.out = input$bins + 1)
#
#     # draw the histogram with the specified number of bins
#     hist(x, breaks = bins, col = 'darkgray', border = 'white',
#          xlab = 'Waiting time to next eruption (in mins)',
#          main = 'Histogram of waiting times')
# })