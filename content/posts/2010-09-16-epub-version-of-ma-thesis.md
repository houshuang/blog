---
title: ePub version of MA thesis
created_at: Thu, 16 Sep 2010 00:26:46 +0000
kind: article
tags:
- MA thesis
- open access
- tech
---

I have been thinking a lot about what would be the ideal file format for
for example dissertations. The dissertations category is a nice example,
because the institutions have basically complete control - they can ask
you to do whatever they want, to graduate, and you will do it. For
example, my institutions require that on the first page of each chapter,
the page number should be at the bottom, centered. At each subsequent
page, it should be at the top, to the right. Not sure what user testing
and reading research went into determining that this is the optimal
placement of the page number, but if I want to graduate, I have to do
it.

Similarly I have to upload a copy of my thesis to the institutional
repository, if I want to graduate. This is a good thing. However, the
required file format is PDF. The double spaced PDF is a singularly poor
format. First, you can't resize the text. What if you want to read it on
your cellphone? What if you want to print it, without wasting hundreds
of pages? (I hate reading double spaced text, when it's not for
grading). What's the alternative though? The one reason I prefer PDFs
over Word DOCs on my system, is that I rarely have Word running, and
starting it is so slow, whereas reading a hundred page PDF in Preview is
a snap.

I think the ideal format would probably be some kind of a semantically
marked up text, which could then generate a bunch of different outputs.
However, I've never really taken to any of the different systems I've
seen, when it comes to ease of editing, or even of creating output. In
the end, I did all the writing in
[Scrivener](http://www.literatureandlatte.com/scrivener.html), and
tweaked the formatting in MS Word, until it was sufficient. I then
generated PDF, DOC and RTF files (and opened it in OpenOffice to
generate an ODT file) of both the canonical version, and a much
compressed two-column edition that takes less then half the pages, great
for printing.

I also wanted to create an ePub version for ebook readers. Since I got
my iPod Touch, I've been reading hundreds of books on it, through
Stanza, the Kindle app, etc. Somehow the small screen works great, when
I can quickly tap to page turn (with no delay). And I would love to see
people reading my thesis on their cell phones, on their iPhones, on
Kindle, on the Kobo, or anywhere else.

It isn't hard to generate an ePub, but it's almost impossible to
generate a perfect one. There's a bunch of different programs, and
websites, but almost all work by conversion. You upload (or open) a file
that is formatted according to certain standards, and the
program/website tries to convert this into an ePub using some fuzzy
logic. Often it works fairly well (sometimes it fails spectacularly),
but there are always little warts that can be very difficult to fix. The
ePub format itself is simply a ZIP file with a bunch of HTML files, and
some metadata. However, because of the way the file is structured, I
find it very cumbersome to manually edit files. Then there's the aspect
that different readers can display texts quite differently.

Either way, I have an ePub file that I am fairly happy with. I created
it by creating a very paired down minimalistic HTML version of my thesis
(with Word, and a lot of regexps to clean out the cruft), and then ran
this through [Calibre](http://calibre-ebook.com/). I've tested it on
Stanza, and iBooks (just drag the file and drop it over iTunes), and it
works great. There are two small issues - the first page is blank for
some reason, and whenever I use two levels of headings just below each
other, for example

Chapter 5

Introduction

Chapter 5 will be followed by a blank page, until you come to
Introduction. If somebody would like to help me fix this, I'd welcome
it, but all in all, I think it reads quite well. Although I find iBooks
a bit too gaudy with it's faux bookshelf, I must admit it's a bit fun to
see my thesis there, with my minimalistic cover - and the contents
actually look nicer than in Stanza (I just wish I could turn off, or
dramatically speed up, the page turning animation, the Stanza one is
perfection).

[MA thesis
ePub](http://reganmian.net/top-level-courses/top-level-courses.epub)

* * * * *

This blog post is about the MA Thesis "The Chinese National Top Level
Courses Project: Using Open Educational Resources to Promote Quality in
Undergraduate Teaching" by Stian Håklev, University of Toronto 2010.

-   [Download the canonical PDF
  version](http://reganmian.net/top-level-courses/Haklev_Stian_201009_MA_thesis.pdf)
-   [Central page collecting all blog posts, many different download
  formats, and supplementary
  material](http://reganmian.net/top-level-courses)

* * * * *
