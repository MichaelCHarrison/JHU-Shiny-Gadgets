library(shiny)
library(miniUI)


# Function plots girth and volume from trees data set and allows user to select datapoints
# by drawing a rectangle which then outputs the dataframe from the selection

pickTrees <- function() {
        ui <- miniPage(
                gadgetTitleBar("Select Points by Draggin your Mouse"),
                miniContentPanel(
                        plotOutput("plot", height = "100%", brush = "brush")
                )
        )
        
        server <- function(input, output, session){
                output$plot <- renderPlot({
                        plot(trees$Girth, trees$Volume, main = "Trees!",
                             xlab = "Girth", ylab = "Volume")
                })
                
                observeEvent(input$done, {
                        #stops app after brushpoints are collected (selected rectangle)
                        stopApp(brushedPoints(trees, input$brush,
                                              xvar = "Girth", yvar = "Volume"))
                })
        }
        
        runGadget(ui, server)
}

# Can assign the function to a variable to call points for further use:
# selectedPoints <- pickTrees()
# 
# Could also use this functionality to select outlier to determine where/what they are.