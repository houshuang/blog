---
title: Screencast of Wikipedia offline (zip-doc)
created_at: Fri, 11 Apr 2008 16:33:00 +0000
kind: article
tags:
  - []
---

I have mentioned my Wikipedia Offline project before
([here](http://reganmian.net/blog/2008/03/07/git-gitoriousorg-and-zip-doc-offline-wikipedia/)
and
[here](http://reganmian.net/blog/2008/03/10/distributing-ruby-applications-ruby-temporary-insanity/)),
not to mention it its previous, very different,
[incarnation](http://reganmian.net/blog/2007/02/16/wikipedia-offline-server-02/).
The project is 95% functional, but is still waiting for assistance for
someone who is better at Ruby or Python than me. Today I wrote up a
number of bullet points, and posted a brief screencast, to share with
people that might help out - I thought I’d post it here as well. The
[screencast (1 minute)](http://reganmian.net/files/zipdoc.swf) is here,
and the [source is available](http://gitorious.org/projects/zip-doc). I
still think it would be too bad to just let all this code go to waste,
when it’s so close to being finished.*Note: I write this with full
respect for the other people working on, and having already produced
versions of Wikipedia offline.*

**Needs analysis:**

-   Having a complete dump of current articles (and possibly userspace
  articles) in Wikipedia is extremely useful, both for the many people
  in the world with no regular access to internet, but also for people
  who are sometimes disconnected (on planes, trains etc). I find
  myself needing this often.
-   This is not something we need to wait for - Wikipedia is not
  perfect, but if it is good enough to be used every day by millions
  of people, it is good enough to be made available offline - as is
-   We don’t need to create a special GUI or application to browse
  Wikipedia, many people are comfortable using a web browser, and
  should have the choice to use the one they prefer.
-   Generating the offline Wikipedia based on the static dumps is vastly
  easier than trying to create a parser that replicates the Wikipedia
  parser, and account for for example templates (that would probably
  have to be pre-rendered for speed). The backside: A [static
  Wikipedia dump](http://static.wikipedia.org) of all the projects has
  not been completed since April 2007.
-   A system should make it easy to generate dumps (and access dumps)
  for all languages, a solution that makes creating each new version
  labor intensive will be detrimental to smaller languages - which
  often need it the most.

**Current solution that I have:**

-   A zdumpfile must be created by extracting the 7zip dump file, and
  running a script over it.
-   The resulting file is compressed with bzip2, only slightly bigger
  than the original file, but indexed and random-access enabled. Uses
  a very simple file format which is documented. (Binary index + bzip2
  blobs).
-   To use, you start a small server (currently commandline) and give it
  a dumpfile. You can then surf Wikipedia just as normal, on
  localhost:2042. The first time it takes half a second to cache CSS
  files etc, after that it’s instantaneous. [See
  screencast](http://reganmian.net/files/zipdoc.swf).[](http://reganmian.net/files/zipdoc.swf)
-   Since it runs on localhost, it could just as easily serve a whole
  classroom or library from one computer on localnet.
-   Code is all Ruby, very simple, well documented, 600 lines of code.
  (Modular, most of the code could be used to store any other large
  collection of documents compressed and random-accessable)

**How it fits in with other projects:**

-   All the other projects out there that I have seen a) only work with
  a commercial reader, or needs a proprietary script to pack dump
  files, so that people are not able do to their own dumps of for
  example Javanese wiki.
-   Very lightweight, easy to jump in and help coding, doesn’t rely on a
  browser GUI. (Eventually there should be a tiny box coming up when
  you click an icon saying “Wikipedia browser running, click here to
  stop it”)
-   Provides the entire Wikipedia, not a selection of articles. This is
  the real utility of Wikipedia - being able to find out how many
  films an obscure Bollywood star made when you are with your friends
  and don’t have internet. Or the genetic makeup of a beetle. Can also
  provide userspace, discussion etc pages - these can also be ignored
  during the compression by regexp, often reducing space by 40%
-   Intelligent redirect handling (often up to 30% of all pages)
-   Ruby = extremly cross-platform

**Status:**

-   Works. Have tried it with German Wikipedia (second biggest) and page
  views are still instantaneous.
-   A bit difficult to install - needs Ruby, a few gems, and a bzip2 C
  extension. Need to make a distributable package, with a tiny GUI,
  ideally with no installation (run straight from CD/DVD)
-   If this cannot be done in Ruby, Python is a good alternative. The
  server script itself is only 100 lines of code.
-   I am not good enough at programming to take this further (I spent
  incredible amounts of time getting where it is today), but I would
  be very happy if someone chose to spend a bit of time on the
  programming (we are probably talking a few hours, for someone who
  knows Ruby/Python well), and would support it how I could,
  explaining all the code etc.
-   Code is available from
  [http://gitorious.org/projects/zip-doc](http://gitorious.org/projects/zip-doc)

Stian
