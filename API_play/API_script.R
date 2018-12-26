library(httr)
library(jsonlite)
library(magrittr)
library(dplyr)
library(tidyr)
library(tibble)


if(Sys.info()["user"] == "dark_") {
  PROJECTDIR <- file.path("C:", "Users", "dark_","Desktop")
  key_name <- "/logs_pub_key.txt"
  
} else if (Sys.info()['user'] == 'other user' ){
  PROJECTDIR <- file.path()
  key_name <- "/logs_pub_key.txt"
} 

setwd(PROJECTDIR) 
key<- paste0(getwd(), key_name) %>% 
  readLines()
base_uri <- 'https://www.warcraftlogs.com:443/v1'

#core function for running the api and converting the json
run_api <- function(endpoint) {
  res <- GET(paste0(base_uri, endpoint, 'api_key=', key))
  http_status(res)
  content <- content(res,  'text' )
  x <- fromJSON(content)
}


#functions creating the endpoints
events_endpoint <- function(raid_id, start_time, end_time) {
  x <- paste0('/report/events/', raid_data_id, '?', 'start=', start_time, '&end=', end_time, '&')
}

fights_endpoint <- function(raid_id) {
  x <- paste0('/report/fights/' , raid_id, '?')
}

tables_endpoint <- function(view, raid_id, start_time, end_time, ability_id){
  x <- paste0('/report/tables/', view, '/', raid_id, '?', 'start=', start_time, '&end=', end_time, '&abilityid=', ability_id, '&')
}

damage_taken_by_ability <- function(boss_name, spell_id, n_fight){
  data <- 
    (
      fights_endpoint(raid_id) %>% 
        run_api()
    )[['fights']] %>% 
        filter(name == boss_name)
  x <- tables_endpoint('damage-taken', raid_id, data[n_fight, 'start_time'], data[n_fight, 'end_time'], spell_id) %>% 
    run_api()
}


  