


library(shiny)
# shinyUI(pageWithSidebar(
#       headerPanel("Data"),
#       sidebarPanel(
#             h3('Sidebar text')
#             ),
#       mainPanel(
#             h3('Main Panel text')
#             )
#       ))

shinyUI(pageWithSidebar(
      headerPanel("Car MPG Prediction"), 
      sidebarPanel(
            h3('Application Explantion'),
            p("This application is use weight, type of transmission and 1/4 mile 
              time to predict car fuel comsumption mpg. The linear regression model 
              was built on data mtcars. Please click submit button after you choose
              paramters."),
            h4('Input Parameters'),
            sliderInput('wt', 'weight (lb/1000)', value = 3, min = 1, max = 8, step = 0.1),
            checkboxGroupInput('am', 'Type of transimission', c("automatic" = "0","manual" = "1" )),
            sliderInput('qsec', '1/4 mile time', value = 17.8, min = 10, max = 30,step = 0.1),
            submitButton('Submit')
      ),
      
      mainPanel(
            h3('Input wight'),
            verbatimTextOutput("inputwt"),
            h3('Type of transmission'),
            verbatimTextOutput("inputam"),
            h3('Input gross horsepower'),
            verbatimTextOutput("inputqsec"),
            h3('Predicted MPG'),
            verbatimTextOutput("opredmpg")
      )
))