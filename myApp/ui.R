library(shinydashboard)
library(shiny)

sidebar <- dashboardSidebar(sidebarMenu(menuItem("North Carolina", tabName = "ncTab")))

body <- dashboardBody(tabItems(
  tabItem(
    tabName = "ncTab",
    tabBox(
      id = "NCTab" ,
      height = "450px" ,
      width = "800px" ,
      tabPanel(
        "Confirmed" ,
        textOutput("totalConfirm"),
        tags$head(
          tags$style(
            "#totalConfirm{
                                 text-align: center;
                                 background-color: #8b0000;
                                 border: 1px solid #000000;
                                 font-family: Helvetica;
                                 font-size: 20px;
                                 font-style: bold;}"
          )
        ),
        plotOutput("plotNCconfirmed")
      ),
      tabPanel(
        "Deaths" ,
        textOutput("totalDeath"),
        tags$head(
          tags$style(
            "#totalDeath{
                                 text-align: center;
                                 background-color: #466085;
                                 border: 1px solid #000000;
                                 font-family: Helvetica;
                                 font-size: 20px;
                                 font-style: bold;}"
          )
        ),
        plotOutput("plotNCdeath")
      ),
      tabPanel(
        "Recovered" ,
        textOutput("totalRecovered"),
        tags$head(
          tags$style(
            "#totalRecovered{
                                 text-align: center;
                                 background-color: Green;
                                 border: 1px solid #000000;
                                 font-family: Helvetica;
                                 font-size: 20px;
                                 font-style: bold;}"
          )
        ),
        plotOutput("plotNCrecoverd")
      ),
      
      tabPanel(
        "Active" ,
        textOutput("totalActive"),
        tags$head(
          tags$style(
            "#totalActive{
                                 text-align: center;
                                 background-color: Yellow;
                                 border: 1px solid #000000;
                                 font-family: Helvetica;
                                 font-size: 20px;
                                 font-style: bold;}"
          )
        ),
        
        
        
        plotOutput("plotNCactive")
      )
    ),
    plotOutput("NCbargraph"),
    uiOutput("ncCounty"),
    actionButton("displayConfirmed", "Confirmed"),
    actionButton("displayDeaths", "Deaths"),
    plotOutput("timeseriesNCconfirmed"),
    tableOutput("confirmedNCtable")
  )
))

dashboardPage(skin = "purple" ,
              dashboardHeader(title = "COVID-19 Dashboard"),
              sidebar,
              body)
