library(shiny)
library(ggplot2)

rubpr <- read.csv("rubpr.csv")
rubpr$date <- as.Date(as.character(rubpr$date))

# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
    
    rubprsub <- reactive({
        rubpr[rubpr$date >= input$period[1] &
              rubpr$date <= input$period[2],]
    })

    # Render Plot
    output$prplot <- renderPlot({
        qplot(brent, rub, data=rubprsub()) + 
            geom_smooth(method = "lm", col="red", size=1.3) + 
            theme_bw() +
            labs(title=paste("Period from"
                             , input$period[1]
                             , "to"
                             , input$period[2])
                 , x="Brent Prices in USD/bbl"
                 , y="Rouble prices in USD")
    })
    
    # Predict Rate
    output$rubpr <- renderPrint({
        fit <- lm(rub ~ brent, data=rubprsub())
        ndat <- data.frame(brent=input$brent)
        pr <- predict(fit, newdata =  ndat)[[1]]
        cat(paste(round(1/pr,2), "Roubles for 1 US Dollar"))
        })
})