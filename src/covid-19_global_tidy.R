library(tidyverse)  
  
  what="deaths"
  data <- read_csv(url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"))
  region <- "Italy"
  last_day=""
  range=29        
  first=range  
  state=""

  # Truncate corona data at `last_day`
  if (last_day !="") {
    last_index <- grep(last_day,names(data))
    data <- data[1:last_index]
  }
  
  # Abbreviations
  r1 <- row.names(data[data[,"Country/Region"]==region & data[,"Province/State"]==state,])
  
  region_deaths <- data[r1,(ncol(data)-first):(ncol(data)-first+range)]
  region_deaths <- gsub(",", "", region_deaths)                     
  region_deaths <- as.numeric(region_deaths)  
  
  plot(region_deaths, 
       col="black", main=paste(data[r1,1], data[r1,2]), 
       xlab=paste(colnames(data)[ncol(data)-first], " to ", colnames(data)[ncol(data)-first+range]), 
       ylab=paste(data[r1,1], data[r1,2], what))   
