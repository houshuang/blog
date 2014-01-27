---
title: Manipulating list of tweets with TextMate (with screencast)
created_at: Mon, 12 Apr 2010 13:37:09 +0000
kind: article
tags: regexp, regular expressions, ruby, tech, TextMate
---

I have begun tweeting at conferences where it is appropriate and
feasible. It serves multiple purposes, providing me a way of reflecting
on what is being said, as a back-channel with other conference
attendees, and to share some of what is happening with the outside
world. Although 140 characters is obviously very short, I have often
appreciated the little snippets of information coming out of conferences
that I could not attend - at a minimum, it might inspire you to go check
out people's blogs, Slideshare presentations or video/audio recordings,
etc.

After having tweeted intensively for a few days, I thus have bunch of
tweets with the same hashtag. A few times in the past, I've made a blog
post with all my tweets for a given conference. Again, I am not sure how
useful that is to others - but it is very easy to do, and it provides a
quick reference for myself in the future.

There might be several ways of doing this, but for me, I start by doing
a search for \#hashtag from:houshuang, with 50 hits per page. I then
copy each page (Ctrl+A, Ctrl+C) to TextMate. Now, there are many lines
that we do not want, the easiest is to apply a text filter, select
Text...Filtering...Copy Matching Lines Into New Document, and use the
search query \#hashtag - each line containing the hashtag should be a
tweet, and each tweet should contain this hashtag, since that is what we
searched for. This way we get rid of all the "Welcome to Twitter", etc
lines.

I also whipped up two one-line Ruby programs, that perform simple tasks.
The first one, strip, removes all leading and trailing white space
(there is already a command that removes trailing white space only, it
users Perl. I could have used Perl for this one as well, but I feel more
comfortable in Ruby):

```ruby
File.read(ARGV[0]).each {|l| puts l.strip}
```

And a quick program that reverses the order of the lines (so that we get
the first tweets first, instead of last):

```ruby
puts File.read(ARGV[0]).split("\n").reverse.join("\n")
```

I've created a screencast to show how it all comes together (note, there
are many other ways of accomplishing this task, but I wanted to show an
example of how easy and powerful it is to use regexps, and write small
snippets for TextMate). [Watch
screencast](http://reganmian.net/files/Textmate-tweets.mov) (eleven
minutes, QuickTime). And see [the
post](http://reganmian.net/blog/2010/04/12/tweets-from-hewletts-oer-grantees-meeting-at-yale-2/)
that was the result of this process.