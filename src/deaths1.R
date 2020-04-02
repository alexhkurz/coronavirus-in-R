# User input
#
# Most countries have the same names in the two tables, but not all
# region1 is the name in the corona_data table, eg "US", "Korea, South"
# region1_pop is the name in the population_data table, eg "United States", "Korea, Rep."
#
region1     <- "Brazil"  
range <- 30           
region1_first <- 30   
region2_first <- 32    

# Output: If the graphs match, the estimated lag is the `region1_first - region2_first`

# Automatically processed from here for most countries, for China put eg Hubei
state1 <- ""              # Column 1 of the corona_data table

# Load coronavirus data from Johns Hopkins
corona_data <- read.csv(check.names = FALSE,url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"))
corona_data_us <- read.csv(check.names=FALSE,url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_US.csv"))

# Abbreviations
cd <- corona_data
r1 <- row.names(cd[cd[,"Country/Region"]==region1 & cd[,"Province/State"]==state1,])

region1_deaths <- cd[r1,(ncol(cd)-region1_first):(ncol(cd)-region1_first+range)]
region1_deaths <- gsub(",", "", region1_deaths)                     
region1_deaths <- as.numeric(region1_deaths)  

plot(region1_deaths, 
     col="black", main=paste(cd[r1,1], cd[r1,2]), 
     xlab=paste(colnames(cd)[ncol(cd)-region1_first], " to ", colnames(cd)[ncol(cd)-region1_first+range]), 
     ylab=paste(cd[r1,1], cd[r1,2], "deaths"))   

