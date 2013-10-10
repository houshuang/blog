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

R is a very powerful open source environment for data analysis, statistics and graphing, with thousands of packages available. After my previous blog post about [likert-scales and metadata in R](http://reganmian.net/blog/2013/10/02/likert-graphs-in-r-embedding-metadata-for-easier-plotting), a few of my colleagues mentioned that they were learning R through [a Coursera course on data analysis](https://class.coursera.org/compdata-003/class). I have been working quite intensively with R for the last half year, and thought I'd try to document and share a few tricks, and things I wish I'd have known when I started out. 

I don't pretend to be a statistics whiz -- I don't have a strong background in math, and much of my training in statistics was of the social science "click here, then here in SPSS" kind, using flowcharts to divine which tests to run, given the kinds of variables you wanted to compare. I'm eager to learn more, but running complex statistical functions in R is typically quite easy. The difficult part is acquiring data, cleaning it up, combining different data sources, and preparing it for analysis (they say 90% of a data scientist's job is data wrangling). (Of course, knowing which tests to run, and how to analyze the results is also a challenge, but that is general statistical knowledge that applies to all statistics packages.) 

<!-- way of grabbing first page of a bunch of PDFs - create collage of frontpages of R stats books? -->

## Use RStudio

![](/blog/images/2013-10-09-starting-data-analysiswrangling-with-r-things-i-wish-id-been-told-_-whole-01.png)

[RStudio](http://www.rstudio.com/) is an great open source *integrated development environment* for R. It integrates 

- a project manager
- a text editor with syntax highlighting and tab-completion
- package management
- graph view
- data view (see columns and rows in your dataset)
- integrated help (click F1 on any function)
- jump to source (click F2 on any function)
- and Knitr (write reports in Markdown, see below)

There's even a version of RStudio that runs in the browser -- we're currently using it to coordinate data analysis among a geographically dispersed team on many gigabytes of data. Keeping it on a central server, and letting people run analyses directly on the data is much more convenient and secure than having everyone store tens of gigabytes of data on their personal computers. 

## Use Knitr

Literate computing is the idea of mixing executable code with documentation in the same document. Knitr brings this functionality to R, and it's integrated beautifully with RStudio. By default, all the text you write is interpreted as Markdown (a lightweight markup language, which I'm also using to author this blog). Press `Alt+Cmd I` to insert an R code block. You can run the code either by pressing `Cmd+Enter` on a single line, or `Alt+Cmd C` to execute an entire code block. When you're done, you can press "Knit HTML", which executes the whole document and produces a report. 

Here's an example from some recent work analyzing a questionnaire, we're introducing the graph, and then adding the code that will produce the graph ((see my previous blog post on likert-graphs)[http://reganmian.net/blog/2013/10/02/likert-graphs-in-r-embedding-metadata-for-easier-plotting]):

![](/blog/images/2013-10-09-starting-data-analysiswrangling-with-r-things-i-wish-id-been-told_-_whole-04.png)

Running `Knit HTML` combines the text, formatted nicely, the code used to generate the graph, and the actual graph:

![](/blog/images/2013-10-09-starting-data-analysiswrangling-with-r-things-i-wish-id-been-told_-_whole-03.png)

For the final report, you might choose to hide all the code segments with this invocation:

```r
library(knitr)
opts_chunk$set(echo=F, warning=F,message=F,results="asis", prompt=F, error=F)
```

Not only is this a great way of writing reports (you can also export to PDF, or even write in LaTeX instead of Markdown), but it's a very nice way of organizing your code. I now do all my development in this mode, even for scripts where I'm not interested in the final report. I like the ease of documenting, the clear visual separation of the different code blocks, and the ease of pressing `Alt+Cmd C` to execute a single code block. 

## Write reproducible code

Although R is a fully-fledged (although a bit crufty) programming language with object-orientation and functions, the code that users typically write is very different from an R package. Users usually write very imperative code, "load this file, then transform the second column, then add the third column, then graph it". However, there are some good habits of organizing the code and working with the data, which might save you a lot of time in the long run. 

I usually separate data importing and cleaning from the analysis. My goal is to not change the raw data at all, but to do all the transformation in code, which can be rerun at any time. While I'm writing the scripts, I'm often jumping around, selectively executing individual lines or code blocks, running commands to inspect the data in the REPL (read-evaluate-print-loop, where each command is executed as soon as you type enter, in the picture above it's the pane to the right), etc. But I try to make sure that when I finish up, the script is runnable by itself. Knitr helps impose this - when you choose `Knit HTML`, it begins with a clean slate. When you are working in RStudio, you might have objects lying around for a long ti