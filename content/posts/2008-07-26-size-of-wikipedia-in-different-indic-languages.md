---
title: Size of Wikipedia in different Indic languages
created_at: Sat, 26 Jul 2008 14:45:00 +0000
kind: article
tags:
- India
---

![ wikipedia-logo](http://bachodi.files.wordpress.com/2007/07/wikipedia.jpg)Preparing
for a talk I am hoping to give in Delhi, I decided to look up the sizes
of the Wikipedias in the different Indic languages. There are several
ways of assessing the size of a language Wikipedia, none perfect. The
most common one is to look at the number of articles, and although this
gives a benchmark figure, it can be very misleading. This is especially
because of robots that run around creating thousands of new almost empty
articles, for example of cities in the US with only census data. There
is nothing wrong with this per se, but it can completely distort
statistics, and it’s also damaging when people single-mindedly focus on
reaching some goal in terms of number of articles, without focusing on
making them longer, and of higher quality.

Because of my long ([although not very
successful](http://reganmian.net/blog/2008/04/11/screencast-of-wikipedia-offline-zip-doc/))
involvement with creating solutions for viewing Wikipedia offline, I
have spent a lot of time looking at the packages that Wikipedia compiles
for download. For the first time in over a year, they successfully
completed a full dump of all languages, [available
here](http://static.wikipedia.org/downloads/2008-06). These packages
have one HTML file representing each article (as well as user pages,
discussions, images etc), in an extremely (typically at least 10x)
compressed form. Looking at this size in itself is unlikely to tell us
anything useful (except for whether it can fit on for example a DVD),
but comparing it either to previous dumps, or to other language
Wikipedias, can give a good measure of relative size.

One problem is that they have made a slight change in the packaging
procedure - whereas earlier all the files where simply packaged with
7Zip, currently they are first tarred and then the tar file is packaged
with 7Zip. I have not done any experiments to see if this has any impact
on package size - the reason for the change was to speed up making the
dumps, but because of this, historical comparisons are not easily
conducted.

However, for an upcoming (possible) talk in Delhi, I decided to look at
the relative size of different Indic language Wikipedias. I remember
being shocked, when starting to study Hindi, that the page about Norway
in the Hindi Wikipedia was only two sentences long! (Sadly, about a year
later, this is still the case. Hopefully my Hindi will soon be good
enough to be able to add content). Certainly a lot of Indians, both in
India and abroad, contribute to Wikipedia, but they choose to contribute
to the English language version.

So below are all the languages spoken in India (I might have missed
some, but I don’t think so), and the size in megabytes, of their
compressed dump files. I also checked how their page about Norway looked
in each language (facilitated by my [redirect
script](http://reganmian.net/blog/2007/11/13/tools-and-hacks-wikipedia-redirect/)).
Certainly the absence or presence of a good article about Norway is not
a great measure of a good encyclopaedia, but most up-and-coming language
versions try to get certain basic articles in place as early as
possible, and these certainly include articles about all the countries
in the world.

Kannada and Urdu was the only two that contained decent sized articles
about Norway. Kannada is near the top in size, so this is not
surprising, but Urdu is interesting. Can it be connected to the fact
that Pakistanis are the biggest group of non-Western immigrants in
Norway? This has not affected Norway’s treatment in the Panjabi version
(most Pakistanis in Norway are from the Punjab region), perhaps because
the Panjabi version is written in Gurmukhi, a script similar to
Devanagari and used in India, and not in Shahmukhi, similar to the Urdu
script?

That Telugu is the largest is not so surprising, given that a library
researcher at the Banaras Hindu University told me that Telugu currently
produces the most literature in India. However, their wiki had no page
on Norway at all (most of the others have at least a place-holder page),
and even when searching for broad topics like “Philosophy”, I found
nothing. Perhaps they have written very good articles about a subset of
topics?

It’s also curious that Bishnupriya Manipura, a language spoken in
Manipur that I had not even heard of before, comes so high up - higher
than Hindi. Perhaps there is some technical reason, or perhaps they are
just a small community that are actively contributing articles.
Certainly there are not many millions of Esperanto speakers in the
world, but because of a small and very dedicated community, they manage
to produce an encyclopaedia of an impressive size.

Here is the list, with a few other languages included for comparison.

**Size in MB of compressed files of language Wikipedias, as of June
2008**

|Language|Size in MB|
|:--------|-----------------------------:|
|English| 14,000|
|German| 3,200|
|Chinese| 626|
|Norwegian| 361|
|Esperanto| 185|
|Telugu| 52|
|Kannada| 46|
|Bangla| 34|
|Tamil| 34|
|Bishnupriya Manipura 30|
|Hindi| 30|
|Malayalam| 29|
|Marathi| 23|
|Nepali| 21|
|Urdu| 16|
|Kannada| 10|
|Sanskrit| 3.2|
|Gujarati| 3.1|
|Sindhi| 2.6|
|Bhojpuri| 2|
|Tibetan| 1.9|
|Panjabi| 1.7|
|Kashmiri| 1.3|
|Oriya| 1.3|

Hopefully, if I repeat this exercise in a year, I will be able to see a
lot of progress… I have plans to promote editing Wikipedia in your own
language for students at University of Toronto - who are from all over
the world, and have access to very good infrastructure. And promoting
the idea of professors including Wikipedia in their assignments. The
[Spanish literature
project](http://en.wikipedia.org/wiki/User:Jbmurray/Madness) is an
example of articles one can only (so far) dream of seeing in Hindi and
other Indic languages.
