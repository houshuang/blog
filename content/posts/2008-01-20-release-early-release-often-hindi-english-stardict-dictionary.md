---
title: "Release early, release often: Hindi-English StarDict dictionary"
created_at: Sun, 20 Jan 2008 17:27:00 +0000
kind: article
tags: India, languages, tech
---

I’ve always loved dictionaries, and especially the mouse-over ones - I
did [a brief screencast of
Wenlin](http://reganmian.net/blog/2006/05/02/screencast-wenlin-helps-you-read-chinese/),
and hacked up my own little [Indonesian
dictionary](http://reganmian.net/indonesian) when learning Indonesian.
Currently I am learning Hindi, so of course I had to go out and
investigate the tools available. Turns out that there’s not that much.
[Shabdkosh](http://www.shabdkosh.com) is a great online dictionary,
being continually improved by users, however you have to actually go to
the site to conduct a search. What I really wanted was a mouseover
dictionary.

I found [TranslateIt!](http://www.gettranslateit.com/mac/), a program
similar to [StarDict](http://stardict.sourceforge.net/) that works on
Mac, and integrates very well with all Cocoa applications, enabling you
to both do normal searches, but also mouseover. Because it is compatible
with the StarDict dictionary format, there is a huge array of
dictionaries available for use. TranslateIt! itself seems to be made by
a Russian company, and comes with very good dictionaries for Russian -
and it even does inflections (since most Russian words tend to be
heavily conjugated, this is key). This solved one long-standing need of
mine - I speak some Russian, after having travelled there several times,
and even attended the [Russian People’s Friendship
University](http://www.rudn.ru/eng/dep.php) (Университету дружбы
народов) in Moscow for a month, and I often thought that if I had such
an application and could actually read Wikipedia, Russian blogs etc, I’d
get back into it.

So the hunt was on for a Hindi-English dictionary in StarDict format.
Turns out all I could turn up were English-Hindi dictionaries, and in
different formats. Finally, I took three English-Hindi dictionary files,
all under an open license: one that I received from a friend doing
research in machine translation, one generated from
[dict.org](http://www.dict.org), and
[Shabdanjali](http://www.iiit.net/ltrc/Dictionaries/Shabdanjali/dict-README.html).
Shabdanjali had to be converted first from
[ISCII](http://en.wikipedia.org/wiki/ISCII) using a Python script. Then
I wrote a hackish Ruby script (Ruby just excels at these quick one-off
scripting jobs) that read the files that each had different (text-)file
formats and reversed them into Hindi-English.

Reversal is absolutely non-trivial. At the simple side, you might have a
file listing a bunch of simple word-word concurrances:

```
House-Haus
Boy-Junge
```

etc. In this case, it’s quite easy to turn around. But more commonly, a
simple word will have either a definition (Zulu - a people in Southern
Africa), or several different options, or a sentence fragment (Schreiben
- to write), which is unhelpful because we are looking to make a
dictionary that will actually match specific words in a text. One of the
things I did was splitting up the listings in the target language (which
became the source language), so that

```
boy - knabe; junge
```

would generate two entries

```
knabe: boy
junge: boy
```

since a lot of hindi verbs are complex, with the most meaningful part
coming first, I also split all multi-word phrases at the first word, but
included the whole in the explanation, so that

```
starting - shuru karna* (शुरू करना)
```

would become

```
shuru - (shuru karna) starting
```

this hopefully maximizes the chance that you will hit right, even if
what’s written is for example shuru kijie (please start - शुरू कीजिये).
And when the match is all wrong, you’ll be able to see it from the
context. Indeed the result is very far from perfect, but it’s sometimes
helpful, and even when it’s way off, you can often understand the
meaning from looking at the context (this is meant for someone who
already knows some basic Hindi to aid in their reading of complex texts,
not enable you to read Hindi from scratch). It’s certainly low quality,
but I believe in putting things out there, instead of keeping it to
myself. Maybe I will be able to improve it later on.

Having the word list unified and reversed, I still had to generate a
StarDict file, which didn’t seem easy, so when I realized that
TranslateIt! included a DictBuilder which could convert
[xdfd](http://en.wikipedia.org/wiki/XDXF) files, I decided to generate
them with my Ruby script. The DictBuilder is a bit weird, first you have
to “unpack” the xdxf file, which creates one file for each word in a
directory (can easily be 40-50.000 files), and then it reads in all
those files again to convert them to StarDict format. One would think it
would be an easier way, but it does work.

If I were able to make some rules, I could improve the matching a lot as
well. Hindi conjugations are mostly quite regular, and I wouldn’t need a
lot of transformation rules to cover most of it (-iyan (-इयाँ) -\> -I
(-ई)) for female plural to female singular, f.ex.). The other thing is
that there are several sounds in Hindi that can and are spelt in
different ways - for example whether using a bindi or a half n to
nasalize (Hindi: हिन्दी/हिंदी) etc, which could also be taken care of in
a rule-based system.

I would also love to incorporate an actual Hindi-English dictionary
instead of what I have been able to hack up. Shabdkosh is great for most
purposes, but not free or downloadable, although they say they are
talking about that changing.

Download the StarDict and the xdxf (XML-based, better for editing, etc)
files:

- [Stardict Hindi-English
dictionary](http://reganmian.net/files/uploads/hindi-stardict.zip)
- [XDXF Hindi-English
dictionary](http://reganmian.net/files/uploads/hindi.xdxf.zip)
- [Python script to convert from ISCII to UTF8 (not written by me, BSD
license)](http://reganmian.net/files/uploads/iscii2utf8.py)