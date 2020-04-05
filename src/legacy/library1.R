# deaths() --- plot the number of deaths in a country
# deaths_2_countries() --- plot the number deaths comparing two countries

#################################
#
# deaths(){}
#   region,                eg "United States"
#   range=29,               width (number of days -1) of the window
#   first,                  how many days before last_day do we start?
#   state="",              if needed this refers to the first row of the table, eg "Hubei" if region1 is "China"
#   last_day=""             last day of data, eg 4/1/20 for April 1, 2020
# }
#################################

deaths <- function(
  region,
  range=29,        
  first=range,  
  state="",
  last_day=""
)
{
  # Load coronavirus data from Johns Hopkins
  corona_data <- read.csv(check.names = FALSE,url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"))
  cd <- corona_data
  if (last_day !="") {
    last_index <- grep(last_day,names(cd))
    cd <- cd[1:last_index]
  }
  
  # Abbreviations
  r1 <- row.names(cd[cd[,"Country/Region"]==region & cd[,"Province/State"]==state,])

  region_deaths <- cd[r1,(ncol(cd)-first):(ncol(cd)-first+range)]
  region_deaths <- gsub(",", "", region_deaths)                     
  region_deaths <- as.numeric(region_deaths)  
  
  plot(region_deaths, 
       col="black", main=paste(cd[r1,1], cd[r1,2]), 
       xlab=paste(colnames(cd)[ncol(cd)-first], " to ", colnames(cd)[ncol(cd)-first+range]), 
       ylab=paste(cd[r1,1], cd[r1,2], "deaths"))   
}

#################################
#
# deaths_2_countries(){}
#   region1,                eg "United States"
#   region1_pop=region1,    eg "US"
#   region2,                eg "Italy"
#   region2_pop=region2,    eg "Italy"
#   range=29,               width (number of days -1) of the window
#   first,                  how many days before last_day do we start?
#   lag,                    how many days is region2 ahead of region1?
#   state1="",              if needed this refers to the first row of the table, eg "Hubei" if region1 is "China"
#   state2=""
#   last_day=""             last day of data, eg 4/1/20 for April 1, 2020
# }
#################################

deaths_2_countries <- function(
  region1,
  region1_pop=region1,  
  region2,
  region2_pop=region2,  
  range=29,        
  first=range,  
  lag,
  state1="",
  state2="",
  last_day=""
)
{
  # Output: By looking at the plots we find the lag that makes both curves match
  
  # Automatically processed from here for most countries, for China put eg Hubei
  # state1 <- ""              # Column 1 of the corona_data table
  # state2 <- ""              # Column 1 of the corona_data table
  
  # Load coronavirus data from Johns Hopkins
  corona_data <- read.csv(check.names = FALSE,url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"))
  cd <- corona_data
  if (last_day !="") {
    last_index <- grep(last_day,names(cd))
    cd <- cd[1:last_index]
  }
  
  # Load population data
  population_data <- read.csv(url("https://raw.githubusercontent.com/datasets/population/master/data/population.csv"))
  pd <- population_data
  
  # Abbreviations
  r1 <- row.names(cd[cd[,"Country/Region"]==region1 & cd[,"Province/State"]==state1,])
  r2 <- row.names(cd[cd[,"Country/Region"]==region2 & cd[,"Province/State"]==state1,])
  
  # Compute the population ratio of the two regions
  pop1 <- pd[pd[,"Country.Name"]==region1_pop & pd[,"Year"]==2015,"Value"]
  pop2 <- pd[pd[,"Country.Name"]==region2_pop & pd[,"Year"]==2015,"Value"]
  population_ratio_region1_region2 <- pop1/pop2

  # Extract the data of region 1
  region1_deaths <- cd[r1,(ncol(cd)-first):(ncol(cd)-first+range)]
  region1_deaths <- gsub(",", "", region1_deaths)                     
  region1_deaths <- as.numeric(region1_deaths)  
  
  plot(region1_deaths, 
       col="black", 
       main=paste(cd[r1,2], "(black) vs", cd[r2,2],  "(red):", "lag =",lag, "days"), 
       xlab=paste("Black data runs from ", colnames(cd)[ncol(cd)-first], " to ", colnames(cd)[ncol(cd)-first+range]), 
       ylab=paste(cd[r1,2], "deaths"))   
  
  # Extract the data of region 2
  region2_deaths <- cd[r2,(ncol(cd)-first-lag):(ncol(cd)-first-lag+range)]
  region2_deaths <- gsub(",", "", region2_deaths)                   
  region2_deaths <- as.numeric(region2_deaths)                      
  lines(population_ratio_region1_region2*region2_deaths, col="red")   
}

