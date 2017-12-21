


library(shiny)

shinyServer(function(input, output){
  model1 <- lm(Q18 ~ Q19, data=data)
  
  model1pred <- reactive({
    Q19Input <- input$sliderQ19
    predict(model1, newdata=data.frame(Q19 = Q19Input))
  })
  
  output$plot1 <- renderPlot({
    Q19Input <- input$sliderQ19
    
    plot(data$Q19,data$Q18, xlab="Overall Satisfaction",
         ylab="Likelihood to Recommend", bty="n",pch=16,
         xlim= c(0,10), ylim = c(0, 10))
    if(input$showModel1){
      abline(model1, col="red", lwd=2)
    }
    
    output$pred1 <- renderText({
      model1pred()
    })
    
  })
})

