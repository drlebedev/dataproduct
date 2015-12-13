library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  src_data <- read.csv("../data/src.csv")
  
  # Generate a summary of the data
  output$summary <- renderPrint({
    summary(src_data)
  })

  output$water_temp_plot <- renderPlot({
    hist(src_data$water_temp, main = "Water Tempreture", xlab = "t (Celsium)")
  })
  
  output$wind_plot <- renderPlot({
    hist(src_data$wind, main = "Wind", xlab = "MpH")
  })
  
  output$air_temp_plot <- renderPlot({
    hist(src_data$air_temp, main = "Air Tempreture", xlab = "t (Celsium)")
  })

  output$pressure_plot <- renderPlot({
    hist(src_data$pressure, main = "Barometric pressure", xlab = "millibar")
  })
  
  output$corr_plot <- renderPlot({
    pairs(~water_temp + wind + air_temp + pressure, data=src_data, main="Parameters correlation matrix")
  })
  
  model <- reactive({
    params <- c("wind", "air_temp", "pressure")[c(input$use_wind, input$use_air_temp, input$use_pressure)]
    f <- as.formula(paste("water_temp~", paste(params, collapse = "+")))    
    lm(f, data = src_data)
  })
  
  output$prediction <- renderPrint({
    nd <- data.frame(wind = c(input$p_wind),
                     air_temp = c(input$p_air_temp),
                     pressure = c(input$p_pressure))
    cat(predict(model(), newdata = nd))
  })

  output$model_summary <- renderPrint({
    summary(model())
  })
  
})