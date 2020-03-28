# Setting up a working environment

(unfinished draft)

## Basics

The basics about managing projects and files in Rstudio are covered in the video in the first **9 min**:

- [Managing - Part 1 (Projects in RStudio)](https://resources.rstudio.com/wistia-rstudio-essentials-2/rstudioessentialsmanagingpart1-2)

    - set a working directory
    - save and load files
    - use the console and the files pane

If you are new to programming, the video will be easier to understand after learning some basics on 

- Computer Architecture: 
  - The difference between the working memory (RAM) and the hard drive (HD): Programs and applications store the data they process *while running* in the RAM. The HD stores the data that continues to persist after the program is halted and the computer is shut down. 
  - Variables denote memory cells in the RAM. An *assignment* such as
    
        a <- 1
    
  puts the value 1 into the memory location named `a`. [^assignment] 
  
  [^assignment]: A variable has a name and a value. To be precise, we need to distinguish the name `a` of from the value `1`. As we have seen, the value of a variable can be modified by assignment.

- File Systems:
  - Data on the HD is stored in the form of files. A file needs to be read into the RAM before programs can process it. A program needs to save its data in the RAM to the HD if the data is supposed to persist after the program was terminated.
  - Files are stored on the HD in a tree. To find a file in the tree, one uses its path. 

## Git

Remember that last time you had to save my files from git manually?

A better way is to learn a bit how git works. Git allows us to maintaint and synchronize different copies of the same **repository**.

We will follow the instructions on [Using Git with RStudio](https://jennybc.github.io/2014-05-12-ubc/ubc-r/session03_git.html).

Personally, I like to use the editor `visual studio code`, which also has a good integration with git. But for this project, I am planning to see how far we can get with staying inside Rstudio.

---

git clone https://github.com/alexhkurz/coronavirus-in-R.git

---

- https://resources.rstudio.com/wistia-rstudio-essentials-2

  - 
  
https://community.rstudio.com/t/should-rproj-files-be-added-to-gitignore/1269