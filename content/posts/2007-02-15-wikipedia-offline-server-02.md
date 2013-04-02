---
title: Wikipedia Offline Server 0.2
created_at: 2007-02-15 00:00:00 -0500
kind: article
tags:
- opensource
- tech
---

With this, I am officially releasing the Wikipedia Offline Server 0.21
into the world (thanks Liam and Espen B-P for helping to test 0.1 and
0.2).

~~UPDATE: I’ve made a static page about the Wikipedia Offline Server,
and released version 0.22. Go to [the new
page.](http://houshuang.org/blog/wikipedia-offline-server)~~

UPDATE: The [new, significantly changed
project](http://gitorious.org/projects/zip-doc), now lives on
Gitorious.org.

~~[Download the
Wikiserver](http://houshuang.org/blog/wikiserver-021.zip)~~

Here are the release notes:

> The WIKIPEDIA OFFLINE SERVER (temporary name)
>
> This is a ruby script designed to enable you to browse offline
> HTML-dumps of the Wikipedia for any language (downloadable from
> http://download.wikipedia.org). The script uses 7zip to selectively
> uncompress only the files needed (it unpacks a few css files etc at
> the beginning), keeps a cache of all files already read, and
> implements an internal webserver (Webrick) which can be viewed at
> http://localhost:2000/wiki. Currently it is very unfinished, but still
> quite useable. I am putting it out there for people to try - and I
> think it could become a great tool with some help (especially with
> 7zip).
>
> THE PROBLEM WITH 7ZIP\
> ---
>
> The wikipedia-(language version)-html.7z is a compressed files that
> contains all the individual html files (generated from the Wikipedia
> sql) that make up a language wiki. This can run up to hundreds of
> thousands of files (or millions for the bigger Wikis). If we
> uncompressed these to the harddrive, they would take up very much
> space, both because they are big, and because there is a very large
> amount of small files, that still take up on block (depending on file
> system). We want to be able to use the 7zip file directly. Currently I
> use the off-the-shelf 7zip decompressor, but it’s slow. It was not
> optimized for finding one file within 100,000. Depending on your
> computer, on my 2 year old iBook it can take up to 14 seconds to
> locate one file from the Norwegian Wikipedia. This is independent of
> my script.
>
> Proposed solution: I am quite sure that it would be easy (a few hours)
> to use the freely available source code for 7zip to implement a small
> tool that indexes a 7zip compressed file (writes all the filenames,
> and their offsets, in a separate file). If we then modified the
> uncompressor so that it reads the offset from this file, and not by
> going through the entire file from start to finish, I think we could
> get the time to uncompress down to almost nothing. This would
> radically improve the useability of this project (and might be useful
> for other projects too). My problem is that I know nothing of C, and I
> don’t really have the time to learn. I would REALLY really appreciate
> some help here!!
>
> LIMITATIONS (UPDATE)\
> ---
>
> It seems that using links that have non-ASCII characters (including
> the last three in the Norwegian alphabet) do not work at all on Mac or
> Windows (could be my sh setup that is bad), but has been reported to
> work on Linux. Does this suck insanely? YES! Is it easy to fix? Not
> necessarily, because I need to get the unicode characters correctly
> from the webbrowser, to the webserver, through the commandline, to the
> 7zip commandline utility. This is obviously a high priority for me,
> also because it renders the Chinese stuff completely unusable. Note
> that it can display articles with unicode perfectly, just cannot deal
> with the filenames.
>
> Second limitation: No installation routine… But I’ll give you some
> hints.
>
> INSTALLATION\
> ---
>
> Nothing to it really, but you need a few things. Ruby and 7zip. After
> that, you should be able to run ruby wiki-html.rb from within the
> directory where the file resides, and if there are any
> “wikipedia-\*-html.7z” files present it will work. Use a web browser
> (I assume you can figure out how to download a web browser) to view
> http://localhost:2000/wiki and it will either show a list of available
> wikis (afterwards available through http;//localhost:2000/wiki\_list),
> or if there is only one wiki dump file present, it will display the
> start page for that wiki. Happy surfing (but be prepared to be
> patient).
>
> GETTING RUBY\
> ---
>
> If you are on Windows, and have not installed Ruby, do it now. The
> easiest is the One-click installer at\
>  http://rubyforge.org/projects/rubyinstaller/
>
> OTHER PROGRAMS\
> ---
>
> You also need 7zip. If you are on Mac, download p7zip from Sourceforge
> here:\
>  http://p7zip.sourceforge.net/
>
> If you are on Linux, your package manager should have it, or you might
> have it installed already (try typing 7z or 7za in a shell window).
>
> Note that the WikiServer expects you to have a program called 7za in
> the path. If you are on a PC, locate the executable 7z.exe in the 7zip
> folder in Program Files (or equivalent), and copy it to the path, or
> to the directory you are launching WikiServer from.
>
> On Mac and Linux, the ruby executable should already be in the path.
> If you are on a PC, you can add the ruby directory to your path, or
> just copy the source files you just got from me (and 7za) into the
> ruby/bin directory, and launch from there. (A messy, but simple
> solution if you want to try this out).
>
> GETTING DUMP FILES\
> ---
>
> Static HTML dumps, needed by the server, can be downloaded from
> http://static.wikipedia.org/. Currently the last is from November, but
> the December dump is in progress. Click on the Download link, choose
> your language, and download the filename ending in .7z. These should
> be in the same directory as the server files.
>
> THE WAY FORWARD\
> ---
>
> In addition to making this an easy to use way of viewing Wikipedia
> offline for Windows, Linux and Mac, I am also planning to make CD/DVD
> distributions that contain all the necessary programs (7zip, Ruby
> etc), and can run directly off the CD. (Ideally, I’d get the guys who
> sell pirated DVDs on street-corners in Indonesia to start hawking
> legal Wikipedia!). Before I start doing any of that though, I need to
> get the 7zip issue sorted out.
>
> For someone with another approach to packaging Wikipedia, have a look
> at the MoulinWiki: http://www.moulinwiki.org/.
>
> FEEDBACK, BUGS\
> ---
>
> Any feedback is welcome. This is very new, in progress, has barely
> been tested on other computers than my own (Mac and PC), and might
> very well not run on other configurations. Paste the output and email
> to me. Thanks.
>
> THANKS\
> ---
>
> Thanks a lot to Liam Doherty and Espen Beer-Prydz for helping me test
> the first version and giving me feedback on instructions on different
> platforms. Keep testing it guys!
>
> Stian, Jakarta, 2007 - shaklev@gmail.com

[Download the Wikiserver](http://houshuang.org/blog/wikiserver-021.zip)\
 Stian
