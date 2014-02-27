---
title: How to get Bokeen Cybook v3 ebook reader to display Chinese with Stanza
created_at: Sat, 31 Jan 2009 22:49:13 +0000
kind: article
tags:
  - books
  - china
  - E-book
  - languages
  - Mobipocket
  - OpenOffice.org
  - Rich Text Format
  - tech
  - TextEdit
---

![](http://blog-tribugourmande.com/dotclear2/public/Cybook-in-hand.jpg)I've
been interested in e-book readers for a long time, and a good friend
generously agreed to lend me his [Bokeen Cybook
v3](http://www.bookeen.com/overview/ebook-overview.aspx)reader for a
week or two to play with, since that is the only way you can really get
a feel for this technology - just looking at it for a few minutes is not
enough.

I will write a longer review later, but for now I wanted to post the
solution to a problem that immediately bugged me: How to get the reader
to display Chinese text? I had to experiment with a few different ways,
but finally I found that you have to generate a Mobipocket file. For
Mac, you can use the excellent [Stanza](http://www.lexcycle.com/) to do
this (I understand there are programs for Windows too, not sure about
Linux, but hopefully there are options).

A small bug, it seems, in Stanza is that if you copy text from for
example a webpage (many Chinese novels are available in full-text as one
long webpage), and choose "Create new from clipboard" in Stanza, the
linefeeds disappear. And for some reason, if I save the text in Textmate
or TextEdit as UTF8 text, or even RTF, it doesn't work, and the text
becomes all garbled. However, if I copy the text into OpenOffice, or
Word, and either save the file as .doc and open it in Stanza, or copy
again from this program to Stanza, it works - with the linefeeds and
paragraphs preserved.

So to summarize, copy from a webpage to OpenOffice, and then from
OpenOffice to Stanza. Generate MobiPocket file, and drag it over to the
ebook reader. Voilà, pure Chinese ebook goodness!

(This is using Stanza 1.0.0-beta16 - they might fix the loss of
linefeeds in a subsequent update. Also, I hope Bokeen comes out with a
new firmware update that enables you to read simple unicode txt or rtf
files directly).

Stian

[![Reblog this post [with
Zemanta]](http://img.zemanta.com/reblog_e.png?x-id=b61853d1-0f4c-4350-b564-06795476939b)](http://reblog.zemanta.com/zemified/b61853d1-0f4c-4350-b564-06795476939b/ "Zemified by Zemanta")
