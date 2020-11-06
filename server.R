#import datasets library
library(datasets)
#import ggpubr library
library(ggpubr)
#import shiny library
library(shiny)

#car_dataset is a variable used to import the in-built dataset mtcars.
car_dataset <- mtcars
#setting automatic and manual as factors
car_dataset$am <- factor(car_dataset$am, labels = c("Automatic", "Manual"))

shinyServer(function(input, output) {
  #formula text inputs a variable
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  #formulaText point takes mpg from mtcars
  formulaTextPoint <- reactive({
    paste("mpg ~", "as.integer(", input$variable, ")")
  })
  #fit takes car_dataset
  fit <- reactive({
    lm(as.formula(formulaTextPoint()), data=car_dataset)
  })
  #render text
  output$caption <- renderText({
    formulaText()
  })
  #making a box plot
  output$mpgBoxPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = car_dataset,
            outline = input$outliers)
  })
  #renderPrint
  output$fit <- renderPrint({
    summary(fit())
  })
  #render plot
  output$mpgPlot <- renderPlot({
    with(car_dataset, {
      plot(as.formula(formulaTextPoint()))
      abline(fit(), col=2)
    })
  })
  
})