library(shiny)

# Define UI for dataset viewer application
shinyUI(navbarPage(strong("RRRP"),
           tabPanel("Application",
                # Application title
                headerPanel("Russian Rouble Rate Prediction"),
                
                # Sidebar with controls to select a dataset and specify the number
                # of observations to view
                sidebarPanel(
                    sliderInput("period", "Select Period:",
                                value = c(as.Date("2013-12-31"), as.Date("2016-01-01")),
                                   min=as.Date("2013-06-26"), max=as.Date("2016-09-13")),    
                    numericInput("brent", "Input Brent Price in USD:", 50),
                    submitButton("Submit")
                ),
                
                # Show a summary of the dataset and an HTML table with the requested
                # number of observations
                mainPanel(
                    h4("Historical Rouble Rates VS Brent Prices Plot:"),
                    plotOutput("prplot"),
                    h4("The Rate is:"),
                    verbatimTextOutput("rubpr")
            )),
            tabPanel("Documentation",
                 h3("Russian Rouble Rate Prediction Application Users Manual"),
                 h4("Introduction"),
                 p("It's a well known fact the Russian currency is strongly dependent on oil 
                   price. This shiny application is to predict Russian rouble rate aginst US dollar
                   based on Brent oil price indicator. The data for prediction is taken in the period
                   from", strong(em("2013-06-26")), " to ", strong(em("2016-09-13")), ". It's also 
                   possible to subset the period with a slider control."),
                 h4("Controls"),
                 p("One can manipulate 2 controls located in the left side bar of the
                   application page to get the prediction:"),
                 tags$ol(
                     tags$li(strong("Period slider")),
                     tags$li(strong("Brent price"))
                 ),
                 p("With the ", strong("Period slider"), " it's possible to subset a period which 
                   is used as a basis for the prediction."),
                 p("With the ", strong("Brent Price"), " input one can suggest a price for Brent oil 
                   to be used for the prediction."),
                 p("As soon as both slider and price input are set, the", strong("Submit"), " button
                   should be pressed to generate outputs"),
                 h4("Outputs"),
                 p("On the right side bar there are 2 outputs:"),
                 tags$ol(
                     tags$li(strong("Historical data plot")),
                     tags$li(strong("Russian rouble rate prediction"))
                 ),
                 p(strong("Historical data plot"), " shows the plot for the data for the period
                   subset with the slider control."),
                 p(strong("Russian rouble rate prediction"), " shows the prediction of the Russian
                   rouble rate against US dollar based on the chosen period and oil price."),
                 h4("Credits"),
                 p("The data for the application was taken from the", 
                   a("Finam company web site"
                     , href="https://www.finam.ru/"),".")
            )
))