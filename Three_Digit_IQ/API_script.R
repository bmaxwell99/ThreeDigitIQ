library(httr)
library(jsonlite)
library(magrittr)
library(dplyr)


if(Sys.info()["user"] == "dark_") {
  PROJECTDIR <- file.path("C:", "Users", "dark_","Desktop")
  key_name <- "/logs_pub_key.txt"
  
} else if (Sys.info()["user"] == 'desktop' ){
  PROJECTDIR <- file.path()
  fileName <- "josh_results.csv"

} 

setwd(PROJECTDIR)

#Identifying info for the logs you want to pull
raid_data_id <- "8QjYhJFrZtgVb2mA"


key<- paste0(getwd(), key_name) %>% 
  readLines()
base_uri <- 'https://www.warcraftlogs.com:443/v1'
endpoint <-paste0('/report/fights/', raid_data_id)

res <- GET(paste0(base_uri, endpoint, '?api_key=', key))
http_status(res)
content <- content(res,  'text' )
event_data <- fromJSON(content)
View(event_data)

