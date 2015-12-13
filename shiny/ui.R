library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Tomales Bay water tempreture prediction model"),
  
  sidebarLayout(
    sidebarPanel(
      h3("Model parameters"),      
      checkboxInput("use_wind", label = "Use Wind", value = TRUE),
      checkboxInput("use_air_temp", label = "Use Air Tempreture", value = TRUE),
      checkboxInput("use_pressure", label = "Use Barometric Pressure", value = TRUE),
      h3("Prediction parameters"),
      sliderInput("p_wind", "Wind:", 
                  min = 0, max = 40, value = 5.0, step= 0.2),
      sliderInput("p_air_temp", "Air Tempreture:", 
                  min = -1, max = 27, value = 15.0, step= 0.5),
      sliderInput("p_pressure", "Barometric Pressure:", 
                  min = 990, max = 1030, value = 1010.0, step= 1.0)
    ),
    
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Summary", 
                           h3("Executive summary"),
                           p("Provided model is a linear model that allows to predict water tempreture
                             in Tomales Bay (Point Reyes, CA) based on wind, air temp and pressure. 
                             Fill free to add/remove model parameters on left panel. Results would be 
                             dynamically updated on prediction panel. Use input fields to predict based on your own data."),
                           h3("Data source"),
                           p("All the data for this model provided by the University 
                              of California, Davis, Bodega Marine Laboratory and a property of Laboratory. 
                              Data are subject of copyrigth."),
                           br(),
                           p("Source data can be found on: ", 
                             a("http://bml.ucdavis.edu/boon/data_access.html")
                           ),
                           br(),                           
                           p("Model is built on hourly 2013 data of water tempreture, average wind, 
                             air tempreture and barometric pressure. 
                             All tempreture is in Celsium. Wind is in mph. Barometric pressure is in millibars.")
                  ), 
                  tabPanel("Exploratory analysis", 
                           h3("Model data summary"),
                           verbatimTextOutput("summary"),
                           h3("Parameters historgrams"),
                           plotOutput("water_temp_plot"),
                           plotOutput("wind_plot"),
                           plotOutput("air_temp_plot"),
                           plotOutput("pressure_plot"),
                           plotOutput("corr_plot")
                  ),
                  tabPanel("Prediction", 
                           div(class="jumbotron",
                                 h3("Predicted water tempreture"),
                                 h1(textOutput("prediction"))
                               ),
                           h3("Model overview"),
                           verbatimTextOutput("model_summary")
                  )
      )
    )
  )
))