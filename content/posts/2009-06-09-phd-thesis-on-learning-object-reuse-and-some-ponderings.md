---
title: PhD thesis on learning object reuse, and some ponderings
created_at: Tue, 09 Jun 2009 08:31:46 +0000
kind: article
tags:
  - open-education
---

I'm stuck at Dubai airport for 12 hours, coming from Beijing, and
transiting to Milan, where I will be attending [ElPub
2009](http://conferences.aepic.it/elpub2009/) (and later
[OAI6](http://indico.cern.ch/conferenceDisplay.py?confId=48321) in
Geneva). I could go downtown, but I'll be spending four days in Dubai on
the way back, so it didn't seem worth it. The airport isn't that
exciting, but it does have free wifi and occasional power-outlets, which
is a huge plus.

Via David Wiley's blog, I came across Sean Duncan's [just completed
dissertation](http://www.archive.org/details/PatternsOfLearningObjectReuseInTheConnexionsRepository)
on the (lack of) reuse of learning objects, where he did a study of
[Connexions](http://cnx.org). I grabbed the .doc from Archive.org, and
since I didn't have any good movies left on my laptop, I settled down to
read it in the airport.

**Digression about document formats** A little digression here about
document formats. For things that I am just going to be reading on
screen, I find it annoying to download large .doc or .odt files. I
seldom have Word of OO.org open, because I rarely use them (preferring
tools like [Scrivener](http://www.literatureandlatte.com/) for
authoring, and OO.org for the final polish). Just starting Word slows my
computer down, let alone opening a several-hundred page Word document.
In these cases, when I am not expected to be editing the document, I
much prefer PDFs. In fact, the first thing I did was to open the
document in Word, convert it to PDF, open it in my PDF reader, and close
Word. My PDF reader quickly opens many hundred page-PDF documents
without even hesitating.

On the other hand, PDFs are only good for one thing - seeing the
document on the screen (or printing it), exactly as it were. Which
excludes two important things: one is reformatting the document for
nicer vieweing (or use on other devices), and the other is reuse. For
example, I hate reading double-spaced documents (1.5 line spacing is
tolerable), but in a PDF, there is no simple way to change this (in
Word, it's extremely easy). I also remember borrowing my friend's
[CyBook](http://www.bookeen.com/) for a week, and got very frustrated
when trying to read the book [Opening up
education](http://mitpress.mit.edu/catalog/item/default.asp?ttype=2&tid=11309%20-%20)
on it, which was released as a Creative Commons book, but only in PDF.
Trying to display PDFs directly on the ebook is possible, but extremely
awkward. Trying to extract the text gives poor results, with mixing of
columns etc.

And of course, for reuse, the situation is even worse... What's the
point of applying a Creative Commons license that allows for reuse, if
the text is "trapped" in a PDF, especially with a multi-column layout?
And I realize that I do exactly this myself. I try to put many of my
papers, reports, etc. online, with an open license. However, I always
upload a PDF... So what's the alternative? .Doc and .odt? Both? I
thought the idea of embedding an ODT into a ["hybrid
PDF"](http://www.oooninja.com/2008/06/pdf-import-hybrid-odf-pdfs-extension-30.html)
sounded quite promising. Could we do the same, but embed an XML?
DocBook? Markdown?

**Back to the dissertation**So back to the actual contents. I have been
very interested in the question of reuse (or even use) for a long time,
since it often seemed like the open ed community was more focused on
production than anything else, and especially reuse seemed to be
something that most people wanted, but that was not very successful.
Thus, Sean's topic is extremely timely.

He starts out with a literature review, done in an interesting fashion.
He uses a quite explicit methodology for gathering data: *"In the
literature search for this study, the original search string [(SU
"learning objects" or KW "learning objects") and (TX reuse OR reusable
OR reusing OR "re using")], in the Academic Search Premier, Psychology
and Behavioral Sciences Collection, and PsychINFO databases, resulted in
43 records."*

He then drills further down, discarding non-peer reviewed papers and
other non-relevant papers, and ends up with reviewing 25 articles in
depth. I am curious about why he choose only these databases, and did
not expand his search wider. For example, I ran the search ["learning
objects" AND ("reuse" OR "reusable" OR
"reusing")](http://scholar.google.ca/scholar?hl=en&lr=&newwindow=1&q=%22learning+objects%22+AND+(%22reuse%22+OR+%22reusable%22+OR+%22reusing%22)&btnG=Search)
in Google Scholar, and it returned 9,280 hits. Granted, most of these
will likely not be usable, but it seems probably that it would turn out
more than 25 that were relevant to the topic in question.

Where I really get confused however, is in the actual methodology and
data collection part. He chooses to limit his study to Connexions, which
has the advantage that all its content uses a free license, the system
has built-in support for translation, modification and collaboration on
modules, and the usage data is openly available. Modules in Connexions
are basically articles, single text pieces, which can incorporate
graphics etc. Collections can contain many modules.

Sean defines the inclusion in a collection as use, in several
collections as reuse, and also talks about translation and modification.
He doesn't make a very strong case for why this would be valid, however.
The first question is how Connexions is actually used - is it used
mainly by self-learners, who wish to find useful material for their own
studying? Or who want to study an entire "collection"? Or is it used
more by educators, who "pre-package" content for their students, into
collections? Or are the collections made by some self-learners, who
package stuff they find neat for other possible future users?

I don't have the answer, but it seems like we would have to know a lot
more about how Connexions is being used, to see if this mapping of
statistical indicators to conceptual ideas "work"... Sean has not
referred to any of the literature on Connexions, although there are
several articles [out
there](http://scholar.google.ca/scholar?q=connexions%20open%20education&hl=en&lr=).
One weakness for example, is that he does not take into consideration
reuse of specific modules from outside of Connexions. A simple example
is
[this](http://www.scribd.com/doc/7089885/Lecture-1-Curriculum-Process),
where a university curriculum explicitly refers to a specific Connexions
module. The way I found this was through the Google search
[link:cnx.org/content
-site:cnx.org](http://www.google.ae/search?hl=ar&client=firefox-a&rls=org.mozilla%3Aen-US%3Aofficial&hs=r9b&q=link%3Acnx.org%2Fcontent+-site%3Acnx.org&btnG=%D8%A8%D8%AD%D8%AB!&meta=).

**How long should a PhD dissertation be?** One of the things that struck
me when opening the file, was how short the dissertation was. The PDF is
74 pages, and at first I thought that maybe it was single-spaced. But
no, it is double-spaced, and in fact, there are a lot of appendices, so
if we only count the text before the reference list, there's only 45
double-spaced pages in this PhD dissertation. Immediately that seemed
very little to me. It might sound very superficial to focus on such an
indicator, but it is striking, because it is so different... I recently
looked over some literature from the [Australian National
University](http://www.anu.edu), because my wife was thinking about
attending, and in [their
guidelines,](http://rsh.anu.edu.au/graduate/pdfs_grad/Style_Guide.pdf)
they specify that a PhD dissertation should be between 80,000-100,000
words. According to [Wolfram
Alpha](http://www26.wolframalpha.com/input/?i=100000%20words), that
gives about 400 double-spaced pages, ie. 10 times as much.

Part of the reason that I am point this out, is that I think that this
dissertation would have been much stronger if it had had a wider
literature review, and perhaps even a design that combined qualitative
and quantitative methods. It could first use exploratory qualitative
methods to understand what constitutes reuse in the context of
Connexions, and then use statistics to gauge the extent to which that is
actually happening. It would also be great to look at, or even test,
some different theories about why this might be the case or not. As it
stands, I feel like the conclusion is not strong enough - it's telling
us that there isn't that much reuse of learning objects within
Connexions, but we're not sure why.

All in all, it's an important topic, and it's great to see people
picking up the gauntlet. I also know myself how hard it can be to
venture into a research area that hasn't been much explored. I
congratulate Sean on his achievements and hope he takes my thoughts in
good spirit.

Stian
