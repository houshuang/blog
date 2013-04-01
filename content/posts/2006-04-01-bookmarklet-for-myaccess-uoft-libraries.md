---
title: Bookmarklet for MyAccess, UofT libraries
created_at: Sat, 01 Apr 2006 00:14:00 +0000
kind: article
tags:
- canada
---

I really should be studying, but I made my first bookmarklet. The
problem I tried to solve: When students of University of Toronto sit at
home using Google Scholar to search for, say, information on the text
book publishing industry in Swaziland, they often arrive at articles
that are subscription only. However, usually they do have access to
these through the library, using a system called MyAaccess. For most
webpages, especially JSTOR and Ingenta Connect, adding
.myaccess.library.utoronto.ca to the domain works, for for example if I
find a JSTOR article with the following URL:

http://links.jstor.org/sici?sici=0010-7484…\
 you change it into\

http://links.jstor.org**.myaccess.library.utoronto.ca**/sici?sici=0010-7484….

and voila, it works. A bit annoying however; and no longer necessary.
Drag this bookmarklet:
[MyAccess](javascript:c=document.location.href;a=c.split('/');document.location='http://'+a[2]+'.myaccess.library.utoronto.ca'+c.substring(a[2].length+7,c.length);)
to your toolbar (should work for most browsers), and just click that
when you’re at a JSTOR or Ingenta page (might work with others). Pure
magic.

I know that with for example SpringerLink, which keeps coming up with
good articles, it doesn’t work. If I have time one day, I might sit down
and make a more sophisticated version. For now, have fun.

Stian
