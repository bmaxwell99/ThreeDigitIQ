source('~/ThreeDigitIQ/API_play/API_script.R')

raid_id <- 'TQbAxNwrPDazYH7h'

taloc_beam_data <- damage_taken_by_ability('Taloc', '275445', 1)
hit_data <- taloc_beam_data[["entries"]][["hitdetails"]]
name_data <- taloc_beam_data[['entries']][['name']]
data_length <- hit_data %>% length()

for(i in 1:data_length){
  hit_data[[i]] <- hit_data[[i]] %>% mutate(name = name_data[i])
}

#experiment constructing empty data frame and adding each 
df <- data.frame(name = '', type = '',  count = '', total = '', totalReduced = '', absorbOrOverheal = '', min = '', max = '', stringsAsFactors = FALSE)


for(i in 1:data_length) {
  sub_data_length <- hit_data[[i]] %>% length()
  if(sub_data_length == 7) {
    df[i,] <-   
      hit_data[[i]] %>%  
      mutate(totalReduced = '') %>% 
      select(name, type, count, total, totalReduced, absorbOrOverheal, min, max)
  }
  else {
    df[i,] <- 
      hit_data[[i]] %>% 
      select(name, type, count, total, totalReduced, absorbOrOverheal, min, max)
  }
}

df[1,] <-   
  hit_data[[1]] %>%  
  mutate(totalReduced = '') %>% 
  select(name, type, count, total, totalReduced, absorbOrOverheal, min, max)

df %>% View()
