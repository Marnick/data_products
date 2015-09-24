require(shiny)

# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(
     
          # Application title
          headerPanel("Plotting MT cars information"),

          # Sidebar with a slider input for the number of bins
          sidebarPanel(
               selectInput("xcol",
                           "Variabel for the x-axis:",
                           choices = names(mtcars)),
               selectInput("ycol",
                           "Variabel for the y-axis:",
                           choices = names(mtcars),
                           selected = names(mtcars)[2]),
          
               helpText(h4("Available variabeles")),
               helpText("mpg:   Miles/(US) gallon"),
               helpText("disp:	Displacement (cu.in.)"),
               helpText("hp:	Gross horsepower"),
               helpText("drat:	Rear axle ratio"),
               helpText("wt:	Weight (lb/1000)"),
               helpText("qsec:	 1/4 mile time"),
               helpText("vs:	 V/S"),
               helpText("am:	 Transmission (0 = auto, 1 = man)"),
               helpText("gear:	 Number of forward gears"),
               helpText("carb:	 Number of carburetors")
          ),

          # Show a plot of the generated distribution
          mainPanel(
               helpText("With this shiny app you can play around with the 
                        mt-cars dataset that is provided with R. With the
                        select-boxes on the left you can select different
                        variabels for the x and y axis. A scatter plot is presented
                        with a regression-line. The slope and intercept of this
                        regression line are shown beneath the plot.
                        Have fun!"),
               plotOutput("carsPlot"),
               verbatimTextOutput("intercept"),
               verbatimTextOutput("slope")
          )
     
     )
)