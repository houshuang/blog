---
title: Moving my blog to a VPS
created_at: 2013-09-29 09:51:51 -0400
kind: article
tags:
---

Some readers might have noticed that my blog, wiki, and other services were down for almost a month.

![](/blog/images/2013-09-29-moving-my-blog-to-a-vps-01.png)

I have been hosting with [Site 5](http://www.site5.com/) for a number of years, and always been quite happy with them - even recommending them to several users of [Researchr](http://reganmian.net/wiki/researchr:start). They provided lot's of space, databases, subdomains etc. However, I suddenly received an email from them telling me I was using more than my fair share of resources, and needed to move up to a Virtual Private Host, raising my cost from around 6$/month to around 70$!

![ Email](/blog/images/2013-09-29-moving-my-blog-to-a-vps-02.png)I obviously understand that the reason hosting was so cheap, was that I was sharing resources with a number of other users. However, the frustrating part was that there didn't seem to be anything I could do to mitigate the problem - I didn't have access to good statistics showing where all the extra CPU was burnt. After all, most of the hits I received went to a static blog, and a wiki, and I didn't have significantly more traffic than I'd had before. 

I removed a number of older scripts and installations, but it didn't seem to work, and I finally had to quickly shut down to avoid having to pay 70$/month. I hadn't looked for a new webhost for many years, and wanted to spend some time looking carefully through the options. That seemed like a big task, and because those weeks were very busy, I ended up putting it off for a while. 

![lowendbox ](/blog/images/2013-09-29-moving-my-blog-to-a-vps-03.png)I was fascinated by coming across the website [lowendbox](http://lowendbox.com/), listing a vast array of companies offering small and cheap Virtual Private Servers. The difference between the shared hosting account I had at Site5, and a VPS, is that you get full control over the virtual computer. It's virtual because it doesn't correspond to a physical server (one physical server might host many virtual ones), but in practice, when you log in, you don't notice much difference. You can choose any operating system, you have root access, can configure Apache anyway you want, or choose to use another web server, etc. 

![ramnode ](/blog/images/2013-09-29-moving-my-blog-to-a-vps-half-01.png)![ plan](/blog/images/2013-09-29-moving-my-blog-to-a-vps-half-02.png)This is a lot of fun, but of course also implies more responsibility and work in setting up. After reading some reviews, I decided to try out [RamNode](http://www.ramnode.com/), which offered a bunch of different packages. The package I chose comes to about what I used to pay for my Site5 plan, but has really nice specs. Especially nice is the 20GB SSD drive - it's less space than I had on Site5 (but still plenty!), but much faster. 

![ tkl](/blog/images/2013-09-29-moving-my-blog-to-a-vps-half-03.png)Initially installing a webserver, database drivers, PHP, etc, and getting it all to play nicely with each other (and being secure and optimized), can be quite trying. Luckily, I came across [TurnKey Linux](http://www.turnkeylinux.org/), which has a ton of different application profiles that are already optimized and ready to roll. I chose the package with [Nginx+PHP+FastCGI](http://www.turnkeylinux.org/nginx-php-fastcgi), because I've been wanting to play with Nginx (an alternative to Apache) for a while. Installation was a breeze, and setup was also quite painless. It was also "fun", but quite painless, to set up the DNS records to point to the new server. 

I haven't had time to play too much with my box yet, I'm sure there's a lot of optimizations I could apply, and some of the old scripts I had running aren't up yet (like my Chinese blog, and [my Wikipedia scripts](http://reganmian.net/blog/2007/11/13/tools-and-hacks-wikipedia-redirect)), but it's been chugging along for a few weeks, and at least it's great to know that my blog and wiki are available. Other things I can work on more slowly.

There were a few other options I also considered, for example using [Amazon AWS](http://aws.amazon.com/) to host my website, but I found that for my usage, it would be too expensive. If I only had a static blog, I could have hosted it through [GitHub Pages](http://pages.github.com/), but my wiki still runs on PHP, and I also really enjoy having an external blog that I can ssh into, run scripts, try out different things etc. And for 50$/year (with the discount from lowendbox), it's absolutely worth it. 

The transition to [Nanoc](http://nanoc.ws/) is not quite complete - I still need to go through all the old blog posts and make sure the conversion to Markdown worked properly, and I still want to fiddle with my workflow, look at the design etc. I'm also hoping to get some site search functionality -- Google Site Search is not good enough. I've played with this for a while, but wish it was much easier. I'll put up a blog post documenting some of my Nanoc hacks later (much of it is in newpost.rb in the [Github repository](http://github.com/houshuang/blog). 
