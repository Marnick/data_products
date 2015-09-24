require(shiny);
require(ggplot2);

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
     
     selectedData <- reactive({
          mtcars[, c(input$xcol, input$ycol)]
     })
     
     model <- reactive({
          eval(parse(text=paste0("lm(", input$ycol, " ~ ", input$xcol, ", mtcars)")))
     })
          
     output$carsPlot <- renderPlot({
          plot(selectedData(),
               pch = 20, 
               cex = 3,
               col = 10)
          abline(model(), 
                 lty = 2,
                 lwd =3)
     })
     
     output$intercept <- renderText({
          paste0("Intercept: ", 
                 round(model()$coefficients[1],1), 
                 " ", 
                 input$ycol)
     })
     output$slope <- renderText({
          paste0("Slope: ", 
                 round(model()$coefficients[2],1), 
                 " ",
                 input$ycol, 
                 "/",
                 input$xcol)
     })
})

