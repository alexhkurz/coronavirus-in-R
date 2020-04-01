# User input
#
# Most countries have the same names in the two tables, but not all
# region1 is the name in the corona_data table, eg "US", "Korea, South"
# region1_pop is the name in the population_data table, eg "United States", "Korea, Rep."
#
admin2     <- "Orange"  
province_state <- "California"
range <- 20           
region1_first <- 20   

# Load coronavirus data from Johns Hopkins
corona_data_us <- read.csv(check.names=FALSE,url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_US.csv"))

# Abbreviations
cd <- corona_data_us
r1 <- row.names(cd[cd[, "Admin2"]==admin2 & cd[,"Province_State"]==province_state,])

region1_deaths <- cd[r1,(ncol(cd)-region1_first):(ncol(cd)-region1_first+range)]
region1_deaths <- gsub(",", "", region1_deaths)                     
region1_deaths <- as.numeric(region1_deaths)  

plot(region1_deaths, 
     col="black", main=paste(cd[r1,6], cd[r1,7]), 
     xlab=paste(colnames(cd)[ncol(cd)-region1_first], " to ", colnames(cd)[ncol(cd)-region1_first+range]), 
     ylab=paste(cd[r1,6], cd[r1,7], "deaths"))   

