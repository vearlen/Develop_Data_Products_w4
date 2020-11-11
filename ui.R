
library(shiny)
library(plotly)
library(tidyverse)

shinyUI(fluidPage(

    titlePanel("Explore Motor Trend Car Road Tests"),
p("You can explore the Motor Trend data by changing variables for axes, color and size.
You can also build a linear or polynomial regression to the displayed plot and see the R-squared coefficient."),
   
    sidebarLayout(
        sidebarPanel(
            selectInput("Xvariable", "X-axis:",
                        c("Miles/gallon" = "mpg",
                          "Cylinders" = "cyl",
                          "Displacement" = "disp",
                          "Horsepower" = "hp",
                          "Rear axle Ratio"="drat",
                          "Weight"='wt',
                          'Engine'='vs',
                          'Transmission'='am',
                          'Number of carburetors'='carb'),
                        selected = "mpg"),
            selectInput("Yvariable", "Y-axis:",
                        c("Miles/gallon" = "mpg",
                          "Cylinders" = "cyl",
                          "Displacement" = "disp",
                          "Horsepower" = "hp",
                          "Rear axle Ratio"="drat",
                          "Weight"='wt',
                          'Engine'='vs',
                          'Transmission'='am',
                          'Number of carburetors'='carb'),
                        selected = "disp"),
            selectInput("Color", "Color:",
                        c("Miles/gallon" = "mpg",
                          "Cylinders" = "cyl",
                          "Displacement" = "disp",
                          "Horsepower" = "hp",
                          "Rear axle Ratio"="drat",
                          "Weight"='wt',
                          'Engine'='vs',
                          'Transmission'='am',
                          'Number of carburetors'='carb'),
                        selected = "wt"),
            selectInput("Size", "Size:",
                        c("Miles/gallon" = "mpg",
                          "Cylinders" = "cyl",
                          "Displacement" = "disp",
                          "Horsepower" = "hp",
                          "Rear axle Ratio"="drat",
                          "Weight"='wt',
                          'Engine'='vs',
                          'Transmission'='am',
                          'Number of carburetors'='carb'),
                        selected = "hp"),
            checkboxInput("showModel","Build and show linear regression?",value = FALSE),
            sliderInput("Poly","How many polynomials?",min = 1, max = 5, step = 1, value=1)
        ),
        

        # Show a plot of the generated distribution
        mainPanel(
plotlyOutput("Plot"),
textOutput("Text")
        )
    )
))
