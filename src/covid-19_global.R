# one_region() --- plot the number of deaths/cases in a country
# two_regions() --- plot the number deaths/cases comparing two countries

###################################################################################################
# 
# one_region(){
#   what            a string, eg "cases" or "deaths", for labelling the y-axis
#   data            data from Johns Hopkins about cases or deaths
#   region          eg "United States"
#   last_day = ""   last day of data, eg "4/1/20" for April 1, 2020
#   range = 29      the plot is `range + 1` days wide
#   first           how many days before last_day do we start?
#   state = ""      if needed this refers to the first row of the table, eg "Hubei" if `region1` is "China"
# }
###################################################################################################

one_region <- function(
  what="",
  data,
  region,
  last_day="",
  range=29,        
  first=range,  
  state=""
)
{
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
}


###################################################################################################
#
# two_regions(){}
#   what                      a string, eg "cases" or "deaths", for labelling the y-axis
#   data                      data from Johns Hopkins about cases or deaths
#   region1                   for the Johns Hopkins tables, eg "United States", "Korea, South", 
#   region1_pop = region1     for the population table, eg "US", "Korea, Rep."
#   region2                   eg "Italy"
#   region2_pop = region2     eg "Italy"
#   range = 29                the plot is `range + 1` days wide
#   first=range               how many days before `last_day` do we start?
#   lag = 0                   how many days is `region2` ahead of region1?
#   state1 = ""               if needed this refers to the first row of the table, eg "Hubei" if `region1` is "China"
#   state2 = ""
#   last_day = ""             last day of data, eg 4/1/20 for April 1, 2020
# }
###################################################################################################

two_regions <- function(
  what = "",
  data,
  region1,
  region1_pop = region1,  
  region2,
  region2_pop = region2,  
  last_day = "",
  range = 29,
  first=range,
  lag = 0,
  state1 = "",
  state2 = ""
)
{
  # browser() # Uncomment this line for debugging
  
  # Truncate data frame at `last_day`
  if (last_day !="") {
    last_index <- grep(last_day,names(data))
    data <- data[1:last_index]
  }
  # Load population data
  population_data <- read.csv(url("https://raw.githubusercontent.com/datasets/population/master/data/population.csv"))
  pd <- population_data
  
  # Abbreviations for the names of the rows of the regions
  r1 <- row.names(data[data[,"Country/Region"]==region1 & data[,"Province/State"]==state1,])
  r2 <- row.names(data[data[,"Country/Region"]==region2 & data[,"Province/State"]==state1,])
  
  # Compute the population ratio of the two regions
  pop1 <- pd[pd[,"Country.Name"]==region1_pop & pd[,"Year"]==2015,"Value"]
  pop2 <- pd[pd[,"Country.Name"]==region2_pop & pd[,"Year"]==2015,"Value"]
  population_ratio_region1_region2 <- pop1/pop2
  
  # Extract the data of region 1
  region1_deaths <- data[r1,(ncol(data)-first):(ncol(data)-first+range)]
  region1_deaths <- gsub(",", "", region1_deaths)                     
  region1_deaths <- as.numeric(region1_deaths)  
  
  plot(region1_deaths, 
       col="black", 
       main=paste(data[r1,2], "(black) vs", data[r2,2],  "(red):", "lag =",lag, "days"), 
       xlab=paste("Black data runs from ", colnames(data)[ncol(data)-first], " to ", colnames(data)[ncol(data)-first+range]), 
       ylab=paste(data[r1,2], what))   
  
  # Extract the data of region 2
  region2_deaths <- data[r2,(ncol(data)-first-lag):(ncol(data)-first-lag+range)]
  region2_deaths <- gsub(",", "", region2_deaths)                   
  region2_deaths <- as.numeric(region2_deaths)                      
  lines(population_ratio_region1_region2*region2_deaths, col="red")   
}

