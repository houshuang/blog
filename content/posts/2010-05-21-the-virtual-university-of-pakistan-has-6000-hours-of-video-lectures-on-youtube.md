---
title: The Virtual University of Pakistan has 6,000 hours of video lectures on Youtube
created_at: Fri, 21 May 2010 15:05:38 +0000
kind: article
tags:
- Education
- languages
- open-education
- p2pU
---

I find distance universities very fascinating, and have learnt much from
my time visiting [the Open University of China](http://en.crtvu.edu.cn/)
and [Indira Gandhi National Open University](http://www.ignou.ac.in/)
(IGNOU) in India. Distance universities have been in the forefront of
researching alternative ways of delivering instruction and enabling
learning, with radio and television, online classes etc. They are also
uniquely poised to open up their materials, because their courses have
been designed for distance/online learning from the outset. The [Open
University of the UK](http://open.ac.uk), the international pioneer of
open universities, has been very innovative with its [OpenLearn
project](http://openlearn.open.ac.uk/).

![](http://reganmian.net/blog/wp-content/uploads/2010/05/vu_illustration_2.png)I
was extremely excited to find the amount of material published in India
by both the Indian Institutes of Technology and
[IGNOU](http://reganmian.net/blog/2008/12/05/worlds-largest-university-opens-almost-all-its-materials/).
IGNOU both uploaded a very large amount of materials to a DSpace
repository called [eGyanKosh](http://www.egyankosh.ac.in/), and also
released thousands of hours of video on [their YouTube
channel](http://www.youtube.com/profile?user=egyankoshIGNOU&view=subscriptions).
Being able to watch videos about rural planning, Hindi literature,
economics, how to be a radio DJ, and many more topics — from an Indian
point of view — is a very exciting opportunity.

This morning I had a wonderful conversation with [Alastair
Creelman](http://acreelman.blogspot.com/), and he mentioned that the
Virtual University of Pakistan (VU) had also put thousands of hours of
video on YouTube. I immediately went to check, and found [their
channel](http://www.youtube.com/user/vu) with 5992 videos! (I wonder if
there will be a cake served when they reach 6000?)

According to
[Wikipedia](http://en.wikipedia.org/wiki/Virtual_University_of_Pakistan),
the VU was founded in 2002, and is “the first distance learning
university in Pakistan based entirely on modern information and
communication technologies.” In that sense, it differs from IGNOU, which
was established in 1985 ([WP](http://en.wikipedia.org/wiki/IGNOU)), and
was initially based mainly on correspondence (although they also used
satellite TV actively).

![](http://reganmian.net/blog/wp-content/uploads/2010/05/vu_illustration.png)What
was a positive surprise to me, when I began looking at some of the
videos, is that they seem to all be in
![](http://wikipedia.org/wiki/Urdu)[Urdu](http://wikipedia.org/wiki/Urdu).
Although Urdu is the national language of Pakistan, many of the
universities teach largely in English (similar to the situation in
India). The fact that these courses are in Urdu will obviously limit the
utility of these courses to the international audience, but radically
increase their value to the local population. (And let’s face it, it’s
not like the English-speaking population is particularly underserved,
globally speaking).

It’s very exciting to me, because I actually studied Hindi for a year
(Hindi and Urdu are very similar) and spent three months in India. I am
very interested in improving my Hindi, and also in learning Urdu. In the
lectures I watched, I could mostly follow the dialogue, because the
professors spoke very slowly (sometimes painfully so), and frequently
mixed in English words, or used slides in English.

The one problem with the YouTube channel is that unlike the IGNOU
account, which uses individual accounts for each faculty (which are all
subscribed to b the main account), and playlists for individual courses,
the VU account lumps every video into one big pool, and names them with
cryptic codes like PSY032-Lecture34. It’s almost impossible to browse
around, if you don’t know what you are looking for.

Luckily, they actually store the full title of the course in the
description, but this does not come up unless you click on a video. I
wanted to see if I could do something about this — mainly to scratch my
own itch, and I found that there was [a great Ruby
library](http://rubyforge.org/projects/youtube-g/) for accessing YouTube
metadata programmatically. Using this, you can retrieve all the metadata
for every video uploaded by a given user (or in a given category, with a
different keyword, etc) using just a few lines of code. I downloaded all
the metadata, used the descriptions as course titles, and sorted the
filenames alphabetically, and generated an [index
page](http://reganmian.net/vu).

This page makes it much easier to see all courses on offer, find a
sorted list of lectures, etc. Now I can really begin to explore! It’s
not perfect, some of the lectures seem to be missing, and there is a
course called “Click to add description…”, but overall this is very
useful, in just about an hour and a half of hacking, having not even
played with the YouTube API previously.

Here’s the code that I ended up with — this downloads all the metadata,
and spits out the [HTML file](http://reganmian.net/vu) that I now host.

~~~~ {.brush:ruby}
require 'rubygems'
require 'youtube_g'

client = YouTubeG::Client.new
allvids = Array.new
count = 1

# get metadata for all videos
begin
 while true
 videos = client.videos_by(:user => 'vu', :page => count)
 allvids = allvids + videos.videos
 count = videos.next_page
 $stderr << count
 break unless count
 end
rescue Exception=>e
end

# sort videos into courses based on descriptions
keywords = Hash.new
courses = Hash.new
allvids.each do |vid|
 unless courses[vid.description]
 courses[vid.description] = Array.new
 keywords[vid.description] = vid.keywords
 end
 courses[vid.description] << vid
end

# start generating the index
puts "<h1>Course titles</h1><ul>"
courses.sort.each do |element|
 puts "<li><a href=\##{element[0]}>#{element[0]}</a></li>"
end
puts "</li><p>"

puts "<h1>Individual courses</h1><ul>"
courses.each_pair do |desc,vids|
 uniq_ary=[]
 puts "<a name=#{desc}>"
 puts "<li><b>#{desc}</b> - <i>#{keywords[desc].join(", ")}</i></li><ul>"
 vids.sort! {|a,b| a.title.downcase <=> b.title.downcase}
 vids.each do |vid|
 next if uniq_ary.index(vid.title)
 uniq_ary << vid.title
 puts "<li><a href=#{vid.player_url}>#{vid.title}</a></li>"
 end
 uniq_ary = []
 puts "</ul><p>"
end
puts "</ul><p>"
~~~~

Here's a **small** sample of the courses available:

-   [SOC401 Cultural Anthropology](http://reganmian.net/vu/#SOC401)
-   [PSY512 Gender Issues in
  Psychology](http://reganmian.net/vu/#PSY512)
-   [PSC201 International Relations](http://reganmian.net/vu/#PSC201)
-   [PAK301 Pakistan Studies](http://reganmian.net/vu/#PAK301)
-   [MKT624 Brand Management](http://reganmian.net/vu/#MKT624)
-   [MGT501 Human Resource Management](http://reganmian.net/vu/#MGT501)
-   [MCM516 TV News Reporting &
  Production](http://reganmian.net/vu/#MCM516)
-   [ISL201 Islamic Studies](http://reganmian.net/vu/#ISL201) (seems to
  be mainly in English)
-   [CS704 Advance Computer
  Architecture](http://reganmian.net/vu/#CS704)
-   [CS201 Introduction to Programming](http://reganmian.net/vu/#CS201)

So go check it out!

Stian
