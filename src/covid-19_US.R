###################################################################################################
#
# two_regions(){}
#   what                    a string, eg "cases" or "deaths", for labelling the y-axis
#   data_us                 data from Johns Hopkins about cases or deaths
#   data_global             data from Johns Hopkins about cases or deaths
#   admin2                  eg "Orange"
#   province_state          eg "California"
#   region2                 eg "Italy"
#   region2_pop=region2     eg "Italy"
#   range=29                width (number of days -1) of the window
#   first=range             how many days before last_day do we start?
#   lag=0                   how many days is region2 ahead of region1?
#   state2=""               if needed this refers to the first row of data_global, eg "Hubei" if region2 is "China"
#   last_day=""             last day of data, eg 4/1/20 for April 1, 2020
# }
###################################################################################################

two_regions <- function(
  what="",
  data_us,
  data_global,
  admin2,
  province_state,  
  region2,
  region2_pop=region2,
  state2="",
  last_day="",
  range=29,
  first=range,
  lag=0
)
{
  # Truncate data frame at `last_day`
  if (last_day !="") {
    last_index <- grep(last_day,names(data_us))
    data_us <- data_us[1:last_index]
    last_index <- grep(last_day,names(data_global))
    data_global <- data_global[1:last_index]
  }

  # Load population data
  population_data <- read.csv(url("https://raw.githubusercontent.com/datasets/population/master/data/population.csv"))
  deaths_us <- read.csv(url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_US.csv"),check.names = FALSE)

  # Abbreviations
  cd <- data_global 
  cd_us <- data_us
  pd <- population_data
  r1 <- row.names(cd_us[cd_us[, "Admin2"]==admin2 & cd_us[,"Province_State"]==province_state,])
  r2 <- row.names(cd[cd[,"Country/Region"]==region2 & cd[,"Province/State"]==state2,])
  # Compute the population ratio of the two regions
  pop1 <- deaths_us[deaths_us[, "Admin2"]==admin2 & deaths_us[,"Province_State"]==province_state,12]
  pop2 <- pd[pd[,"Country.Name"]==region2_pop & pd[,"Year"]==2015,"Value"]
  population_ratio_region1_region2 <- pop1/pop2

  region1_deaths <- cd_us[r1,(ncol(cd_us)-first):(ncol(cd_us)-first+range)]
  region1_deaths <- gsub(",", "", region1_deaths)                     
  region1_deaths <- as.numeric(region1_deaths)  

  # Plot region one and two

  plot(region1_deaths, 
     col="black", 
     main=paste(cd_us[r1,6], cd_us[r1,7], "(black) vs", cd[r2,2],  "(red):", "lag =",lag, "days"), 
     xlab=paste("Black data runs from ", colnames(cd_us)[ncol(cd_us)-first], " to ", colnames(cd_us)[ncol(cd_us)-first+range]), 
     ylab=paste(cd_us[r1,6], what))   

  region2_deaths <- cd[r2,(ncol(cd)-first-lag):(ncol(cd)-first-lag+range)]
  region2_deaths <- gsub(",", "", region2_deaths)                   
  region2_deaths <- as.numeric(region2_deaths)                      
  lines(population_ratio_region1_region2*region2_deaths, col="red")   
}


