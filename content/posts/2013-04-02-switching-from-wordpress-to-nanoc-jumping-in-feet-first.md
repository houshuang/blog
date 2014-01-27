---
title: Switching from WordPress to nanoc, jumping in feet first
created_at: 2013-04-02 11:53:27 -0400
kind: article
tags: tech, personal
---

I've thought about switching to a [static site generator](http://www.mzlinux.org/?q=node/415) for a while, spending some time playing with [Jekyll](https://github.com/mojombo/jekyll), the poster-boy for SSGs, and learning about the different options, but I always put it on the backburner.

There are many reasons for switching, and for doing it now. My current blog layout has been the same [since 2005](http://web.archive.org/web/20051125124447/http://www.houshuang.org/blog/), and although I've enjoyed it, it's starting to feel old. I've also spent a lot of time writing on my wiki, which runs on localhost and is synced online, with a number of neat tools to help me author more effectively, and these days I find it so much quicker to write something on my wiki, than on my blog.

I don't know if I've really been writing less on my blog lately, or if it just feels like it - it's always been up and down. In the graph below, each point represents a blog post, the y-axis shows length (log-scale), and the x-axis time. You can see some pretty big gaps where I didn't write anything (like in 2007). I also seem to write fewer very short blog posts, which is probably because I began using Twitter and later Google Plus for quick links, and used the blog more for longer texts.

![plot](http://i.imgur.com/l2I3Xll.png)

*(the graph above was generated with [R](http://www.r-project.org/) and [knitr](https://github.com/yihui/knitr), which is another reason why I'd like to switch to an SSG, however I haven't quite integrated knitr into my workflow yet).*

Recently, I found [my PhD wiki](http://reganmian.net/wiki/start) overrun with spam accounts. Because the canonical version is stored offline, I was able to simply do another sync, and the wiki looked just as nice. I've also had WordPress hacked two or three times, and it was not so easy - once I lost all my posts, and [had to recover them using Google Cache](http://reganmian.net/blog/2009/01/11/how-to-restore-your-hacked-wordpress-database-from-google-cache-through-ruby). Knowing that I have [my entire post history](https://github.com/houshuang/blog/tree/master/content/posts) on my harddrive, in "future-proof" Markdown, is a great feeling.

[Nanoc](http://nanoc.ws/) is written in Ruby, and makes it very easy to configure, design compilation rules and filters (like plugins in WordPress), etc. Out of the box, it requires a fair amount of setup, but I've used my previous WordPress setup in almost 9 years, so spending a day or two to get it right will hopefully be worth it. I had a look at [a nanoc blog skeleton](https://github.com/mgutz/nanoc3_blog), but not only did it need tweaking to work properly with the latest version of nanoc, there was also too much magic going on. In the end, [Dave Clark's guide to building a blog with nanoc](http://clarkdave.net/2012/02/building-a-static-blog-with-nanoc/) got me started, and by making all the changes myself, I understood much better how the system is working.

The transition is not by any means "finished", there are many older blog posts that need cleaning up, the layout (based on [Mark Reid's site](http://mark.reid.name/blog/)) is nice, but needs polishing, etc. But I decided to eat my own dogfood and put it up. Already most posts should work, on the same URLs, and I'll slowly fix the rest.

*PS: I used [linkify](http://reganmian.net/blog/2013/03/28/link-helper-for-markdown-using-google-chrome-history-and-other-sources) extensively for this blog post, and I love it*