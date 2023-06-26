# NC-COVID-Dashboard

### Dashboard has been Archived 
At some point during the last year the CSEE at Johns Hopkins University changed the way data is being reported. 
As a result some of the data in the dashboard no longer reflects accuarte real life information. I have archived the link for now. 

Link to the dashboard : https://zahidrangwala.shinyapps.io/COVID-19_Tracker/

### Background 

Side project I have been working on during quarantine to better understand COVID-19 trends in my home state
Primary purpose of pursuing this project was to teach myself more about R shiny.

North Carolina COVID 19 Dashboard showing confirmed cases and deaths on a county to county basis 

Data sourced from the COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University
https://github.com/CSSEGISandData/COVID-19

Dashboard is updated daily with approximately a two day lag to account for discrepancies between John Hopkins repository being updated and my get request to their repository


*Note about Recovered Cases

As of August 16 2020 no cases in NC have been reported as recovered my hope when building this dashboard is eventually we will be able to see 
These cases in the data. 
This does not mean there are no recovered cases in NC

### Features 

#### Tabs
The four tabs at the top correspond to the four tracked metrics: Confirmed Cases, Deaths, Recovered Cases, and Active Cases.
Clicking on any of these tabs will change the NC map to overlay the appropriate metric onto the NC county map

#### Graphics
The bar chart in the middle of the dashboard shows the Worst 30 counties in NC base on Confirmed Cases, displaying the Confirmed cases in red and Deaths in blue.
The rest of the Counties data can be found in the table below

#### Choose a County 
Selecting a county in the drop down menu and then clicking either the confirmed or deaths button will display a time series chart showing the cases/deaths of that county
