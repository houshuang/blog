---
title: A pedagogical script for idea convergence through tagging Etherpad content
created_at: 2014-10-03 17:17:26 -0400
kind: article
location: Toronto, Canada
tags: cscl,education,tech
---

**I describe a script aimed at supporting student idea convergence through tagging Etherpad content, and discuss how it went when I implemented it in a class**

# Background

In **[an earlier blog post](/blog/2014/10/03/supporting-idea-convergence-through-pedagogical-scripts/)** I introduced the idea of pedagogical scripting, as well as implementing scripts in computer code. I discussed my desire to make ideas more "moveable", and support deeper work on ideas, and talked about the idea of using tags to support this. Finally, I introduced the tool [tag-extract](http://reganmian.net/blog/2012/06/13/tag-extract-a-tool-to-automatically-restructure-textoutline-using-tags/), which I developed to work on [a literature review](http://reganmian.net/wiki/draft_literature_review_open_courses).

# Context

![right ](/blog/images/2014-10-03-a-pedagogical-script-for-idea-convergence-through-tagging-etherpad-content_-_half-02.png)I am currently teaching a course on Knowledge and Communication for Development ([earlier open source syllabi](http://idsb10.pbworks.com/w/page/37652952/FrontPage)) at the University of Toronto at Scarborough. The course applies theoretical constructs from development studies to understanding the role of technology, the internet, and knowledge in international development processes, and as implemented in specific development projects.

![ left](/blog/images/2014-10-03-a-pedagogical-script-for-idea-convergence-through-tagging-etherpad-content_-_half-01.png)I began the course with two fairly tech-centric classes, because I believe that having an intuition about how the Internet works, is important for subsequent discussions. I've also realized in previous years that even the "digital generation" often has very little understanding of what happens when you for example send a Facebook message from one computer to another.

<!-- more -->

So I spent the first week focused on the physical infrastructure of the Internet, the history and development, protocols and structure. We used traceroute to explore connections between local computers, from Scarborough to downtown Toronto, or to servers in the US or China. We used telnet to simulate a connection to a web server, we handwrote a very simple webpage, and I had students in groups "draw" the process of sending an e-mail from Toronto to China (inspired by [John Britton's idea](http://openmatt.org/2010/10/04/draw-how-the-internet-works/) in his [P2PU course](http://archive.p2pu.org/webcraft/web-200-anatomy-request.html))

![right ](/blog/images/2014-10-03-a-pedagogical-script-for-idea-convergence-through-tagging-etherpad-content_-_half-03.png)The second week, **in which I implemented this script**, was focused more on the software side, particularly Web 2.0. I wanted the students to understand the history of the Web, the concept of the social web, how websites have gone from simple containers of content to web apps and places of interaction, the interaction between commercial providers and user-generated content, etc. *I also thought this would be a great opportunity to try out some interactive production and organization of knowledge in practice.*

# The script

My basic idea was to have the students work in small groups on adding ideas to group Etherpads. My key question was: **What are the distinguishing features of Web 2.0**. I would have a few different "external stimuli", after which they would add more ideas to their own pad. At the end of the class, we would use tagging to create a [folksonomy](http://en.wikipedia.org/wiki/Folksonomy), and then collaboratively reduce the folksonomy to a few key categories. Based on the categories, my script would extract the tagged pieces of text from everyone's pad, and create one new pad per category. My idea was then to assign the students to edit these pads and turn them into wiki articles that students could later refer to when studying, or working on the final project.

Inspired by Pierre Dillenbourg's work on orchestration graphs, which he talked about at [ICLS in Sydney](https://www.youtube.com/watch?v=UIRDxHAnAlg) and [LASI](http://new.livestream.com/hgselive/events/3105335/videos/55325177) in Cambridge, MA, I attempted to visually represent the script.

Script (click for a bigger version)

[![](/blog/images/2014-10-03-a-pedagogical-script-for-idea-convergence-through-tagging-etherpad-content_-_whole-04.png)](/blog/images/2014-10-03-a-pedagogical-script-for-idea-convergence-through-tagging-etherpad-content_-_whole-04-orig.png)

The graph is organized across three vertical levels, representing work done by students individually, in small teams (in our case groups of 2-3 students), and done in the whole class. The x-axis represents time, and the stars represents processing by an external script which shuffles information between pads. Below, I'll discuss the script more in detail.

## Phase 1

![ left](/blog/images/2014-10-03-a-pedagogical-script-for-idea-convergence-through-tagging-etherpad-content_-_whole-03.png)The students had been assigned two readings as homework, and came to the class prepared. In addition, they mostly had pre-existing ideas about Web 2.0, the social web, etc. Before doing any lecturing at all, I asked them to gather into groups of 2-3 people (based on where they were sitting), and counted off. A script had already generated a number of Etherpads with identical prompts, that were all linked from the week's wiki page.

![](/blog/images/2014-10-03-a-pedagogical-script-for-idea-convergence-through-tagging-etherpad-content_-_whole-05.png)

## Phase 2

![](/blog/images/2014-10-03-a-pedagogical-script-for-idea-convergence-through-tagging-etherpad-content_-_whole-02.png)

The idea was to have a few rounds of providing the students with stimulus that would lead to the generation of more ideas, which could be recorded in the pads. After the students had finished their initial brainstorming, I led the class in a discussion, talked through the articles, and showed two Michael Wesch videos: [The Machine is Us/ing Us](http://www.youtube.com/watch?v=NLlGopyXT_g) and [Information R/evolution](https://www.youtube.com/watch?v=-4CV05HyAbM). I then gave the students some time to write down ideas and thoughts.

![left ](/blog/images/2014-10-03-a-pedagogical-script-for-idea-convergence-through-tagging-etherpad-content_-_half-04.png)I wanted to give the students a sense of how the web has developed, and I've found the [Internet Archive Wayback Machine](https://archive.org/web/) a great tool in the past. This let's the students explore the history of websites they are familiar with. We looked at a few examples together, and then I asked each group to choose a few websites they were familiar with (and encouraged them to also look at websites in other languages, since we have a very multilingual student body), and specifically look at features and functionality that has changed, not just design. We then discussed some of these examples together, and the students added more ideas to their pads.

The final stimulus was looking in-depth at a specific Web 2.0 site. I had prepared a list of URLs, and the script automatically inserted a random URL at the bottom of each group's pad. The URLs included Wikipedia, Flickr, a newspaper, the university LMS, etc. I always enjoy walking around the room when students are working on these kinds of tasks, because the quick conversations we have while they are in the middle of exploring a topic, and I am able to point them in the right direction, seem really valuable. (And something I have not really captured in the orchestration graph).

## Phase 3

![](/blog/images/2014-10-03-a-pedagogical-script-for-idea-convergence-through-tagging-etherpad-content_-_whole-01.png)

## Individual tagging

At this point, each student group had a pad filled with notes and ideas about Web 2.0 features and functionality, the shift from Web 1.0 to Web 2.0, etc. They had gradually added to this pad during the class, and I had provided rich external input, and opportunities to discuss in small groups, and in the whole class. If the class had ended here, I would have already considered it a success.

However, one of my design goals for this iteration was to make content generated in class more accessible and useful to students going forwards. Nobody would probably wade through a bunch of unorganized Etherpads when they were later working on the final project, or preparing for the exam. I wanted to see if my [tag-extract](http://reganmian.net/blog/2012/06/13/tag-extract-a-tool-to-automatically-restructure-textoutline-using-tags/) approach, which had been so useful to me in organizing and structuring my own notes and ideas when doing a literature review, could help the students collaboratively reorganize all of their notes into a coherent whole.

![right ](/blog/images/2014-10-03-a-pedagogical-script-for-idea-convergence-through-tagging-etherpad-content_-_half-05.png)I first asked the students to add tags to the ideas in their pads. They were all familiar with tagging from Twitter, and from the readings and videos in class, and I connected the exercise to this, without telling them about the next step yet.

**Below you can see an example of the evolution of the pad from one student group, ending with the students adding tags to their existing ideas.**

<img src="/blog/images/2014-09-22-tagging-and-convergence-for-small-groups-collaboration-with-multiple-etherpad-01-static.png" alt="" class="post-thumb" onclick='this.src="/blog/images/2014-09-22-tagging-and-convergence-for-small-groups-collaboration-with-multiple-etherpad-01.gif"'/>

## Collectively organizing the folksonomy

After the students had added tags to their pads, the script extracted all the tags, and created a new Etherpad listing them all. Including misspellings and variants, the students had come up with almost 100 tags. The pad with all the tags offered a simple way of categorizing tags, if you have a list of tags that are similar and should be grouped together, such as this list from our class:

- advertisments
- viralmarketing
- consumerism
- marketization
- onlinerevenue

We just needed to combine them together into one category:

```
advertisments: viralmarketing, consumerism, marketization, onlinerevenue
```

Because we were using Etherpad for this as well, the whole class could participate, and in just a few minutes, we had organized the tags into a much smaller number of categories. In the example above, this was quite easy, but for others, the ordering might have been a bit arbitrary. Since we did not have access to the actual text tagged at this point, it was also sometimes hard to know what people had meant.

**See the animation below of this process.**

<img src="/blog/images/2014-09-22-tagging-and-convergence-for-small-groups-collaboration-with-multiple-etherpad-02-static.png" alt="" class="post-thumb" onclick='this.src="/blog/images/2014-09-22-tagging-and-convergence-for-small-groups-collaboration-with-multiple-etherpad-02.gif"'/>

## Putting it all together

![right ](/blog/images/2014-10-03-a-pedagogical-script-for-idea-convergence-through-tagging-etherpad-content_-_half-06.png)The final move was to run a script which would go through all the pads, and extract all the text tagged into appropriate category pads (ie. above, text tagged either #advertisments or #viralmarketing or #consumerism would all end up in a pad called advertisments). There was a bit of an anti-climax as that script failed to run at the end of the class, because of a silly error. That was OK, because when I fixed the script after class, and ran it, I realized that the output was often not as useful as I had naively hoped.

On the right, you see an example of a pad, with the title listing all the tags in the category, and the specific category also appended after each text snippet. (I could also have appended the name of the group pad that the snippet came from, but in this case, that would just make it more cluttered.)

# Evaluation

The first part of the script worked great, but was not that different from the way I often teach. Pushing different URLs to each pad worked very well (and students loved having something suddenly show up beneath the text they were just editing), I've used this particular script again in a later class.

However, the grand idea of using tags to reorganize and structure the text still needs more work. I think the prompt was the first problem, "What distinguishes Web 2.0" was not perhaps the most productive or clear question I could have asked. I could have made it more problem-oriented, or debate (pro/con), etc. I also never explained to the students the purpose of what we were doing - they are used to taking notes in the Etherpad during group work, but I never told them that it would be tagged, cut up into small pieces, and shared.

## Now do this, then do that

![right ](/blog/images/2014-10-03-a-pedagogical-script-for-idea-convergence-through-tagging-etherpad-content_-_half-07.png)Once we tagged, I didn't tell them that we would gather all the tags and organize them, and while we were organizing the tags, I didn't tell them what we were doing it for. I think teachers often do this unconsciously – lead students through activities that they have clearly thought out, without telling the students where they are going, or why they are moving in a certain way. Sometimes this is a necessary part of the script, whereas at other times, students need conscious training in certain epistemic moves, to be able to carry them out effectively.

I was very impressed by Kate Bielaczyc's presentation at ICLS 2010, where she used a sport metaphore to distinguish between practice and playing a match. To get good at a sport, you don't just play matches, the coach leads you into targetted practice, setting up contrived situations to challenge you. Similarly, she had her students practice the act of knowledge building with contrived situations, before they actually got into authentic knowledge building.

> Hypothetical game-configurations are used to reflect on the knowledge building moves made possible by a particular configuration of knowledge objects. The configurations consist of “snapshots” of hypothetical student work in Knowledge Forum, meant to capture game play at a fixed point in time in order to engage the community in asking: given this configuration, what types of knowledge building moves would best contribute to advancing our knowledge? Some configurations focus on single moves, such as presenting a possible initial explanation generated in response to the problem the students are working on.
>
> Students then generate a knowledge building move meant to advance this initial idea. There are also more complex game configurations that present not only a possible initial explanation in response to a problem, but also provide a series of possible knowledge building moves. In this case, students both evaluate the quality of the provided moves and generate a possible next move that contributes to the progressive improvement of ideas. In all cases, students each work on the same hypothetical game-configurations so that they can then compare and contrast their proposed knowledge building moves in whole-class discussions about issues such as what makes a “good contribution” and what does it mean to advance the community understanding.
([Bielaczyc & Ow, 2010](http://dl.acm.org/citation.cfm?id=1854471&dl=ACM&coll=DL&CFID=579302205&CFTOKEN=60206663))

So perhaps if I did this again, with a better prompt, and students knew that they were taking notes that would be cut apart and reassembled, they would write differently. However, it is also possible that this kind of reorganization is not as useful for collaborative work – part of why it works when working on my own ideas, is that I wrote the notes myself, and I remember why I wrote them. Looking at other people's notes is difficult at best, and especially when they are out of context.

# Future work

I still believe that Etherpad and the wiki, which is also scriptable, has a lot of potential for rapid experimentation with collaborative scripts. We have experimented with a number of other scripts in the two classes that I teach/co-teach, and I might blog about other ones later. I've used a simplified version of the tagging script in two later classes, where I focused on the ability to pick out and aggregate ideas based on pre-determined tags. *The fact that Etherpad records the entire history, and let's me go back, is also useful for research, and I plan to spend a bit longer looking at how the individual team pads evolved during the different stages of the script.*

![right ](/blog/images/2014-10-03-a-pedagogical-script-for-idea-convergence-through-tagging-etherpad-content_-_half-08.png)The week after the script above, we talked about theoretical perspectives on development and technology, and as an ice-breaker before the lecture, I asked them to write down what they thought poverty was, and what they perceived the "official" definition to be. After some group discussion, I asked each group to come up with a single sentence for each, and tag them with respectively #ithink and #worldthinks. The script then simply aggregated all of these on a simple webpage, which was a great way of exploring different approaches (ethics, capability approach, materialistic, relative/objective poverty, happiness, etc).

*Writing these [two](/blog/2014/10/03/supporting-idea-convergence-through-pedagogical-scripts/) blog posts has also been interesting. I know they ended up very long, and kind of mix technical stuff, CSCL theory, my own ideas about how people work with ideas, and my practical experience in the class. But this is how I think – and it's liberating to not be constrained by the academic paper format, especially in the exploratory phase. Writing it down enables me to reflect more deeply on my own design, and execution. Putting the script into Dillenbourg's orchestration graph format was also a great exercise, even though I have barely scratched the surface of his framework.*

*The drawing of an internet workflow comes from [a student in the P2PU course](![](/blog/images/2014-10-03-a-pedagogical-script-for-idea-convergence-through-tagging-etherpad-content_-_half-02.png)). The Web 2.0 image comes from [Nonprofit Tech for Good](http://www.nptechforgood.com/2010/01/28/web-1-0-web-2-0-and-web-3-0-simplified-for-nonprofits/). The Do as I tell You sign comes from [Ice House Crafts](http://icehousecrafts.com/item_371/If-You-Would-Just-Do-What-I-Tell-You-I-Wouldnt-Have-To-Be-So-Bossy-Sign.htm)*