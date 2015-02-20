---
title: "OpenEdX and LTI: Pedagogical scripts and SSO"
created_at: 2015-02-20 11:41:48 -0500
kind: article
location: Toronto, Canada
tags: tech, mooc, edx
toc: true
---

**I came up with a neat way to embed external web tools into EdX courses using an LTI interstitial, which also allows for rich pedagogical scripting and group formation. Illustrated with [a brief screencast](https://www.youtube.com/watch?v=-OY9UPT4dK8).**

Last year, I [experimented](http://reganmian.net/blog/2014/10/03/a-pedagogical-script-for-idea-convergence-through-tagging-etherpad-content/) with [implementing pedagogical scripts](http://reganmian.net/blog/2014/10/03/supporting-idea-convergence-through-pedagogical-scripts/) spanning different collaborative Web 2.0 tools, like Etherpad and Confluence wiki, in two hybrid university courses.

[![](http://reganmian.net/blog/images/2014-10-03-a-pedagogical-script-for-idea-convergence-through-tagging-etherpad-content_-_whole-04.png)](http://reganmian.net/blog/2014/10/03/supporting-idea-convergence-through-pedagogical-scripts/)

Coordinating collaboration and group formation in a class of 85 students was already challenging, but currently we are planning a MOOC built on the same principles. Before we begin to design the pedagogical scripts and the flow of the course, a key question was how much we could possible implement technically given the MOOC platform. Happily, it turns out that it will be easier and more seamless than I had feared.

We chose to go with EdX (University of Toronto has agreements with both EdX and Coursera), which is based on an open-source platform. Open source can mean many different things, there are platforms that are mainly developed privately in a company, and released to the public as periodic "code dumps", and where installation is very complex, and the product is unlikely to be used by anyone else. I didn't know much about the EdX code, but the fact that the platform is already used by [a very impressive number of other installations](https://github.com/edx/edx-platform/wiki/Sites-powered-by-Open-edX), such as China's [XuetangX](https://www.xuetangx.com/) and [France's Université Numérique](https://www.france-universite-numerique-mooc.fr/cours/) was already a very positive sign. 

<!-- more -->

## Installation

![right ](/blog/images/2015-02-10-openedx-and-lti-pedagogical-scripts-and-sso_-_half-01.png)
The OpenEdX code is available on GitHub, and seems to be a very active community -- more than 28k commits by 199 contributors, >100 pull requests, 621 branches... But the most important thing is that it is very easy to install. I remember when we were building P2PU's Lernanta platform, also on Django, and it was quite difficult to install the code locally (having the right Python version, pulling in all the right libraries, etc), even to make some tiny changes. OpenEdX, which is much more complex, with a number of different services that need to work together, offers several pre-built packages. I chose to use Vagrant to run it locally, and once you've installed Vagrant and VirtualBox, simply using the commands listed [here](https://github.com/edx/configuration/wiki/edx-Full-stack--installation-using-Vagrant-Virtualbox) was enough to get a fully functioning local OpenEdX instance:

```bash
mkdir fullstack
cd fullstack
curl -L https://raw.githubusercontent.com/edx/configuration/master/vagrant/release/fullstack/Vagrantfile > Vagrantfile
vagrant plugin install vagrant-hostsupdater
vagrant up
```

## Cohorts and single-sign on
Now that I had a functional version of OpenEdX running locally, it was time to look at our challenges. We were interested in two separate but connected pieces of functionality. 

- enabling single-sign on with external tools, so that students can use an external wiki, for example, without having to create a new account and remember a new password
- ways of "scripting" the collaboration process, particularly grouping students into smaller groups, and sending students to various resources based on time, group affiliation, and what they had already done

![right ](/blog/images/2015-02-10-openedx-and-lti-pedagogical-scripts-and-sso_-_half-02.png)
For the second challenge, EdX already has a "cohort-feature", which let's you divide students into groups, and make certain parts of the discussion forum specific to each group. However, we were interested in much more detailed scripts than that. In our existing course, we used APIs to automatically insert templates into each group's space, take content from different groups and aggregate together, conditionally send students to different tools depending on their previous input, etc. Since EdX does not have an API that gives an instructor live access to the discussion forum, we couldn't for example create 300 cohort-groups and automatically populate each forum thread with a question post, then extract their answers, and do something with them. We would thus need to use external tools for this aspect of the course, bringing us back to the single-sign on issue.

![right ](/blog/images/2015-02-10-openedx-and-lti-pedagogical-scripts-and-sso_-_half-04.png)
Inspired in particular by the recent EdX MOOC [Data, Analytics and Learning](https://www.edx.org/course/data-analytics-learning-utarlingtonx-link5-10x), and their inclusion of external social and collaborative tools, I began investigating our options. The simplest way of including external tools, beyond simply linking to them, is to use an IFrame. However, a tool included in an IFrame receives no information from EdX about which student is visiting, and can send no information back.

An intriguing option that the [DALMOOC](https://linkresearchlab.org/dalmooc/) used, is to let the EdX platform function as an OpenID provider, and having a "Login with EdX" button, similar to the many sites that feature "Login with Google/Facebook/Twitter, etc". However, I could not find any information about how to enable this on EdX.org, and it would also mean that the students still would have to do a round-trip back to EdX to allow the login, making it less seamless.

## LTI to the rescue
![right ](/blog/images/2015-02-10-openedx-and-lti-pedagogical-scripts-and-sso_-_half-03.png)
Although I've been working with hybrid and online learning for many years, I've always been drawn to existing Web 2.0 tools, using APIs and RSS feeds to tie things together. Because of this, I don't have much experience with traditional LMSes, and things like SCORM and LTI -- in fact, they always sounded quite cumbersome and complex. However, it turns out that LTI ([Learning Tools Interoperability](http://www.imsglobal.org/toolsinteroperability2.cfm)) is a very simple protocol; it's basically a simple web request (either as an IFrame, or as a link opening a separate window) with three extra pieces: 

- **Authentication**<br>
    The authentication ensures that the request really comes from the OpenEdX platform (in this case), and that I cannot easily fake a request with someone else's user ID.
- **Student info**<br>
    The student info in the case of EdX is not any actual student info, but a persistent hashed identifier. This means I can always recognize when the same student accesses the LTI object, and I can also later connect learning analytics from the LTI object with EdX data (there is a hash table connecting the hash IDs with the actual student IDs in the data dumps).
- **Callback URL**<br>
     The callback URL is for graded LTI objects, to deliver a simple numeric grade back to the EdX platform.  

I first spent some time researching an LTI integration directly with [Confluence](http://confluence.atlassian.com), but I could not find one that was currently maintained. Limiting ourselves only to web apps that offer LTI integration would also severly restrict our choices, and even if the tools did offer LTI integration, that would only give us something like single-sign on, not any opportunity to implement pedagogical scripts. This led to idea of using an interstitial LTI script. This script would receive the request from OpenEdX, keep track of the relevant information about the student ID, and forward to various web services, providing automatic logon or deep-linking where appropriate/possible.

## Early experiment, group-based Etherpad selection
I found [an LTI library for Ruby](https://github.com/instructure/ims-lti.git), which had a great little [minimal example application](https://github.com/instructure/lti_tool_provider_example). The application is simple -- it prompts the user for a grade, and then sends that grade back to the platform -- but the fact that I could get that to work with OpenEdX using [the provided instructions](http://edx-partner-course-staff.readthedocs.org/en/latest/exercises_tools/lti_component.html), gave me the confidence to keep experimenting. I decided to use [Redis](http://redis.io/) as a backing database, since it is very easy to experiment with, and would also provide easy scaling if needed in the future. 

![right ](/blog/images/2015-02-10-openedx-and-lti-pedagogical-scripts-and-sso_-_half-05.png)Since we don't know anything about the student arriving, other than the hashed persistent id (there might be ways of getting more information from the system in the future), my first step was a simple form where students would specify their nickname, and choose a group (this could in the future be a long list of groups, or even some complex group formation algorithm).

![](/blog/images/2015-02-10-openedx-and-lti-pedagogical-scripts-and-sso_-_whole-01.png)
The next access point then simply forwards to an Etherpad, however it chooses the Etherpad URL based on the group already select (and stored in Redis). This way, we could have three hundred groups, and funnel students into 300 different Etherpads without changing anything in the EdX course setup. We could even have an on-demand feature which puts entrants into a "waiting room" until a pre-determined number of students appear, upon which a new Etherpad room is generated, students are forwarded to that room, and a new waiting room is created. 

## Confluence integration and templates
Since Etherpad does not use any authentication, it was a much simpler thing to integrate than Confluence. Luckily, Confluence has a rich API, which I've already used extensively in previous courses, however I did not know if it would be possible to automatically log students in. In the end, it turns out that by accessing a particular URL, you can offer as arguments the username, password, and the page to be redirected to:

```ruby
url = "https://www.WIKIURL.org/dologin.action?os_username=#{wiki_username}" + 
"&os_password=#{wiki_pwd}&os_destination=/display/IN/#{page}".
```

When a user tries to access a wiki endpoint, I first check in Redis whether the user already has a wiki password. If not, I randomly generate a wiki username and password, and create that user with the appropriate permissions, using the Confluence API. I then redirect the user's browser to the URL above, with the username and password (which they never need to see). The result is that they are seemlessly logged in, and redirected to the page I want.

![right ](/blog/images/2015-02-10-openedx-and-lti-pedagogical-scripts-and-sso_-_half-07.png)
However, having thousands of users simultaneously edit an unstructured wiki can be chaotic. Our idea is to make it easy for students to supply information, and for a smaller group of engaged users to engage with editing and enriching that information. As an example, I created a simple form which then populates a wiki page. In the current example, upon visiting this LTI object, the student automatically gets a wiki account (if he/she doesn't already have one), the page is created, and the student is automatically logged in and sent to the newly created page. In an actual course, the page could be generated by information submitted by numerous students, and accessing the page wouldn't have to follow immediately after filling out the template.

![](/blog/images/2015-02-10-openedx-and-lti-pedagogical-scripts-and-sso_-_whole-02.png)

## See it in action

<iframe width="420" height="315" src="https://www.youtube.com/embed/-OY9UPT4dK8" frameborder="0" allowfullscreen></iframe>

Although this example is quite simple, I find it very promising. I am very happy that due to the OpenEdX platform being so easy to install, and the Ruby LTI library comes with an example app, I was able to get this running in an afternoon. Now comes the hard work -- designing meaningful scripts and interaction patterns for students with very different reasons to participate, and levels of engagement, but at least we know that we can probably implement what we want to. We also need to think about scaling, and whether our local services can handle the amount of users we are expecting.

I'd love to hear about others experimenting with pushing on the interactive and collaborative features in MOOCs and large courses. It would also be interesting to think about how to make LTI tools even easier to integrate -- I'd love to see a catalogue of external LTI tools, ranging from simple individual widgets, to groupware and collaboration tools, which could all be easily slotted into an EdX, Instructure, or even Blackboard course.

All the example code [is on GitHub](https://github.com/houshuang/inquirymooc).