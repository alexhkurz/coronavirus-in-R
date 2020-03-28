# Comparing any two countries

(draft ... under construction)

In the exercises of the last lesson we took the code for plotting Germany vs Italy

    range <- 15           
    germany_first <- 15   
    italy_first <- 35     
    population_ratio_germany_italy <- 1.38
    
    german_deaths <- mydata[germany,(ncol(mydata)-germany_first):(ncol(mydata)-germany_first+range)]
    german_deaths <- gsub(",", "", german_deaths)                     
    german_deaths <- as.numeric(german_deaths)                      
    plot(german_deaths, col="black", main="German (black), Italy (red)",xlab="days", ylab="German deaths")   
    
    italian_deaths <- mydata[italy,(ncol(mydata)-italy_first):(ncol(mydata)-italy_germany_first+range)]
    #View(mydata[italy,1:2])       
    italian_deaths <- gsub(",", "", italian_deaths)                   
    italian_deaths <- as.numeric(italian_deaths)                      
    lines(population_ratio_germany_italy*italian_deaths, col="red")   

and adapted it to compare another country with Italy, say, XXXXXX:

    range <- 15           
    XXXXXX_first <- 15   
    italy_first <- 35     
    population_ratio_XXXXXX_italy <- 1.38
    
    XXXXXX_deaths <- mydata[XXXXXX,(ncol(mydata)-XXXXXX_first):(ncol(mydata)-XXXXXX_first+range)]
    XXXXXX_deaths <- gsub(",", "", XXXXXX_deaths)                     
    XXXXXX_deaths <- as.numeric(XXXXXX_deaths)                      
    plot(XXXXXX_deaths, col="black", main="XXXXXX (black), Italy (red)",xlab="days", ylab="XXXXXX deaths")   
    
    italian_deaths <- mydata[italy,(ncol(mydata)-italy_first):(ncol(mydata)-italy_XXXXXX_first+range)]
    #View(mydata[italy,1:2])       
    italian_deaths <- gsub(",", "", italian_deaths)                   
    italian_deaths <- as.numeric(italian_deaths)                      
    lines(population_ratio_XXXXXX_italy*italian_deaths, col="red")   

Changing code by hand in many places for each new country is not only painful, but also bad software engineering. Why?

  - It is boring and repetitive.
  - It is error prone.

**Rule of Good Practice**: Never copy and paste a piece of code more than once. Rather refactor your software.

How can we write code that can easily be adapted to any two countries?

Ideally, **we only want to change the name of each country once.**

How can we do this?

#### Step 1: Introduce generic variabales

Idea: Rewrite the code above with variable names that are not specific to Italy and to XXXXXX.

**Rule of Good Practice:** Think carefully about variable names. This will help with readability and maintenance.

In our case, while the first idea was to have variables `country1` and `country2`, we may want to use the code for regions that are not countries such as California or New York. So we decided on to start with

    region1 <- # fill in the row of region 1
    region2 <- # fill in the row of region 2

The comments are marking the two places where variables will be changed to refer to the particular countries/regions in question.

    range <- 15           
    region1_first <- 15   
    region2_first <- 35     
    population_ratio_region1_region2 <- 1.38

These four variables above also depend on the particular regions in question and currently need to be modified by hand. We can think later whether this data can be computed from `region1` and `region2` instead. 
    
    region1_deaths <- mydata[region1,(ncol(mydata)-region1_first):(ncol(mydata)-region1_first+range)]
    region1_deaths <- gsub(",", "", region1_deaths)                     
    region1_deaths <- as.numeric(region1_deaths)                      
    plot(region1_deaths, col="black", main="region1 (black), region2 (red)",xlab="days", ylab="region1 deaths")   
    
    region2_deaths <- mydata[region2,(ncol(mydata)-region2_first):(ncol(mydata)-region2_region1_first+range)]
    #View(mydata[region2,1:2])       
    region2_deaths <- gsub(",", "", region2_deaths)                   
    region2_deaths <- as.numeric(region2_deaths)                      
    lines(population_ratio_region1_region2*region2_deaths, col="red")   

Does it run? If not debug it. 

By the way, it is now clearly starting to be annoying to write this lesson by jumping from text to the program and back. Do you as a reader feel the same? From now on I may write the lessons in `Rmd` only. 

So let us continue this in [lesson-03.Rmd](lesson-03.Rmd).

Does it run now? What next? Can we improve this?

