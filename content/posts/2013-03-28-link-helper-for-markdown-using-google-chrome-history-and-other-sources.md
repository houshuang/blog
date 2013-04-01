---
title: Link-helper for Markdown, using Google Chrome history and other sources
created_at: Thu, 28 Mar 2013 15:18:11 +0000
kind: article
tags:
- tech
---

[![ links-density](http://reganmian.net/blog/wp-content/uploads/2013/03/links-density.png)](http://reganmian.net/blog/wp-content/uploads/2013/03/links-density.png)

I've been writing more blog posts than usual lately, because of [the
Beyond the PDF2 conference](http://www.force11.org/beyondthepdf2), as
well as [some hacks I've been working
on](http://reganmian.net/blog/2010/04/29/personal-time-tracker-with-ruby-and-growl),
and I realized (again) how much of my time is taken up with finding and
inserting links. I often have quite a lot of links in my blog posts, the
graph shows a bunch of posts with only two or three links, but most have
more than 10, and a few have up to 40 or 60 links
([these](http://reganmian.net/blog/2009/03/12/links-from-the-talk-open-education-around-the-world/)
[two](http://reganmian.net/blog/2011/03/25/open-course-done-right-saylor-foundation)
are the winners, with 78 links each).

Typically what I do is Cmd+T for a new tab, type in a Google query,
select the new page, Cmd+L and Cmd+C to copy the URL, back to the blog
editor, insert link, etc. It's quite quick, but for 10, 20 or 40 links,
it takes a significant of time, and also disrupts the writing.

When you use the UI to add a link in WordPress, it automatically
suggests other blog posts, either by recency or by a search term. This
is great, but it only looks at blog posts - what if I want to link to my
YouTube video, or a wiki page? I'm also trying to (slowly) move away
from WordPress onto a [static site
generator](http://www.mzlinux.org/?q=node/415), probably
[nanoc](http://nanoc.ws/), which relies on editing MarkDown.

[![Screen Shot 2013-03-28 at
10.58.45 ](http://reganmian.net/blog/wp-content/uploads/2013/03/Screen-Shot-2013-03-28-at-10.58.45.png)](http://reganmian.net/blog/wp-content/uploads/2013/03/Screen-Shot-2013-03-28-at-10.58.45.png)

As I was looking into accessing [the Google Chrome
history](http://www.intridea.com/blog/2011/2/2/fun-with-ruby-mining-your-chrome-history)
for some [quantified self](http://reganmian.net/wiki/quantified_self)
experiments, I realized that almost all the pages I link to are either
pages I've recently accessed in Google Chrome, or my own pages, either
from my blog, my wiki, or my YouTube, Vimeo or Slideshare channels. What
if I could quickly search those sources, and have the resulting link
inserted in MarkDown format? See the result in the short (2:30min)
screencast below:

The script is triggered by [Keyboard
Maestro](http://www.keyboardmaestro.com/main/), grabs the currently
selected text, and looks up in a bunch of data sources (some, like the
YouTube, Vimeo and Slideshare channels are cached using the relevant
APIs, others like the Google Chrome history, and my wiki pages, are
live), and presents the choices using
[Pashua](http://www.bluem.net/downloads/pashua_en). If I make a choice,
it then formats the link accurately depending on which application I am
using, and in Google Chrome, the URL of the tab I am on (wiki markup for
my wiki, Markdown on GitHub, etc).

The source is [on GitHub](https://github.com/houshuang/linkify), and it
should be fairly easy to get running, especially if you only want Google
Chrome history. There might be some individual quirks in how I access my
wiki pages for example, but feel free to contact me if you have
questions.

Stian
*PS: The other thing I spend a lot of time doing, is selecting,
resizing, uploading and inserting pictures, and that's another thing I
hope to simplify when I move to writing my blog posts in Markdown.*
