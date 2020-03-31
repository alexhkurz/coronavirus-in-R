# README

This is both a self-learning and a homeschooling project. I know Mathematics and Computer Science, but have never done data analysis or R before. Johanna is new to programming. 

Ideally, these notes will turn into a first  introduction to programming for high-school students with no previous experience. But I will assume that students can install programs, download files and open them in applications.

The motivation to learn about data anlysis now comes from the coronavirus crisis. One can read a lot of analyses. So why not making your own? 

An good example of what can be done with data analysis is this visualisation on [How To Tell If We're Beating COVID-19](https://www.youtube.com/watch?v=54XLXg4fYsc). By the way, one of my favourite visualisation is about the [history of the top chess players](https://www.youtube.com/watch?v=z2DHpW79w0Y).

And it is more interesting to have a project right from the start, rather than to work through long tutorials and textbooks first. Each lesson below is a lesson we set ourselves. 

Of course, it is also good to follow a course. We chose Stefano de Sabbata's [GRANOLARR](https://sdesabbata.github.io/granolarr/), which is short for a geog**GR**aphic d**A**ta scie**N**ce, repr**O**ducib**L**e te**A**ching resou**R**ce in **R**. An awesome course. 

We'd love to get feedback and one way of doing this is, is to [raise an issue](https://github.com/alexhkurz/coronavirus-in-R/issues). Or send me an email. In particular, it would be  great to hear from parents and children who took up a similar project.

## Organisation

It seems one can organise the material into two threads. 

- Each numbered lessons addresses a data analysis question. 
- The other lessons cover some necessary computer and programming related background and can be skipped by those who already have some experience in these matters.

I also like to call these two threads the interesting one and the boring-but-necessary one. (Of course, nerds like myself may find the boring-but-necessary interesting in its own right.) 

My teaching experience suggests that students and teachers get frustrated by the boring-but-necessary parts. This can create a vicious circle in which teachers spend more and more time on trying to improve the teaching of the boring-but-necessary parts, thereby making the course ever more boring. This is another reason to distinguish the two parts separate. 

## Part I: Basics

The aim is to develop a program that can be used to match the curves of the deaths of two countries. If you want to see how what it does right now, load [deaths.R](src/deaths.R) into R, run it, and produce some sample graphs. If you understand how the program works and you can modify it to suit your own interests there will be not much to learn in Part I.

**Data analysis:**

- [Lesson 1](lessons/lesson-01/lesson-01.md): Download coronavirus data and plot it.   

- [Lesson 2](lessons/lesson-02/lesson-02.md): How far does Germany lag behind Italy?

- [Lesson 3](lessons/lesson03/lesson-03.md): How far do other countries lag behind Italy? 

I collected an [example](reports/report-2020-03-29.md) obtained from using the program [deaths.R](src/deaths.R).

---
 
drafts:

**Programming skills**:
- [Managing files.](lessons/lesson-files.md)
- [Variables and types](lessons/lesson-strings.Rmd). How to manipulate strings?
- [Filtering data](). How to automatically extract information from data?
- [Managing projects with Git](lessons/lesson-git.md). How to use version control?

**possible directions to take**:

- Lesson: Compare more than. Functions in R.

- Data analysis: Compute the lag automatically, Visualise how the lag changes over time, Find reasons for changing lags, ...

- Data preprocessing: Extracting data from large tables, ...

- Programming: Variables, Functions, How to use git, Machine Learning, ...

- Maths: Metric spaces, similarlity measures, ...

- Once we learned enough we could take part in [Kaggle Challenges](https://www.kaggle.com/covid19)

---

My [coronavirus blog](https://alexhkurz.github.io/notes/covid-19.html).
My [homepage](https://alexhkurz.github.io).

