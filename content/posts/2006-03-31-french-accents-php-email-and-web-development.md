---
title: French accents, php, email and web development
created_at: 2006-03-31 00:00:00 -0500
kind: article
tags:
  - tech
---

(Geek alert). I have been working a lot on a website funded by CIDA,
which has to be bi-lingual, French and English. The pages use PHP, and I
ran into a lot of problems trying to reconcile French letters and PHP. I
googled around, thinking that surely these problems would be well
documented, but I didn’t find a very good comprehensive resource - maybe
because it’s only available in French. However, I thought I’d gather
some of my experiences here, to save other folks time.

First, just getting the French onto the website; if you cut and paste
French accented letters, they’ll look horrible. If you save the file as
unicode, they will look fine, BUT: PHP will crash! PHP is apparently
incredibly backwards when it comes to unicode (come on guys, it’s 2006!
26 letters is not enough anymore, and hasn’t been for like 20 years…)
The solution is to turn the page into so-called
[html-entities](http://en.wikipedia.org/wiki/HTML_entities), for example
to get Å’, you need to write Œ. Of course, changing this manually is a
real pain, especially if you like editing your pages in a text-editor
for maximum control. I wrote a little sed-script that does this
automatically, download it [here](files/french.sed).

The way to use it is to finish editing your file, say french.php, and
run\
 *sed -f french.sed french.php \> out*\
 and then\
 *cp out french.php*

This assumes that you are running a UNIX-based system (including Mac
OSX). If not, you can upload french.sed to your server, and run it there
(if you have shell access). Sed is just a simple program that is
included in most UNIX distributions, and french.sed is a simple file
containing which search-and-replace operations to be conducted. Just a
few lines, but I’ve used it a lot, and is highly useful.

For sending emails in French from a php-script, you need another method;
[quoted-printable](http://wikipedia.org/wiki/quoted-printable). This
looks like this: =F4, and you can use to transform any text to quoted
printable. If you have a lot of text, you can of course construct a
similar sed script, or I even think php has a built-in function. Either
way, it did the job for me. In addition, you need to add a few e-mail
headers. I figured this out simply by typing in letters with French
accents in Gmail, mailing it to myself, and then using Show original
(very useful!). Here is an example of a code piece that sends a French
e-mail from php:

*if (\$Language==&\#8221;French&\#8221;) mail(\$Email,”Merci”,”Nous vous
remercions pour votre inscription pour participer =E0 la Semaine
d’Action Mondiale 2006 de la Campagne Mondiale pour l’=C9ducation. Le
mat=E9riel de notre curriculum sera bient=F4t disponible en
ligne.”,”From: &\#8221;French is beautiful&\#8221; -Version: 1.0-Type:
text/plain; charset=ISO-8859-1-Transfer-Encoding:
quoted-printable-Disposition: inline”);*

the if() is of course only an example, \$Email should contain the
receiving email address, the following field is the subject, then the
message, and then the headers, including from.

Finally, as a bonus: Here is [a tiny
script](files/send_email_example.php.txt) that extracts records from a
MySql database according to a certain criteria, and sends all the people
a personalized email. Very simple, but it works. And **please** don’t
use this to spam anyone!

Stian
