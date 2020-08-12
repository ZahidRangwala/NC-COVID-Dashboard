library(shinydashboard)
library(shiny)

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("North Carolina", tabName = "ncTab")
  )
)

body <- dashboardBody(
  tabItems(
    
    tabItem(tabName = "ncTab",
        tabBox(
          id = "NCTab" , height = "450px" , width = "800px" ,
          tabPanel(
            "Confirmed" , 
            textOutput("totalConfirm"),
                tags$head(tags$style("#totalConfirm{
                                 text-align: center;
                                 background-color: red;
                                 border: 1px solid #000000;
                                 font-family: Helvetica;
                                 font-size: 20px;
                                 font-style: bold;}"
                         )
                ),
            plotOutput("plotNCconfirmed")
          ),
          
          
          
          tabPanel("Deaths" , plotOutput("plotNCdeath")),
          tabPanel("Recovered" , plotOutput("plotNCrecoverd")),
          tabPanel("Active" , plotOutput("plotNCactive"))
        ),
        plotOutput("NCbargraph"),
        uiOutput("ncCounty"),
        plotOutput("timeseriesNCconfirmed"),
        tableOutput("confirmedNCtable")
      )
  )
)

dashboardPage(
  skin = "purple" ,
  dashboardHeader(title = "COVID-19 Dashboard"),
  sidebar,
  body
)
