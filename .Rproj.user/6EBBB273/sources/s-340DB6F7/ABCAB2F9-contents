#Seperate file for creating graphics


#Creating Maps 

ncMapConfirmed <- dailyNCMerge %>%  ggplot() + 
  geom_sf(aes(fill = Confirmed)) + 
  scale_fill_gradient(low = "#f5f5f5",high = "#8b0000", na.value = "grey50" , trans = "log") + 
  ggtitle("Confirmed Cases as of " ,  dateString ) +
  geom_text(aes(label = substr(Admin2 , start = 1 , stop = 4), x = Long_, y = Lat) , size = 3) +
  coord_sf()

ncMapDeath <- dailyNCMerge %>%  ggplot() + 
  geom_sf(aes(fill = Deaths)) + 
  scale_fill_gradient(low = "#f5f5f5",high = "#00003b", na.value = "grey50") + 
  ggtitle("Deaths as of " ,  dateString ) +
  geom_text(aes(label = substr(Admin2 , start = 1 , stop = 4), x = Long_, y = Lat) , size = 3) +
  coord_sf()

ncMapRecovered <- dailyNCMerge %>%  ggplot() + 
  geom_sf(aes(fill = Recovered)) + 
  scale_fill_gradient(low = "#f5f5f5",high = "Green", na.value = "grey50") + 
  ggtitle("Recoveries as of " ,  dateString ) +
  geom_text(aes(label = substr(Admin2 , start = 1 , stop = 4), x = Long_, y = Lat) , size = 3) +
  coord_sf()

ncMapActive <- dailyNCMerge %>%  ggplot() + 
  geom_sf(aes(fill = Active)) + 
  scale_fill_gradient(low = "#f5f5f5",high = "Yellow", na.value = "grey50") + 
  ggtitle("Active Cases as of " ,  dateString ) +
  geom_text(aes(label = substr(Admin2 , start = 1 , stop = 4), x = Long_, y = Lat) , size = 3) +
  coord_sf()

#Creating Graphs

confirmedBar <- bardataNC %>% ggplot(aes(x= reorder(County ,value) , y = value , fill = variable )) +
  geom_bar(stat="identity" , position = "stack") + 
  geom_text(aes(label = value)) +
  coord_flip()

#Creating Table
