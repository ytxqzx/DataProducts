library(shiny)
data(mtcars)
fit <-  step(lm(mpg ~ ., data = mtcars))
coef <- summary(fit)$coef
predmpg <- function(wt, am = 0, qsec){
      am <- as.numeric(am)
      coef[1,1] +  wt * coef[2,1] + qsec * coef[3,1]+ am * coef[4,1]}



shinyServer(
      function(input, output){
            
            output$inputwt <- renderPrint({input$wt})
            output$inputqsec <- renderPrint({input$qsec})
            output$inputam <- renderPrint({input$am})
            output$opredmpg <- renderPrint(predmpg(wt = input$wt, qsec = input$qsec, am = input$am))

            
      })

# data(mtcars)
# 
# shinyServer(
#       function(input, output){
#             output$newHist <- renderPlot({
#                   hist(galton$child, xlab = 'child height', col = 'lightblue', main = 'Histogram')
#                   mu <- input$mu
#                   lines(c(mu, mu), c(0, 200), col = 'red', lwd = 5)
#                   mse <- mean((galton$child - mu)^2)
#                   text(63, 150, paste("mu = ", mu))
#                   text(63, 140, paste("mse = ", round(mse, 2)))
#             })
#       }
# )