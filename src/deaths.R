# User input
#
# Most countries have the same names in the two tables, but not all
# region1 is the name in the corona_data table, eg "US", "Korea, South"
# region1_pop is the name in the population_data table, eg "United States", "Korea, Rep."
#
region1     <- "Brazil"  
region1_pop <- "Brazil"  
region2 <- "Italy"
region2_pop <- "Italy"  
range <- 31           
region1_first <- 31   
region2_first <- 58    

# Output: If the graphs match, the estimated lag is the `region1_first - region2_first`

# Automatically processed from here for most countries, for China put eg Hubei
state1 <- ""              # Column 1 of the corona_data table
state2 <- ""              # Column 1 of the corona_data table

# Load coronavirus data from Johns Hopkins
corona_data <- read.csv(check.names = FALSE,url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"))

# Load population data
population_data <- read.csv(url("https://raw.githubusercontent.com/datasets/population/master/data/population.csv"))

# Abbreviations
cd <- corona_data
pd <- population_data
r1 <- row.names(cd[cd[,"Country/Region"]==region1 & cd[,"Province/State"]==state1,])
r2 <- row.names(cd[cd[,"Country/Region"]==region2 & cd[,"Province/State"]==state1,])

# Compute the population ratio of the two regions
pop1 <- pd[pd[,"Country.Name"]==region1_pop & pd[,"Year"]==2015,"Value"]
pop2 <- pd[pd[,"Country.Name"]==region2_pop & pd[,"Year"]==2015,"Value"]
population_ratio_region1_region2 <- pop1/pop2

# Uncomment for debugging
# View(cd)
# View(pd)
# View(pd[pd[,"Country.Name"]==region1_pop & pd[,"Year"]==2015,]) 
# View(pd[pd[,"Country.Name"]==region2_pop & pd[,"Year"]==2015,]) 
# View(population_ratio_region1_region2)

region1_deaths <- cd[r1,(ncol(cd)-region1_first):(ncol(cd)-region1_first+range)]
region1_deaths <- gsub(",", "", region1_deaths)                     
region1_deaths <- as.numeric(region1_deaths)  

# Only plot region one

plot(region1_deaths, 
     col="black", main=paste(cd[r1,1], cd[r1,2]), 
     xlab=paste(colnames(cd)[ncol(cd)-region1_first], " to ", colnames(cd)[ncol(cd)-region1_first+range]), 
     ylab=paste(cd[r1,1], cd[r1,2], "deaths"))   

# Plot region one and two

plot(region1_deaths, 
     col="black", 
     main=paste(cd[r1,2], "(black) vs", cd[r2,2],  "(red):", "lag =",region2_first-region1_first, "days"), 
     xlab=paste("Black data runs from ", colnames(cd)[ncol(cd)-region1_first], " to ", colnames(cd)[ncol(cd)-region1_first+range]), 
     ylab=paste(cd[r1,2], "deaths"))   

region2_deaths <- cd[r2,(ncol(cd)-region2_first):(ncol(cd)-region2_first+range)]
region2_deaths <- gsub(",", "", region2_deaths)                   
region2_deaths <- as.numeric(region2_deaths)                      
lines(population_ratio_region1_region2*region2_deaths, col="red")   




