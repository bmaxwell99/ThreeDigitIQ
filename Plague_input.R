library(dplyr)

read_plague <- function(logs_data, which){
  data <- read.csv(paste0("C:/Users/dark_/Downloads/", logs_data))
  data.frame(data)
  x <- data %>% mutate(Plague_A = which)
}


data_1 <- read_plague('Warcraft Logs - Combat Analysis for Warcraft.csv', '1')
View(data_1)
data_2 <- read_plague('Warcraft Logs - Combat Analysis for Warcraft.csv (1)', '2')

