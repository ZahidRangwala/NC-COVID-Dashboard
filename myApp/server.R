setwd(getwd())
source("setup.R")
source("data.R")
source("graphics.R")

#Back End 
server <- function(input, output) {
  

  #Server Stuff
  output$confirmedNCtable <- renderTable(tableDataNC)
  output$plotNCconfirmed <- renderPlot(ncMapConfirmed)
  
  confirmString <- paste("Total Confirmed: " , sum(dailyNC$Confirmed))
  output$totalDeath <- renderText(confirmString)
  
  confirmString <- paste("Total Deaths: " , sum(dailyNC$Deaths))
  output$totalRecovered <- renderText(confirmString)
  
  confirmString <- paste("Total Recovered: " , sum(dailyNC$Recovered))
  output$totalActive <- renderText(confirmString)
  
  confirmString <- paste("Total Active: " , sum(dailyNC$Active))
  output$totalConfirm <- renderText(confirmString)
  
  output$plotNCdeath <-  renderPlot(ncMapDeath)
  
  output$plotNCrecoverd <-  renderPlot(ncMapRecovered)
  
  output$plotNCactive <-  renderPlot(ncMapActive)
  
  
  
  output$NCbargraph <- renderPlot(confirmedBar)
  
  # Logic for line graph

  output$ncCounty <- renderUI({
    selectInput("county", "Choose County", unique(timeseriesNC[1]))
  })
  
  selectedCounty <- reactive({ input$county })
  
  observeEvent(input$displayConfirmed, {
    output$timeseriesNCconfirmed <-  renderPlot({
      timeseriesNC %>% filter(Admin2 == selectedCounty()) %>%
        filter(Confirmed != 0) %>% select(-Admin2) %>%
        ggplot(aes(x = Date , y = Confirmed , group = 1)) + 
        geom_line(color="#8b0000") + geom_point(color="#8b0000") +
        ggtitle(paste("Cumulative cases in" , selectedCounty())) +
        labs(x="Date", y=("Confirmed Cases")) +
        theme(
          plot.title = element_text(size=20, face="bold",
                                    margin = margin(10, 0, 10, 0)) ,
          axis.text.x=element_text(angle=60, vjust=0.5 , face = "bold") ,
          axis.text.y=element_text(face = "bold"),
          axis.title.x = element_text(vjust=-0.35 , face = "bold"),
          axis.title.y = element_text(vjust=0.35 , face = "bold") 
        )
    })
  })
  
  observeEvent(input$displayDeaths, {
    output$timeseriesNCconfirmed <-  renderPlot({
      timeseriesNC %>% filter(Admin2 == selectedCounty()) %>%
        filter(Deaths != 0) %>% select(-Admin2) %>%
        ggplot(aes(x = Date , y = Deaths , group = 1)) + 
        geom_line(color="#00003b") + geom_point(color="#00003b") +
        ggtitle(paste("Cumulative Deaths in" , selectedCounty())) +
        labs(x="Date", y=("Confirmed Deaths")) +
        theme(
          plot.title = element_text(size=20, face="bold",
                                    margin = margin(10, 0, 10, 0)) ,
          axis.text.x=element_text(angle=60, vjust=0.5 , face = "bold") ,
          axis.text.y=element_text(face = "bold"),
          axis.title.x = element_text(vjust=-0.35 , face = "bold"),
          axis.title.y = element_text(vjust=0.35 , face = "bold") 
        )
    })
  })


}
