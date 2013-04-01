---
title: "Tools: Always find the longest Wikipedia article in a language you know"
created_at: Fri, 23 Nov 2007 07:49:00 +0000
kind: article
tags:
- languages
- personal
- tech
---

So I updated my tools, first adressing a silly bug in the redir script

*(Update 23.11.2007: Fixed the code so that article names with spaces
work again)*

and also by changing the GET method in my bigger script (which I’ve had
lying around for ever) to HEAD, so that it wouldn’t cause to much impact
on Wikipedia, and I wouldn’t feel unethical releasing it. So, lo and
behold:

**Wikipedia: which language has the longest article**\
 ![](http://static.flickr.com/2044/1531679419_e86abd610f_m.jpg) I, and
many of my friends, speak more than one language. Wikipedia sometimes
has surprising gems in some of the smaller languages, yet I find myself
always going automatically to the English one (or the Norwegian one for
Norwegian topics), thus missing out on the cases where other language
versions (which I can read) have better articles.

Example: http://reganmian.net/bigger/en/no,da,sv,de,it/Democracy (will
automatically redirect to the longest article about democracy in any of
Norwegian, Danish, Swedish, German and Italian)\
 Explanation:
bigger/language-from/languages-to-comma-separated/article-name

As the above, this is also supposed to be used for a Firefox shortcut,
where you pre-program the languages you can understand. Of course size
is not a perfect measure of the quality of an article, but it’s a quick
proxy for where there is most interesting content.

I was initially reluctant to release this, as I was worried about the
impact of WP’s servers (it has to hit every single language version once
to get the size), however I now changed it to use HEAD to make its
requests, so each request is just a few byte. Through my experience with
redir, I know that not many people will use this, and if they do, that’s
just an incentive for Wikipedia to implement something similar natively.

*This and more, on the [tools page](http://reganmian.net/blog/140/)*.

*(Update: I added the source code files on the tools page.)***

Stian\
 *(thanks to [hugovk @ flickr](http://www.flickr.com/photos/hugovk/) for
the picture)*
