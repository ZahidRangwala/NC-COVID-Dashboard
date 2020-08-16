#Separate File for Importing/Cleaning data


#Getting the data from the John Hopkins Repository
dateString <- as.character(format(Sys.Date() - 2, format="%m-%d-%Y"))
url <- as.character(paste("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/" , dateString , ".csv" , sep = "", collapse = NULL))
x <- getURL(url)
daily <- read.csv(text = x)

usTimeseriesConfirmed <- read.csv(text = getURL("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_US.csv"))

usTimeseriesDeaths <- read.csv(text = getURL("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_US.csv"))


#Data Cleaning
dailyNC <- daily %>% filter(Province_State == "North Carolina")
timeseriesNC <- usTimeseriesConfirmed %>% filter(Province_State == "North Carolina")
timeseriesNC <- timeseriesNC %>% select(Admin2 , starts_with("X"))
timeDeathsappend <- usTimeseriesDeaths %>% filter(Province_State == "North Carolina") %>%
  select(Admin2 , starts_with("X"))

ncTimeC <- usTimeseriesConfirmed %>% filter(Province_State == "North Carolina") %>% 
  select(Province_State , starts_with("X"))
ncTimeC <- melt(ncTimeC)
ncTimeC <- ncTimeC %>% rename(Admin2 = Province_State) %>% group_by(Admin2 , variable) %>%
  summarise(value = sum(value))

ncTimeD <- usTimeseriesDeaths %>% filter(Province_State == "North Carolina") %>% 
  select(Province_State , starts_with("X"))
ncTimeD <- melt(ncTimeD)
ncTimeD <- ncTimeD %>% rename(Admin2 = Province_State) %>% group_by(Admin2 , variable) %>%
  summarise(value = sum(value))


timeseriesNC <- melt(timeseriesNC)
timeDeathsappend <-melt(timeDeathsappend)

timeDeathsappend <- rbind( data.frame(ncTimeD) , data.frame(timeDeathsappend))
timeseriesNC <- rbind( data.frame(ncTimeC) , data.frame(timeseriesNC))
timeseriesNC$variable <- gsub("X" , "" , timeseriesNC$variable)

timeseriesNC$variable <- parse_datetime(as.character(timeseriesNC$variable) , format = "%m.%d.%y")
timeseriesNC$variable <- format(timeseriesNC$variable, "%m/%d")

timeseriesNC <- timeseriesNC %>% rename(Confirmed = value) 
timeseriesNC <- timeseriesNC %>% rename(Date = variable) 
timeseriesNC$Deaths <- timeDeathsappend$value

#Shape Data
USshapeData <- st_read("gz_2010_us_050_00_5m.shp") #Reading in shape data
NCshapeData <- filter(USshapeData , STATE == 37) #Filter for NC

NCshapeData <- NCshapeData %>% rename(Admin2 = NAME)

dailyNCMerge <- NCshapeData %>% inner_join(dailyNC, by = "Admin2")


#Graphics Data

bardataNC <- dailyNC %>% arrange(desc(Confirmed)) %>% head(n = 30) %>% 
  select(Admin2 , Confirmed , Deaths) %>% rename(County = Admin2) %>% melt()

tableDataNC <- dailyNC %>% select(Admin2 , Confirmed , Deaths , Recovered , Active) 
tableDataNC$CountyCode <- substr(dailyNC$Admin2 , start = 1 , stop = 4)
rename(tableDataNC, County = Admin2) 
tableDataNC <- tableDataNC[, c(1,6,2,3,4,5)]

