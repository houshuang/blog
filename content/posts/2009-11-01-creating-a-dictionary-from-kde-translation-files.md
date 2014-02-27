---
title: Creating a "dictionary" from KDE translation files
created_at: Sun, 01 Nov 2009 23:27:44 +0000
kind: article
tags:
  - languages
  - open access
  - opensource
  - personal
  - tech
---

I've previously written about how I used interwiki links in Wikipedia to
extract dictionary information
([here](http://reganmian.net/blog/2009/02/16/release-early-release-often-english-chinese-dictionary-based-on-wikipedia/)
and
[here](http://reganmian.net/blog/2009/02/23/the-english-chinese-dictionary-revisited/)).
After talking with a friend, I got another idea for how I could extract
even more dictionary information - localization files. You might know
that open source projects like KDE are available in many different
languages, translated by (usually) volunteers. In order to make
translation easy, and enable volunteers who might not know anything
about programming to help out, the text strings to be translated are
extracted from the source code, and translated in separate files, often
using a library called [gettext](http://en.wikipedia.org/wiki/Gettext).

Given that there are these large databases of strings translated into
different languages out there, I wondered if I could use that as an
addition to a dictionary. I am pretty sure I am not the first to have
this idea, in fact, I seem to remember some website where you could
search translation strings, but I don't remember where I found that.
Anyway, I decided to give it a try.

First I had to find the files. I began by downloading some Debian
localization packages, but then remembered that in the finished product,
the files (with .mo extension) have been "compiled", so that the program
can access them more rapidly, and are not plain text anymore. There
might be tools that can extract the strings from the .mo files, but it's
much easier to go straight to the "source", and get the localization
projects from the SVN repository.

KDE has very nice and helpful pages for their translation teams, for
example [the page for simplified
Chinese](http://l10n.kde.org/team-infos.php?teamcode=zh_CN) tells me
clearly how I should go about to download this project, simply enter the
command:

  svn co svn://anonsvn.kde.org/home/kde/
  trunk/l10n-kde4/zh_CN/messages

and a bit over a thousand files will be downloaded, with names like
koffice/kivio.po. After some initial metadata, these files look like
this:

  #: rc.cpp:28
  msgctxt "Stencils"
  msgid "Assorted"
  msgstr "杂类"

  #: rc.cpp:29
  msgctxt "Stencils"
  msgid "Electric"
  msgstr "电子"

  #: rc.cpp:30
  msgctxt "Stencils"
  msgid "Network"
  msgstr "网络"

There is some metadata about where in the code this string comes from,
then the key string in English, which will be the same in all
translation projects, and then the translation into Chinese. If all we
wanted was an English-Chinese dictionary, it would be quite easy to run
some [regexp](http://wikipedia.org/wiki/Regexp)s to compile this data.
However, we would like to make a dictionary of for example Norwegian and
Chinese. The corresponding Norwegian file looks like this:

  #: rc.cpp:28
  msgctxt "Stencils"
  msgid "Assorted"
  msgstr "Diverse"

  #: rc.cpp:29
  msgctxt "Stencils"
  msgid "Electric"
  msgstr "Elektrisk"

  #: rc.cpp:30
  msgctxt "Stencils"
  msgid "Network"
  msgstr "Nettverk"

So I wrote a simple program that takes two paths, and opens every file
in those two paths, and you can download that script
[here](http://reganmian.net/files/extract.rb). If you download the
Chinese files into a directory called zh, and the Norwegian files into a
directory called no, you can run the program like this:

  ruby extract.rb no/messages zh/messages > nozh.data

and you get a file containing more than a 100,000 lines like this:

--- ---
Lydstyrke           音量
Tone inn/ut-kurve   曲线淡出
Tone til volum      淡出到音量
Tonetid             淡出时间
Start toning        开始淡出
--- ---

...which is what we were looking for. You can then easily grep this file
to find words you are looking for - many of which won't be in normal
dictionaries (especially not Chinese-Norwegian or Esperanto-Urdu or
whatever interesting combinations you cook up).

This script can be used for any language combinations, with one caveat.
Right now, it is hardcoded to only accept entries that contain at least
one Chinese character from the second file, because there is now point
to get an entry telling you that XML in Norwegian is XML in Chinese. I
do that by adding this:

  trans[0][0] =~ /[⾰-⾿]/

which is a regular expression that checks for the existence of Chinese
characters. You'd want to remove that, if you were not using it with
Chinese.

Stian PS: I realize that calling this a "dictionary" is perhaps not very
accurate, they are collocated sentences, not words. However, if the
target language is a language that you speak a bit of, you can very
often easily isolate the word you are looking for.
