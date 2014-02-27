---
title: Personal time tracker with Ruby and Growl
created_at: Thu, 29 Apr 2010 18:02:54 +0000
kind: article
tags:
  - data driven
  - growl
  - personal
  - ruby
  - self-experimentation
  - tech
  - time tracker
---

**Introduction**

I'm fascinated by the idea of measurement itself having
an effect on behavior. For example, it has been show that simply letting
people see how much electricity they are using at any given time, leads
people to decrease their usage. Data is also necessary to experiment,
and measure the effect. I was fascinated by the [Hacker's
Diet](http://www.fourmilab.ch/hackdiet/e4/), where one of the features
is measuring your weight every day, but using a moving average to smooth
out the data noise caused by varying levels of water, etc. (There are a
number of web apps and iPhone, etc apps available for doing this as
well).

Yesterday, I came across a [New York Times
article](http://www.nytimes.com/2010/05/02/magazine/02self-measurement-t.html?pagewanted=all)
about the "data driven life". They showed how the wide availability of
cheap measuring instruments (the primary being the cell phone, but also
GPS chips, Wifi-enabled weights etc), and programs for crunching and
visualizing data, some people are tracking a range of personal
statistics, such as time use, weight, mood, sleep etc. This can be used
for self-experimentation, one person did several experiments to find
that his cognitive capacity went up with a spoon of flaxseed in the
morning.

These experiments are different from traditional scientific experiences
in that they don't necessarily seek universality, rather than assuming
that what happens to you can be applied to others, you are simply
interested in what happens to you. Perhaps the person above is the only
one reacting like this to flaxseed oil, but that's OK – he is the one
who is going to be eating him – to him it's a profoundly useful
discovery.

Another difference is that instead of having very targeted and
well-designed experiments, these individuals often just track data over
long periods of time, for curiosity, or to see if any patterns emerge.
Or perhaps to try to improve on some aspect of their life, such as
weight loss, or wasting less time, and using the visualization of
"brutally honest" data to drive that behavior change.

**How can I stay more focused online?**

I work on a number of different
projects concurrently, they all (mostly) happen in front of the
computer, and combined with all the distractions and interruptions (an
e-mail just arrived, my friend paged me, let me check this thing), it
can often be very difficult to get a sense of where time went. Sometimes
in the evening, I think – wow, that was another day, but what did I
actually achieve? And especially this summer, as I really need to finish
my thesis, it becomes important to focus more on the important tasks,
and cut down on the distractions.

I came across the [LeechBlock
plugin](https://addons.mozilla.org/en-US/firefox/addon/4476) for
Firefox, which is designed exactly for people like me, who get easily
distracted. You can add a number of sites, specify whether they should
be blocked for a certain time period, or after you have used them for a
certain period of time each hour/day/week. Given that you are installing
it, it's impossible to make the computer completely "you-proof", so the
purpose is rather designed to make you slow down when you go to Reddit
or Facebook, think twice, and go back to your real work. (That said,
some of the options are designed to make it almost impossible to
modify/uninstall the plugin while it's actively blocking).

So I thought I'd give it a try, I installed it, and listed a number of
web pages I frequently visit, but which I don't really *need*to visit...
Reddit, Google Reader, various newspapers, Daring Fireball, Boing Boing,
etc. I wanted to be strict with myself, to get work done on my thesis,
so I set it to block all access until 6PM every day. I also moved Chrome
and Safari out of the Applications folder.

The plugin does exactly what it says it's supposed to do. However, after
a day I disabled it, for two reasons. The first is that although the
sites mentioned above do take up a lot of my time, they are far from the
only ones. In fact, that day I spent most of my time working on the
[P2PU](http://p2pu.org), adding a [Planet](http://blogs.p2pu.org/planet)
for example. While this is useful work, it's not related to my thesis,
and strictly, it could have waited. Yet there would have been no way of
blocking every web page related to P2PU. And of course, the biggest time
sink is perhaps my e-mail, but it's also vital to much of the research I
am doing, so I could not block GMail. The second reason was that it felt
very tiresome and annoying when I did need some of those sites for
legitimate purposes – connect with a researcher on Facebook, or view a
film clip related to my research on Youtube, and was blocked (with no
option of turning it off).

**Getting a better sense of how I spend my time**

So inspired by the
NYTimes article, I thought it would be fun to try to track my time
online, and maybe through this, be able to focus more on the tasks that
really matter. I put out [a
question](http://twitter.com/houshuang/status/13021680071) to my Twitter
network: "Interesting article abt data tracking&self-experimentation.
Any good inobtrusive time trackers for Mac? Sync with iPhone?
nyti.ms/b4Eiro". I got a number of answers (thanks all!), and I spent
some time checking some of these tools out. However, none really did
what I wanted. Many of them were designed more for freelancers and
others needing to track their time for billing purposes, and some were
integrated with impressive project managers.

The key feature to me was the ease of entry. The whole purpose of this
exercise would be to micro-measure how much time I spend on different
tasks on my computer, which is often spliced in very small segments –
two minutes reading e-mail, a minute chatting with a friend, five
minutes writing a proposal, back to chat, back to the proposal... To be
able to track something like that, I'd need a way that was incredibly
unobtrusive, and easy to manage. In fact, I instinctively had a fairly
good idea of what I wanted: some little tool that sat in the menu bar,
which enabled me to change the category it was tracing with a mode-less
global shortcut. So I could quickly do Ctrl+Cmd 1, for category one,
check my e-mail, then Ctrl+Cmd 2, back to report writing etc.

However, none of the time tracking tools I found offered this
functionality. They all had nice little boxes with a button to click on
your mouse. But if I had to tab to find this application, and manually
click on the category, it would never become something I integrated into
my workflow. (Note that there are a *lot* of time trackers out there,
it's quite possible that this exists, and I didn't find it.)

**Making my own**

So I could not found a tool that would do exactly what
I wanted. Then I started wondering whether it would be possible to build
my own tool. I realize the irony in spending this much time, trying to
save time. But it's fun! My tool of choice is Ruby, and I realized that
the actual tracking would be very simple – all that would be needed,
would be to write a time-stamp with a category to a file. Later, a
script would be able to go through that file and by looking at the
various time-stamps, figure out how much time I had used.

If for example I had stamped "Sunday 3:01 PM - P2PU" and later "Sunday
3:15 PM - thesis", then the script would output "On Sunday 3:01 PM, you
spent 14 minutes working on P2PU".

However this tiny script – a line or two – would have to be launched
from a global shortcut. There are two ways of doing this. One is
creating a service that launches the script using
[Automator](http://en.wikipedia.org/wiki/Automator_%28software%29). This
service can then be assigned a global shortcut in the control panel
(under keyboard). I tried this, and it worked, but it seems that you
cannot edit the services from Automator, once you have created them. You
can edit them manually, but the little text to execute is hidden into a
huge XML file (sometimes Apple config files are incredibly verbose). In
addition, you will have to create one service for every category you
want to be able to trigger.

Another possibility is
[FreeHotKeys](http://www.batista.org/freehotkeys.html) by Richardo
Batista. It's a free download (unfortunately the disk image is SIT
compressed, so you need to download the free Stuffit Expander as well –
Mac nostalgia), and a small hidden program, that let's you assign random
scripts to global hotkeys in a way that is much more easy to manage. I
currently use this program, but the method above should work as well,
and doesn't require any external programs.

**Visual
feedback**

![tracker ](http://reganmian.net/blog/wp-content/uploads/2010/04/tracker-newentry.png) As
I said, the actual code for making a new time stamp is about one line
long. I simply add a time stamp (output of Time.now.to\_i) and the
category as a new line to a text file. However, I would really
appreciate some visual feedback to know that this has been achieved, and
maybe telling me how much time I spent on the previous activity. There
are a few ways of creating programs with a GUI on OSX, like MacRuby,
RubyCocoa, etc. However, when I began reading up on NSObjects and
interface builder, and nib files, my eyes glazed over. It's great that
it's possible, but learning about it would require more time than I
could justify for a project designed to save time...

Then I remembered [Growl](http://growl.info/). It's a small library used
by many different programs for providing unobtrusive visual reminders or
notices on OSX. I looked around to see if there was a way that I could
trigger Growl notices using Ruby. There is a Ruby library, but it seemed
much easier to use
[growlnotify](http://growl.info/documentation/growlnotify.php), a
command line tool for creating notices. This way, the script could write
the time stamp, and then send out a notice to let me know what was going
on.

Great! Except I ran into some snags. No matter what I did, the script
worked great from the command line, but when launched through the global
shortcut, growl wouldn't trigger (the time stamp was still written to
file). I found two remedies
([1](http://craigjolicoeur.com/blog/problem-with-growlnotify-on-os-x-leopard),
[2](http://hasseg.org/blog/post/111/growlnotify-leopard-incompatibility-workaround/)),
and I ended up with
[this](http://hasseg.org/blog/post/111/growlnotify-leopard-incompatibility-workaround/),
which worked perfectly (really hope the Growl team can fix this
permanently!).

**Status**

![ill ](http://reganmian.net/blog/wp-content/uploads/2010/04/tracker-status.png)] In
addition to generating a file of timestamps, that could then be analyzed
in any which way – graphs of time use over time, scatter plots, when
during the day are you most likely to get distracted, etc. – I also
wanted a quick status of the current day. To achieve this, I switched to
recording the time stamps in a new file every day, so that I could
quickly sort through this file and calculate cumulative totals. (I
realize this might get me into trouble for tasks that continue past
midnight, an unfortunately all to common issue. I have to put in a fix
for this.)

So I added a status script, which prints the current activity and how
long you spent already, the cumulative totals for all activities today,
and a "cheat sheet" for the different hot keys, and the categories which
they trigger.

Having done all this, I was very content, and finally went to bed. The
whole thing took longer than I had thought, because I spent some time
trouble-shooting Growl, etc. But in the end, I was very happy with what
I had come up with. The whole project was about 110 lines of code
(including white space and comments), but worked perfectly, and even
looked good.

**Cleaning up the code**

This morning, I sat down to clean up the code a
bit. This is how I usually develop – it starts out as a simple idea, you
write a few lines, try them out. Then it grows, and becomes a mess of
code with no functions, lot's of code duplication, paths and values
hard-coded, etc. But it makes for rapid prototyping. Then, when I've
reached some basic level of functionality, I can look through the code
again, begin picking out duplicated code and make it into functions,
make parts of the script more robust and less dependent on me running it
in exactly that directory, etc. I also added some comments. This makes
the code incredibly much cleaner and neater to look at (and usually I
end up removing a bunch of lines), and in addition to making it easier
for others to get up to speed, it helps me a lot too, when I come back
to it in a year or so.

I put [all the code](http://github.com/houshuang/Personal-time-tracker)
up on Github. Note that I totally didn't write this for anyone else, it
was purely to scratch a personal itch. Due to the way Ruby works, I am
never contemplating to create some kind of an installer, etc. But if you
are a bit technical, and want to have a look– be my guest! Anyone can
fork the code and improve upon it. Right now, the categories are all
hard-coded into *library.rb*, and are easy to change. (The way I use
this, is that *0* means "stepping away from the computer", *1-5*are
different projects I'm working on right now. *6* is "goofing off", ie.
any time spent on the computer not doing one of these projects, and
*7-8* are to free slots for shorter-term projects. For example, I am
tracking how much I'm spending on this tracker program right now in
"project 1".

This was fun. Now I am going to actually use this program, and measure
how effective I am. I don't know yet if I'll end up using this regularly
or not, or what effect it will have, but it's an interesting experiment,
and writing it was a fun exercise in how much you can do with little,
when things are loosely coupled.

(I haven't written a script that analyzes the time stamp files yet.
There are lot's of ways to do it, it could output different kinds of
data, even automatically upload it to a web service, etc. Feel free to
play with it, and if I add such a script later, I'll make it available
in GitHub.)

Stian - off to be productive
