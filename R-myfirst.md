# My First R project

## The simple version

Download [R](https://cran.r-project.org/) and [Rstudio](https://rstudio.com/products/rstudio/download/).

Start up Rstudio. Import the data from Johns Hopkins. 

    > mydata = read.csv(url("https://github.com/CSSEGISandData/COVID-19/raw/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Deaths.csv"))
    > View(mydata)

Depict the total deaths over time for country number 12 (Germany) over the last `range` days

    > range <- 20
    > deaths_germany <- mydata[12,(ncol(mydata)-range):ncol(mydata)]

Convert the data to a list of numbers and plot it.

    > deaths_germany <- gsub(",", "", deaths_germany)   # remove comma
    > deaths_germany <- as.numeric(deaths_germany)      # turn into numbers
    > plot(deaths_germany)                              # plot

## Comparing German and Italian data

[deaths.R](deaths.R)

## Tutorials and References

- [tutorialspoint](https://www.tutorialspoint.com/r/r_csv_files.htm)
- [r-tutor](http://www.r-tutor.com/r-introduction)
- [cran manual](https://cran.r-project.org/doc/manuals/R-intro.html)