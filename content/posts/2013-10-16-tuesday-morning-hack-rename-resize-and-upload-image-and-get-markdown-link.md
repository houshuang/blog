---
title: "Tuesday morning hack: Rename, resize and upload image, and get Markdown link"
created_at: 2013-10-16 12:20:09 -0400
kind: article
location: Toronto, Canada
tags: tech, Markdown, ruby
---

![upload-box ](/blog/images/2013-10-16-tuesday-morning-hack-rename-resize-and-upload-image-and-get-markdown-link_-_half-01.png)

I've written previously about [a quick way of adding pictures to my blog entries](http://reganmian.net/blog/2013/10/02/blogging-with-nanoc-easy-workflow-for-embedding-images/). Today I was adding a picture to [a pull request on Github](https://github.com/jonschlinkert/sublime-markdown-extended/pull/26), and thought it would be a nice thing to automatize. In the previous example, the image is just moved to my [nanoc](http://nanoc.ws/) [blog folder](http://github.com/houshuang/blog), and then gets uploaded to my server when I sync my entire blog. In this case, I wanted the image put on my server immediately, and I also wanted a bit of control over the size, and even the filename.

<!-- more -->

Enter [Pashua](http://www.bluem.net/en/mac/pashua/), an amazing light-weight "GUI" toolkit for scripting languages, which I've used with both [Researchr](http://reganmian.net/wiki/researchr:start) and my [time tracker script](http://reganmian.net/blog/2013/03/16/unobtrusive-time-tracker-visualizing-time-spent-with-ruby-and-r/) in the past. Here's the code to generate the dialog box you see above:

```ruby
config = "
*.title = image-uploader
fname.type = textfield
fname.label = Image file name
fname.name = filename
fname.tooltip = Choose from the list or enter another name

size.label = Current image dimensions width: #{width}, height: #{height}, resize?
size.type = radiobutton
size.option = 100%
size.option = 50%
size.option = 320 px width
size.option = 640 px width
size.option = 800 px width
size.default = 100%

img.type = image
img.maxwidth = 500
img.maxheight = 500
img.path = #{curfile}

cancel.type = cancelbutton
cancel.label = Cancel
cancel.tooltip = Closes this window without taking action"
```

The script uses **[sips](http://osxdaily.com/2013/01/11/converting-image-file-formats-with-the-command-line-sips/)** to get the image dimensions, shows me a quick preview, let's me choose a name, and optionally resize the image, either to 50%, or to a few pre-set widths *(width* tends to be more important than *height* on the web). On clicking OK, the image is renamed and resized, and uploaded to my server. It then generates a Markdown link, and pastes it into my editor, or text field in the browser. 

Quick screencast showing the script in action:

<iframe width="640" height="480" src="//www.youtube.com/embed/bqprrpTZrxk" frameborder="0" allowfullscreen></iframe>