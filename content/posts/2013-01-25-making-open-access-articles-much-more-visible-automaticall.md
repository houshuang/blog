---
title: Making Open Access articles much more visible, automatically
created_at: 2013-01-25 00:00:00 -0500
kind: article
tags: academia/research, bibtex, FORCE11, metadata, open access, pdf, Researchr, semantic, tech, zotero
---

[![OA-padlock\_oaig-pic1 ](http://reganmian.net/blog/wp-content/uploads/2013/01/OA-padlock_oaig-pic11.jpg)](http://reganmian.net/blog/wp-content/uploads/2013/01/OA-padlock_oaig-pic11.jpg)In
April, [I wrote
about](http://reganmian.net/blog/2012/04/17/api-to-check-if-a-publication-is-open-access/ "API to check if a publication is “Open Access”")
my desire to make OA publications much more visible on [my academic
wiki](http://reganmian.net/wiki/), and whenever I cite them. The first
challenge was to capture the URL I downloaded the files from (ideally
automatically), and then check if it is "truly" OA, and not just
available to me because I am using the university network. (Yes, I'd
love for all articles to be formally OA, using a CC license etc, but for
now, I'm more than happy to see articles available for download to the
world!)

**Improving the API**

So I figured out a way to get the URL from the file metadata, and
created a simple API to check if the file was indeed a PDF, and
available to the world. I then store this information in the bibtex
metadata using the field oa-url and url (the url field is used by other
software, but there is no guarantee that it points to a PDF, or that
it's OA).

Since then, I've upgraded the API to become much more robust ([the new
code](https://github.com/houshuang/folders2web/blob/master/check-oa.rb)
is slightly longer, but performs much better). It uses curl instead of
the built-in functionality in Ruby, because curl seems better at
following redirects, etc. It first tries to grab the header to check if
it's the correct MIME type. If that fails, it tries to download the
whole file, and uses the *file* command to see if it's a PDF file.

I also [created a
script](https://github.com/houshuang/folders2web/blob/master/update_urls.rb)
that goes through every single already-downloaded file and checks this
from the local computer (make sure to execute this outside of a campus
network) - I'm running the API on my own server, so I'd preferred not to
be spammed with thousands of requests simultaneously.

**Showing it off**

Once I have this data, how do I represent it? Initially, all it did was
add a simple "Downloaded from" in the citation, but I always wanted to
"celebrate" the fact that a publication was publicly available. I
redesigned the citation header (also hiding some of the internal links
that aren't useful to web visitors). Here's how [an OA
publication](http://reganmian.net/wiki/ref:bergstrom2011encouraging)
looks when you are logged in (*BibDesk* opens the publication in
BibDesk, *Skim* opens the PDF in Skim, and *Sidewiki* opens the
[side-by-side
view)](http://reganmian.net/blog/2012/05/10/using-web-clipping-and-sidewiki-to-gather-and-synthesize-information/ "Using web clipping and sidewiki to gather and synthesize information"):

[![Screen Shot 2013-01-25 at
23.15.49](http://reganmian.net/blog/wp-content/uploads/2013/01/Screen-Shot-2013-01-25-at-23.15.49.png)](http://reganmian.net/wiki/ref:bergstrom2011encouraging)

and here is how it looks on the public web:

[![Screen Shot 2013-01-25 at
23.16.11](http://reganmian.net/blog/wp-content/uploads/2013/01/Screen-Shot-2013-01-25-at-23.16.11.png)](http://reganmian.net/wiki/ref:bergstrom2011encouraging)(

I have not inserted any tracking code, so I have no way of knowing how
many people actually click these buttons and download the PDFs, although
it would be interesting.)

Of course, it doesn't stop with the actual publication page. One of the
goals with Researchr is that you should be able to use a
publication's [citekey](http://reganmian.net/wiki/researchr:citekeys)
(like scardamalia1999research) anywhere on the wiki, on your blog, or
even in authoring a publication, and have the proper citation generated.
So if you go to the bibliography, you can immediately see which
publications are OA (and download them directly through the icon):

[![Screen Shot 2013-01-25 at
23.22.01](http://reganmian.net/blog/wp-content/uploads/2013/01/Screen-Shot-2013-01-25-at-23.22.01.png)](http://reganmian.net/wiki/bib:bibliography)

similarly
on an author page:

[![Screen Shot 2013-01-25 at
23.23.14](http://reganmian.net/blog/wp-content/uploads/2013/01/Screen-Shot-2013-01-25-at-23.23.14.png)](http://reganmian.net/wiki/a:simon_buckingham_shum)

And
anywhere on the wiki where you are citing an article, for example this
extract from my (very in-progress) [draft of a literature review on open
courses](http://reganmian.net/wiki/draft_literature_review_open_courses) ([blog
about the process of writing this literature
review](http://reganmian.net/blog/2012/06/13/tag-extract-a-tool-to-automatically-restructure-textoutline-using-tags/ "tag-extract: A tool to automatically restructure text/outline using tags")):

[![Screen Shot 2013-01-25 at
23.26.00](http://reganmian.net/blog/wp-content/uploads/2013/01/Screen-Shot-2013-01-25-at-23.26.00.png)](http://reganmian.net/wiki/draft_literature_review_open_courses)

As
with any citation, hovering over the link shows you the full citation:

[![hovering](http://reganmian.net/blog/wp-content/uploads/2013/01/hovering.png)](http://reganmian.net/blog/wp-content/uploads/2013/01/hovering.png)

and clicking
on the link brings you to my article page with the full citation,
download link, clippings, my high level notes, etc. (For example
[Couros, 2010](http://reganmian.net/wiki/ref:couros2010developing)).
Clicking on the PDF icon directly downloads the PDF to your computer.
And here is how the section above looks like in the edit view, as you
see all the citations are simply using the citekeys, and you get
everything else for free:

[![Screen Shot 2013-01-25 at
23.31.19](http://reganmian.net/blog/wp-content/uploads/2013/01/Screen-Shot-2013-01-25-at-23.31.191.png)](http://reganmian.net/wiki/draft_literature_review_open_courses?do=edit&rev=1350082780)

Note
that this is all dynamic, so if I in the future found an open version of
the Fini article mentioned above, and added this metadata to BibDesk,
this page would have a PDF icon next to Fini on the next reload (the
same with the Fini article page, etc).

This doesn't only work on the wiki; I also created a WordPress plugin
which enables me to use the same citekey syntax in my blog, and type for
example:

```
[@couros2010developing] is a very interesting article
about open teaching.
```

And it turns into:

```
[@couros2010developing] is a very interesting article about open
teaching.
```

**Future work**

It's very frustrating to see how little useful metadata and open APIs
are available. There doesn't seem to be a clear standard for embedding
microdata into websites with bibliographic metadata, and some of the
standards used. [Zotero](http://www.zotero.org), which is dependent on
publishers making metadata available, [talks
about](http://www.zotero.org/support/dev/exposing_metadata) RDF, COinS
and unAPI, none of which are easy for me to generate (if you have a Ruby
or Javascript library which can generate either of the above from
BibTex, let me know). I use a hidden tag to expose the BibTeX entry on
article pages:

![Screen Shot 2013-01-25 at
23.49.29](http://reganmian.net/blog/wp-content/uploads/2013/01/Screen-Shot-2013-01-25-at-23.49.29.png)
This
enables me to do things like automatically grab and import the citation
from another user's Researchr wiki into my own BibDesk (and if there is
a URL, try to download the PDF and attach it automatically), and if you
click on the page number after a PDF clipping, it automatically attempts
to download the PDF from the publishers (or repository), and opens it in
the PDF browser, on the page specified:

[![Screen Shot 2013-01-25 at
23.56.28](http://reganmian.net/blog/wp-content/uploads/2013/01/Screen-Shot-2013-01-25-at-23.56.28.png)](http://reganmian.net/blog/wp-content/uploads/2013/01/Screen-Shot-2013-01-25-at-23.56.28.png)

[![growl](http://reganmian.net/blog/wp-content/uploads/2013/01/growl.png)](http://reganmian.net/blog/wp-content/uploads/2013/01/growl.png)

[![skim2](http://reganmian.net/blog/wp-content/uploads/2013/01/skim2.png)](http://reganmian.net/blog/wp-content/uploads/2013/01/skim2.png)

(I made [a screencast](http://www.youtube.com/watch?v=O5LgG_K3y8A)
showing this off).

My point is that this should be much more universal - I wish that every
site published machine-readable metadata that let me automatically
import it to whatever citation manager I use, together with the PDF (if
the PDF is available). I wish the BibTex metadata would contain the URL
to download the PDF, and even information of whether a publication is OA
or not, what kind of license it has, etc.

But for now, I'm very happy with showcasing all the great OA articles
that are linked from my site. Check out [my
bibliography](http://reganmian.net/wiki/bib:bibliography) (or [other PhD
students with open
wikis](http://reganmian.net/wiki/individual_academic_wikis)), read my
summaries and ideas, and download the articles yourself! And if you are
publishing, make sure you make a version of your article publicly
available, so that you can get a
nice [![pdficon\_small](http://reganmian.net/blog/wp-content/uploads/2013/01/pdficon_small.png)](http://reganmian.net/blog/wp-content/uploads/2013/01/pdficon_small.png) next
to your name!