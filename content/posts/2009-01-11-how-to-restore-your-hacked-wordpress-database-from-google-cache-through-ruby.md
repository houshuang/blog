---
title: How to restore your hacked WordPress database from Google Cache through Ruby
created_at: 2009-01-11 00:00:00 -0500
kind: article
tags: Application programming interface, personal, tech, TextMate, WordPress
---

So my website [got
hacked](http://reganmian.net/blog/2009/01/11/blog-hacked-returns-from-the-dead/),
and I lost my entire [WordPress](http://wordpress.org "WordPress")
database. I realized that I could find most of the information through
[Google](http://www.googleguide.com/cached_pages.html)[Cache](http://www.googleguide.com/cached_pages.html),
but did not look forward to the prospect of copying and pasting over 200
articles. So I thought I'd try to do it in an automated fashion - and I
was successful. I will describe in detail how I proceeded here, and many
of these methods can be adapted for other purposes as well. I will
describe how I proceeded using tools like
[TextMate](http://macromates.com/) (only for Mac, but similar programs
exist for Windows and Linux), [Ruby](http://www.ruby-lang.org/en/) (all
platforms) and some Unix tools (Mac and Linux have them natively,
Windows can get them through [Cygwin](http://www.cygwin.com/)).

The first thing was downloading the information from Google. I began by
doing a site search (site:reganmian.net/blog) on Google. I got several
pages worth of hits, and used a wonderful plugin called
[Antipagination](http://blog.andreineculau.com/2008/06/repagination/)
for Firefox. It allows me to right-click on the "Next" button at the
bottom of the screen, and choose "load all". It will then load every
single web page under each other in the same tab - it has to be seen to
be believed. After all the 7 pages of Google hits (50 hits per page) had
loaded, I saved the page as an html file.

This html file of course has a lot of superfluous material - all we
really need are the URLs to Google's cached versions of my pages. A
quick way of picking out only the lines we want is to use grep, a
command line tool. If we save the list of URLs to filelist.html, we can
for example run ***grep reganmian.net filelist.html \>
filelist2.html***. This will choose only the lines that contain
reganmian.net (the name of my website), and put them in the new file
filelist2.html (note that you should never have the same file on both
sides of the \> sign). If you want to exclude certain lines (for
example, Google might also have listed a bunch of files ending in
/trackback or /comments, or /feed, which might not be useful to you),
you can also use grep -v, which only outputs the lines not matching the
search string. (For example grep -v trackback filelist2.html \>
filelist3.html).

Now, I open filelist3.html in TextMate. TM is a great editor, with a
very powerful regexp system. [Regular
expressions](http://en.wikipedia.org/wiki/Regexp) are a very powerful
way of manipulating text, but it can seem quite baffling at first.
Luckily, you only need to understand a few simple ways of using them -
and I find it a lot easier to do a few different regexps in TM to get
what I need done, than to try to craft "the ultimate" Regexp that does
everything at once. (This is why I also often use grep, when I just want
to select certain lines).

Basically, we want to isolate the cache URLs, so we have to look through
the file and see what unique section comes immediate before the URL. We
can then delete everything up to the URL. Go to find and replace, check
"use regexps". Let's say that the line looks like this (very
simplified):

*Entry: Reganmian (cached) http://google.cache.com/reganmian (url)
http://reganmian*

We want the line to only contain http://google.cache.com/reganmian.
First we remove the first part: search for \^(.*)cached)*and replace
with nothing (ie. remove it). Then we remove the end: search for
*(url)(.*) \<  / *s**t**r**o**n**g* \>  \<  / *e**m* \> *a**n**d**a**g**a**i**n**r**e**p**l**a**c**e**w**i**t**h**n**o**t**h**i**n**g*. ^*m*^*e**a**n**s**t**h**e**b**e**g**i**n**n**i**n**g**o**f**a**l**i**n**e*, *a**n**d*
the end, so the first selectes everything between the beginning of the
line, and the search string, etc. Holding *alt* down while selecting
with the mouse also enables block-select, which is a great way of
removing text, if the lines are aligned.

After playing with the different tools in TextMate to "clean up" the
text, we should have a text file only containing a list of URLs, all of
which we wish to download. Then it's time for the superb tool
[wget](http://www.gnu.org/software/wget/). It's extremely powerful, but
now we will only use a small subset of the features. ***wget -i
filelist3.html*** will download every single URL listed in that file.

However, Google does not like "robots" to download files, and based on
the "[user agent](http://en.wikipedia.org/wiki/User_agent "User agent")
string" which says "I am wget, and I would like this file", it will
refuse all the requests. Luckily, wget knows how to lie. With this
slightly longer line ***wget --user-agent="Opera/9.25 (Windows NT 6.0;
U; en)" -i filelist3.html***, wget will pretend to be Opera, and Google
will believe it, and let us download the files. However, it's not quite
over yet, because Google also becomes suspicious if you download too
many files at once. In my case, it stopped me after 150 files, and
called me a robot to my face. Luckily, a quick reboot of the cable modem
gave me a new [IP
address](http://en.wikipedia.org/wiki/IP_address "IP address"), and I
could get the last files. Another option might be to increase the delay
between each file in wget's options.

Now we have all the files. Unfortunately, they have horrible names based
on the URLs, with all kinds of strange characters, that don't play well
with other programs. I used [Name
Mangler](http://www.manytricks.com/namemangler/) to rename the files to
001.html, 002.html, etc. (Using Automator.app doesn't seem to work,
because of all the strange characters).

If we just wanted a small archive of our writings, we could stop at this
point. However, we don't simply want to preserve the old pages, we want
the information back into the database so that WordPress can display it
dynamically, by category, by date, etc. This requires us to extract the
relevant information from each page, and insert it into a WordPress
database. For this, we will use Ruby.

The task is actually not that difficult, although it took me a few
hours, both because I program in Ruby so seldom that I often forget the
syntax for different commands, and because this kind of automatic text
extraction is always a bit tedious. I could have tried to insert the
data directly into the WordPress database using SQL, but it is much
easier to use the
[XML-RPC](http://en.wikipedia.org/wiki/XML-RPC "XML-RPC") interface
[metaWeblog](http://www.xmlrpc.com/metaWeblogApi) to let WordPress
update its own database (the same API that offline blog clients use).

Ruby has built-in support for XML-RPC, and I found some examples of
using this with WordPress, but they didn't show all the options, and I
spent some more time trying to figure out how to include the categories
(which you have to create first on the blog), and change the posting
date (so it doesn't look like they were all written today). One thing
that metaWeblog doesn't seem to support, is to change the "slug" for a
post (the short web friendly name that is a part of the URL). This was a
bit important for me, because I really wanted to keep the same
permalinks as before, since there are already some places out there
linking to certain posts. Luckily, almost all of the permalinks were
automatically generated from the title when I wrote them, and with the
right date, the resulting permalink should be OK. But there are a few
that I changed manually, and they will now have a different permalink.

While I was experimenting with the Ruby script, I used
[MAMP](http://www.mamp.info/), a neat all-in-one LAMP suite for Mac, to
run WordPress locally and play with its database there. In the end, I
had a script that would automatically insert every single of the blog
posts into the database, when run. Here it is (it is extremely ugly, and
coded to be used only once. There are probably much more elegant
solutions, but it works. And maybe you can copy a snippet from it.)

  require "xmlrpc/client"
  c = 0        
  while c < 259 do # number of files
    c = c + 1
    text = File.read("#{sprintf("%03d", c)}.html")
    begin # not all of the files are blog posts, some are 
      # category pages etc. If they don't fit our pattern, 
      # just skip them
      a = text.scan(/base href\=\"http:\/\/reganmian.net\/
        blog\/(.+?)\/(.+?)\/(.+?)\/(.+?)\/\"/) 
      year, month, day, shorttitle = a[0] 
      title = text.scan(/Blog Archive   \&raquo\; (.*)
        \<\//)[0][0]
      cat = text.scan(/is filed under(.*)\n/)[0][0] 
      categories = cat.scan(/tags\/(.+?)\//)
      hour, minute = text.scan(/on (.*)at (.+?)\t/)
        [0][1].split(":")    
      pubdate = Time.local(year,month,day,hour,minute,0)
      content = text.scan(/entrytext\">(.+?)\<script/m)
        [0][0].strip
      server  = XMLRPC::Client.new("reganmian.net", 
        "/blog/xmlrpc.php")
      content = { :title => title, :categories => 
        categories.flatten, :category => categories.flatten, 
        :description => content,  :dateCreated => pubdate, 
        :lastBuildDate => pubdate }
      result  = server.call("metaWeblog.newPost", 1, "admin", 
      "password", content, true)
    rescue
    end
  end

Not perfect, but it worked. The only problem is that the number of posts
imported is slightly smaller than the one I had previously, so I will
eventually have to "hunt down" the remaining ones, perhaps from other
sources. I also tried Yahoo Cache, which gave me slightly more files,
but they seemed to be poorly formatted and more difficult to use.

I hope this could be useful to someone in the future. But hopefully you
will not need it - backup! It was an interesting project though, and I
am always amazed by the power of simple tools, as well as some of the
libraries people write for Ruby. And the incredible documentation that
is available out there. Hopefully this will be a modest addition.

Stian

[![Reblog this post [with
Zemanta]](http://img.zemanta.com/reblog_e.png?x-id=98412b2e-035e-4852-b952-deb9428037fc)](http://reblog.zemanta.com/zemified/98412b2e-035e-4852-b952-deb9428037fc/ "Zemified by Zemanta")
