---
title: "Release early, release often: English-Chinese dictionary based on Wikipedia"
created_at: 2009-02-16 00:00:00 -0500
kind: article
tags:
  - china
  - Chinese language
  - dictd
  - dictionary
  - languages
  - Linus Torvalds
  - open access
  - personal
  - Republic of China
  - sed
  - stardict
  - tech
  - Text editor
  - Text file
  - wenlin
  - XML
---

**Background** Although there are some great Chinese dictionaries out
there, I often encounter cases when they are not enough. I might either
be looking for a specific concept, like "open access" (in scholarly
publishing) and want to know how that is written in Chinese, so that I
can google for articles about it in Chinese. Or I might want to know how
Heidegger, Copenhagen or Grey's Anatomy is written in Chinese - a
dictionary is unlikely to have any of these (it might have the two
first, if it is very complete, but certainly not the last).

Wikipedia is a great, perhaps unintentional, source of these words,
because of interwiki links. Each article (usually) has a number of links
to articles on the same topic in another language. In the wiki markup,
these look like [[en:Oslo]] (to make a link to the English article about
Oslo), and they are listed on the bottom left side of the screen. When,
a few days ago, I needed to know about open access in Chinese, I went to
the [English page on open
access](http://en.wikipedia.org/wiki/Open_access_(publishing)), and
clicked on the Chinese link, to the page
[开放获取](http://zh.wikipedia.org/wiki/%E5%BC%80%E6%94%BE%E8%8E%B7%E5%8F%96).

**Data extraction** One of the neat things about Wikipedia is that you
can download the whole database, and do fun things with the contents. In
fact, I tried doing this all the way back in 2007, which gave good
results, but I never did anything further (and didn't write it up, since
I was in Indonesia, and not blogging, at the time). Recently, a friend
of mine has been playing around with
[dictd](http://en.wikipedia.org/wiki/Dict) servers and files, and this
inspired me to take up what I had left.

Luckily, I had pasted the little code snippet I made back then into an
email to my friend, and I could find it easily. It worked without any
modifications. All I had to do was download the latest Chinese database,
an XML file containing all the articles (the file
[zhwiki-20090116-pages-articles.xml.bz2](http://download.wikimedia.org/zhwiki/20090116/zhwiki-20090116-pages-articles.xml.bz2)
in this [directory](http://download.wikimedia.org/zhwiki/20090116/); you
can find all the different databases at [Wikipedia
Downloads](http://download.wikipedia.org)). I then ran the Ruby script
below, to extract all the titles of articles, and their interwiki links,
to a separate, tab-separated text file:

  zh = File.open("zhwiki-20090116-pages-articles.xml")
  zhtitle = File.open("english-chinese.txt","w")
  title, entitle, hitcounter, counter = '','',0,0

  while true
    counter += 1
    if zh.readline.match(/\(.*?)\<\/title>/)
      title = Regexp::last_match[1]
    end
    if line.match(/\[\[en:(.*?)\]\]/)
      entitle =  Regexp::last_match[1]
      unless title.match(/^Wikipedia|^User|^Help|^[A-Za-z]/i)
        zhtitle << title << "\t" << entitle << "\n"
        hitcounter += 1
        if hitcounter == (hitcounter / 100) * 100
          puts "In #{counter} articles, found #{hitcounter}
  hits: #{hitcounter.to_f/counter.to_f*100}%."
        end
      end
    end
  end

This generates an output file that looks like this

--- ---
设计模式          Design pattern
中华人民共和国    People's Republic of China
克利斯登·奈加特   Kristen Nygaard
黑客              Hacker (computing)
林纳斯·托瓦兹     Linus Torvalds
理查德·斯托曼     Richard Stallman
自由软件基金会    Free Software Foundation
2003年7月         July 2003
操作系统          Operating system
--- ---

It's interesting to compare the statistics for this run, and for the run
I did in March, 2007. In 2007, the XML dump was 520MB, with 59,600 hits
(articles with interwiki links to English). In 2009, the XML dump is
1.1GB, with around 123,300 hits, ie. roughly double both the filesize
and hits in two years. As you can see from the small selection above,
not all of these are useful (dates, for example), but many are, and
would not be found in ordinary dictionaries.

**Transforming to simplified and traditional characters**The Chinese
Wikipedia contains articles written in both simplified and traditional
characters, and has a built-in facility to convert this on the fly, so
that a user can read everything in simplified or traditional according
to the settings. Converting from simplified to traditional and back is
not trivial, because there are a number of traditional characters that
all convert to the same simplified character, etc. Chinese Wikipedia has
come up with a great conversion database which deals with this, and once
again, we are able to download it and use it for our own purposes.

Back in 2007, a friend of mine downloaded this database, and converted
it to a sed script. [Sed](http://en.wikipedia.org/wiki/Sed) is an
extremely fast command line
[regexp](http://en.wikipedia.org/wiki/Regexp) search-and-replace program
for \*NIX (also built into OSX). The file looks like this:

s/幾畫/几画/g s/賣畫/卖画/g s/滷鹼/卤碱/g s/原畫/原画/g

each line is an instruction to do global search and replace on for
example 幾畫 (traditional) with 几画 (simplified). This is from the
traditional-\>simplified file, there is also a simplified-\>traditional
file. Note that sometimes the conversion isn't simply between
characters, but also between words, when different words are used in
mainland China and Taiwan. (Download
[cn-\>tw](http://reganmian.net/files/cntw) and
[tw-\>cn](http://reganmian.net/files/twcn) sed files).

So instead of having a file that mixed simplified and traditional
characters, we can easily generate one with simplified and one with
traditional, using sed:

  sed -f cntw english-chinese.txt > english-chinese.tw.txt
  sed -f twcn english-chinese.txt > english-chinese.cn.txt

Instead of doing all this yourself, you can directly download the entire
textfile in
[simplified](http://reganmian.net/files/english-chinese.cn.zip), or
[traditional
characters](http://reganmian.net/files/english-chinese.tw.zip) (or
[both](http://reganmian.net/files/english-chinese.zip), zipped).

**Using the file**With this simple file, you can already do a lot. The
simplest is to use [grep](http://en.wikipedia.org/wiki/Grep), a fast
command line tool that searches lines in a text file. To quickly search
for open access, I would use

  grep -i "open access" english-chinese.cn.txt

and get the following result:

开放获取    Open access

the *-i* means that grep ignores case differences. Note that on my Mac,
I cannot see Chinese characters in the terminal window (it might be
possible to fix with some settings). An alternative would be to do

  grep -i "open access" english-chinese.cn.txt > out.tmp

and then open out.tmp in a text editor that can read UTF8 (unicode).
Note that in many text editors you have to specifically ask to open the
file as UTF8.

This is cumbersome, but you can of course make different kinds of
interfaces to it.

**Web interface**One simple interface I made was a web interface.
Initially I simply ran the *grep* command through a Ruby wrapper, but I
realized that if I executed arbitrary text on the command line, people
could use it to infiltrate my server, so I changed to a very simple
search. Note that this is not indexed, and is extremely "inefficient" -
by putting this into a database, or using something like
[Ferret](http://ferret.davebalmain.com/), it would be extremely much
faster. But it works. Source:

  #!/usr/bin/env ruby
  require 'rubygems'
  require "fcgi"
  a = File.read("zhcn-en.txt")
  FCGI.each_cgi do |cgi|
    text = cgi['bigger']

    search = text.gsub(/\.html/,'')
    puts "Content-Type: text/html; charset=utf-8"
    puts "<html><head><title>#{search} |
  English-Chinese dictionary</title></head>"
    puts '<meta http-equiv="Content-Type"
  content="text/html;charset=utf-8" >'
    puts "<body>"
    puts "<h1>Search result for #{search}</h1><i>This is a
  simple search of a database extracted from the interwiki
  links of Chinese Wikipedia. shaklev@gmail.com</I><p>"
  puts "<table>"
    a.each do |line|
      if line.downcase.match(search.downcase)
        a,b=line.split("\t")
        puts "<tr><td>" + a + "</td><td>" + b + "</td></tr>"
      end
    end
    puts "</table>"
  end

I didn't bother writing a form page for it, but the API is extremely
simple: http://reganmian.net/en-zh/*searchword*. Here are some examples:

[http://reganmian.net/en-zh/Toronto](http://reganmian.net/en-zh/Toronto)
[http://reganmian.net/en-zh/open
access](http://reganmian.net/en-zh/open%20access)
[http://reganmian.net/en-zh/sex](http://reganmian.net/en-zh/sex)

One advantage of the simple search is that it accepts both English and
Chinese input, see for example:

[http://reganmian.net/en-zh/开放获取](http://reganmian.net/en-zh/开放获取)

**Redirects and disambiguation**When I initially entered "open access"
in English Wikipedia, I arrived at a [disambiguation
page](http://en.wikipedia.org/wiki/Dab_page) giving me
[links](http://wikipedia.org/wiki/open%20access) to different meanings
of the term, one of which, [Open access
(publishing)](http://en.wikipedia.org/wiki/Open_access_(publishing)),
was the one I wanted. It is also often the case that abbreviations,
people's last names, etc. are redirected to the full article name. I
figured it would be useful to have an index of all these disambiguations
and redirects, so that I could incorporate that in the database. If, for
example, NATO was a redirect to North Atlantic Treaty Alliance, I could
have both of those two words function as headwords for the same Chinese
term in the dictionary.

And if you looked up open access, I could have (publishing): Chinese
term, (infrastructure) different Chinese term, etc. The problem is that
I would have to sort through the English database to do this, and the
English dump is 7,8GB packed (probably something like 150GB unpacked -
pure text). There is also a dump of redirects, however that is just an
SQL dump, containing the ID of each article, and the title of the
redirect, thus I would have to first import the SQL dump of page titles
into a local SQL database. I tried, but it took for ever, and I gave up.
This is not impossible, but it will take more time and more programming.

**Other dictionary formats**Having a simple text file is great, you can
grep it, and even build simple interfaces, like the web interface I
mentioned above. But it would be great if we could also put this
database into different dictionaries and lookup programs that already
exist.

First I thought about [Wenlin](http://www.wenlin.com/). Although it is
proprietary, and has not been significantly updated for many years, it
is still a very powerful program, which I use frequently when reading
texts. I even made a
[screencast](http://reganmian.net/blog/2006/05/02/screencast-wenlin-helps-you-read-chinese/)
to showcase why I found it so useful. I wondered if it would be possible
to import this dictionary into Wenlin. Turns out there is a way to
import entries - you need to open a specially formatted textfile in
Wenlin, and then choose "import". I was lucky enough to find a very
interesting [German project](http://dewenlin.com/) to create a German
database for Wenlin, and they had a [text
file](http://dewenlin.com/liste.uni) that I could use as a model.

The format looks like this:

  cidian.db
  New or changed entries:

  *** 1 ***
  pinyin                      zàijūliú
  characters                  再拘留
  serial-number               1016904350
  reference                   vwu3184a1
  part-of-speech              v.
  environment                 law
  definition                  rearrest

With some experimentation, I found that the *serial-number* and
*reference* had to be there, but could be empty. *part-of-spech* and
*environment* were not necessary at all. However, I needed two things.
First of all, since simplified and traditional characters are not easy
to automatically convert, the program requires that you specify both
simplified and traditional characters. This was solved by using the
scripts above to generate one file for simplified and one for
traditional (the same content was on the same lines in each file, so it
would be easy to combine them).

In addition, Wenlin requires you to provide the pinyin for each word.
This is because some characters have multiple readings, so that it is
not easy to automatically generate (correct) pinyin for characters. I
didn't need this, but Wenlin required it, and it even checked to see
that each pinyin was a possible reading for the given Chinese character.
So I needed somehow to get all the words rendered in pinyin.

There are many services, and programs, that convert from Chinese text to
pinyin. However, I couldn't find any good command line tools. Command
line tools are very good when you are dealing with text files of many
megabytes! I tried pasting the text into textfields in Firefox, and in
stand-alone applications, and they all choked. Surprisingly, Wenlin
itself was able to open the large (around 4MB) file, and it actually has
a built-in conversion to pinyin. However, given that this cannot happen
automatically, it tags each character with multiple readings, and asks
you to select the correct one. I wasn't too preoccupied by having
correct readings, just having possible readings that would be accepted
by Wenlin would be enough, so I saved the result of the conversion
(which took a while). Some lines looked like this:

  lín nà sī·tuō 【◎Fix:◎wǎ;◎wà;◎wā】 【◎Fix:◎zī;◎cí】
  Linus Torvalds
  lǐ 【◎Fix:◎chá;◎zhā】 dé·sī tuō màn    Richard Stallman

And I had to use the search-and-replace with regexp function in
[TextMate](http://macromates.com/) to remove these options, leaving only
the first one (as I mentioned, my goal was not to choose the correct
reading, but a possible one).

Combining all three files, I generated the file in Wenlin's required
format, however because of all the space required per word, the file
became quite large, and Wenlin was unable to cope with it (in fact, even
trying to import 100 words automatically failed). I wish there was a
command line tool that enabled me to import large amounts of words into
Wenlin, but until then, I might have to give this venue up.

**Apple's Dictionary.app**Initally, I thought that Dictionary.app, which
is preinstalled on all Mac's, used dictd files, but it turns out they
use some Apple-specific format. Luckily, this is [well
documented](http://developer.apple.com/documentation/userexperience/Conceptual/DictionaryServicesProgGuide/Introduction/chapter_1_section_1.html),
and there are tools for generating these files included on in the
developer package. All you have to do is generate an XML file, which
looks something like this

  <?xml version="1.0" encoding="UTF-8"?>
  <d:dictionary xmlns="http://www.w3.org/1999/xhtml"
  xmlns:d="http://www.apple.com/DTDs/DictionaryService-1.0.rng">
    <d:entry id="mathematics1">
      <d:index d:value="mathematics" d:title="mathematics"/>
      <h1>mathematics</h1>
      <p>数学 (數學)</p>
    </d:entry>
    <d:entry id="philosophy2">
      <d:index d:value="philosophy" d:title="philosophy"/>
      <h1>philosophy</h1>
      <p>哲学 (哲學)</p>
    </d:entry>
  </d:dictionary>

Here is the script I wrote to generate this file:

  pinyin = File.open('english-pinyin.txt')
  cn = File.open('english-chinese.cn.txt')
  tw = File.open('english-chinese.tw.txt')
  result = File.open('MyDictionary.xml','w')
  result << '<?xml version="1.0" encoding="UTF-8"?>
  <d:dictionary xmlns="http://www.w3.org/1999/xhtml"
  xmlns:d="http://www.apple.com/DTDs/DictionaryService-1.0.rng">'
  counter = 0
  begin
    pinyin.each do |line|
      counter += 1
      b, english = cn.readline.split("\t")
      c, dummy = tw.readline.split("\t")
      english.gsub!(/\((.*)\)/,'')
      english.downcase! english.strip! ; b.strip! ; c.strip!
      result << "<h1>#{english}</h1>
      <p>#{b} (#{c})</p>
      </d:entry>"
    end
  rescue
  end
  result << "</d:dictionary>"
  result.close

After generating this file (you can download [an
example](http://reganmian.net/files/MyDictionary.xml.zip) here), and
editing the MyInfo.plist to reflect the name of the new dictionary, you
can run make, and it will churn through, compile the dictionary and
generate the index. The finished product ([example
here](http://reganmian.net/files/english-chinese.dict.zip)) can be
installed into your \~/Library/Dictionaries with the command *make
install* or manually, and ideally when you restart Dictionary.app, it
will show up.

However, when I compiled the dictionary, I got a number of error
messages

  """/Developer/Extras/Dictionary Development Kit"/bin"/
  build_dict.sh" "My Dictionary" MyDictionary.xml
  MyDictionary.css MyInfo.plist
  - Building My Dictionary.dictionary.
  *** Invalid index. Skipped -- entry[12504] index[<d:index
  d:value="" d:title=""/>](7 similar lines deleted)
  2009-02-16 18:47:30.507 add_supplementary_key[58407:10b] ***
  Terminating app due to uncaught exception 'NSRangeException',
  reason: '*** -[NSCFString characterAtIndex:]: Range or index
  out of bounds'
  2009-02-16 18:47:30.508 add_supplementary_key[58407:
  10b] Stack: (2520711435, (lots of numbers))
  /Developer/Extras/Dictionary Development Kit/bin/build_
  dict.sh: line 131: 58407 Trace/BPT trap          "$DICT_
  BUILD_TOOL_BIN"/add_supplementary_key <$OBJECTS_DIR/
  normalized_key_body_list_1.txt > $OBJECTS_DIR/normalized_
  key_body_list_2.txt
  *** Unknown format. Skipped [raphael  1222584 0  rapha]
  - Building key_text index.
  (things are good...)
  - Finished building ./objects/My Dictionary.dictionary.
  echo "Done."
  Done.

I am quite aware that I didn't read the specs for the file format very
carefully, but rather just threw together something that seemed to work
- but I must say that the message above is less than meaningful. The
actual result, is that a file is produced, and it does work well in
Dictionary.app, but it clearly does not contain all the words.

I am not quite enamoured with the Dictionary.app interface, since it
only shows a list of headwords, and you have to select a headword to see
the translation - different from how the website I mentioned does
things. However, it is extremely speedy, and it would be nice if I could
solve the problem above.

I might also try to convert the dictionary into an actual dictd file,
which should be easier. And I've even thought of merging it somehow with
CEDICT to get one large database (I found [some perl
scripts](http://www.math.umaine.edu/faculty/hiebeler/cedictscripts/)
that might help with this).

**Conclusion**This is how far I got in my amateur hacking this time,
before it was time to turn back to studies and "more important things".
It's interesting that I did a part of this work two years ago, when I
wasn't blogging, and therefore didn't document it. These days, I figure
I derive so much utility from other people's write ups about their
problems and solutions, and neat hacks, that I ought to share my stuff
with the world. Perhaps only a few people ever come across it, but to
them it might be very useful. Also it's a great personal archive of
things too - hadn't I found the script I wrote two years ago in GMail,
it might have been lost.

It also shows how useful semantically marked up data can be, especially
when a website allows you to download it's entire database and do fun
stuff with it, that they never even planned for. (Something similar was
the case when I made the [Indonesian mouse-over
dictionary](http://reganmian.net/blog/2006/05/03/indonesian-dictionarymouseover-terbang-dengan-bahasa-indonesia/)).
There's a large amount of useful tools out there, but they become much
more useful if you can run them in command line mode. And there needs to
be an easy to use, easy to create, and extract from, format for
dictionaries, that all applications can read. (Maybe dictd is it, I need
to learn more about it first).

Stian
