---
title: "Starting data analysis/wrangling with R: Things I wish I'd been told"
created_at: 2013-10-09 18:17:31 -0400
kind: article
location: Toronto, Canada
status: draft
tags:
  - tech
  - R
  - statistics
---

**Note: This is an unfinished draft, and wasn't intended to be published yet (I clearly need to play with my nanoc settings). I hope you still find it useful, but it will become longer/more complete, and will move to http://reganmian.net/blog/2013/10/09/starting-data-analysiswrangling-with-r-things-i-wish-id-been-told/ (without the /draft/).**

* list
{:toc}

[R](http://www.r-project.org/) is a very powerful open source environment for data analysis, statistics and graphing, with thousands of [packages](http://cran.r-project.org/web/packages/) available. After my previous blog post about [likert-scales and metadata in R](http://reganmian.net/blog/2013/10/02/likert-graphs-in-r-embedding-metadata-for-easier-plotting), a few of my colleagues mentioned that they were learning R through [a Coursera course on data analysis](https://class.coursera.org/compdata-003/class). I have been working quite intensively with R for the last half year, and thought I'd try to document and share a few tricks, and things I wish I'd have known when I started out.

![](/blog/images/2013-10-09-starting-data-analysiswrangling-with-r-things-i-wish-id-been-told_-_whole-05.png)

I don't pretend to be a statistics whiz -- I don't have a strong background in math, and much of my training in statistics was of the social science *"click here, then here in SPSS"* kind, using flowcharts to divine which tests to run, given the kinds of variables you wanted to compare. I'm eager to learn more, but running complex statistical functions in R is typically quite easy. The difficult part is acquiring data, cleaning it up, combining different data sources, and preparing it for analysis (they say 90% of a data scientist's job is data wrangling). Of course, knowing which tests to run, and how to analyze the results is also a challenge, but that is general statistical knowledge that applies to all statistics packages.

So here are some of my suggestions and "lessons learnt", in no particular order:

## Use RStudio

![](/blog/images/2013-10-09-starting-data-analysiswrangling-with-r-things-i-wish-id-been-told-_-whole-01.png)

[RStudio](http://www.rstudio.com/) is an great open source *integrated development environment* for R. It integrates

- a project manager
- a text editor with syntax highlighting and tab-completion
- package management
- previewing plots
- previewing tables (see columns and rows in your dataset)
- integrated help (click F1 on any function)
- jump to source (click F2 on any function)
- and [Knitr](http://yihui.name/knitr/) (write reports in [Markdown](http://daringfireball.net/projects/markdown/), see below)

There's even a version of RStudio [that runs in the browser](http://www.rstudio.com/ide/docs/server/getting_started) -- we're currently using it to coordinate data analysis among a geographically dispersed team on many gigabytes of data. Keeping it on a central server, and letting people run analyses directly on the data is much more convenient and secure than having everyone store tens of gigabytes of data on their personal computers.

## Use Knitr

[Literate programming](http://en.wikipedia.org/wiki/Literate_programming) is the idea of mixing executable code with documentation in the same document. Knitr brings this functionality to R, and it's integrated beautifully with RStudio. By default, all the text you write in a Knitr document is interpreted as [Markdown](http://daringfireball.net/projects/markdown/) (a light-weight markup language, which I'm also using to author this blog). Press `Alt+Cmd I` to insert an R code block. You can run the code either by pressing `Cmd+Enter` on a single line, or `Alt+Cmd C` to execute an entire code block. When you're done, you can press "Knit HTML", which executes the whole document and produces a report.

Here's an example from some recent work analyzing a questionnaire, we're introducing the graph, and then adding the code that will produce the graph ([see my previous blog post on likert-graphs](http://reganmian.net/blog/2013/10/02/likert-graphs-in-r-embedding-metadata-for-easier-plotting)):

![](/blog/images/2013-10-09-starting-data-analysiswrangling-with-r-things-i-wish-id-been-told_-_whole-04.png)

Running `Knit HTML` combines the text, formatted nicely, the code used to generate the graph, and the actual graph:

![](/blog/images/2013-10-09-starting-data-analysiswrangling-with-r-things-i-wish-id-been-told_-_whole-03.png)

For the final report, you might choose to hide all the code segments with this invocation:

```r
library(knitr)
opts_chunk$set(echo=F, warning=F,message=F,results="asis", prompt=F, error=F)
```

Not only is this a great way of writing reports (you can also export to PDF, or even write in LaTeX instead of Markdown), but it's a very nice way of organizing your code. I now do all my development in this mode, even for scripts where I'm not interested in the final report. I like the ease of documenting, the clear visual separation of the different code blocks, and the ease of pressing `Alt+Cmd C` to execute a single code block.

## Separate cleaning and organizing from analysis

Although R is a fully-fledged (although a bit crufty) programming language with object-orientation and functions, the code that users typically write is very different from an R package. Users usually write very imperative code, *"load this file, then transform the second column, then add the third column, then graph it"*. However, acquiring some good habits of organizing the code and working with the data, might save you a lot of time in the long run.

I usually separate data importing and cleaning from the analysis. My goal is to leave the raw data completely unchanged, and do all the transformation in code, which can be rerun at any time. While I'm writing the scripts, I'm often jumping around, selectively executing individual lines or code blocks, running commands to inspect the data in the REPL (read-evaluate-print-loop, where each command is executed as soon as you type enter, in the picture above it's the pane to the right), etc. But I try to make sure that when I finish up, the script is runnable by itself. Knitr helps impose this - when you choose `Knit HTML`, it begins with a clean slate. When you are working in RStudio, you might have objects lying around from calculations you did a while ago (with code that you've already changed), but if the "knitting" is successful, you know that the current code is valid and produces exactly what you see.

![](/blog/images/2013-10-09-starting-data-analysiswrangling-with-r-things-i-wish-id-been-told_-_whole-06.png)

In one example, I had gotten spreadsheets from several students who had helped me enter data from a large survey. I could have opened these in Excel, and copied and pasted the information into one sheet, but instead I left the files as they were, and read them into R. I tag the columns from each spreadsheet with provenance, if I want to run any quick tests, or even more formal [interrater reliability tests](http://en.wikipedia.org/wiki/Inter-rater_reliability), and merge them into one table. In some spreadsheets, there was an extra empty column, so I remove that programmatically (rather than editing the Excel spreadsheet). First I load `xlsx` to read the Excel spreadsheets, and `plyr` to rename fields later.

```r
library(xlsx)
library(plyr)
```

Then I read in and join the spreadsheet files:

```r
ana <- read.xlsx(file="ana.xlsx", 1,stringsAsFactors=FALSE)
ana$by <- "Ana"

chad <- read.xlsx(file="chad.xlsx", 1,stringsAsFactors=FALSE)
chad[["NA."]] <- NULL
chad$by <- "Chad"

dd <- read.xlsx(file="DD.xls", 1,stringsAsFactors=FALSE)
dd$by <- "DD"

db <- rbind(ana, chad, dd)
```

I noticed that some of the spreadsheets had a bunch of empty rows at the bottom. This might not be the most elegant way, but I used this function to remove all the spreadsheets with all empty values. The way this works is that is.na(x) produces a list of "TRUE TRUE FALSE FALSE TRUE" depending on which of the columns has an NA for that particular row, and sum() adds up the TRUE's as 1, and FALSE's as 0.

```r
db2 <- db[apply(db,1, function(x) {
  sum(is.na(x)) < 43}),]
```

Then I move on to turn all the various versions of "empty cell" into NA:

```r
db <- as.data.frame(lapply(db2, function(x){
  x <- replace(x, x %in% c("n", "N", ""), NA)
  x <- as.factor(x)}))
```

Some of the columns are demographic values, so I'll change these from numeric to categorical variables with the actual values:

```r
db$gender <- revalue(db$X1, c("1"="Male", "2"="Female", "3"="Trans", "4"="Other", "5"=NA))
db$major <- revalue(db$X2, c("1"="History", "2"="Religion", "3"="Other"))
```

And the rest of the questions are likert-style questions with the same categories, so I'll both rename them and order them in one swoop:

```r
likertcat <- c("1"="Not at all", "2"="To a small extent", "3"="To some extent",
  "4"="To a moderate extent", "5"="To a large extent")

for(e in names(db[,9:44])) {
  db[[e]] <- revalue(db[[e]], likertcat)
  db[[e]] <- ordered(db[[e]], levels= c("Not at all","To a small extent",
    "To some extent","To a moderate extent","To a large extent"))
}
```

I also add categories and groupings using my own addition, which [you can read more about](http://reganmian.net/blog/2013/10/02/likert-graphs-in-r-embedding-metadata-for-easier-plotting), and finally I save the new table as an RData file:

```r
save(db, file="db.RData")
```

I should always be able to re-run this script, and re-generate the exactly same RData file, but typically the only time I'll re-run the script is if I get additional data (let's say two other students send me their data entry files).

I then begin the data analysis script with

```r
load(file="db.RData")
```

And we have a nicely prepared table that we can begin exploring.

![](/blog/images/2013-10-09-starting-data-analysiswrangling-with-r-things-i-wish-id-been-told_-_whole-07.png)

## Use version control
![ version control](/blog/images/2013-10-09-starting-data-analysiswrangling-with-r-things-i-wish-id-been-told_-_half-02.png)
RStudio comes with support for [git](http://git-scm.com/) baked in, and it's a great practice to use it. When you create a new project, check the box for *"Create a git repository for this project"*, and you get all this functionality for free. Once you have a functioning version of your script, commit it to Git, and when you later make changes, you can easily track those changes back in history, restore earlier versions, etc. This is great for people collaborating, but it's actually a great idea to start doing it even on solo-projects, and can save you a lot of grief in the future. RStudio has a good [writeup](http://www.rstudio.com/ide/docs/version_control/overview) of this functionality.

![](/blog/images/2013-10-09-starting-data-analysiswrangling-with-r-things-i-wish-id-been-told_-_whole-08.png)

Of course, if you are able to do so, it would be great if you could share your scripts (and data) on [GitHub](https://github.com/) or another public repository. Even in cases where you can't share your raw data (because of ethics, etc), your code could be useful to others. (I have shared some of the code we used [to analyze Coursera MOOC data](http://www.ocw.utoronto.ca/demographic-reports/) in [a GitHub repository](https://github.com/houshuang/coursera-scripts), but I could probably go through my folders and find more snippets of code to share).

## Use data.table instead of data.frame
<!-- Data.frame is the built in
http://datatable.r-forge.r-project.org/ -->

## Keeping track of types in R

## Asking questions - providing reproducible examples

## Packages to use
One of the strengths of R is the incredible selection of packages available, but this can also be quite disorienting to a beginner. Here are some packages that should be part of your toolchain no matter what kinds of analyses you do:

|Package|Description |
|:--|:--|
|[plyr](http://plyr.had.co.nz/)|Plyr applies the "split-apply-combine" approach to R data. You might want to calculate the average height of players, grouped by nationality and year of birth - a one-liner in Plyr. Hadley Wickham is currently developing [dplyr](https://github.com/hadley/dplyr), a faster and more powerful version |

<!--
#test
# es
|[data.table||

http://adv-r.had.co.nz/
http://adv-r.had.co.nz/Reproducibility.html -->