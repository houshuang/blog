---
title: Git, Gitorious.org and Zip-doc (offline Wikipedia)
created_at: 2008-03-07 00:00:00 -0500
kind: article
tags: []
---

![](http://lh3.google.com/shaklev/R9HuVyFSuWI/AAAAAAAABWA/7QkI1IQbt_w/8c09949d_overview)When
I was dabbling in QBasic and Visual Basic a decade ago, I never thought
about using version control. Later, I learnt about CVS and SVN and
thought it was a neat way of enabling lot’s of people to collaborate
online. I used it so I could access cutting edge open source software,
but never thought about using it for my own little programs. Then, in
Indonesia and working on Ruby on Rails, I started reading up on it, and
found out that it would be a very useful thing. I got into SVN, and
found that it really changed the way I worked with code. Later I
realized that even for an individual programmer, distributed version
control has a lot of advantages (like when working on different
computers), and I tried out a bunch - git, darcs, bazaar, mercurial…

I never understood why Bazaar was so popular among the Ubuntu crowd,
because to me it seemed very slow and under-featured. Especially the
concept (which might have changed by now), that to branch I had to copy
the whole thing to a separate directory seemed incredibly inefficient.
What if I want to put a huge source tree with thousands of files, make a
branch and quickly change one of them to see what happens? With git,
that’s instantaneous. I also really appreciated the architecture and the
design philosophy. I first put two projects on
[repo.or.cz](http://repo.or.cz), which was decent. But today I just came
across [Gitorious](http://gitorious.org), which is really far more
advanced and user friendly. I love the nice interface, the beautiful
diffs, the syntax highlighting of source code, and the ease of which
other people can pull a branch to my repository without asking for
permission.

I’ve worked on a Ruby program to view entire Wikipedias offline on and
off for a year and a half (very off lately). It’s functional, but it’s
very hard to install, and thus it’s hard to spread it to others. This is
one of the weaknesses of Ruby I think, that it’s hard to make
“click+run” installable apps for people who aren’t programmers. Inspired
by the enthusiasm of a friend, I had another look at my Wikipedia
offline script (which is also so modular that it can be used to store
any kind of information where you need very fast random access to
millions of blobs of text, compressed with bzip2). I just put my
repository up on Gitorious, so if you want you can [check out zip-doc
there](http://gitorious.org/projects/zip-doc). If you want some data to
play with, I even uploaded a [Norwegian Wikipedia dump
file](http://reganmian.net/files/no.zdump) that has already been
processed. Plug and play (only for people who have Ruby and can use Ruby
gems etc). (If you do, make sure to use –transcode with mongrel-web.rb).

Stian
