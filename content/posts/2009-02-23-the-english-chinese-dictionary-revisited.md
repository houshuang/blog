---
title: The English-Chinese dictionary, revisited
created_at: Mon, 23 Feb 2009 15:59:26 +0000
kind: article
tags:
  - china
  - Jin Ping Mei
  - languages
  - personal
  - tech
---

My previous post on extracting an English-Chinese dictionary garnered a
fair amount of attention, I got
[reddit](http://www.reddit.com/r/programming/comments/7xwst/englishchinese_dictionary_based_on_wikipedia/)'ed
(on their frontpage for a short time),
[solidot](http://internet.solidot.org/index.pl?issue=20090217)'ed,
mentioned on the [Wall Street Journal
blog](http://blogs.wsj.com/chinajournal/2009/02/18/best-of-the-china-blogs-february-18/),
and more. Very fun. About 10,000 page views in three days, and a bunch
of comments, both here and at Reddit. It was fun to follow the referrers
in the log and see how the article spread, first through some big
portals, then being picked up by others, as well as personal blogs,
twitter, etc.

For the simple dictionary server I wrote - which was only a small part
of my article, but I guess the most immediate and visible way of testing
it out - I generate a simple log file. I don't want to infringe anyone's
privacy, so I am not logging IP or anything, simply the word that is
searched for. I just had a look at this file, and here are the stats.
First, I did a quick

  cat log | wc

to see how many words (ie. searches) had been performed. The result is
2,819. Then I did a

  cat log | sort | uniq | wc

this shows me how many different unique words have been searched for (ie
if five people searched for China, that would be one entry - doesn't
account for misspellings of course). The result was 702 different words.
Then I wanted to make an overview over the most frequent search words,
but I couldn't immediately think of a way to do this using shell
commands. So I wrote a quick Ruby script. (Note, I could of course have
imported this into a spreadsheet, but what if it had been a million
rows?)

  text = File.read(ARGV[0])
  counter = {}
  text.each do |line|
    counter[line] = counter[line] ? counter[line] + 1 : 1
  end
  puts "<table>"
  counter.sort {|a,b| b[1]<=>a[1]}.each do |key|
    puts "<tr><td>" + key[0].chomp + "</td><td>" +
  key[1].to_s + "</td></tr>"
  end
  puts "</table>"

This gave the following top searches:

--- ---
searchword    414
sex           376
Toronto       253
open access   174
test.cgi/     148
天安门        146
北京          135
开放获取      118
telephone     75
托福          41
很好很强大    23
上海          16
favicon.gif   11
Dictionary    11
favicon.ico   11
toronto       8
word          7
中国          7
--- ---

It's an interesting combination. First, I notice that things that I link
to in my article appears very frequently. I began talking about my
server in my previous article with the text: I didn’t bother writing a
form page for it, but the API is extremely simple:
http://reganmian.net/en-zh/*searchword.*Since the searchword is
italicized, my intent was for the user to replace that with whatever
they wanted to search for, and unlike my subsequent real examples, this
URL wasn't even linked, but still people ended up clicking on it
(finding no hits, and hopefully not abandoning the dictionary just
because of this).

The second hit is sex, unsurprisingly. And apart from being titillating,
this is a searchword that really illustrates the strength of this
dictionary compared to other more traditional ones. The result is 141
headwords, as diverse as [East
Sussex](http://reganmian.net/en-zh/East%20Sussex), [Oral sex in Islamic
law](http://reganmian.net/en-zh/Oral%20sex%20in%20Islamic%20law), [Sex
Pistols](http://reganmian.net/en-zh/Sex%20Pistols) and [Psyochopathia
Sexualis](http://reganmian.net/en-zh/Psyochopathia%20Sexualis). I
certainly didn't know how to translate metrosexual or genetic sexual
attraction to Chinese, but now I do. (And, incidentally, this blog will
probably be blocked in all British Schools, and Saudi Arabia).

[Toronto](http://reganmian.net/en-zh/Toronto) and [Open
Access](http://reganmian.net/en-zh/Open%20Access) where both examples I
provided, but test.cgi/ is an interesting one. It has a huge amount of
hits, and as far as I know, hasn't been listed anywhere. I am curious if
this is an automated attempt at exploiting a vulnerability. Then we get
some Chinese ones, like [天安门](http://reganmian.net/en-zh/天安门)
(Tiananmen), [北京](http://reganmian.net/en-zh/北京) (Beijing) and
[开放获取](http://reganmian.net/en-zh/开放获取) (Open Access).

Further down, we find "很好很强大". It literally means "very good, very
strong", but is a Chinese internet meme which can be used to express
strong surprise (and often unhappiness) with something. According to
[this
blogger](http://ultrarvid.spaces.live.com/blog/cns!28A06226450F9F83!572.entry)
(in Chinese), the expression can be traced back to [Jin Ping
Mei](http://en.wikipedia.org/wiki/Jin_Ping_Mei), a Chinese erotic
classic. Although there is a nice [Wikipedia entry in
Chinese](http://zh.wikipedia.org/w/index.php?title=%E5%BE%88%E5%A5%BD%E5%BE%88%E5%BC%BA%E5%A4%A7&variant=zh-cn),
there is no English corresponding article, and thus no entry in the
dictionary.

By the way, I made a corresponding dictinary for traditional characters
at http://reganmian.net/en-tw/search-something. Now we'll see if in a
while, when I check it's log, "search-something" is the top search
word...

Stian
