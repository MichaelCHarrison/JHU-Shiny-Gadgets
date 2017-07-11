library(shiny)
library(miniUI)

multiplyNumbers <- function(numbers1, numbers2) {
        ui <- miniPage(
                gadgetTitleBar("Multiply Two Numbers"),
                miniContentPanel(
                        #selectInput produce dragdown boxes
                        selectInput("num1", "First Number", choices = numbers1),
                        selectInput("num2", "Second Number", choices = numbers2)
                )
        )
        
        server <- function(input, output, session){
                observeEvent(input$done, {
                        num1 <- as.numeric(input$num1)
                        num2 <- as.numeric(input$num2)
                        stopApp(num1 * num2)
                })
        }
        runGadget(ui, server)
}

# The function can be provided with two ranges of numbers to populate the 
# dragdown boxes of the gadget 