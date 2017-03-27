library(shiny)
library(plotly)
library(dplyr)
library(ggplot2)

# Define UI for application that predicts 1/4 Mile time based on car Weight and HP
shinyUI(fluidPage(
        titlePanel("Predict New Car 1/4 Mile Time"),
        sidebarLayout(
                sidebarPanel(
                h3("New Car Data"),
                tags$br(),
                h4("Select Weight"),
                sliderInput("sliderWT", "Car Weight in Lbs",
                        1500, 5500, 0),
                tags$br(),
                h4("Select Horse Power"),
                sliderInput("sliderHP", "Car Horse Power",
                        50, 350, 0),
                submitButton("Click for Prediction"),
                tags$br(),
                h4("Predicted 1/4 Mile Time"),
                tags$em(textOutput("pred1")," Seconds", style = "color:red;")
              
       
    ),
    
     mainPanel(
        h3("Car Weight vs. Horse Power vs. 1/4 Mile Time"), 
        h4("New car added based on inupt and predicted values", style = "color:red;"),
        plotlyOutput("plot1",height = "500px")
##        h3("New Car Data"),
##        h5("Predicted 1/4 Mile Time in Seconds"),
##        textOutput("pred1"),
##        h5("Input Weight in Lbs"),
##        textOutput("inputWT"),
##        h5("Input Horse Power"),
##        textOutput("inputHP")
    )
  )
))

