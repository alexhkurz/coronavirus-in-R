# README

This is both a self-learning and a homeschooling project. I know Mathematics and Computer Science, but have never done data analysis or R before. Johanna is new to programming. 

Ideally, these notes will turn into a first  introduction to programming for high-school students with no previous experience. But I will assume that students can install programs, download files and open them in applications.

[Introduction](intro.md).

We are learning this from scratch, but if you want to see how far we got by now, you can see **some recent data** at my collection of [coronavirus links](https://alexhkurz.github.io/notes/covid-19.html).

## Part I: Extracting and Plotting Data

**Shortcut:** Sometimes it is fastest to learn from the end. The aim in this part, is to develop a program that can be used to match the curves of the deaths of two countries. If you want to see what it does right now, load [deaths.R](src/deaths.R) into R, run it, and produce some sample graphs. If you understand how the program works and you can modify it to produce your own plots you can skim over Part I or skip it altogether.

**Data exploration:**

- [Lesson 1](lessons/lesson-01/lesson-01.md): Download coronavirus data and plot it.  [Quiz](lessons/lesson-01/quiz-01.Rmd)  
- [Lesson 2](lessons/lesson-02/lesson-02.md): How far does Germany lag behind Italy?  
- [Lesson 3](lessons/lesson-03/lesson-03.md): How far do other countries lag behind   Italy? 

**Programming skills**: (unfinished drafts only)
- [Managing files.](lessons/lesson-files.md)
- [Variables and types](lessons/lesson-strings.Rmd). How to manipulate strings.
- [Filtering data](lessons/lesson-filter.Rmd). How to automatically extract information from data.

**Applying the results of Part 1:** Examples of [reports](reports/reports.md) one can quickly generated with the program [deaths.R](src/deaths.R). While this works well, if one is interested in comparing just two countries at a specific point in time, this method does not scale to comparing many countries at many points in time for two reasons: First, we should not be forced to copy code around in order to adapt the same algorithm to different inputs. This problem will be solved by functions. Second, we should not be forced to save each single plot we generate at a specific place, then upload it to a webserver and link it by hand. One solution to this problem is to use Knit ... work in progress ...


## Part 2: Reports

(under construction)

**Shortcut:** The aim of this part is to explain how to write the library that is used to support the writing of reports.

**Data analysis:**

- Lesson: How to quickly write and publish reports (needs to be written)

**Programming skills**: (unfinished drafts only)
- []() How to write reports using functions, Rmarkdown and Knit.
- Functions in R, Debugging Functions, ... 
- [Managing projects with Git](lessons/lesson-git.md). How to use version control.
- https://stackoverflow.com/questions/12235677/bold-boxplot-labels-in-r


**Applying the results of Part 2:** An example report is [here](https://rpubs.com/alexhkurz/594386) and its source code is [here](https://github.com/alexhkurz/coronavirus-in-R/blob/master/reports/report-Germany-Italy.Rmd). Due to the modular way we constructed the software of this part, and also due to tools such as git, knit, and rpub it takes only a few minutes to adapt this report to a new country.

## Part 3: Data Wrangling and Plotting with Tidyverse

(... under construction ...)

At the end of this part, we will be able to write much nicer reports about more complicated data with shorter programs and in shorter time. See [here](https://rpubs.com/alexhkurz/600882) for an example.

- [Lesson 1 with exercises](https://github.com/alexhkurz/coronavirus-in-R/blob/master/lessons/lesson-data-wrangling.Rmd)

- [Lesson 2](https://github.com/alexhkurz/coronavirus-in-R/blob/master/lessons/lesson-data-wrangling-2.Rmd)

**Further Reading:**

- [Tidy Data](http://www.jstatsoft.org/v59/i10/paper) by Hadley Wickham.

## Part 4: Statistics 

...

---

**possible directions to take**:

- Data analysis: 
  - Compute the lag automatically, Visualise how the lag changes over time, Find reasons for changing lags, ...
  - Why do some countries have the same lag wrt deaths, but not the same wrt cases? Cluster countries that have the same lag wrt deaths and the same lag wrt cases. Any patterns?
  - Compute doubling times. Chart doubling times over time and space. What patterns arise?
  - Compute moving averages.
  - How many days after lockdown does growth become linear in different countries? Can we relate this to policy measures?

- Classify countries according to different growth rates. At the moment it looks as if almost all countries have the same growth rate, but, also, at the moment we always ever directly compare two countries.

- Programming: Machine Learning, ...

- Maths: Metric spaces, similarlity measures, ...

- Once we learned enough we could take part in [Kaggle Challenges](https://www.kaggle.com/covid19) (this is a long way off)

---

My [coronavirus blog](https://alexhkurz.github.io/notes/covid-19.html).
My [homepage](https://alexhkurz.github.io).

