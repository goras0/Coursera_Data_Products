# server.R


shinyServer(function(input, output) {

  data <- reactive({
    validate(
      need(input$help == FALSE, "This application generates a scatter plot between automobile weight on the horizontal axis and miles per gallon on the vertical axis. Check best fit to add a line of best fit. Check labeling to add labeling points.")
    )

  })
    
    
  output$plot <- renderPlot({
    p <- plot(mtcars$wt, mtcars$mpg, xlab="Car Weight", ylab="Miles Per Gallon", pch=18, col="blue")  
    
    if (input$labeling)
      p <- text(mtcars$wt, mtcars$mpg, row.names(mtcars), cex=0.6, pos=4, col="red")
    
    if (input$bestFit)
      p <- p + abline(lm(mtcars$mpg~mtcars$wt)) 

    print(p)
  })
  
  output$table <- renderTable({
    head(data())
  })

  
})