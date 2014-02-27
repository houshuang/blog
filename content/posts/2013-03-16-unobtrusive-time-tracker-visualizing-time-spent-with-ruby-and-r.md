---
title: Unobtrusive time tracker, visualizing time spent with Ruby and R
created_at: Sat, 16 Mar 2013 23:05:52 +0000
kind: article
tags:
  - academia/research
  - personal
  - tech
---

About three years ago,  I read some articles about the [quantified
self](http://quantifiedself.com/), and how the simple act of observing
something can lead to change (often in a positive direction). I've been
interested in productivity tools and theories for a long time (it's a
constant struggle for academics), and I thought of different ways of
measuring how I spend my time. I tried a few different automatic tools
which look at which applications are open, which websites you visit etc,
but found that the data they generated were not that helpful. If I am on
Google Scholar, am I doing research for my PhD, working on a paid
research project, or just following a random thought?

So I needed something that took my intention into consideration, but did
so in a really easy and unobtrusive way. I had a pretty good idea of how
the tool I wanted would look - something that would sit in the menubar,
and where I could change which activity I was working on with only a
global shortcut. I looked around, but couldn't find any tools that
really fit the description, so I began building my own. I wrote some
really simple Ruby scripts to log time codes to text file, triggered
with a global shortcut program, and used [Growl](http://growl.info/) to
provide some feedback.

I [wrote up the whole
thing](http://reganmian.net/blog/2010/04/29/personal-time-tracker-with-ruby-and-growl/ "Personal time tracker with Ruby and Growl")
on my blog, posted [the
code](https://github.com/houshuang/Personal-time-tracker) on GitHub, but
actually didn't end up using the system very much (the fate of many
productivity tracking systems, I'm sure). Three years later, I've spent
a lot of time working on my [open academic
workflow](http://reganmian.net/wiki/researchr:start), and I've also
begun experimenting with [R](http://www.r-project.org/) for data
analysis and visualization. I am also involved in a number of different
paid projects, so tracking my time is not just for self-insight, but
would also be very useful for billing, etc.

[![Screen Shot 2013-03-16 at
18.58.22](http://reganmian.net/blog/wp-content/uploads/2013/03/Screen-Shot-2013-03-16-at-18.58.22.png)](http://reganmian.net/blog/wp-content/uploads/2013/03/Screen-Shot-2013-03-16-at-18.58.22.png)

I opened the code that I hadn't touched in three years, updated it a
tiny bit (I use [Keyboard Maestro](http://www.keyboardmaestro.com/main/)
now, instead of [FreeHotKeys](http://www.batista.org/freehotkeys.html)),
and then experimented with adding a graph. It took a bit of time getting
R to play nicely with Ruby, I began with
[rinruby](https://sites.google.com/a/ddahl.org/rinruby-users/), which
lets you run R commands through Ruby. However, this popped up a Quartz
screen every time I used ggplot to render a graph (even if I never
displayed the graph, but sent it straight to a PDF).

Then I tried to run an R script through R CMD BATCH, which worked, but
took almost 10 seconds to execute. I later found out that this is an old
way of doing things, and that
[Rscript](http://stat.ethz.ch/R-manual/R-patched/library/utils/html/Rscript.html)
is the new way. That worked perfectly, and it executes and renders the
PDF in 0.8 seconds. I then use
[Pashua](http://www.bluem.net/en/mac/pashua/), which I use extensively
in my open academic workflow, to display a dialogue with the graph and
some extra information.

[![pashua time
tracker](http://reganmian.net/blog/wp-content/uploads/2013/03/pashua-time-tracker.png)](http://reganmian.net/blog/wp-content/uploads/2013/03/pashua-time-tracker.png)

Currently, it just shows a simple bar graph of activity during the
current day, but as I collect more information over multiple days, the
data could be visualized in many interesting ways. I know not only how
much time I spend on a certain activity each day, but also when I spend
the time (and in how large chunks, how often I'm interrupted or start
surfing etc). This could be visualized as time-series, and I could even
experiment with correlations with other factors, whether external ones
(the daily temperature?) or internal, if I track other factors (when I
go to bed, what I eat etc).

Only time will tell if I keep using the system, but perhaps this
possibility of using and visualizing the data will be enough incentive
to track. It will also be very interesting to see how much time I
actually use on various activities - for example I need to give a
presentation at [Beyond the PDF2](http://www.force11.org/beyondthepdf2)
in Amsterdam in a few days - exactly how much time will it take me to
prepare?

Stian

 
