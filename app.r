library(shiny)
library(DT)
currencies <- readRDS("countries.rds")
ui <- fluidPage(
  titlePanel("World currencies"),
  sidebarLayout(
    selectInput("Currency", "Choose Currency",
                currencies$Currency),
    tableOutput("data")
      )
        )
      

  
server <- function(input, output) {
    
  output$data <- renderTable({
    if(input$Currency!=''){
    currencies[currencies$Currency==input$Currency, c("State or territory","Currency", "ISO code", "Fractional unit","Number to basic"), drop = FALSE]
    }
    else
    {
    currencies[, c("State or territory","Currency", "ISO code", "Fractional unit","Number to basic"),drop = FALSE]
    }
    }, rownames = TRUE)
    
  }
  
shinyApp(ui, server)
