#downloading shiny libraries
library(shiny)
#creating a shiny application
shinyUI(
  navbarPage("Shiny Application",
             tabPanel("Analysis",
                      fluidPage(
                        titlePanel("A relationship between Miles per Gallon(MPG) and the other variables."),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Number of cylinders" = "cyl",
                                          "Displacement (cu.in.)" = "disp",
                                          "Gross horsepower" = "hp",
                                          "Rear axle ratio" = "drat",
                                          "Weight (lb/1000)" = "wt",
                                          "1/4 mile time" = "qsec",
                                          "V/S" = "vs",
                                          "Transmission" = "am",
                                          "Number of forward gears" = "gear",
                                          "Number of carburetors" = "carb"
                                        )),
                            
                            checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                          ),
                          
                          mainPanel(
                            h3(textOutput("Caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                        tabPanel("Regression model", 
                                                 plotOutput("mpgPlot"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             ),
             tabPanel("Describing the dataset:",
                      
                      h3("Regression Models(Course 7), Linear, Polynomial, Logistic Regression"),
                      helpText("As an employee of Top Gear, a famous automobile Magazine, we have to decide whether automatic or manuel transmission
                               is better in terms of mpg, using multiple linear regression analysis."),
                      h3("Imperitive:"),
                      p("Dataset has 11 variables and 32 observation."),
                      
                      a("https://class.coursera.org/regmods-008")
             ),
             tabPanel("Increasing the details of the data",
                      h2("Motor Trend Car Road Tests"),
                      hr(),
                      h3("Describing"),
                      helpText("This data was extracted from various magazines to analyse them and find out whether we have made
                               the necessary developments for making automobiles cost effective and environment friendly."),
                      h3("Format"),
                      p("A data frame with 32 observations on 11 variables."),
                      
                      p("  [, 1]   mpg         Miles/(US) gallon"),
                      p("  [, 2]	 cyl	 Number of cylinders"),
                      p("  [, 3]	 disp	 Displacement (cu.in.)"),
                      p("  [, 4]	 hp	 Gross horsepower"),
                      p("  [, 5]	 drat	 Rear axle ratio"),
                      p("  [, 6]	 wt	 Weight (lb/1000)"),
                      p("  [, 7]	 qsec	 1/4 mile time"),
                      p("  [, 8]	 vs	 V/S"),
                      p("  [, 9]	 am	 Transmission (0 = automatic, 1 = manual)"),
                      p("  [,10]	 gear	 Number of forward gears"),
                      p("  [,11]	 carb	 Number of carburetors"),
                      
                      h3("Sources:"),
                      
                      p("Matt Le Blanc from Top Gear, Building multiple regression models interactively. Biometrics, 37, 391-411.")
             ),
             tabPanel("Github:",
                      a("https://github.com/ShreyasR26/Developing-Data-Products-week-4-"),
                      hr(),
                      h4("This is my shiny application "),
                      h4("Repository: Shiny app")
             )
  )
)

#Analysis done on regression in mtcars dataset.