# two_regions <- function(
  cd <- read.csv(check.names = FALSE,url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"))
  region1 <- "Germany"
  region1_pop=region1 
  region2 <- "Italy"
  region2_pop=region2
  range=29
  first=range
  lag=0
  state1=""
  state2=""
  last_day=""

  # Truncate data frame at `last_day`
  if (last_day !="") {
    last_index <- grep(last_day,names(cd))
    cd <- cd[1:last_index]
  }
  
  # Load population data
  population_data <- read.csv(url("https://raw.githubusercontent.com/datasets/population/master/data/population.csv"))
  pd <- population_data
  
  # Abbreviations for the names of the rows of the regions
  r1 <- row.names(cd[cd[,"Country/Region"]==region1 & cd[,"Province/State"]==state1,])
  r2 <- row.names(cd[cd[,"Country/Region"]==region2 & cd[,"Province/State"]==state1,])
  
  # Compute the population ratio of the two regions
  pop1 <- pd[pd[,"Country.Name"]==region1_pop & pd[,"Year"]==2015,"Value"]
  pop2 <- pd[pd[,"Country.Name"]==region2_pop & pd[,"Year"]==2015,"Value"]
  population_ratio_region1_region2 <- pop1/pop2
  
  # Extract the data of region 1
  region1_deaths <- cd[r1,(ncol(cd)-first-lag):(ncol(cd)-first-lag+range)]
  region1_deaths <- gsub(",", "", region1_deaths)                     
  region1_deaths <- as.numeric(region1_deaths)  
  
  plot(region1_deaths, 
       col="black", 
       main=paste(cd[r1,2], "(black) vs", cd[r2,2],  "(red):", "lag =",lag, "days"), 
       xlab=paste("Black data runs from ", colnames(cd)[ncol(cd)-first], " to ", colnames(cd)[ncol(cd)-first+range]), 
       ylab=paste(cd[r1,2], "deaths"))   
  
  # Extract the data of region 2
  region2_deaths <- cd[r2,(ncol(cd)-(first+lag)):(ncol(cd)-(first+lag)+range)]
  region2_deaths <- gsub(",", "", region2_deaths)                   
  region2_deaths <- as.numeric(region2_deaths)                      
  lines(population_ratio_region1_region2*region2_deaths, col="red")   

