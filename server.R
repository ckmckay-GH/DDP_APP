library(shiny)

shinyServer(function(input, output) {
        data(mtcars)
        mtcars$model <- rownames(mtcars)
        mtcars <- mtcars[,c(4,6,7,12)]
        inputWT <- 1.5
        inputHP <- 50
        
## Prediction model        
        mtfit <- lm(qsec ~ wt + hp, data = mtcars)
## Prediction       
        mtfitpred <- reactive({
                inputWT <- input$sliderWT/1000
                inputHP <- input$sliderHP
                predict(mtfit, newdata = data.frame(wt = inputWT, hp = inputHP))        
        })
        
        PredTime <- predict(mtfit, newdata = data.frame(wt = inputWT, hp = inputHP))
        
## Plot        
        output$plot1 <- renderPlotly({
                inputWT <- input$sliderWT/1000
                inputHP <- input$sliderHP
                PredTime <- predict(mtfit, newdata = data.frame(wt = inputWT, hp = inputHP))
        P <- plot_ly(mtcars, x = ~wt, y = ~hp, z = ~qsec, 
                        hoverinfo = 'text', text = ~paste(model), name = "mtcars") %>%
                        add_markers() %>%
                        layout(scene = list(xaxis = list(title = 'Weight (lbs 1000s)'),
                                            yaxis = list(title = 'Horse Power'),
                                            zaxis = list(title = '1/4 Mile Time (seconds)'))) %>%
                        add_trace(p, type = "scatter3d", x = inputWT, y = inputHP, z = PredTime, 
                                text = "New Car", name = 'New Car', mode = 'markers')
        })        
 ## Prediction output
        
        output$pred1 <- renderText({round(mtfitpred(),2)
        })        
 
})
