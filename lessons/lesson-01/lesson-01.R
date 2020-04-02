mydata <- read.csv(url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"),check.names = FALSE)
deaths_italy <- mydata[138,(ncol(mydata)-30):ncol(mydata)]
deaths_italy <- gsub(",", "", deaths_italy)
deaths_italy <- as.numeric(deaths_italy)
plot(deaths_italy)
