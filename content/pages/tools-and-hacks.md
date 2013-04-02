---
title: Tools and hacks
kind: page
---
<img src="http://farm1.static.flickr.com/22/24938735_34aee474ae.jpg?v=0" alt="" width="450" height="340" />

Welcome to my tools page. This is a simple link to the various hacks that I come up with.

<strong>Wikipedia: language redirect</strong>
Example: <a href="http://reganmian.net/redir/en/zh/Hamar">http://reganmian.net/redir/en/zh/Hamar</a> (takes you to the article on Hamar (哈马尔) in Chinese Wikipedia.

Explanation: redir/from-language/to-language/article.

Example 2: <a href="http://reganmian.net/redir/it/ar/Democrazia">http://reganmian.net/redir/it/ar/Democrazia</a> (looks up democracy (ديمقراطي) in Arabic Wikipedia)

Rationale: Supposed to be used through for example a Firefox shortcut (<a href="http://reganmian.net/redir/en/zh/%s">http://reganmian.net/redir/en/zh/%s</a>) for your most common combination. I use it frequently for Chinese, when my friend tells me he just made a great page about Moscow, or to find out how they spell Plato.

<a href="http://reganmian.net/blog/files/redir.rb"><em>(source code)</em></a>

<em>(Update 23.11.2007: Fixed the code so that article names with spaces work again)</em>

<strong>Wikipedia: which language has the longest article</strong>
I, and many of my friends, speak more than one language. Wikipedia sometimes has surprising gems in some of the smaller languages, yet I find myself always going automatically to the English one (or the Norwegian one for Norwegian topics), thus missing out on the cases where other language versions (which I can read) have better articles.

Example: <a href="http://reganmian.net/bigger/en/no,da,sv,de,it/Democracy">http://reganmian.net/bigger/en/no,da,sv,de,it/Democracy</a> (will automatically redirect to the longest article about democracy in any of Norwegian, Danish, Swedish, German and Italian)

Explanation: bigger/language-from/languages-to-comma-separated/article-name

As the above, this is also supposed to be used for a Firefox shortcut, where you pre-program the languages you can understand. Of course size is not a perfect measure of the quality of an article, but it’s a quick proxy for where there is most interesting content.

I was initially reluctant to release this, as I was worried about the impact of WP’s servers (it has to hit every single language version once to get the size), however I now changed it to use HEAD to make its requests, so each request is just a few byte. Through my experience with redir, I know that not many people will use this, and if they do, that’s just an incentive for Wikipedia to implement something similar natively.

<a href="http://reganmian.net/blog/files/bigger.rb"><em>(source code)</em></a>

<strong>Hindi-English dictionary</strong>

Based on data from dict.org, Shabdanjali, and a database from a friend, all released under open licenses. This is an incredibly imperfect first attempt at creating a Hindi-English dictionary in StarDict format. (<a href="http://reganmian.net/blog/2008/01/20/release-early-release-often-hindi-english-stardict-dictionary/">Read more</a>).

<a href="http://reganmian.net/blog/files/hindi-stardict.zip">Stardict Hindi-English dictionary</a>
<a href="http://reganmian.net/blog/files/hindi.xdxf.zip">XDXF Hindi-English dictionary</a>
<a href="http://reganmian.net/blog/files/iscii2utf8.py">Python script to convert from ISCII to UTF8 (not written by me, BSD license) </a>

<strong>Offline Wikipedia viewer/random access compressed archive system</strong>

A ZArchive library function that enables you to store millions of text chunks in a bzip2/gzipped file, and random access them very rapidly. Used in a Wikipedia offline compressor (to process Wikipedia dumps) and a reader (runs as a webserver on localhost, enabling you to access entire Wikipedia versions offline). Written in Ruby. <a href="http://gitorious.org/projects/zip-doc">Available from Gitorious</a>.

<strong>Simple personal time tracker with Ruby and Growl</strong>

A set of scripts designed to use global shortcuts to easily and unobtrusively let you track how you spend your time on different projects while you're at your computer. (<a href="http://reganmian.net/blog/2010/04/29/personal-time-tracker-with-ruby-and-growl/">Read more</a>).

<a href="http://github.com/houshuang/Personal-time-tracker">Available from GitHub</a>.

<em>(Thanks to <a href="http://flickr.com/photos/pvera/">pvera @ flickr</a> for the photo)</em>