---
title: API to check if a publication is "Open Access"
created_at: Tue, 17 Apr 2012 17:52:01 +0000
kind: article
tags:
- academia/research
- open access
- tech
---

**Two perspectives on Open Access promotion**

There are two different ways of promoting Open Access publishing to
academic authors, and also two different perspectives from which to
conduct research. The first is to say that the current system is
wonderful, but many people are locked out – academics at smaller
institutions, teachers and school administrations, the public, etc. Our
goal in this case would be to give everyone in the world access to
download PDFs from Elsevier and Springer, and the research would largely
be policy-related.

Another perspective would be to ask: What new ways of interacting with
publications can be enabled by Open Access, which are impossible with
Toll Access journals, even those for which you have paid subscription
fees. I believe this is in some ways a more compelling story for many
authors, because the first argument is largely based on charity – they
might think that they themselves, and all their friends at elite
universities, all have access. However, the second approach is to show
how Open Access can make your research work easier and faster, even when
you are at an elite institution.

Of course, the extent to which innovative new workflows and analyses can
be implemented also depend on the "degree" of openess, given that the
term Open Access covers a wide array of cases. The minimal (but also the
most common) case is to expect the ability to download a PDF without
logging in, or paying money. The ideal case would be a Creative
Commons-licensed article, preferably in a semantic open text-based
format (not PDF), with machine-readable metadata, linked datasets,
[semantic
citations](http://opencitations.wordpress.com/2010/10/14/introducing-the-semantic-publishing-and-referencing-spar-ontologies/),
etc.

I have spent a lot of time pushing for policy change around OA, and I am
in awe of what we have already accomplished, and I also know we have a
lot left to do. However, I feel that the OA community has not
sufficiently addressed this other technical part, and I believe
increasing the use-value of OA journals can do a lot to convince
academics to become more active with self-archiving etc.

**Researchr**

I mentioned a number of dimensions of openness above, but even with just
the PDF file available, there are things we can do. When I see a
citation in a journal article, on a social citation sharing website, or
on somebody's blog or wiki, which I find interesting, what is the first
thing I want to do? Import the citation **and** the PDF into my citation
manager.

If you are really lucky, the location that posted the citation also
offers machine-readable metadata, such as BibTeX. However, there is very
seldom any distinction made between OA and non-OA publications – in both
cases, the PDFs are not hosted on the site, because of copyright issues
(which is correct in most cases, since a very small percentage of OA
articles are openly licensed). Sadly, it is very rare that the metadata
contains a link to download the PDF, even though theoretically, that
would actually be the *most important* part of the metadata. (After all,
the reason we create such standardized formatting schemes is to make it
easy for other people to locate the article we cited).

And the few times the URL field in a BibTeX entry is filled in, it goes
to an abstract page, from which we can download the PDF. The same is
true for DOI, which always resolves to an HTML abstract page, and almost
never to the actual publication – even when the publication is OA, and
can be downloaded without login, etc.

Initially, Researchr was no distinction. I simply captured the BibTeX
offered by Google Scholar, or other sites. Of course, I
always endeavored to find the PDF and download for my own purposes, but
I was not able to share these online, because of copyright. Thus, an
article page on my wiki for an OA article, would look identical to that
of a TA article, and users would have to copy the title into Google
Scholar to locate the PDF.

![](http://reganmian.net/blog/wp-content/uploads/2012/04/Screen-Shot-2012-04-17-at-09.53.35.png "Screen Shot 2012-04-17 at 09.53.35")

I really wanted to change this, and thought about ways of automatically
capturing the download URL when importing PDFs. It turns out there is a
very elegant solution – OSX Finder stores the download URL as part of a
file's metadata, even when using Chrome.

We can easily access this information through the command line

  mdls -name kMDItemWhereFroms FILENAME

Thus I could easily add this URL to the citation's metadata, tag it as
Open Access, display this in various ways in the wiki, etc.

However, was the file really Open Access? If I am sitting at the
University of Toronto, I can download PDFs from all the big publishers,
because they have "whitelisted" the IP ranges belonging to the
University of Toronto. However, these PDFs are not available outside of
the university. How to distinguish?

I wrote [a tiny little
API](https://github.com/houshuang/folders2web/blob/master/check-oa.rb),
which I uploaded to my public server, which sits outside of University
of Toronto, and does not have any special privileges. It accepts a URL
as an argument, and attempts to download the header of that URL (ie.
even though the PDF might be 5MB, it will only download a few hundred
bytes). It checks whether the URL accepts at all, and whether it is of
the kind "PDF" (ie. it's not an HTML abstract page).

If successful, it simply returns "true", and the URL is added to the
file's metadata.

![](http://reganmian.net/blog/wp-content/uploads/2012/04/Screen-Shot-2012-04-17-at-10.18.22.png "Screen Shot 2012-04-17 at 10.18.22")

So far, I have not done anything specific to display this fact, although
the citation template automatically displays the contents of the URL
field in the citation.

![](http://reganmian.net/blog/wp-content/uploads/2012/04/Screen-Shot-2012-04-17-at-10.36.02.png "Screen Shot 2012-04-17 at 10.36.02")

Eventually, I want to make a big nice (green?) icon next to this
metadata field saying "PDF Download" or something similar. However,
since the URL field is also present in the hidden machine-readable
metadata field below, we are able to do some fun stuff.

![](http://reganmian.net/blog/wp-content/uploads/2012/04/Screen-Shot-2012-04-17-at-10.40.12.png "Screen Shot 2012-04-17 at 10.40.12")

I traditionally used Ctrl+Alt+Cmd+B as a shortcut to grab a citation
from Google Scholar. I
[enhanced](https://github.com/houshuang/folders2web/blob/master/bibdesk.rb#L100-124)
this script to also look for the hidden BibTeX on a Researchr wiki page.
If it finds it, it imports it into BibDesk. If it also finds a URL
field, it attempts to automatically download the PDF, and autolink it to
the citation in BibDesk.

I further had some fun with the page numbers from the raw clippings – if
you press a page number on somebody else's wiki, and the metadata has
the URL field, it will attempt to download the PDF, and open it on the
correct page! See the 3 minute demo below (which also includes our new
experimental social Researchr server):

I think this is a pretty neat example of what is possible with OA
publications. Currently, this functionality only exists in Researchr,
but all the data is open and standardized (BibTeX), so other citation
managers could build this in as well – and ideally, more metadata will
come with the URL field filled in. In fact, maybe we need a new field,
something like OA-URL, to denote both that the publication is OA, and
that this is a URL that goes directly to a download, rather than to an
HTML abstract. (In fact, embedding the publication license in the BibTeX
metadata wouldn't be dumb either).

Stian
