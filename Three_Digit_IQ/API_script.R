library(httr)
library(jsonlite)
library(magrittr)
library(dplyr)


key<- readLines('C:/Users/dark_/Desktop/logs_pub_key.txt')
base_uri <- 'https://www.warcraftlogs.com/v1'
endpoint <-paste0('/report/events/', raid_data_id)

res <- GET(paste0(base_uri, endpoint, '?api_key=', key))
http_status(res)
content <- content(res,  'text' )
event_data <- fromJSON(content)
View(event_data)

raid_data <- 
  data %>% 
  filter(zone == 19)

raid_data %>% View()

raid_data_id <- "v2Q8DzGVKxrJanc4"
