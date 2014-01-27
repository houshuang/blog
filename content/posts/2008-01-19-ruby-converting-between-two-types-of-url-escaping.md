---
title: "Ruby: Converting between two types of URL escaping "
created_at: 2008-01-19 00:00:00 -0500
kind: article
tags: languages, tech
---

I am playing around with my old scripts for repacking Wikipedia for
offline access, and ran it on the Norwegian database to see if they were
still working. I realized that they had changed the way they saved
filenames on the disk, which broke my program. I thought I’d post the
solution (which took me a few days to find) here, in case any one else
should have the same problem.

I did it! It was really weird - apparently I have to convert from
Unicode to ISO-8859-1 to get the proper string - I always thought the
Norwegian letters were represented in the same way, and looking at the
UNICODE pages, it looks like they are all given as 00 something, but
either way it works now.

As an example of the problem, the article about 1890-Årene is now stored
in no/1/8/9/1890-%E5rene.html (årene), but when I type in Årene in
Firefox, what actually gets requested is this: Sorry, article
1/8/9/1890-%C3%85rene.html not found. So both the request and the
filename is URL escaped, but they seem to be using two different kind of
encodings? Finally I figured out that it had something to do with the
difference of a ISO-8859-1 encoding escaped, and a unicode escaped
string. Don’t ask me why this problem occurred, but here is how I solved
it in Ruby (it works now).

This is the important line:

*def url\_unescape(text)\
 ..return CGI.escape(Iconv.new(’ISO-8859-1′,
‘UTF8′).iconv(CGI.unescape(text))).gsub(”%2F”,”/”)\
 end\
*

That’s a quite compact line, I will expand it to make it clearer.

*def url\_unescape(text)\
 ..\# first convert the URL into unicode (take away the hex)\
 ..a = CGI.unescape(text)\
 ..\# create an object which converts between ISO-8859-1 and unicode\
 ..uniconvert = Iconv.new(’ISO-8859-1′,’UTF8′)\
 ..\# use it to convert the text to ISO-8859-1\
 ..b= uniconvert.iconv(a)\
 ..\# now go back and escape out the ISO-8859-1 text so that it matches
the filename in the harddrive\
 ..c = CGI.escape(b)\
 ..\# unfortunately it also escapes the forward slashes in the path, so
we have to go back and put them in again\
 ..c.gsub!(’%2F’, ‘/’)\
 ..\# all done, send c back and let the program work with it return c\
 end\
*\
 Those two snippets do exactly the same thing
![:)](http://reganmian.net/blog/wp-includes/images/smilies/icon_smile.gif)

I am not sure if this will work on other operating systems (this is Mac
OSX).

Stian

(Update, I had some problems with the codeview plugin messing up my
browser when trying to edit this page - very strange, but I am reposting
it without nice formatting. The info is still there.)
