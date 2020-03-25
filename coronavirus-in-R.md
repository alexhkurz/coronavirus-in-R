# Coronavirus in R

The coronavirus is an opportunity to learn to crunch your own data. And a great home-schooling project. I do maths and computer science professionally, but I have never done any data analysis before. So this is unchartered territory for us.

I decided to use the data analysis language R because it was designed for applications outside of computer science. I am curious to see how it goes.

First some remarks on [getting started with R](R-myfirst.md).

And then let us jump right into a concrete question:

## How far do we lag behind Italy?

With the [data from Johns Hopkins](https://coronavirus.jhu.edu/map.html) you can ask and investigate your own questions.[^daily-data] 

For example, there is a discussion now why Germany has many fewer deaths than Italy. In fact, writing March 22, according to [worldometers](https://www.worldometers.info/coronavirus/#countries), Italy has 60k cases and 5.5k deaths, whereas Germany has 25k cases and 0.1k deaths. That is, Italy has a case fatality rate of 9% and Germany of 0.4%. What is going on here? 

Could it be that this is just due to different testing regimes? 

Here is a simple analysis. The idea is to see what happens if we ignore tests (that is, ignore the number of total cases) and only look at the number of deaths. Can we then see any difference between Germany and Italy when we take into account that Germany lags behind Italy? 


We use the [time series of deaths](https://github.com/CSSEGISandData/COVID-19/blob/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Deaths.csv) from Johns Hopkins. A brief look at the [raw data](https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Deaths.csv) shows that there is not reliable data for all countries, but I am going to assume that the data for the major industrialised countries is reasonably accurate. [^data-format-change]

We ask the question whether the data is consistent with the hypothesis that Germany and Italy follow the same development, only separated by a certain time lag. We try to answer the question by estimating the time lag by moving the Italian curve so that it best matches the German curve.

 On March 22, this produces the following graph, overlaying deaths in Italy in red and deaths in Germany in blue. The German curve starts 13 days ago when the first deaths appeared and the Italian curve starts 32 days ago. Italian numbers are multiplied by 1.32 to account for the difference in population sizes. 

###### Germany vs Italy

- The graph: [March 22](covid/Germany-Italy-March-22.png)

It looks to me that Germany may just be lagging behind by approx 32-13=19 days and may be on the same course as Italy. 

Running the data on UK vs Italy and on California vs Italy produces similar results (lags of 15 and 19 days, respectively):

###### UK vs Italy

- The graph: [March 22](covid/UK-Italy-March-22.png)

###### California vs Italy

- The graph: [March 22](covid/California-Italy-March-22.png)

**Remark:** (March 22) Intriguingly, looking at the righ-hand side of the German and Californian graphs raises the question whether deaths in Italy increase faster. But right now there is not enough data to say that this is a trend. It will be interesting to watch this over the next days as new data will come in.

---

[my links on the coronavirus](../covid-19.md)


[^daily-data]: The data changes every day, here are the snapshots for reference: 
    - [March 22](covid/time_series_19-covid-Deaths-March-22.csv)

[]
