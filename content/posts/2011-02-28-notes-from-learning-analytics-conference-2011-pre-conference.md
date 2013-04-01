---
title: "Notes from Learning Analytics Conference 2011: Pre-conference"
created_at: Mon, 28 Feb 2011 00:53:54 +0000
kind: article
tags:
- academia/research
- Education
- lak11
- open-education
- p2pU
- plenk2010
---

This week, I am participating in the first [Learning Analytics
conference](https://tekri.athabascau.ca/analytics/) in Banff, Alberta.
I'm interested in this topic both for my PhD research, and it's also
something that P2PU has been very interested in pursuing. I started
taking notes in Etherpad, and invited others to join me - most of the
notes below were taken by me, but a number of others also contributed
(thanks to all of you)!. These notes are very raw, but you might find
some of it useful. I've also focused more on the things that are
interesting to me, rather than trying to provide a comprehensive
overview. I will keep taking notes for the next two days of the
conference (as long as I keep having good access to a power bar, my
aging MacBook has a battery life of about 1,5 hours by now).

If you want to follow the conference, there is a fair amount of tweeting
at [\#lak11](http://search.twitter.com/search?q=%23lak11), and the
conference is [streamed at
UStream](http://www.ustream.tv/channel/learning-analytics-conference).

Notes below the fold.

**George Siemens**

The intelligent curriculum – personalizing experience for individual
students – adaptive curriculum

TEKRI – has very deep data about student interaction

Q: Who is going to succeed, who will fail? Not percentage-wise,
individuals!

“Who talks to whom, about what, and to what effect” (sociology)

“Who’s connecting, what are they talking about, what’s the impact in the
long run?”

Analyzing emails, who should be connected – business analysis – IBM

Marissa Meyer – the physics of data

function of scale

map reduce, hadoop

computing speed

digital data – data exhaust, trails

learning analytics – measurement, collection, analysis, reporting of
data about learners and their contexts, or purposes of understanding and
optimizing learning, and the environments in which it occurs

knowledge analytics – text / data mining, info retrieval machine
learning, linked data) for processing data to provide representations in
forms of which conclusions can be drawn in an automated and domain-aware
way

model: learners data + intelligent curriculum \> profile, analysis \>
prediction \> personalization, adaptation, intervention

**Dragan**

ontology – basic structure or armature around which knowledge base can
be built

semantic web cannot exist without social web – cannot be easily
produced.

DBpedia as ontology

BBC – semantic data – BBC music, leveraging data from MusicBrainz,
DBpedia

learning ecosystems

authoring + reusability \> packaging \> learning and collaboration
(community, peer-review, presenting, community, learners)

learning context ontology – content structure ontology, content type
ontology, user model ontology, learning design ontology, domain ontology
(DBpedia)

(IEEE International Conference on Advanced Learning Technologies –
“Learning Object Context on the Semantic Web”)

sparlq – language for data mashups – can pull in data from many sources

loco-analyst http://jelenajovanovic.net/LOCO-Analyst/ harmonization of
personal and organizational goals http://intelleo.eu

ubiqitous learning analytics – from lot’s of platforms, formats –
aggregates and integrates cannot exist without advanced learning
analytics

**Ideas from lunch:**

****use latent semantic analysis to go through all published papers by
all professors at a given university – find interesting linkages
(topics, methods, common citations) of professors in different
departments – sugget that they get to know each other. “you guys should
talk”

FYI (from Joe): LSA might not be the best method to use here, I
generally prefer “Concept Forest” (but need to make some experiments!).

**Katrien**

visualizing activities for self-reflection and awareness

-learning resource recommendation

dataTEL inititative

research on recommendation for learning

LAK11 pre-course data: http://ariadne.cs.kuleuven.be/monitorwidget-lak11

login: choose any users name

views average time spent of all users, and can highlight individual
users (how do they calculate time spent? which resources were they able
to suck in? ability to use with P2PU data?) is it OSS?

how does this modify student activity?

privacy issues for universities – this is the nice thing about LAK and
other MOOCs

can anonymize – see the lines, but not who the students are

George: How real-time is the data? Currently pre-loaded, we can update
every day, but not on the fly. Performance issues.

Time – estimates. Track all interactions.

“Altruistic learning situations vs competitive learning situations
(grades are curved, etc)”

-   Participation metrics

  Participation metrics might be more meaningful in altruistic
  learning situations – my example from MOOC: I signed up, but was
  only active during the first week. There is no penalty to dropping
  out – so people leave very easily. Presumably I would have learnt a
  lot more if I had been actively engaged with the course over the six
  weeks.

Compare to a competitive learning situations, where there might be a
participation mark to make sure students generate a number of posts per
week – in this case, pure participation statistics would be a lot less
meaningful, and you’d need to look much more closely at LSA, discourse
analysis to see if they are really doing deep thinking, or just
“writing”… (This will be useful in open learning situations too – but we
need to get the engagement and participation first. Plus it’s harder,
because people have more leeway to define their own learning outcomes…
Maybe link to individual learning plans etc?)

Contextualized Attention Metadata

deployed in ROLE-PLE, RWTH-Aachen engineering, Moodle

Track every kind of data such as user clicks

http://bit.ly/laksurv – survey about tool/ LAK11

“Happy to load your data into the tool.” Again: how does this work with
distributed learning – this is the holy grail (funny how the MOOC people
are so anti-LMS, but yet it’s an LMS that enables this to happen) – (gs:
good point. Have you looked at social media monitoring tools? They are
starting to address distributed interactions: see:
http://www.diigo.com/user/gsiemens/monitoring

sh: @gs thanks! – this will be a core focus of the new P2PU platform –
having a solid user-friendly core, which enables us to pull in
statistics and info from lot’s of outside platforms, wikis, twitter,
blogs, Wikipedia, github – for people to view activity, learners to
create portfolios, assessment, and data analysis. (Hoping to make
data-dumps of all learner activity available to all researchers on a
regular basis / real-time)

We used to think that we could just use tags, and suck in \#lak11 stuff
from lot’s of platforms into a widget. Two problems: spam (all my blog
posts get reposted on lot’s of splogs, with the tags intact, and popular
tags are often spammes on Twitter etc), and connecting a learner
identity in the LMS to an external contribution (learners might not use
same login across different systems) – how to do this easily? Would be
interesting to come up with a standard data format for sharing “learning
interaction logs”, so that visualizers etc could plug directly into data
from P2PU / MOOCs, or even BlackBoard… Do any examples exist?

September RecSysTel 2010:
http://adenu.ia.uned.es/workshops/recsystel2010/

dataTel: bit.ly/ieqm (too fast)

request for data sets, they already have datasets, Mendeley (2 million
users), APOSDLE, ReMashed, .edunet, Mace, Melt

ROLE: Responsive Open Learner Environment

can suggest new tools of resources on the fly

tools that can support learner self-assessment

The Data Shop – A data analysis service for the learning science
community http://pslcdatashop.web.cmu.edu \#lak11

**Tony Hirst**

How can non-programmers do these kinds of things – lowering barriers

Data is a dish best served raw

\*Workflow:

-   Discovery

-   Acquisition *as data*

APIs – offered by many social networks

(currently P2PU doesn’t offer any API – wonder what kinds of APIs would
be useful to others, how to design them, etc)

screenscraping – extracting data from loaded webpages straight from html

scraperwiki – tool for this – http://scraperwiki.com/

import to HTML in Google Spreadsheet (grab table, or list?) identify
table by the number of the table on the page (or number of list) –
http://googlesystem.blogspot.com/2007/09/google-spreadsheets-lets-you-import.html

-   Representation

-   Cleansing

Data is notoriously unreliable – different dataformats, spelling
mistakes, correcting errors (outliers might be valid though)

Hirst answered my question now about transformation. A possible tool is
Google Refine.

Google Refine – load in a CSV, find strings that look similar and should
be similar http://code.google.com/p/google-refine/

Stanford Data Wrangler: http://vis.stanford.edu/wrangler/

Alfred Essa adds: transformation (one structure to another)

(Visual) analysis

– we can stop trends and variations visually much better than in raw
tables

generate Google “heatmap”

Yahoo Pipes ( http://pipes.yahoo.com ) useful for generating KML format
used by GoogleMaps and GoogleEarth

JSON = Web interchange language (mostly javascript based)

The really neat thing is that there is a tool to convert Yahoo Pipes to
Python, which means that if Yahoo ever pulls the plug (not impossible,
given how many services Yahoo shuts down, you won’t loose your tools):
http://blog.ouseful.info/2010/09/30/yahoo-pipes-code-generator/

ManyEyes ( http://www-958.ibm.com/software/data/cognos/manyeyes/ )

Scraping “In Our Times”, finding members of the OU (not in a linked data
form, neither list of academics in OU). lot’s of work to make things
join up.

Gephi is an interactive visualization and exploration platform for all
kinds of networks and complex systems http://gephi.org/ \<- looks very
cool

Use common usernames on different social platforms – not perfect, what
if the name is taken on a service, or if someone takes your common
username and use it to open an account at a new service. But maybe “good
enough” for now. Would be great if there was a unique person identifier,
which you could put into a field on all social services (and where you
could do reverse lookup) – I guess this tends to be e-mail. Does Twitter
have an API, give me the Twitter stream of shaklev@gmail.com?

if I wanted to follow “best practices” when writing about OU Academics,
how would I “link” this data? Perhaps hyperlink their names to their
faculty pages? What is the “unique identifier”? (Having personal URLs is
great, but not sustainable – your own DNS, maybe you forget to renew it
– your institution, maybe you change jobs)…

There are more common login services now that may help. For example,
facebook logins.

I wonder how these help coordinate data – is there a way for me to find
all the accounts that a Facebook user has logged into? Privacy issues?
Also, Facebook isn’t the most generous at giving data *out* (they love
“sucking it in” to Facebook though) Good point.

Create Google Custom Search Engine over just the followers in a certain
area. “Roll your own” social search engine. Same with creating a “blog
roll” in a certain topic.

I wonder if you can extract semantic relationships via twitter or
delicous data?

**Academic publishing** Funny how much easier it is to create networks
of people who retweet each other, or follow each other, than to create a
graph of people who co-author papers, or are cited by the same papers…
We need unique author IDs, and unique paper IDs. And these need to be
used every time a citation / author is mentioned in a paper. There are
experiments in both categories, but nothing comprehensive yet.

**Not related to anything** Interesting to think about the ideal design
of such a collaborative note taking tool… Ways of keeping an emerging
structure, and inserting notes at appropriate locations. (I’d almost
like several small windows on the screen for different kinds of notes –
one for speaker notes, one for books to look up, one for process notes
etc). Ways of graphing visually (like @sbskmi does with Compendium, live
meeting notes)… ways of going through at the end and collate everything
– with ppts, notes, tweets etc…

**LUNCH**

**Linda Baer**

Systematic adoption of learning analytics

When looking at analytics, you have to look at past, present and future
trends

Past: What happened?

Present: What is happening now?

Future: What will happen?

Analytical DELTA

Accessible high quality Data

Enterprise orientation

Analytical Leadership

Strategic Targets

Analyst

Tom Davenport books on analytics http://www.tomdavenport.com

Have a look at Doug Clow’s conference notes:
http://dougclow.wordpress.com/2011/02/27/lak11-learning-analytics-and-knowledge-banff/
Oh very nice find! Thanks to Doug!

Stian – hope it’s ok to mention this here as well:
http://www.learninganalytics.net/?p=122 cfp learning and knowledge
analytics in ETS (delete if it isn’t)

**Theory-based learning analytics (Simon Buckingham-Shum)**

learning analytics and sensemaking – important and different from normal
chat and social network analysis… google analytics etc designed by
people who don’t know much about education

New learning theory – that wasn’t possible before we had learning
analytics (ref. big science)

KMI – similar to AU’s TEKRI
http://projects.kmi.open.ac.uk/hyperdiscourse/

(Note to all: Knowledge Cartography is brilliant, available here:
http://www.springerlink.com/content/978-1-84800-148-0 for people who
have access. Dan Suthers, who wrote a chapter, will be here too)

theory-based analytics: assumptions, evidence-based findings,
statistical models, instructional models, as well as more academic
"theories"theory-based analytics: assumptions, evidence-based findings,
statistical models, instructional models, as well as more academic
“theories”

The question is whether this has INTEGRITY as a meaningful indicator,
and WHO/WHAT ACTS on this data

Another summary/notes of LAK11: http://alfredessa.com/?page\_id=617

A theory might predict future patterns based on analytics.

RAISEonline: learning analytics in English schools

UK higher ed system: analytically “oppressed”

Previous OU study data are best predictors of future success

“operationalize” a definition of “at risk” – complex intersection of
well-documented factors that threaten completion rates.

this is a theory of learning – model, empirically based findings, we can
make predictions. (model of learning or of engagement?)

Sensemaking (Karl Weick): comprehending, patterning, interaction in
pursuit of mutual understanding

Collective intelligence tools and analytics should be designed
specifically to minimise breakdowns in sensemaking

Example

Experts might fail to recognize a novel phenomenon… SO tools should pay
particular attention to edge-cases, or scaffold critical debates between
contrasting issues

Complex systems only seem to make sense retrospectively

Use narrative theory to detect and analyse
knowledge-sharing/interpretive stories

Coherent pathways through the data ocean are important

Much knowledge is tacit, shared through discourse, no formal
cofidications. Trust is key to flexible sensemaking when the environment
changes.

SO scaffold the formation and maintenance of quality learning
environments.

Many small signals can build over time and become a significant
force/change

SO highlight important events and connections → aggregation and emergent
patterns

learning-to-learn analytics

set of generic dispositions and skills that characterize good learners –
if we can teach them a language for this, they can learn to become
better learners. deal with ambiguity, ask good questions, etc.

7 dimensions of learning power : http://www.vitalhub.net/index.php?id=8

Changing and Learning

Meaning Making

Curiosity

Creativity

Learning Relationships

Resilience

Strategic Awareness

Effective Lifelong Learning Inventory (Ruth Deakin Crick)

http://www.vitalhub.net/index.php?id=674

When making a blog post – tag it with the relevant indicator, dashboards
for teachers.

(Idea: link this with work on badges at P2PU)

Discourse analytics

disputational talk

cumulative talk

exploratory talk

knowledge is made more publicly accountable and reasoning is more
visible in the talk (ref to research papers).

use Elluminate to analyze exploratory talk. separate learning from
social interaction. Taking Mercer’s framework for Exploratory talk –
find “canned phrases” that signal the presence of these, run these on
the transcript of the text chat. Preliminary evidence: yes, it works.

Xerox Incremental Parser: sophisticated text parser technology. Run on
scientific paper – can pick out categories of knowledge level claims.

For example

background knowledge

…the previously proposed…

…is universally accepted…

contrasting idas

generalizing

novelty

significance

http://olnet.org/node/512

Integrate this with Cohere human annotation interface. Webcast about
this (possibly at URL above)

What comes after threaded-discussion forum?

Analyst-defined visual connection language

Reflective deliberation platform (others being developed at MIT).
Similar to Scardamalia & Bereiter (http://www.ikit.org/kbe.html)

Check this chapter out – very good overview of different ways of
designing deliberative platforms for deeper learning:
http://lilt.ics.hawaii.edu/papers/2008/suthers-2008-cartography.pdf

Videos from ODET 2010: Online Deliberation Emerging Tools – via @sbskmi

http://olnet.org/odet2010

**George Siemens**

dashboards must be learner-facing, learners should know everything about
themselves that institutions know about them.

If people know what your metrics are, they will game them – like content
farms.
