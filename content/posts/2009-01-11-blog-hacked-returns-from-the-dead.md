---
title: Blog hacked - returns from the dead
created_at: 2009-01-11 00:00:00 -0500
kind: article
tags:
- Backup
- FriendFeed
- Intense Debate
- personal
- WordPress
---

 [![A smiley by Pumbaa, drawn using a text editor.](http://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Smiley.svg/202px-Smiley.svg.png "A smiley by Pumbaa, drawn using a text editor.")](http://commons.wikipedia.org/wiki/Image:Smiley.svg) 
:   Image via
  [Wikipedia](http://commons.wikipedia.org/wiki/Image:Smiley.svg)

I discovered it through a post on
[Friendfeed](http://friendfeed.com "FriendFeed") (one of the rare times
that I checked my FF page) - it showed that a new post had been posted
on my blog, with the title "Hello World". It's not a good feeling to
suddenly see that something has been posted on your blog, without your
control. When I loaded my blog, I saw that it had been entirely wiped
out, and what was there instead was a brand new install of
[WordPress](http://wordpress.org "WordPress"), with a blog called Busty,
and one post saying only "Hello World"... I had been hacked.

I still am not quite sure how this happened. I am assuming it happened
through some weakness in WordPress, since only my blog was affected of
all the different content I host on my site, however I was running a
fairly recent version of WP. In any case, the database holding all of my
WP blog posts was completely hosed. I hoped in the longest that my host
Site5.com would be able to restore the site from backups, but on my
cheap plan, they only do one daily backup, and I discovered it too late
- the backup from yesterday was already overwritten...

Of course, I ought to have had a backup myself, but I had been very lax.
In fact, I thought I had a backup lying around somewhere, but could not
find it. So what to do? Well, after some messing around, I managed to
restore almost all the old posts using a Ruby script that parsed my old
blog post pages through Google Cache. It worked surprisingly well, and I
will do a separate post about how I did it. The most important thing,
however, is that almost all of my posts should be back in place, at the
same URLs as before (if you find any broken links etc, please let me
know). Most of the comments should also be preserved, because I used
[Intense Debate](http://www.intensedebate.com "Intense Debate").

To me, it's certainly a reminder to be much more vigilant about
security, and backups. It's also a neat example of how "the cloud" can
inadvertently function as a backup. I wouldn't rely on it entirely, and
it was a major pain to revert from HTML back into structured data for
the database, but it's incredible that it was even possible.

Happy New Year, all! Stian

[![Reblog this post [with
Zemanta]](http://img.zemanta.com/reblog_e.png?x-id=716b9b3a-a094-441b-874e-35d941032daf)](http://reblog.zemanta.com/zemified/716b9b3a-a094-441b-874e-35d941032daf/ "Zemified by Zemanta")
