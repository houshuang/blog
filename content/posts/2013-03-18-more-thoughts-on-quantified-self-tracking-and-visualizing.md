---
title: More thoughts on quantified self, tracking and visualizing
created_at: Mon, 18 Mar 2013 10:27:27 +0000
kind: article
tags: tech
---

Yesterday, I wrote [about my tiny timetracker
script](http://reganmian.net/blog/2013/03/16/unobtrusive-time-tracker-visualizing-time-spent-with-ruby-and-r/ "Unobtrusive time tracker, visualizing time spent with Ruby and R"),
resurrecting [some 3 year old
code](https://github.com/houshuang/Personal-time-tracker), cleaning it
up a bit and adding a simple R graph of my day. The script makes it very
easy to track intention (ie. I am the one saying what I am working on,
it doesn't try to infer it from my activity), and over time the log
files should prove interesting.

**R graphs**

I started wondering about other ways of representing the data with R
graphs. Right now, it's just showing a simple bar graph with the
cumulative amount of time spent on each category per day. It would be
easy enough to make similar graphs per week, month, etc, and also easy
enough to correlate other measures that I tracked per day (temperature,
time getting up, mood etc) with cumulative activity in each category for
each day (ie. on days when I got up early, I got more hours of PhD
reading done, etc).

However, the log files don't only contain information about how many
hours I spent each day doing different categories, they also contain
information about when I start and stop different activities. So I might
be able to find correlations like "I tend to get more done on my PhD on
days when that's the first thing I do", etc. To begin with, I tried to
find a way to graph the day's time use as a timeline.

[![daygraph with
timeline](http://reganmian.net/blog/wp-content/uploads/2013/03/daygraph-with-timeline1.png)](http://reganmian.net/blog/wp-content/uploads/2013/03/daygraph-with-timeline1.png)

**Categories**

There are still some challenges with the script. The first is how I log
categories, right now I have 10 slots (0-9), but since I log the full
text, rather than the number, you can change the categories in
settings.rb, without risking to "overwrite" earlier logs. However, I
realized that I wanted to log at different levels of granularity. For
example, I might want to know how much time I'm spending preparing for a
presentation in a few days, but I'd also like to know how much time I
spend each month preparing for presentation, or even on "schoolwork" in
total.

I could attach categories to the projects in settings.rb of course, that
would be easy. I would have to determine whether I wanted the categories
to be exclusive or not. If they are exclusive, I can add them all up,
and get the total amount of time spent. If I want overlapping categories
(presentation is both school work and authoring, whereas writing a blog
post is authoring, but not school work), I'll be able to look at time
use in different categories, but can't compare them against each other
(plotting authoring vs school work wouldn't make sense, since the time
spent writing the blog post would be double-counted). I guess an expense
tracking system that let's you tag your expenses in different categories
has the same problem.

One problem is that I don't quite know how to store or represent this
information effectively in R. I had the same problem when I imported
Google Analytics data together with metadata about all of my blog posts.
My blog posts usually have several categories attached to them.
Initially, this is just a text field with each category listed like
"oa,publishing,china". How would I represent this in a datastructure in
R, so that I could see whether certain tags were more popular than
others, for example? Would I have to duplicate the post, so that I had
three entries for the page, one for each tag? Or turn the tags into
binary variables, so that for each row I would have columns for all the
tags I've ever employed, with a 1 for in use, and a 0 for no? (And is
there a function to remap the data like this?)

**Other data**

I also thought about other sources of data that I could track either
explicitly or automatically. Some of these would be interesting to track
and visualize by themselves, others would be interesting mainly as
related variables. I could for example easily track all the scholarly
PDFs that I read, by taking note of when clippings are exported to
[Researchr](http://reganmian.net/wiki/researchr:start) (I could log both
the number of PDFs read, and the number of pages in each PDF). I could
also look at the length of the high-level notes that I write about
different articles.

It would be quite interesting to wear a FitBit or something similar
24/7, and get detailed information about when you fall asleep, when you
wake up, how you move around etc. However, I could at least use
Fitocracy's API – if I could query the number of points added per day,
that might be a useful proxy for exercise. (If I am diligent about
turning on Runkeeper when biking, I could also extract the number of
kilometers biked every day).

There are some things that I do digitally, that would be so easy and so
interesting to track, but which does not have an interface. I spend
hours every day reading on my Kindle, and it would be very interesting
to export the number of pages read per day, the time I've spent, speed
(seconds per page), etc. But the Kindle does not collect this data (or
at least, it won't share it with me).

**Entering manually**

There is also data other than time-use that I might have to enter
manually. I thought about creating a very unobtrusive interface,
triggered with a global keyboard shortcut, which would let me type in a
variable (with autocomplete), let me tab to an entry field, let me type
in the value, and press enter to store (with a time stamp). This could
be everything from weight, to bed time, books read, or anything else.
(One could even imagine a window that pops up at random times asking
about your mood, whether you are feeling tired or energetic etc - but
that might quickly become annoying). First draft of interface:

[![loggr](http://reganmian.net/blog/wp-content/uploads/2013/03/loggr1.png)](http://reganmian.net/blog/wp-content/uploads/2013/03/loggr1.png)

**Reports**

Right now I am creating a few graphs with
[ggplot2](http://ggplot2.org/), running an R script through Rscript,
that spits out a PDF, and then I display that PDF with
[Pashua](http://www.bluem.net/en/mac/pashua/). When I have more data,
and graphs, I plan to create a knitr template (Markdown + R code), maybe
even using a templating system, and then run knitr from the command line
(through Rscript?), which will generate an HTML page, which I can then
open in the browser.

Anyway, that's how far I got in my pondering.

*PS: This blog entry took exactly 37 minutes to write, most of which I
did on the plane, which is the early pink blob you see on the timeline,
then my battery ran out, I arrived, spent some time finding my AirBnB
host, etc, and then the timeline resumes :)*
