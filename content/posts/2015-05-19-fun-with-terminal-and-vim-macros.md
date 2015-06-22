---
title: "Fun with terminal and Vim macros"
created_at: 2015-04-19 11:41:48 -0500
kind: article
location: Lijiang, Yunnan, China
tags: tech, vim
---

I always enjoy finding new ways of automating boring tasks, and today I had a few different small tasks that I was able to solve using some terminal-fu, and Vim macros. I really enjoyed how well it came together, so I thought I'd put together a short screencast to demonstrate.

I had generated a number of discussion forum graphs for different courses. The processed data is in a json file in a directory named after the course. My task was to put an identical index.html file into each directory, create an index of the courses, with links, and modify all the landing pages to reflect the names of the courses. Not a hugely complicated task, but something you could run into day to day, and which would be quite cumbersome to do manually.

<iframe width="600" height="500" src="https://www.youtube.com/embed/HesocMwPuJc" frameborder="0" allowfullscreen></iframe>

The video should be quite self-explanatory, but I've included some "show-notes" below.

As far as I know, `ls` doesn't have a built-in way to list only directories, so I found this snippet somewhere and added it to my .zshrc:

```bash
alias ld="ls -lht | grep '^d'"
```

`awk` is a very powerful string manipulation tool, but in this case we're just using it to get the 9th column of each line (`awk '{ print $9 }'`)

`xargs` is very useful to run commands on input arguments. We need `-n 1`, otherwise it would put use all the arguments in the same command. With `-n 1`, it executes the command once for each input argument. If we didn't want to put the arguments last, we could do something like `echo 1 2 3 | xargs -n 1 - J % echo % hi`.

