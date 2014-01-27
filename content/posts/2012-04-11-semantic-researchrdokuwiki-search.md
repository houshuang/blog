---
title: "\"Semantic\" Researchr/DokuWiki search"
created_at: Wed, 11 Apr 2012 23:25:59 +0000
kind: article
tags: academia/research, open access, Researchr, tech
---

I really intended to focus on my literature review these few weeks, and
put [Researchr](http://reganmian.net/wiki/researchr:start) hacking
aside, but using it for many hours per day there are always little
niggling things you want to fix. And sometimes I get ideas that I just
"have to try out".

Researchr is built on [DokuWiki](http://www.dokuwiki.org/dokuwiki),
which has worked out incredibly well. It stores all the data in flat
text files (for example the page [[andragogy]] is stored in
/wiki/data/pages/andragogy.txt, and the contents is identical to the
wikimarkup you see when you edit a page). This means that I can easily
access and modify these text files from scripts, I can search and index
them using external tools, backing up is as easy as copying the entire
DokuWiki folder to another location, and I can easily keep two versions
in sync through rsync. (This is how I edit locally, and publish to my
server).

Within DokuWiki, I use a large number of
[[researchr:dokuwiki\_plugins|plugins]] to get the functionality I need.
One of the most crucial one is the [include
plugin](http://www.dokuwiki.org/plugin:include). This lets you include
another wiki page into the current wiki page. If you look at an article
page, like [@bouchard2001experiential], you see that it contains several
sections - it starts out with a citation, and some links (including a
hidden BibTeX field), then there are the high level notes, then the raw
clippings from Skim, and finally the pictures I've imported from Skim.

However, if you click on edit this page, after the top citation
information, all you see is this:

  {{page>notes:bouchard2001experiential}}

  h2. Links here
  {{backlinks>.}}

  {{page>clip:bouchard2001experiential}}

  {{page>kindle:bouchard2001experiential}}

  {{page>skimg:bouchard2001experiential}}

This is because the information is stored in a number of other files,
with the same file name, but in other namespaces. (A namespace in a wiki
is kind of like a directory). The fact that the clippings and the high
level notes are stored separately is what enables "side-by-side"
editing:

[![](http://reganmian.net/wiki/_media/pages:researchr_screenshots04.png)](http://localhost/wiki/researchr:screenshots)

It's also what makes it possible to go back and add more highlights to
the Skim file, and export that again to the wiki, without overwriting
high level notes, etc.

However, the one challenge with this approach is that DokuWiki doesn't
understand that I never really want to see the pages in the clip:
namespace alone, I always want to see them in the context of a full
publication (with the head page in the ref: namespace). So when I added
automatic [backlinks](http://dokuwiki.org/plugin:backlinks2) to articles
(which you see included above, using another plugin), they would display
as "Key ideas" (because that's usually the title I use for the notes:
section), and when I did a search, it would look like below:

![](http://reganmian.net/blog/wp-content/uploads/2012/04/Screen-Shot-2012-04-11-at-19.03.45.png "Screen Shot 2012-04-11 at 19.03.45")

I thought it would be fun to try to rewrite the search to take into
account what I know about the structure of the data. I am very poor at
php, and not familiar with the DokuWiki code base (I've written some
very simple plugins before to support Researchr, but never really
touched the main code base).

It took me quite a while, both figuring out the flow of the program, and
coming up with something which worked. I fixed the backlinks quite
quickly, and then had some fun re-imagining the search.

In addition to the namespaces that make out an article page, I also have
a few "semantic" namespaces, such as a: for
[authors](http://reganmian.net/wiki/a:start), and t: for
[tools](http://reganmian.net/wiki/t:start). I've also created namespaces
for conferences I've attended, like cscl11: for [CSCL
2011](http://reganmian.net/wiki/cscl11:start) (although I've been
thinking for a while that I should consolidate them under a conf:
namespace). I thought that it might be fun to let search be "aware" of
these distinctions.

Initially I thought I had come up with ["faceted
search"](http://en.wikipedia.org/wiki/Faceted_search), but looking at
the Wikipedia entry, I think I would have needed to give several
different ways of sorting the hits, rather than just one.

I removed the snippets, since they look ugly (wiki markup isn't
rendered) and it seemed to slow things down quite a bit. Either way,
opening a link highlights all the hits, and moves automatically to the
first hit.

I experimented with replacing hits on article pages (and clips, notes
etc) with the full citations, but found that far too ugly ([see
screenshot](http://reganmian.net/files/researchr_find_with_citations.png)),
so I ended up with just using the page names (which are the article
titles). I might experiment with this in the future.

Either way, I'm quite pleased with the result, even though the code is a
horror (I'm did the experimentation on my live wiki, so I need to clean
it up and move it to the DokuWiki fork in the [Researchr GitHub
repository](http://github.com/houshuang/folders2web), but I threw up a
quick [gist](https://gist.github.com/2362754)).

![](http://reganmian.net/blog/wp-content/uploads/2012/04/researchr-find-new1-469x1024.png "researchr-find-new")

Of course, the search is live now, so you can [try for
yourself](http://reganmian.net/wiki/?do=search&id=constructivis*&button=).

Stian
