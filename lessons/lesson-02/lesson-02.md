# Lesson 2

program: [lesson-02.R](lesson-02.R)  
Rmarkdown: [lesson-02.Rmd](lesson-02.Rmd)  

## Practical trivialities

- In your browser, click on [lesson-02.Rmd](lesson-02.Rmd).
- Click on the **Raw** button. 
- Save the displayed page on your computer ("Save Page As" in Firefox) under the name `lesson-02.Rmd`.  
- Open your local copy of `lesson-02.Rmd` in Rstudio.

Now you can either read the next section for an explanation of what we are trying to do (the coronavirus point of view) or you can jump directly to the sections Draw Your Own Plots and Suggested Exercises to plays with the code.

## How many days does Germany lag behind Italy?  

There is a discussion now why Germany has many fewer deaths than Italy. In fact, writing March 22, according to [worldometers](https://www.worldometers.info/coronavirus/#countries), Italy has 60k cases and 5.5k deaths, whereas Germany has 25k cases and 0.1k deaths. That is, Italy has a case fatality rate of 9% and Germany of 0.4%. What is going on here? 

Could it be that this is just due to different testing regimes? 

Here is a simple analysis. The idea is to see what happens if we ignore tests (that is, ignore the number of total cases) and only look at the number of confirmed deaths. Can we then see any difference between Germany and Italy when we take into account that Germany lags behind Italy? 

We use the [time series of deaths](https://github.com/CSSEGISandData/COVID-19/blob/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Deaths.csv) from Johns Hopkins. A brief look at the [raw data](https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Deaths.csv) shows that there is not reliable data for all countries, but I am going to assume that the data for the major industrialised countries is reasonably accurate. 

We ask the question whether the data is consistent with the **hypothesis** that Germany and Italy follow the same development, only separated by a certain time lag. We try to answer the question by **estimating** the time lag by moving the Italian curve so that it best matches the German curve.

 On March 22, this produced the following graph, overlaying deaths in Italy in red and deaths in Germany in blue. The German curve starts 13 days ago when the first deaths appeared and the Italian curve starts 32 days ago. Italian numbers are multiplied by 1.32 to account for the difference in population sizes. 

###### Germany vs Italy

- The graph: [March 22](../../plots/2020-03-22/Germany-Italy-March-22.png)

It looks to me that Germany may just be lagging behind by approx 32-13=19 days and may be on the same course as Italy. 

Running the data on UK vs Italy and on California vs Italy produces similar results (lags of 15 and 19 days, respectively):

###### UK vs Italy

- The graph: [March 22](../../plots/2020-03-22/UK-Italy-March-22.png)

###### California vs Italy

- The graph: [March 22](../../plots/2020-03-22/California-Italy-March-22.png)

**Remark:** (March 22) Intriguingly, looking at the righ-hand side of the German and Californian graphs raises the question whether deaths in Italy increase faster. But right now there is not enough data to say that this is a trend. It will be interesting to watch this over the next days as new data will come in.

## Draw your own plots

Go back to Rstudio where you opened `lesson-02.Rmd`.

This looks a bit different from [last time](../lesson-01/lesson-01.R). This time we have an **Rmarkdown** file, hence the `.Rmd` file extension. Can you say how Rmd files are different from R files?

- There are white and grey areas.
- White areas are comments.
- Comments are not introduced by`#`. They are just plain text.
- The grey areas contain the executable code.
- You can execute the code in each grey area by clicking. 

The computer scientist Donald Knuth invented this style of mixing texts and code and called it [literate programming](https://en.wikipedia.org/wiki/Literate_programming). It was fancy then, but is now quickly becoming the new standard (most famously in Jupyter notebooks). So the task is now to

- *read* through the file and 
- *execute* the code as you go on reading.

## Suggested exercises

(Time for some music? I wrote this listening to [Interstellar Space](https://www.youtube.com/watch?v=RyIPmmCmIb0&list=PLSeOx7nxhymJl1aXmMDM3-TyiLodxcavz).)


- If the graphs do not match, play around with the variable `italy_first` and try to find the best match. The difference between `germany_first` and `italy_first` is the new lag.

- Copy and paste the code between lines 39 and 55 and adapt the program so that it compares a country of your choice to Italy.

  - The copied code should appear under the Germany-Italy plot.
  - Find a country. Remember the number of its row.
  - In the copied code
    - replace `germany` by `name_of_new_country`
    - run your code 
    - watch out for error messages
    - one error is likely to be `object `name_of_new_country` ... a good place to define the variable `name_of_new_country` is after the lines defining `germany` and `italy`

  - Don't forget to put in the correct ratio of the new country versus Italian population.

- Estimate the lag between the two countries by finding the best fit for the two curves by changing the value of `italy_first`.
