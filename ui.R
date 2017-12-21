
library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Predict Likelihood to Recommend from Overall Satisfaction"),
  h4("Select the Overall Satisfaction mean using the slider. 
  The resulting Likelihood to Recommend mean will be shown below."),
  
  
  sidebarLayout(
    sidebarPanel(
      
      sliderInput("sliderQ19", "What is the Overall Satisfaction?",
                  0, 10,  value=0),
      checkboxInput("showModel1","Show/Hide Model 1", value=TRUE)
      
    ),
    
    mainPanel(
      
      plotOutput("plot1"),
      h3("Predicted Likelihood to Recommend:"),
      textOutput("pred1")
    )
  )
))
