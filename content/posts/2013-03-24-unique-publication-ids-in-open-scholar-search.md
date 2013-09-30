---
title: Unique publication IDs in open scholar search
created_at: Sun, 24 Mar 2013 10:22:54 +0000
kind: article
tags:
- "#scholrev"
- academia/research
- FORCE11
- open access
- Researchr
- tech
---

At [Beyond the PDF 2](http://www.force11.org/beyondthepdf2), I gave a
Vision talk about ["An open alternative to Google
Scholar"](http://www.slideshare.net/houshuang/stian-haklev-vision), and
since then a group of us have begun discussing how we can make this
happen. There isn't yet a fixed place for this discussion to take place,
but we can use the broader hashtag #scholrev (see [Peter Murray-Rust's
blog
post](http://blogs.ch.cam.ac.uk/pmr/2013/03/20/btpdf2-scholrev-planning-the-scholarly-revolution/))
to coordinate.

**Researchr and "Scrobblr"**

Many of my thoughts on this topic came out of my work with
[Researchr](http://reganmian.net/wiki/researchr:start), and my wish to
have a system with an open API, which would let me integrate search,
metadata lookup, etc, with Researchr. I also wanted unique IDs for
publications to be able to link my notes about an article, with notes
somebody else took about the same article. Together with [Ryan
Muller](http://wiki.learnstream.org/wiki/), we began work on
"[Scrobblr](https://github.com/cicatriz/Rsrchr)",  a social hub for
reading. The idea was that it could work like Scrobbler for music, where
what you listen to is automatically submitted, and shared with your
friends. In the same way, the papers you read are automatically
submitted, and other people in your group can see what you are reading,
and automatically import your citations ([screencast
demo](http://www.youtube.com/watch?v=O5LgG_K3y8A)).

[![xkcd
standards](http://reganmian.net/blog/wp-content/uploads/2013/03/xkcd-standards1.png)](http://reganmian.net/blog/wp-content/uploads/2013/03/xkcd-standards1.png)

Although we never got there, we thought a lot about how this could be
expanded to a much larger social hub - sharing bibliography lists from
different Researchr users, auto-suggesting "you've been reading many of
these papers lately, you should get in touch with this other student,
who is reading a lot of similar stuff", automatic PDF hash-based lookups
([screencast demo](http://www.youtube.com/watch?v=X9FqaqgAlG8)), etc. I
began writing up design ideas in [a document that was never
finished](http://reganmian.net/wiki/ideas_for_scrobblr), but many of
these are relevant to the current ideas about an Open Scholar Search, so
I'll post some of them here.

**Unique IDs for publications**

[![qrcodeblog ](http://reganmian.net/blog/wp-content/uploads/2013/03/qrcodeblog.png)](http://reganmian.net/blog/wp-content/uploads/2013/03/qrcodeblog.png)There
are a lot of reasons why we'd want unique IDs for publications, making
citation lists unambiguous and easier to parse, enabling rich citations
in non-traditional media (wikis, blogs), etc. Right now [CrossRef
DOIs](http://www.crossref.org/index.html) is the closest we come, and
they already show how difficult it is to push for the usage of such
identifiers ([ORCID](http://orcid.org/) will have a similar challenge).
It would be great if it were possible to build on the work CrossRef has
done, and I've recently become aware of how much interesting innovations
the team is coming out with
([slides](http://www.slideshare.net/CrossRef/crossref-annual-meeting-2012-strategic-initiatives-update-geoff-bilder),
[blog](http://www.crossref.org/CrossTech/)).

However, there are a few barriers. The first is economic - as far as I
can see, it costs a minimum of \$330 for a publisher to participate.
This might not seem like much, but I know of very few independent OA
journals that have DOIs. (There might also be large technical
implementation costs, I don't know). However, worse than this is that
only the publisher can submit metadata. This means that we have to rely
on them to submit correct metadata (and although that's often the case,
it's not always). It also means that we will never get
metadata/identifiers for publishers who don't participate, who don't
even exist anymore, or for scholarly material that wasn't published as
journal articles (we might want to cite video films, archive items etc,
and have unique identifiers for them as well).

[![arxiv\_identifier](http://reganmian.net/blog/wp-content/uploads/2013/03/arxiv_identifier1.png)](http://reganmian.net/blog/wp-content/uploads/2013/03/arxiv_identifier1.png)

Below I discuss how the identifier might be formatted (from [Scrobblr
notes](http://reganmian.net/wiki/ideas_for_scrobblr)). This is also
related to who can assign an identifier, in the case of CrossRef DOI,
[identifiers are assigned by
publishers](http://help.crossref.org/#sample-doi-suffix-patterns), who
get their own "name spaces" (similar to ISBN, DNS or IP numbers). In the
case of ORCID, who [share the their deliberation about
identifiers](https://docs.google.com/document/d/1awd6PPguRAdZsC6CKpFSSSu1dulliT8E3kHwIJ3tD5o/edit),
numbers are assigned centrally, and are simply arbitrary numbers with a
specific formatting. This will probably end up being the case with
articles in open scholar search as well, but below I play with the idea
of using something more semantic - after all, it's a lot easier to give
a hat tip to @houshuang than
to [http://orcid.org/0000-0002-2632-8448](http://orcid.org/0000-0002-2632-8448),
even though both are equally unique. And it is a fascinating idea to be
able to write
[[@scardamalia2006knowledge]](http://localhost/wiki/Ref:Scardamalia2006knowledge) in
any blog or wiki, and have it work...

Unique IDs
==========

(*From "[Ideas for
Scrobblr](http://reganmian.net/wiki/ideas_for_scrobblr)":)*

Each publication should be assigned a unique ID (UID). This is inspired
by the integration of many different applications that is enabled by the
concept of a citekey in BibTeX. APIs should enable users to submit UID
and receive metadata for any publication (whether in JSON or BibTeX,
whether strictly citation info or also social info about tags, other
users, links etc). There should also be a number of ways to determine a
publication’s UID through various lookups.

**Format**
---

There are (roughly) two choices for the format of a UID. The first would
be a randomly generated (or sequential) ID with no semantic meaning,
whether with numbers or letters etc. The second would be the citekey
format which researchr currently uses. The advantage with this is that
it is familiar to users (of LaTeX / researchr etc), and immediately
conveys some minimal information about a citation. Through use, certain
frequent citations might even be recalled actively or passively.
Certainly, it is much easier to reorder three publications cited in a
blog post using citekeys ("I’ll put the scardamalia2006knowledge first,
and then mention johsnson2000corruption") than using random IDs ("See
for
example [3093049](http://reganmian.net/wiki/ref:3093049 "ref:3093049"), [304955](http://reganmian.net/wiki/ref:304955 "ref:304955") and 88585").

However, there are a few challenges with using the citekey format. The
first is generation and the second is collisions. Although the general
principle is well understood (last name of first author + year + first
word of title) there are a number of permutations, for example

-   I prefer manually changing van2006knowledge to
  vanderwende2006knowledge
-   what to do with punctuation, is it peter2006knowledge or
  peter2006knowledge-integration
-   it often makes sense to include the first word with more than n
  (=3?) letters, etc.

This results in citekeys generated by researchr or other tools (Google
Scholar) and Scrobblr to be different. Some of these we can just define
arbitrarily, but we might want some decent algorithm to solve the first
point above - perhaps joining the words of the last name without spaces.

[![Screen Shot 2013-03-24 at
11.19.48](http://reganmian.net/blog/wp-content/uploads/2013/03/Screen-Shot-2013-03-24-at-11.19.48.png)](http://reganmian.net/blog/wp-content/uploads/2013/03/Screen-Shot-2013-03-24-at-11.19.48.png)

Given that we can thus generate nice citekeys from submitted metadata
(much of which won’t even have a citekey, or have a citekey in a totally
different format), we encounter the problem that the citekey in the
database might differ from the citekey in the user’s local system. One
approach would be to use Researchr or other plugins to “harmonize” these
(i.e.. automatically modify citekeys on the user’s end) - this would
have to be done early in the import process, because everything locally
is tied to the citekey (PDF name, wiki pages). (Of course, in the future
Scrobblr will be the first place we go to download papers in our fields
anyway so theoretically we won’t even have this problem :)) Or we could
just accept that there will be a discrepancy here.

The second problem however will be collision. It is likely that there
will be cases of several papers generating the same citekey. Again we’ll
need a way of resolving this. A simple way would be to add “b” to the
year or something like that - not very elegant, since it will look kind
of “random” when viewing it outside of a context. Another approach could
have been to go back and give both articles a longer citekey to avoid
collision (perhaps the first two words of the title), however, given
that a citekey once assigned should be absolute, this is impossible.

Given that we can solve all of these things, the final concern is user
confusion about local citekeys and Scrobblr citekeys, given that they
look so similar. One way to mitigate this in practice would be to come
up with some notation for linking to citekeys which specified that they
were Scrobblr citekeys. Currently we are using [@citekey] for citations,
but this is purely random, it could easily be something else. It would
however be great if it was something both easy to type, easy on the
eyes, and still fairly unambiguous.
Since [citekey](http://reganmian.net/wiki/ref:citekey "ref:citekey") is
rarely used on the web today, it would for example be easy to write a
plugin that scanned a blog post for this notation and recognized
citations.
