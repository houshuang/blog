---
title: Distributing Ruby applications, Ruby temporary insanity
created_at: 2008-03-10 00:00:00 -0400
kind: article
tags: personal, tech
---

[![](http://farm1.static.flickr.com/108/314184695_ea6a1b6284_m.jpg)](http://www.flickr.com/photos/60648084@N00/314184695/)I
have had a weird on and off relationship with Ruby for the last few
years, since I learnt it one very long night in Hangzhou a few years
ago. I played with it on and off during the first year in Toronto, doing
tutorials and thinking about neat apps, but never really coming up with
any apps that I wanted to create. Then, in the summer I ended up
spending about a month writing a series of scripts to move about 800
HTML pages and pictures etc from EZPublish to DokuWiki for
[HealthWrights](http://www.healthwrights.org/) while working for them in
Mexico (it obviously took so long because I was learning as I went
along, and also because the EZPublish output is really messy).

Not much Ruby during the year after that, although sometimes I’d get a
kick and sit up all night trying to figure stuff out. And then I’d
forget about it. Then in Indonesia working for
[CARE](http://careindonesia.or.id), we ended up choosing to implement a
intranet file library in Ruby on Rails, which I spent several months
working on to extend its capabilities quite significantly. This meant
that I learnt Ruby on Rails, and also version control, first svn and
then git, and generally got much deeper into the Ruby way. The sad thing
was that the original programmer had left development and so there was
no one to discuss it with.

Another thing that I spent a lot of time on during my stay in Indonesia
was coming up with a system for viewing Wikipedia offline (the entire
database of articles of any given language). I have spent incredible
amounts of time on this (because I am a lousy programmer) and gone down
so many paths that ended up being useless… I might write more about my
“journey” later. Either way, towards April I actually had [a Ruby
application that more or less worked quite
well](http://gitorious.org/projects/zip-doc) and according to
specifications. However, I ran into two major limitations of Ruby, and
where I sadly believe that Ruby lags far behind Python.

[![](http://farm1.static.flickr.com/55/145786038_84d21cc680_m.jpg)](http://www.flickr.com/photos/22339026@N00/145786038/)I
wanted to distribute the program in an easy to install file, or even
better, in a CDROM with the database, which could be run directly from
the CDROM without even installing, of course Mac/Linux/Windows friendly.
However, this requires two thing: A (very minimal) graphical interface,
and a way of installing/bundling all the files necessary. There are
bindings for lot’s of graphical interfaces for Ruby, but it’s still very
immature, there are few frameworks that work well across all three
platforms, and the lack of actual applications written using these
frameworks means that it is very hard to find example code. This isn’t a
show stopper for this particular app which only needs an incredibly
rudimentary GUI (pretty much a box saying “Web server is running, press
here to stop it”), but it’s too bad. I have high hopes for the Qt
integration, eventually…

More significantly, there is still not a single good way of distributing
Ruby apps in a binary fashion. Ruby itself hasn’t even considered the
problem, and the only half-solutions that exist are hacks which get no
support from the Ruby core. Most Rubyists either use it to scratch their
own itches (this is usually what I use it for nowadays also, quick five
liners to do something to a file once), to write libraries that they
distribute to other programmers, or to write servers or Ruby on Rails
apps. My script works great on any platform, but first you must install
all of Ruby, plus Rubygems, then install Trollops (I could distribute
this myself, since it’s a Ruby script), and then download the [BZip2 C
extension](raa.ruby-lang.org/project/bz2/) (which isn’t even a Gem), and
compile it for whatever architecture you are on.

There are tools such as
[Rubyscript2exe](http://www.erikveen.dds.nl/rubyscript2exe/) (for all
three platforms), [Platypus](http://www.sveinbjorn.org/platypus) (for
Mac - not restricted to Ruby) and
[Exerb](http://exerb.sourceforge.jp/index.en.html) for Windows, however
I’ve had mix success with two of them (not tried Exerb). Because my
script relies on a bunch of different files, as well as the includes,
and especially the C library. The C library is the biggest problem - but
I refuse to go back to ZLib, which is at least 30% as efficient. I think
it’s very sad that it is so hard to make desktop applications with Ruby
and distribute them - this is a position that Python has excelled in,
with for example [Miro](http://www.getmiro.com/) as a flagship
application. There are incredibly smart minds in the Ruby movement, and
I am sure that if [\_why the lucky stiff](http://whytheluckystiff.net/)
put his mind to it, he could couple together a platform in an hour - but
nobody seems to have taken it seriously so far.

Recently a friend of mine showed interest, and I started thinking about
the application again. I thought that perhaps one of the new
implementations, [Rubinius](http://rubini.us/) or
[JRuby](http://jruby.codehaus.org/) would be able to help. Rubinius
didn’t want to run it at all, but JRuby intitially seemed promising.
They cannot use the C extension, however there is a [Java implemention
of BZip2 from
Apache](http://commons.apache.org/sandbox/compress/apidocs/org/apache/commons/compress/bzip2/package-summary.html),
and using this would give the added benefit of being completely in Java.
I then imagined that it would be easy to package it up and distribute as
a Java app - perhaps using
[Swing](http://en.wikipedia.org/wiki/Swing_(Java)) or something similar
for the limited GUI.

However, I ran into problems again. First of all, I am completely lost
at Java, and trying to figure out how in the world to interact with the
BZip2 Java library was a complete mess, with all kinds of InputStreams
and OutputStreams and I don’t know what. To compare, after having
required the bzip2 library, this is literally the only line needed to
uncompress a bzip2 compressed chunk stored in the variable txt:
BZ2::Reader.new(txt).read. Whenever I duck into C or Java because of
something I have to do (and usually fail to do) I run away screaming at
the incredible complexity of doing the simplest things.

In addition to this (I really hope they implement a Ruby bridge to
BZip2, just as they have to GZip, this would be incredibly useful!), the
project is still not complete, and especially it seems like their
File::Find module does not support unicode, which obviously won’t work
for Wikipedia pages. So I am back at square one again. After another
seven hours spent trying to fix it.

[![](http://farm1.static.flickr.com/117/296445681_fc79cc2590_m.jpg)](http://www.flickr.com/photos/76261353@N00/296445681/)Of
course, if anyone else in the whole world thought the idea of a complete
version of the entire database of Wikipedia accessible on a CDROM/DVD
was kind of useful, someone who actually knows programming could
probably help me with this in an hour. I would have no problem with
having the reader implemented in Python if that made it easier to
distribute it - it’s only perhaps 100 LOC, and the method of accessing
the binary files is very clearly explained in my README files. But
somehow either people are not at all excited about an offline Wikipedia,
which I find very strange, or they design huge projects, reimplement the
browser and make fancy webpages, but never actually produce anything.

Oh well. That was my little Ruby craziness. Hopefully I won’t have
another for a few months. ([Ruby app on
Gitorious](http://gitorious.org/projects/zip-doc) if anyone wants to
hack.)

Stian\
 [![Creative Commons
License](http://reganmian.net/blog/wp-content/plugins/photo_dropper/images/cc.png)](http://www.photodropper.com/creative-commons/ "creative commons")
[photo](http://www.photodropper.com/photos/) credits:
[bayat](http://www.flickr.com/photos/76261353@N00/296445681/ "bayat"),
[Lawrence
Whittemore](http://www.flickr.com/photos/22339026@N00/145786038/ "Lawrence Whittemore")and[](http://www.flickr.com/photos/22339026@N00/145786038/ "Lawrence Whittemore")[](http://www.flickr.com/photos/22339026@N00/145786038/ "Lawrence Whittemore")[Don
Solo](http://www.flickr.com/photos/60648084@N00/314184695/ "Don Solo")
