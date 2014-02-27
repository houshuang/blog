---
title: Pick out text based on formatting, OpenOffice/Ruby trick
created_at: Fri, 11 Apr 2008 15:12:00 +0000
kind: article
tags:
  - personal
  - tech
---

I am currently finishing up my research on community libraries in
Indonesia, and one of the interesting aspects is how they name
themselves - very few choose to call themselves libraries, with Taman
Bacaan (reading garden) being the most common, but far from only
appellation. I thus wanted to find some statistics, and decided to
examine [this
list](http://www.1001buku.org/index.php/Indonesia/Jaringan%20Perpustakaan/Daftar%20Perpustakaan/291.html).
It has a list of libraries, with names in bold, one line of code, and
one line of address.

I copied and pasted the list to NeoOffice, but that lost formatting. I
then opened the HTML file directly, which conserved formatting. Search
and replace with format works great, but it only seems to allow me to
replace with different formatting… I can’t really do something about the
text that is formatted so? My idea was either to do a query that would
delete all text that was not bold, or to insert for example 000 in front
of all lines that were bold (so that I could later sort the lines, and
have the bold ones come to the top. This might be possible, but if it
is, I don’t know how.

Final solution: Export the document as xhtml (actually I just realized
you can do this on the original HTML as well, but this is what I ended
up doing), and write a quick Ruby script that spits out only the
contents that is bold:

***File.read(”test.xhtml”).scan(/&lt;span
class=&\#8221;T8&\#8221;\>(.\*?)&lt;/) { |hit| puts hit }***\
 And voila.

(Note, if I was editing the pure HTML text in OpenOffice, I am sure I
could construct an OpenOffice regexp that would let me do this. But
somehow my mind is much more amenable to the “for each entry that fits
this regexp criteria, give me the entry and let me do something with
it”, then having to write the entire thing in regexp.)

This is why I am *really* looking forward to Ruby scripting within
[](http://www.koffice.org/kword)KWord. Of course I don’t know how much
they’ll expose, and if I would be able to do such a query wihtout
converting it to HTML/XHTML first.

Stian

(PS: I am hoping that the next version of WordPress has a better editor,
this one has very few inline functions (even PRE is not available in the
WYSIWYG), and when I switch between Code and Visual it messes up my
posts. Not to mention if I embed Youtube videos.)
