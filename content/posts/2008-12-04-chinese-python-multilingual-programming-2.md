---
title: "Chinese Python, multilingual programming #2"
created_at: 2008-12-04 00:00:00 -0500
kind: article
tags:
- china
---

**I got Reddit’ed!**

Two weeks ago I wrote a brief entry about the Chinese translation of
Python, with both Chinese function names and Unicode enabling you to use
Chinese identifiers. Not only did I get some good comments on the post
locally, but [it ended
up](http://www.reddit.com/r/Python/comments/7g2mz/chinese_python_translating_a_programming_language/?sort=controversial)
on [Reddit](http://reddit.com), which brought a small spike in traffic
(about 300 hits in two days) and a flurry of comments over at the
[Reddit
page](http://www.reddit.com/r/Python/comments/7g2mz/chinese_python_translating_a_programming_language/?sort=controversial).
Through the comments, I was also made aware of a number of other
initiatives. So I thought I’d pull in some of the most interesting
comments, and also some of the new neat projects I was made aware of.

**Translation, fractioning of the community**

[![](http://farm4.static.flickr.com/3073/3046267775_625c7f24cd_m.jpg)](http://farm4.static.flickr.com/3073/3046267775_625c7f24cd_m.jpg)[Turadg](http://aleahmad.net/turadg)
thought that it would be counter-productive to learn Python in Chinese
for someone who wanted to do programming, and noted that by using
Chinese identifiers but English function names (which is
[new](http://www.python.org/dev/peps/pep-3131/) in [Python
3.0](http://docs.python.org/3.0/whatsnew/3.0.html)) one could get close
to this result, he gives the example:

  # Standard Python by a Chinese programmer
  #!/usr/bin/env zhpy
  # 檔名: while.py
  數字 = 23
  運行 = True
  while 運行:
    猜測 = int(raw_input('輸入一個數字: '))

    if 猜測 == 數字:
      print '恭喜, 你猜對了.'
      運行 = False # 這會讓循環語句結束
    elif 猜測 < 數字:
      print '錯了, 數字再大一點.'
    else:
      print '錯了, 數字再小一點.'
  else:
    print '循環語句結束'
    print '結束'

I commented back that:

> “One important point is that as far as I understand, this functions as
> a pre-processor, “translating” the Chinese commands into English
> commands before compilation/running. Since there is a one-to-one
> correlation in this case, there isn’t any of the ambiguity or problems
> connected to Machine Translation. Thus, theoretically one could easily
> “translate” a Python program from/to Chinese.”

Indeed, [sujbarkale](http://www.reddit.com/user/surajbarkale/) on Reddit
tried using Google Translate, and got [this
result](http://xrl.us/ozqgt).

Over at Reddit, much of the discussion centered around the fractioning
of the global community if people started programming in Chinese Python,
wasting of effort on translating libraries that could have been used on
improving Python, etc. However, [Mark
Byers](http://www.reddit.com/user/MarkByers/) pointed out that “Telling
people what they can and cannot do goes against the Open Source
principle. If a Chinese child wants to learn programming without first
having to feel comfortable with technical English, more power to them.”

**Learning to program for children**

[![](http://farm3.static.flickr.com/2058/2210941843_3952c2762b_m.jpg)](http://farm3.static.flickr.com/2058/2210941843_3952c2762b_m.jpg)[Chromacode](http://www.reddit.com/user/chromakode/)
followed up with:

“I think it makes total sense to use a localized language for
programming *learning*, and then use the global “lingua franca” to
produce shared work. I agree with you that compatibility is key… it
would be pretty odd to live in a world where you had to translate
libraries to make them work (though if automated, this could be
interesting…).

I also think that serious programmers would probably gravitate naturally
to the English Python since it is so established.”

This was similar to my own thinking:

> “What I was thinking about was to use Python to teach simple logics
> and ideas to kids, most of whom might not go on to program (or if they
> ever picked it up later, would perhaps write in Ruby or in Javascript
> or some fancy newfangled language anyway). In that case, I think this
> might be a good idea. Some people argue that programming should be an
> obligatory class in school by now. Not a specific language, but the
> idea.”

Turadg also chimed in:

> “Thinking about it more, I’m not so sure what to expect. If you’re
> training people to code in Python, then I think getting them into
> English fastest is best. But if you’re training them in the concepts,
> the language doesn’t matter. So it really depends on what your
> learning goals are.”

and

> “Oh I get where you’re coming from now. If you just want them to “the
> simple logics and ideas to kids” then they shouldn’t have to learn
> English, however little, at the same time.
>
> I would go further though and say they shouldn’t have to learn any
> syntax at all. There are a number of introductory programming
> environments in which you create instructions by linking graphical
> symbols from a palette. This makes it impossible to make a syntax
> error and yet it is Turing-complete. The most successful such
> environment, to my knowledge, is the [Alice](http://www.alice.org/)
> project from Carnegie Mellon University.”

**Need more research (or to locate existing one)**

[![](http://farm4.static.flickr.com/3130/2423802887_b3c2056f84_m.jpg)](http://farm4.static.flickr.com/3130/2423802887_b3c2056f84_m.jpg)To
close that issue, I’d say that I’d really like to see some research on
children learning to program using languages based in English, or in
their mother tongues. Two concepts would be important, first: is there a
big difference in the rapidity and quality of their learning if they are
learning beginning programming with say English Python or Chinese Python
(or Hebrew Python for Israeli kids, etc)? How large is this difference?
Secondly: How long does it take for the students who started with
Chinese or Hebrew Python to “catch up” with the ones who started out
with the English version?

Perhaps the ones starting with English Python will learn roughly as
rapidly as the ones starting with Chinese Python, and the group starting
with Chinese Python will never be able to catch up in using the English
version (because the kids using the English version are constantly
improving as well - moving target). Or, perhaps the kids using the
Chinese version learn the concepts much faster, and are able to
translate these to English, and thus after a period of let’s say one
year of using Chinese Python and two months of using English Python
could be on par or ahead of students using only English Python.

(Note that if all you are looking for is to teach general logics to
young kids, the second results might not matter. If you are training
kids to become programmers, the second results would be the most
important.)

I tried a quick Google Scholar search, but could not easily find any
research related to kids learning programming through “translated”
programming languages.

**Not just Chinese, not just Python!**

Finally, I was made aware that this project is far from unique - in fact
there has been a lot of different attempts at “non-English programming
languages”, some serious and some in jest.
[Lorg](http://www.algorithm.co.il/blogs/) commented on my blog and made
me aware of [Hpy](http://pypi.python.org/pypi/hpy/0.2), a translation of
Python into Hebrew. Here’s a
[screencast](http://www.youtube.com/watch?v=jZEx9JCsQCw) of someone
writing in Hpy in Gedit.

And [Shmurk](http://www.reddit.com/user/Shmurk/) mentioned [this
list](http://en.wikipedia.org/wiki/Non-English-based_programming_languages)
on Wikipedia, with a lot of different examples, including
[“Perligata”](http://www.csse.monash.edu.au/~damian/papers/HTML/Perligata.html),
a version of Perl that uses the conjugations of verbs in Latin quite
cleverly, like this:

The Sieve of Eratosthenes is one of oldest well-known algorithms. As the
better part of Roman culture was “borrowed” from the Greeks, it is
perhaps fitting that the first ever Perligata program should be as
well:\
 The Sieve of Eratosthenes is one of oldest well-known algorithms. As
the better part of Roman culture was “borrowed” from the Greeks, it is
perhaps fitting that the first ever Perligata program should be as well:

  #! /usr/local/bin/perl -w
  use Lingua::Romana::Perligata;

  maximum inquementum tum biguttam egresso scribe.
  meo maximo vestibulo perlegamentum da.
  da duo tum maximum conscribementa meis listis.

  dum listis decapitamentum damentum nexto
      fac sic
        nextum tum novumversum scribe egresso.
        lista sic hoc recidementum nextum cis vannementa da listis.
      cis.

*The use Lingua::Romana::Perligata statement causes the remainder of the
program to be translated into the following Perl:*

  print STDOUT 'maximum:';
  my $maxim = ;
  my (@list) = (2..$maxim);

  while ($next = shift @list) {
    print STDOUT $next, "\n";
    @list = grep {$_ % $next} @list;
    }

Lot’s of fun all around.

Stian\
 *Pictures by [orcmid](http://flickr.com/photos/orcmid/) @ flickr,
[dulk](http://flickr.com/photos/11527081@N05/) @ flickr and [Shane
Pope](http://flickr.com/photos/shanepope/) @ flickr. Thanks.\
*
