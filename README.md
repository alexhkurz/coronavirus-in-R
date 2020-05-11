# README

This is both a self-learning and a home-schooling project. I know Mathematics and Computer Science, but have never done data analysis or R before. Johanna is new to programming. (If you are home-schooling now and interested to join  send me an [email](mailto:alexhkurz@gmail.com?subject=coronavirus-in-R).)

Ideally, these notes will turn into a first  introduction to programming for high-school students with no previous experience. But I will assume that students can install programs, download files and open them in applications.

[Introduction](intro.md).

We are learning this from scratch, but if you want to see how far we got by now, you can see **some recent data** at my collection of [coronavirus links](https://alexhkurz.github.io/notes/covid-19.html).

Being more a mathematician than a data scientist this course is currently more on questions like how to define the exponential function, what is the number line, how to compute square roots without using a calculator,etc. If you are interestend in this you can jump directly to Part 2 without doing Part 1 first.

## Part I: Data Exploration in R

### Chapter 1: Extracting and Plotting Data

(can be improved, but should be readable)

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


### Chapter 2: Reports

(under construction)

**Shortcut:** The aim of this part is to explain how to write the library that is used to support the writing of reports.

**Data analysis:**

- Lesson: How to quickly write and publish reports (needs to be written)

**Programming skills**: (unfinished drafts only)
- []() How to write reports using Rmarkdown and Knit.
- Functions in R, Debugging Functions, ... 
- [Managing projects with Git](lessons/lesson-git.md). How to use version control.
- https://stackoverflow.com/questions/12235677/bold-boxplot-labels-in-r


**Applying the results of Part 2:** An example report is [here](https://rpubs.com/alexhkurz/594386) and its source code is [here](https://github.com/alexhkurz/coronavirus-in-R/blob/master/reports/report-Germany-Italy.Rmd). Due to the modular way we constructed the software of this part, and also due to tools such as git, knit, and rpub it takes only a few minutes to adapt this report to a new country.

### Chapter 3: Functions

(under construction)

Functions play an important role in all of programming. But while you will use functions in R all the time, as opposed to other programming languages, you can go a long way without ever writing your own functions. So this part is optional. If you want to use the opportunity to learn more about programming in general, this chapter is for you. The R debugger is great to understand in detail how functions work. On the other hand, if you want to keep on concentrating on the data part, go to the next part. 

- []() How to write reports using functions ... 
- Functions in R, Debugging Functions, ... 

### Chapter 4: Data Wrangling and Plotting with Tidyverse

(under construction)

At the end of this part, we will be able to write much nicer reports about more complicated data with shorter programs and in shorter time. See [here](https://rpubs.com/alexhkurz/600882) for an example. Moreover, once you have produced such a webpage, to rerun the analysis and republish it with new data takes less than a minute and only 3 clicks of the mouse ... there is a whole set of tools available which is really gratifying to work with.


- [Lesson 1 with exercises](https://github.com/alexhkurz/coronavirus-in-R/blob/master/lessons/lesson-data-wrangling.Rmd)

- [Lesson 2](https://github.com/alexhkurz/coronavirus-in-R/blob/master/lessons/lesson-data-wrangling-2.Rmd)

- [Exercises](exercises-I.4.md)

**Further Reading:**

- [Tidy Data](http://www.jstatsoft.org/v59/i10/paper) by Hadley Wickham.


## Part II: Mathematics (Pre-Calculus)

The emphasis is on providing the background on mathematics behine Part I. Our first aim is to define the exponential function. This raises a number of questions, most interestingly, what is the numberline. There are two ways to answer this question. From a practical point of view one only needs to know the [laws of exponents]() and how to use a calculator to compute with decimal numbers. But it would be a pity to pass on the opportunity to investigate the question from a proper mathematical point of view. Moreover, this gives us an opportunity to study examples of two of the fundamental concepts of science, both going back at least to Euclid, namely algorithms and proofs. While the proofs we present here are all simple, they have left their trace in all areas of mathematics. Following Erdos, I call them *proofs from THE BOOK*.

**Further Reading:** The idea of proofs from THE BOOK is explained in the preface of [Proofs from THE BOOK](https://link.springer.com/book/10.1007%2F978-3-662-57265-8), availabe for free online at the time of writing. (But note that the proofs they collected are more demanding than the ones we are doing here.) For the back story I recommend the documentary [N  is a Number](https://vimeo.com/ondemand/nisanumber) about Erdos. (This documentary is not free but I found it well worth supporting.) 

### Chapter 1: Introduction

[How does exponential growth look in data](lessons/maths-01.md): Interpreting doronavirus data.
[The discrete exponential](https://hackmd.io/OiwWCSfzQTmPgUBK_MMgnA): Doubling every unit of time  
[The number of nodes in a binary tree](https://hackmd.io/RSPGDf-GRPaBGyj3jHzkmQ): A formula and a proof from THE BOOK.
[SIR models](lessons/maths-04.md): Introduction to the modelling of epidemics.
[Exponential and logistic growth](https://www.youtube.com/watch?v=Kas0tIxDvrg).

### Chapter 2: What is the number line?

(These are lessons we have done but I am behind with the write-ups ... some write-ups contributed by Johanna and Jonathan)

[How can we extend the discrete exponential to the number line?](https://hackmd.io/9_pqgfjESP-IzQdSZuu4Xg) Introduction.
[What are numbers and what should they be?](https://hackmd.io/bKz_ly_6S5CY6_j_j3OHqw) Mostly some useful notation  
[Square root of two is not a fraction](https://hackmd.io/ETSe5OjEQve8cXpq9lVNHA) A nice little proof  
[How to compute square roots without a calculator](https://hackmd.io/Z7RPmhptSwK8Jt82lLF8pQ) A simple but important algorithm  
[What is the number line after all?](https://hackmd.io/2Uno7NcsR4S3tTLwx8GA5w)  
...

**Further Reading**: ... tbc ...

[Understanding Analysis](https://link.springer.com/content/pdf/10.1007%2F978-1-4939-2712-8.pdf) by Stephen Abbott. Chapter 1 contains a more rigorous but still introductory definition of the real numbers.

### Chapter 3: What is the exponential function?

... this is where we are at the moment ...

[Exponential function on the real numbers]() tba
[What is e?]() tba

## Part III: ...

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

