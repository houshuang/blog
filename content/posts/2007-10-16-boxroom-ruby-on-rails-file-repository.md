---
title: "Boxroom - Ruby on Rails file repository "
created_at: Tue, 16 Oct 2007 22:05:00 +0000
kind: article
tags:
  - opensource
  - tech
---

![](http://reganmian.net/blog/files/dir-boxroom.png)While working for
[CARE Indonesia](http://www.careindonesia.or.id/) we were trying to
implement a web-based intranet file repository, that the different sub
offices could use to store their documents, to increase both archival
(backup, etc) but also cross-project and organizational learning. I
found the project [Boxroom](http://boxroom.rubyforge.org/), a Ruby on
Rails project that seemed to do pretty much what I wanted, and with a
very simple and intuitive layout. I still missed a few functions, but it
had a very clear code base, and so I spent part of my time at CARE
adding functionality and making it more appropriate to our organization.

![](http://reganmian.net/blog/files/search-boxroom.png)The product right
now has a lot of really neat features - it uses a number of UNIX tools
to extract the text from pdfs, rtfs, powerpoints, etc - and full-text
indexes all files, so that you can search with “snippet view”, you can
preview the pure text (instead of having to download a 5 MB pdf,
especially useful in countries with slow internet), upload zip files
that are then extracted, or select a number of files and have them
zipped before downloading, distribute permissions on a group basis, and
there is even a very thin “intranet news” front-end, which is mainly to
promote files, since it has a very neat way of linking directly to files
in the repository.

![](http://reganmian.net/blog/files/news-boxroom.png)The application is
almost 100%, but since my Ruby skills are not perfect, I do believe that
there are still some tiny bugs or instabilities in there - the only real
way to find out is to use it. However, because of other issues, we never
managed to implement it at CARE before I left, and since then I have
gone on to do other projects. I would very much like for these changes
to be incorporated into the original Boxroom, so that they could face
more “peer-review”, but unfortunately the original Boxroom is pretty
much unmaintained at the moment. So instead of letting the code linger
on my hard drive, I decided to at least release it to the public. The
code can be found at this [git
repository](http://repo.or.cz/w/boxroom-stian.git), and I even made a
[nice screen-cast](http://reganmian.net/blog/files/Boxroom-demo.htm)
showing every step from downloading it with git, configuring it (almost
no steps), and using the different functions.

I think this code has a lot of potential, and I would love for someone
to pick up where I left and adapt it to their needs (MIT style license).

Stian
