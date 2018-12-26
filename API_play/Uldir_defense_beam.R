source('~/ThreeDigitIQ/API_play/API_script.R')

raid_id <- 'TQbAxNwrPDazYH7h'

taloc_beam_data <- damage_taken_by_ability('Taloc', '275445', 1)
hit_data <- taloc_beam_data[["entries"]][["hitdetails"]]
name_data <- taloc_beam_data[['entries']][['name']]
data_length <- hit_data %>% length()

for(i in 1:data_length){
  hit_data[[i]] <- hit_data[[i]] %>% mutate(name = name_data[i])
}


df <- full_join(hit_data[[1]] %>% gather(), hit_data[[2]] %>% gather(), by = 'key')
full_join(df, hit_data[[3]] %>% gather(), by = 'key')

#this wont work. Re-explore joining
df <- data.frame(type = '', total = '', count = '', totalReduced = '', absorbOrOverheal = '', min = '', max = '', name = '')
df[1,] = hit_data[[1]]
df[2,] = hit_data[[2]]
df %>% View()
