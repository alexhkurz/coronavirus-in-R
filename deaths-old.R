# deaths.R
# Alexander Kurz, March 22, 2020

# Estimate by how many days Germany, or other countries, lag behind Italy 
#   by overlaying the number of deaths in each country.
#   The lag between the two countries is computed as italy_first - germany_first.
#   germany_first is the first day of a recorded coronavirus death in Germany.
#   italy_first is the corresponding day which produce the best match of the two curves. 

# Note: The results of the analysis change when Johns Hopkins update their data.
#   One may want to adapt the program accordingly by increasing by one the variables
#     range, germany_first, italy_germany_first
#   and similarly for the other countries.               

# download the current data from Johns Hopkins
#
mydata <- read.csv(url("https://github.com/CSSEGISandData/COVID-19/raw/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Deaths.csv"))
# View(mydata) 
View(colnames(mydata)[ncol(mydata)]) # Show the last date for which there is data

# get the number of the rows for different countries
#
germany <- 12       # View(mydata[germany,1:2])
italy <- 17         # View(mydata[italy,1:2])
ca <- 101           # View(mydata[ca,1:2])
uk <- 404           # View(mydata[uk,1:2])

# Germany vs Italy
# 32-13=19 day lag estimated on March 22: range=13, germany_first=13,italy_germany_first=32
#
range <- 13                  # range of days plotted minus 1
germany_first <- 13          # how many days ago? first German death on March 8
italy_germany_first <- 32    # how many days ago?

population_ratio_italy_germany <- 0.72
population_ratio_germany_italy <- 1.38

german_deaths <- mydata[germany,(ncol(mydata)-germany_first):(ncol(mydata)-germany_first+range)]
# View(mydata[germany,1:2])    # Verify country
german_deaths <- gsub(",", "", german_deaths)                     # remove commas
german_deaths <- as.numeric(german_deaths)                        # turn into numbers
plot(german_deaths, col="black", main="German (black), Italy (red)", xlab="days", ylab="German deaths")                                   # plot Germany in a new window

italian_deaths <- mydata[italy,(ncol(mydata)-italy_germany_first):(ncol(mydata)-italy_germany_first+range)]
#View(mydata[italy,1:2])       # Verify country
italian_deaths <- gsub(",", "", italian_deaths)                   
italian_deaths <- as.numeric(italian_deaths)                      
lines(population_ratio_germany_italy*italian_deaths, col="red")   # plot Italy in the same window

# UK vs Italy
# 32-17=15 day lag estimated on March 22: range=17, uk_first=17,italy_uk_first=32
#
range <- 17             # range of days plotted minus one
uk_first <- 17          # how many days ago? first UK death March 5
italy_uk_first <- 32    # how many days ago?

population_ratio_uk_italy <- 1.12

uk_deaths <- mydata[uk,(ncol(mydata)-uk_first):(ncol(mydata)-uk_first+range)]
#View(mydata[uk,1:2])      # Verify country
uk_deaths <- gsub(",", "", uk_deaths)                     
uk_deaths <- as.numeric(uk_deaths)                        
plot(uk_deaths, col="black", main="UK (black), Italy (red)", xlab="days", ylab="UK deaths")                                   # plot UK in a new window

italian_deaths <- mydata[italy,(ncol(mydata)-italy_uk_first):(ncol(mydata)-italy_uk_first+range)]
italian_deaths <- gsub(",", "", italian_deaths)                   
italian_deaths <- as.numeric(italian_deaths)                      
lines(population_ratio_uk_italy*italian_deaths, col="red")     # plot Italy in the same window

# California vs Italy
# 31-12=19 day lag estimated on March 22: range=12, ca_first=12,italy_ca_first=31
# 
range <- 12             # range of days plooted minus one
ca_first <- 12          # how many days ago? first CA death March 10
italy_ca_first <- 31    # how many days ago?

population_ratio_ca_italy <- 0.66

ca_deaths <- mydata[ca,(ncol(mydata)-ca_first):(ncol(mydata)-ca_first+range)]
#View(mydata[ca,1:2])   #Verify country
ca_deaths <- gsub(",", "", ca_deaths)                     
ca_deaths <- as.numeric(ca_deaths)                        
plot(ca_deaths, col="black", main="California (black), Italy (red)", xlab="days", ylab="Californian deaths")                                   # plot CA in a new window

italian_deaths <- mydata[italy,(ncol(mydata)-italy_ca_first):(ncol(mydata)-italy_ca_first+range)]
italian_deaths <- gsub(",", "", italian_deaths)                   
italian_deaths <- as.numeric(italian_deaths) 
lines(population_ratio_ca_italy*italian_deaths, col="red")     # plot Italy in the same window

