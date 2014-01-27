---
title: Coding in Ruby
created_at: 2005-06-16 00:00:00 -0400
kind: article
tags: opensource, tech
---

This last week I have been working unusually hard. After fighting for a
while with [EZPublish](http://www.ez.no), which is what [Politics of
Health](http://politicsofhealth.org) is published with, I have decided
to try to migrate the whole system to a wiki. The article structure is
very simple, we hardly use any of the CMS features of EZPublish, and
it’s a beast. I know a lot of people use it, but personally there are
fare too many files, php templates and directories for me to even begin
to root around with. I spent a lot of time with a Norwegian CMS called
[InfoLab](http://www.infofab.no) (not opensource), which was quite nice.
It lacked documentation, but at least all the modifications were done
inside the program. With EZ, you have a bunch of stuff that is edited
within the web-app, and other things (especially layout - but for
changing anything except adding another identical article, you need to
muck around with php). And it seems poorly documented at that level as
well.

So I am trying to migrate us over to
[DokuWiki](http://wiki.splitbrain.org/wiki:dokuwiki) (just a test, if it
doesn’t do what we want, it should be easy to port it to another wiki).
I am using [Ruby](http://www.ruby-lang.org), and after looking at the
[SQL database](http://www.wikipedia.org/wiki/SQL) of EZPublish, I
decided to go straight to the HTML - which, since it is all outputted by
a computer, is wonderfully predictable. I am using a combination of
wget, [Tidy](http://tidy.sourceforge.net) (with -asxhtml),
[REXML](www.germane-software.com/software/rexml/) (which is absurdly
undocumented - it seems to work, but I don’t know why), and a bunch of
regexps. The work is going slowly, mostly because it has been ages since
I programmed in Ruby, and even then I never properly learnt it, so I
have to look up most functions. But I learn quickly, Google is my
friend, and I love Ruby. (If you are interested, and don’t know much
about programming, may I suggest [the Poignant Guide to
Ruby](http://www.poignantguide.net/ruby/)?)

[Ruby on Rails](http://www.rubyonrails.org/) has garnered a lot of
interest lately, with the first major book [selling over a 1000 copies
of the prerelase
PDF](http://books.slashdot.org/books/05/06/16/1914251.shtml). I didn’t
know much about this before, but I read up on it a bit (a nice
tutorial), and I must say I am impressed. This is quite different from
mucking around with php and MySql. In general, although I’ve been
working long days lately (including some network installing down in
Mazatlan), I’ve enjoyed getting back into coding (after many years). I
might continue doing it, if I can keep it at a regular but not
overpowering level. There are some pretty neat ruby opensource projects,
for example [instiki](http://www.instiki.org) - a wiki with its own
webserver - maybe I’ll try contributing to some of those (I could use
[these wiki
ideas](http://joseph.randomnetworks.com/archives/2005/05/10/trying-out-dokuwiki-and-wiki-wishlist/)as
a starter).

Stian
