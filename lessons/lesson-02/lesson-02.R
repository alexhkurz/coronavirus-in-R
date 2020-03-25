# Estimate by how many days Germany lags behind Italy 
#   by overlaying the number of deaths in each country.
#   The lag between the two countries is computed as italy_first - germany_first.
#   germany_first is the first day of a recorded coronavirus death in Germany.
#   italy_first is the corresponding day which produce the best match of the two curves. 

# Note: The results of the analysis change when Johns Hopkins update their data.
#   One may want to adapt the program accordingly by increasing by one the variables
#     germany_first, italy_first

# download the current data from Johns Hopkins
#
mydata = read.csv(url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"))
# View(mydata)
# Show the last date for which there is data
View(colnames(mydata)[ncol(mydata)]) 

# get the number of the rows for different countries
#
germany <- 12       
italy <- 138

# Germany vs Italy
# 32-13=19 day lag estimated on March 22: range=13, germany_first=13,italy_germany_first=32
#
germany_first <- 13          # how many days ago? first German death on March 8
italy_germany_first <- 32    # how many days ago?

population_ratio_germany_italy <- 1.38

german_deaths <- mydata[germany,(ncol(mydata)-germany_first):ncol(mydata)]
german_deaths <- gsub(",", "", german_deaths)                     
german_deaths <- as.numeric(german_deaths)                      
plot(german_deaths, col="black", main="German (black), Italy (red)", xlab="days", ylab="German deaths")                                   # plot Germany in a new window

italian_deaths <- mydata[italy,(ncol(mydata)-italy_germany_first):(ncol(mydata)-italy_germany_first+range)]
#View(mydata[italy,1:2])       # Verify country
italian_deaths <- gsub(",", "", italian_deaths)                   
italian_deaths <- as.numeric(italian_deaths)                      
lines(population_ratio_germany_italy*italian_deaths, col="red")   # plot Italy in the same window
