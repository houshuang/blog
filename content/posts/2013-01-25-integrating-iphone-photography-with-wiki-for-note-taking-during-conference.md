---
title: Integrating iPhone photography with wiki for note-taking during conference
created_at: 2013-01-25 00:00:00 -0500
kind: article
tags: academia/research, conference blogging, devonthink, dokuwiki, evernote, FORCE11, iphone, open access, photostream, Researchr, researchr, tech
---

**Developing Researchr - two converging strands**

The development of
[Researchr](http://reganmian.net/wiki/researchr:start), the open
academic workflow, began from two different angles. I began thinking
about highlighting text, and extracting those highlights, and then doing
something about them, because I got my first Kindle (the Keyboard one).
It enabled quick highlighting, and all the highlighted text was copied
into a file called My Clippings.txt, which could be accessed through the
USB channel (clippings for books bought at Amazon are also available
through a web interface).

I ended up transferring lots of academic articles to my Kindle, and
taking hundreds of clippings, and then wondering about what I should do
with these. I discovered
[rb-appscript](http://appscript.sourceforge.net/rb-appscript/), which
enabled me to remote control other Mac applications through Ruby, and
initially began by importing the clippings into
[DevonThink](http://www.devontechnologies.com/products/devonthink/overview.html).
I then began thinking about ways of publishing my clippings online, and
wrote some scripts that turned DevonThink (and later Scrivener) exports
into browseable web pages, and used this to publish [all the notes from
my MA
thesis](http://reganmian.net/blog/2011/05/18/all-the-raw-notes-from-my-ma-thesis-chinese-national-top-level-courses/ "All the raw notes from my MA thesis: Chinese National Top Level Courses").

[![Screen Shot 2013-01-25 at
20.10.20](http://reganmian.net/blog/wp-content/uploads/2013/01/Screen-Shot-2013-01-25-at-20.10.20.png)](http://reganmian.net/top-level-courses/scrivener-web/)

At the same time, I was interested in a tool to let me take notes during
conferences, and I stumbled upon DokuWiki. I had used it before, and
loved the idea that it didn't rely on a database server, rather storing
all the pages in simple text files with wiki markup. This meant that I
could simply use rsync to mirror online a version of the wiki, while
hosting the main version on my own computer (crucial for use during
conferences, with poor connectivity). I [used this the first
time](http://reganmian.net/wiki/aera11:start) during AERA in New Orleans
in 2011, and since then I've used it during a number of
[conferences](http://reganmian.net/wiki/conferences).

After I came home, I realised that I could also take notes and extract
them into text format from [Skim](http://skim-app.sourceforge.net/),
that I could import these to DokuWiki, instead of to DevonThink, and I
began experimenting with BibDesk, and automatically generating citation
data using the amazing
[bibtex-ruby](https://github.com/inukshuk/bibtex-ruby) and
[citeproc-ruby](https://github.com/inukshuk/citeproc-ruby) libraries.
From there, there was no way back :)

**Adding images to wikis**

I eventually developed a very efficient way of importing text to the
wiki, whether it be clippings or my own notes when reading PDFs or
Kindle documents, clippings from other websites, etc. However, there was
no easy way to bring pictures into the wiki, and whenever I came across
a great illustration, a graph or a diagram in an article, I thought that
my corresponding notes would be the poorer for not including this.
Traditionally, it has been a bit of a hassle including graphics in
wikis, because they have been treated as their own elements. On
Wikipedia, for example, you typically go to Wikimedia to upload a media
file, specifying copyright information, description, etc, and then you
use a code to embed it in your wiki page. While important for a big
public wiki, this was a lot more cumbersome than I wanted.

There were two problems: Getting a picture out of a PDF, and into the
wiki. The first problem had several solutions. I thought about drawing a
square on the page, and then letting the export process get the
coordinates, and try to extract the picture from those coordinates in
the PDF. This might be possible (and might be an even more elegant
solution in the long run), but I never got that far. I fell back on a
built-in functionality in OSX that I love: partial screenshots.
Shift+Cmd+3 takes a screenshot of the whole screen, and Shift+Cmd+4
let's you select a portion of the screen. Crucially, it doesn't ask you
where to put them, but simply names them in a consistent manner, and
dumps them into your Desktop folder.

[![Screen Shot 2013-01-25 at
19.32.57](http://reganmian.net/blog/wp-content/uploads/2013/01/Screen-Shot-2013-01-25-at-19.32.571.png)](http://reganmian.net/blog/wp-content/uploads/2013/01/Screen-Shot-2013-01-25-at-19.32.571.png)

So I developed the following workflow for grabbing photos from PDFs.
While reading along, highlighting and commenting, I could grab a picture
at anytime using Shift+Cmd+3. After grabbing the screenshot, I also had
to press Ctrl+Alt+Cmd+C, which would simply add a line to a cache file
noting the page location I was on, and the name of the most recent
screenshot in the Desktop folder.

Then, when exporting to the wiki, it would read the cache file, move
each file into the correct wiki folder, and insert the corresponding
wiki image link into the article page. It works great, and if you look
at my [Bibliography](http://reganmian.net/wiki/bib:bibliography), all
the articles with an I have images, which are placed at the bottom of
the page
([example](http://reganmian.net/wiki/ref:bergstrom2011encouraging#images)).

With this, it was a simple next step to add a keyboard shortcut to wiki
editing, Ctrl+Alt+Cmd+C when editing a wiki page moves the most recent
screenshot into the wiki, and inserts a wiki link at the cursor. I use
this frequently when for example editing [author
pages](http://reganmian.net/wiki/a:start)
([example](http://reganmian.net/wiki/a:gerry_stahl)).

**Using the iPhone to insert photos live during conferences**

[Bodong](http://bodongchen.com/) is another PhD student at OISE. He is
currently using [a version of Researchr](http://bodongchen.com/wiki/) on
a PC, but during ICLS 2012 in Sydney, he chose to [take notes using the
Evernote app on his
iPad](https://www.evernote.com/pub/dirkchen/icls2012). I've never quite
understood people who are able to type that confidently on a
touch-screen, but one thing that really impressed me was that he could
type some text, raise the iPad and take a photo of the speakers, or
slides, the photo would be inserted exactly where the cursor was, and he
could continue to type.

[![Screen Shot 2013-01-25 at
20.07.40](http://reganmian.net/blog/wp-content/uploads/2013/01/Screen-Shot-2013-01-25-at-20.07.40.png)](https://www.evernote.com/pub/dirkchen/icls2012)

I recently got an iPhone and have been using it to take a lot more
photos than I used to. With the new
[PhotoStream](http://www.apple.com/ca/icloud/features/photo-stream.html) pictures
you take automatically arrive on your other devices, without needing to
plug in or sync, making it much easier. This made me think that it might
be possible to integrate iPhone photos into note taking in DokuWiki.
Apple just wants you to access your PhotoStream from within iPhoto, but
since it's so tightly integrated with the operating system, you don't
need to have iPhoto open for the photos to be downloaded, they are
stored in the folder \~/Library/Application
Support/iLifeAssetManagement/assets/sub.

And once you have the photos on computer, it is as easy to insert them
into a wiki page as inserting a recent screenshot. However, the problem
was knowing when a new photo had arrived - it's fairly fast but not
simultaneous (some experimentation showed that I had to exit the photo
app before the photos are uploaded). Since the insert command
automatically moves and renames the photos, executing it when the photo
you want has not arrived yet, will move and link in an old photo, which
is not what we want.

I solved this in two ways. One was by adding a "preview" function, which
uses qlpreview (similar to pressing space over a file in Finder) to show
which file will  be insert when you give the insert command. The second
was to write a little ["photostream-watch"
script](https://github.com/houshuang/folders2web/blob/master/watch_photostream.rb),
which watches the director, and posts a growl with a little icon of the
photo, whenever a new photo is downloaded from Photostream.

[![newphoto](http://reganmian.net/blog/wp-content/uploads/2013/01/newphoto.png)](http://reganmian.net/blog/wp-content/uploads/2013/01/newphoto.png)

(I also use
[sips](https://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man1/sips.1.html) to
resize the photos, since they usually arrive as 2-3MB files. I also need
to rotate them if the metadata indicates a need (ie. you held the iPhone
in the wrong direction), but I haven't figured this out yet).

**It works**

[![Long wiki
page ](http://reganmian.net/blog/wp-content/uploads/2013/01/Long-wiki-page.png)](http://reganmian.net/wiki/media_pedagogy_panel)

In the end, I got it all working, and I showed it to some friends as a
very neat hack. It wasn't until yesterday that I finally had a chance to
try it out. I attended a critical media education panel, and used
DokuWiki to take notes. I started the watcher, and shot a few pictures
of the whole panel, and later of the individual panel members. You can
see the result [here](http://reganmian.net/wiki/media_pedagogy_panel).

I'm pretty excited by this, even though it's still not perfect. I think
it makes the notes look much more inviting, and it's neat to remember
how people looked. I was sitting fairly far towards the front, but I
didn't seem to be able to focus on the slides well enough to get a good
resolution picture (many of the presenters didn't even use slides, so I
didn't try too hard).

The pictures of the individual presenters are also quite blurry - these
were done with digital zoom on the iPhone (it might have been better if
I had cropped on my computer, but the idea was trying to make it as
quick a workflow as possible - have the photo go straight into the wiki,
with no fuzzing on the computer).

I had to flip a few pictures manually in Preview, so I should really
figure out how to change the orientation (pictures with the orientation
metadata bit set look ok in preview, but not when viewed in a web
browser. If you save them in Preview, Preview will manually rotate them
into the proper orientation).

Since this is based on PhotoStream, it can only be used with Apple
devices, but it should be trivial to modify the solution to work with
for example DropBox, if there are any good Android photo apps which
immediately sync to DropBox.