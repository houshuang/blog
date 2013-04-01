---
title: Conceptually explicit representations for group learning and representational guidance
created_at: Thu, 26 May 2011 12:46:27 +0000
kind: article
tags:
- academia/research
- CSCL-intro
- Education
- open-education
- p2pU
- tech
---

I was very excited when I first came across Dan Suther's 2008 article
[[ref:suthers2008empirical|"Empirical studies of the value of
conceptually explicit notations in collaborative learning"]] in the book
"Knowledge Cartography: Software tools and mapping techniques" (a book
which is filled with other very interesting chapters as well). I had
been acquainted with Knowledge Forum for several years, and also seen a
few other graphical discourse environments, but never had any vocabulary
for describing them, or taxonomy for analyzing the design, and how it
could impact learning.

Suther's article lays out a whole theory of how graphical discourse
systems impact collaborative learning discourses, through the two
concepts of salience and constraints, and runs a number of experiments
with different systems to show the actual impact of the design changes.
This was very refreshing to me, after having read a lot of Knowledge
Building literature that mostly acted like the base design of Knowledge
Forum was sacred, and never referred to other graphical discourse tools,
or experimented with radical changes in the design to see how it
impacted the learning process.

For [week 5 of CSCL
intro](http://new.p2pu.org/en/groups/introduction-to-the-field-of-computer-supported-co/content/wk-5-design-of-collaborative-learning-environments-representational-guidance-suthers/),
I read both [[ref:suthers2008empirical|Suthers (2008)]], as well as an
earlier paper from 2001, [[ref:suthers2001towards|Towards a Systematic
Study of Representational Guidance for Collaborative Learning
Discourse]], where he laid out his research agenda for the next few
years, and touches on more of the theory behind his ideas. I've taken
quite detailed noted, as usual, so I won't spend this blog post trying
to explain all of his ideas, but rather to bring up some of my
questions, or ideas.

He cites a lot of interesting papers, and I plan to read many of them in
the future - in fact, it's just this kind of a situation that my wiki
was made for. If reading the paper and highlighting / adding notes is
first-order processing, and using the sidewiki to synthesis and write
organized notes/key ideas is second-order processing, then the
third-order is moving the ideas out of the individual article pages. I'd
like to have a page, for example, on "salience", which integrates the
knowledge from all the articles I've read (with links back to the
individual articles, of course).

[![](http://reganmian.net/blog/wp-content/uploads/2011/05/Screen-shot-2011-05-26-at-8.44.25-PM.png "Screen shot 2011-05-26 at 8.44.25 PM")](http://reganmian.net/blog/wp-content/uploads/2011/05/Screen-shot-2011-05-26-at-8.44.25-PM.png)

**Implementation**

Many of Suther's studies are laboratory studies, where two students sit
in a room with one or two computer screens for an hour or two. This is
an interesting design which allows him to test a number of different
"configurations" with a large number of students in a relatively pure
environment. However, a two-hour interaction is a poor substitute for a
two week class section, or even an entire 12 week course. Even if we
accept that certain forms of representational guidance help students
think more systematically and deeply about issues, how do we implement
them as part of a curriculum - what is the ideal balance between time
spent online, time spent face to face (if it is a hybrid class), other
instructional activities etc?

Suthers mentions two studies (Suthers, Toth & Weiner 1997; Toth et al
2002) which "developed comprehensive method for implementing
Belvedere-supported collaborative inquiry in classroom", and I look
forward to reading them. I also hope to find other studies that can shed
light on this issue.

**Granularities of collaboration**

I've previously discussed the idea of granularities of collaboration
([1](http://reganmian.net/blog/2011/04/26/cscl-intro-week-1-constructivism/),
[2](http://reganmian.net/blog/2011/05/19/contributions-to-a-theoretical-framework-for-cscl/)).
In most of the cases that Suthers' experiments with, the granularity of
collaboration is extremely low - there are two people who directly
interact, and immediately express their ideas, etc. In the asynchronous
cases, there might be a little bit more individual processing before
posting, but it is still likely to be minimal.

However, most courses are not conducted in dyads, what happens when
there area many more participants? Perhaps there are sub-groups (as
happens naturally when two or more students share computers and work on
an artefact, like is common with Knowledge Building)? Or there might go
days between each time people contribute, and they might do a
substantial amount of processing individually, either in their head
(what Suthers calls "cognitive operations" from Zhang (2007)), or even
externally, taking notes or drawing up a diagram, before posting
something to the central artefact ("perceptual operations").

Suthers writes that: "People construct representations together,
elements of the representation becomes imbued with meanings for the
participants by virtue of having been produced through the negotiation
mentioned above." This was what prompted my question above - I am
thinking of for example people who were unable to participate in an
Etherpad meeting, who look through the log and look at the finished
artefact. They can still access the same representation, but they don't
have the same shared memory.

I wonder if there are ways of overcoming this - Etherpad for example,
provides a "playback mode", so you can see how the artefact took form
(although right now, the chat is not replayed in sync, which would be
useful). Or you could even imagine someone doing a screencast with the
replay tool, providing a narrative voice-over of how the group arrived
at a certain point.

(These reflections were also prompted by the fact that I often find
diagrams, flowcharts or mind maps in academic articles or blogs very
difficult to understand, and often prefer narrative explanations.
Clearly, diagrams work very differently if you constructed them
yourself, or if you are looking at somebody else's finished product. )

[![](http://reganmian.net/blog/wp-content/uploads/2011/05/Screen-shot-2011-05-26-at-8.44.12-PM.png "Screen shot 2011-05-26 at 8.44.12 PM")](http://reganmian.net/blog/wp-content/uploads/2011/05/Screen-shot-2011-05-26-at-8.44.12-PM.png)

**Representational guidance literacy**

Suthers' (2008) concludes that:

System designers should treat representational design as design of
resources for conversation between learners.

> A designer or teacher might ask:
>
> -   What activities does a given representational notation suggest or
>     prompt for?
> -   Do the actions that can be performed on a shared representation in
>     this notation correspond to the potential ideas that we want
>     learners to negotiate and distinctions we want them to attend to?
> -   Do the resulting representations express and make salient the
>     ideas and relationships that learners should revisit and relate to
>     new information?
> -   Are the needs that should be addressed by subsequent activity,
>     such the lack of information, made obvious?
> -   Do the representations capture important aspects of learners’
>     thinking and expose conflicts between alternative solutions or
>     perspectives?
> -   Stepping beyond the scope of the studies reported here, one might
>     ask: does the notation provide the preferred vocabularies and
>     representational perspectives that constitute both the target
>     skill to be learned as an aspiring member of a community, and
>     focus learning activity on ways of approaching a problem that are
>     productive?

Does this mean that it would be useful to develop a range of different
tools, or even tools that were configurable by teachers, to suit
different instructional methods and subject areas? Let's say a tool that
you could easily configure to show node-links, with a chat that was
deictically indexed for one task, and for another task, you used
Knowledge Forum, for a third task a week later, you used an Excel
spreadsheet with theories and proofs on different columns – this would
be a very different approach from the "one-size-fits-all" of for example
Knowledge Forum.

[[ref:gan2010early|Gan (2010)]] suggests that the use of graphical
discourse toools, such as Knowledge Forum, can help students gain
"graphical literacy".

> Graphical literacy involves a range of visual thinking and
> communication skills (Jolliffe, 1991) and the ability to use graphic
> tools to construct, present, read, and interpret charts, maps, graphs,
> and other visual presentations (e.g., spreadsheets, timelines,
> cartoons, photographs) that supplement prose in textbooks, nonfiction
> trade-­‐books, and newspapers (Readence, Bean & Baldwin, 2004).
>
> Visual thinking is defined as processing information through images or
> graphics instead of words (Olson, 1992) and graphical representations
> help support and externalize visual thinking, aiding creative problem
> solving and intellectual development. Visual thinking is a fundamental
> and unique part of our perceptual system aiding in the construction of
> mental models that can lead to productive thinking and learning (West,
> 1997) and supporting verbal and symbolic forms of expression
> (McLoughlin & Krakowski, 2001).

I wonder if the use of a number of different graphical discourse systems
can make students meta-cognitively aware of the salience and constraints
of these different systems, and if so, what the effect would be on the
learning.

This could be furthered by students not only being exposed to these
different systems during teacher-initiated group work, but also using
various ways of externalizing and systematizing their knowledge
individually (mind mapping, etc). Ideally, this would be a skill that
students could bring with them throughout life.

**Visual salience and cognition**

I am fascinated by the distinction between "direct perception", which
requires automatic computation, but no executive control (such as the
color of a node), and other perception, such as whether a node is
connected to another node, which requires active visual search. It is a
fascinating perspective to use for analyzing different discourse
platforms, and also thinking about new ways of representing knowledge (I
dream about a room with gigantic touch screens, so that I can put all my
different ideas up there, drag them from one room to the next, etc –
there is something very powerful about "seeing everything" at the same
time).
