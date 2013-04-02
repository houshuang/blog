---
title: Time tracker one week on, new features
created_at: Sat, 29 Mar 2013 03:18:51 +0000
kind: article
tags:
- academia/research
- personal
- tech
---
Last week I wrote about how [I began resurrecting a three-year old time
tracker
project](http://reganmian.net/blog/2013/03/16/unobtrusive-time-tracker-visualizing-time-spent-with-ruby-and-r)
with R graphs. I then [added a
timeline](http://reganmian.net/blog/2013/03/18/more-thoughts-on-quantified-self-tracking-and-visualizing),
and began thinking about other kinds of data that I could track.

It's now been almost two weeks since I began playing with this script,
and the first thing I can say is, I'm using it. Both because the graphs
generated are compelling, and because I've been able to add some useful
functionality, it's become a part of my workflow, and I've been quite
rigorous about logging my time, without ever feeling that it was
intrusive or annoying.

**Automatically log on computer sleep or wakeup**

One key feature I added, was the ability to detect when my computer goes
to sleep (by closing the lid) and when it wakes up, using
[Sleepwatcher](http://www.bernhard-baehr.de/). It ends the current
activity on sleep, and automatically begins "surfing" when it wakes up -
I have to tell it if I am doing something more productive, but that
little popup saying "surfing" also reminds me of that. And being able to
quickly close the lid when my wife says dinner is ready, without
worrying about the time tracker running, and some category getting an
extra bunch of hours added on it, is also a relief. (I also changed the
format of the data files to nice time codes, like this:

```
2013-03-29 09:05:35 -0400,PhD offline
2013-03-29 09:42:35 -0400,surfing
2013-03-29 09:46:14 -0400,PhD offline
```

This makes it easier to manually edit (something I've almost never
needed).

**Automatically turn off the Internet, based on activity**

To provide more focus, I've also added a feature which turns off the
Internet if an activity containing the word offline is entered (for
example PhD offline). I just use ipfw for that,

```ruby
def internet(status) # true = on, false = off
  if status # enable
    `ipfw -q flush`
  else
    `ipfw add deny all from any to any`
  end
end
```

Of course, it would be easy for me to override this manually, but unlike
apps like [Freedom](http://macfreedom.com/), it doesn't aim to block me
from the Internet for a certain period of time, but only for however
long I'm using the offline activity. I can switch back to surfing at any
time, but I have to do so consciously, rather than mindlessly
Alt+Tabbing to a browser and pulling up Reddit whenever my brain
encounters something difficult.

**Auto-completing activity chooser**

![activity chooser ](http://reganmian.net/blog/wp-content/uploads/2013/03/Screen-Shot-2013-03-29-at-23.06.26.png)

I found that I often had to peek at the keyboard shortcut list before
switching to an activity, and sometimes needed activities that were not
on the list, so I added a command on Ctrl+Alt+Cmd+Enter, which pulls up
a text-entry box that autocompletes on all previously entered
activities. I was curious whether I would end up preferring this, or the
direct keyboard shortcuts. After a few days, I'm using both - I remember
a few keyboard shortcuts very well, like 9 for surfing, 6 for hacking, 7
for tasks, and 0 for rest (although I usually just close the laptop),
whereas for specific projects, it's quicker to pull up the window, hit
the first few buttons, like *la*, *laurie *pops up, and I hit enter to
select it.

**Adding week view and traffic light**

I've added a cumulative view over the last 7 days, and also a
rudimentary "traffic light" ([thanks to
StackOverflow](http://stackoverflow.com/questions/15707342/how-to-color-a-ggplot-according-to-color-stored-in-a-column)): green if I spend more than 4 hours per day on my PhD, yellow if more than 2
hours, and red if less than 2 hours. Looking at the graph below (click
on it to expand), you can see that I have not been spending enough time
on my PhD lately, and hopefully this "nudge" will help me improve on
that!

![](http://reganmian.net/blog/wp-content/uploads/2013/03/time-use-small.png)

**Future**

The popup view is already getting very overcrowded, so if I want to do
any further analyses (which I surely do), I will have to start writing
up a knitr report, to be viewed in a browser. ([My friend
Bodong](http://bodongchen.com) suggested [a Shiny
app](http://shiny.rstudio.org/), which I might also look into). I think
I will need to begin storing the data in a sqlite database, instead of
in flat textfiles, to enable easier integration with other data sources,
both automatic ones (Chrome history, Fitocracy API, PDFs read), and
self-logged variables. I also need to think about how much processing I
want to keep in Ruby, and how much to do in R.

I've got two 10-hour bus trips coming up next week, on the way to and
from[the Coursera conference](http://conference.coursera.org/), so maybe
I'll get some more work done it then. In the meantime, I'm going to
focus on my PhD, and try to turn those traffic lights green!