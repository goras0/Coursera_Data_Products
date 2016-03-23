library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Cars"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      checkboxInput("bestFit", "regression best fit"),
      checkboxInput("labeling", "labeling points"),
      checkboxInput("help", "help")
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3('Scatter plot between MPG and Weight'),
      tableOutput("table"),
      plotOutput("plot")
    )
  )
))