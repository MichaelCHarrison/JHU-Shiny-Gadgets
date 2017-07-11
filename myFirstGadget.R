library(shiny)
library(miniUI)

myFirstGadget <- function(){
        ui <- miniPage(
                gadgetTitleBar("My First Gadget")
        )
        server <- function(input, output, session){
                #Done button closes app
                observeEvent(input$done,{
                        stopApp()
                })
        }
        runGadget(ui, server)
}