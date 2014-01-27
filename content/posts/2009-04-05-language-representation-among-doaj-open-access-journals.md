---
title: Language representation among DOAJ Open Access journals
created_at: 2009-04-05 00:00:00 -0400
kind: article
tags: languages, open access
---

I am writing a paper about encouraging undergraduate students to conduct
research in their mother tongues / other non-English languages that they
know. One key element is of course availability -- University of Toronto
students are lucky to have access to a large repository of foreign
online journals, but this might not be the case everywhere, so Open
Access can play an important role. Curious about this, and frustrated
about the difficulty in finding good numbers about the size of the
"academosphere" in different languages (how many journals are published
in Spanish? In Farsi?), I decided to have a look at the [Directory of
Open Access Journals](http://www.doaj.org) data.

Unfortunately, they don't provide an option to search based on language,
but luckily they allow you to download their entire database of journal
metadata as a comma-separated file. They have one field for journal
language, but often there are several languages listed, so simply
sorting them and counting in OpenOffice.org is not good enough. I
whipped up [a quick Ruby script](http://ruby.nopaste.dk/p865), reusing a
few lines from my [previous
script](http://reganmian.net/blog/2009/02/23/the-english-chinese-dictionary-revisited/)
to count the most frequent search-words used with my [online
Chinese-English
dictionary](http://reganmian.net/blog/2009/02/16/release-early-release-often-english-chinese-dictionary-based-on-wikipedia/),
and got the following list:

--- ---
English      3309
Spanish      871
Portuguese   472
French       338
German       202
Italian      114
Turkish      60
Croatian     46
Russian      45
Catalan      45
Japanese     26
Polish       24
Chinese      19
Romanian     14
Norwegian    13
Swedish      13
Czech        13
Serbian      11
Persian      10
--- ---

In total there were 4010 journals listed, but note that journals that
have articles in several languages are double-counted, so a journal with
articles in French and English would be counted as one journal for
French, and one for English. (There are a total of 74 languages
represented, the full list is
[here](http://spreadsheets.google.com/pub?key=pNo-fF8ishiDei_QlgTmOfg)).

I am assuming (hoping) that there are more than 19 open access journals
in Chinese, for example, but on the other hand, there might not be a
strong incentive to be listed on an English-language only website, which
does not even allow for searching/sorting by language. The data would
have been better if we could have looked at the distribution at an
article level, because some of the journals which list several languages
are overwhelmingly published in only one of them -- however, only a
portion of the journals have article data, and the article metadata does
not contain a field for language (unlike journal metadata). I wonder if
it would be feasible to run the titles through a language recognition
library, but that has to be wait for another rainy day.

Stian
