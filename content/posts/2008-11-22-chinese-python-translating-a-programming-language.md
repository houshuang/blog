---
title: "Chinese Python: 2809CTranslating a programming language2809D"
created_at: Sat, 22 Nov 2008 05:24:00 +0000
kind: article
tags:
- china
---

[![example of Python
language](http://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Python_add5_syntax.svg/202px-Python_add5_syntax.svg.png "example of Python language")](http://commons.wikipedia.org/wiki/Image:Python_add5_syntax.svg)

Image via Wikipedia

*Update:
[Round-up](http://reganmian.net/blog/2008/12/04/chinese-python-multilingual-programming-2/)
of comments from this blog and Reddit, with some great new ideas and
sites.*

I remember discussing with a friend of mine whether it would ever be
possible to program in Chinese. Of course, computer language isn’t quite
human language, but most computer languages today are heavily based on
English, both in the built in functions, and in the libraries that
people distribute. Thus, you write

> System.PrintScreen(”Hello”), and not Sistemo.SkribuEkrane(”Saluton”)

I explained that most modern languages have very few built-in functions,
and that as long as the interpreter or compiler supports UTF-8 variables
and function names, you could theoretically rewrite all functions and
variables to be in another language. Today, my friend forwarded me
evidence that someone has gone much further.

[Chinese
Python](http://www.chinesepython.org/cgi_bin/cgb.cgi/english/english.html)
is a complete translation of Python into Chinese. Not only is all the
documentation, and all the program feedback and error codes in Chinese,
but you can write your entire program in Chinese - all the variables and
function names can be in Chinese, and all the built-in functions are
named in Chinese. Thus, instead of “if a=2″ you write “如果 阿=2″, where
如果 is the Chinese word for “if”, and 阿 is the arbitrary name of your
variable.

Here is a longer example for you to compare: (from [Chinese
Wikipedia](http://zh.wikipedia.org/wiki/ZhPy)).

**Chinese Python:**

  #!/usr/bin/env zhpy
  # 檔名: while.py
  數字 = 23
  運行 = 真
  當 運行:
      猜測 = 整數(輸入('輸入一個數字: '))

      如果 猜測 == 數字:
          印出 '恭喜, 你猜對了.'
          運行 = 假 # 這會讓循環語句結束
      假使 猜測 < 數字:
          印出 '錯了, 數字再大一點.'
      否則:
          印出 '錯了, 數字再小一點.'
  否則:
      印出 '循環語句結束'
  印出 '結束'

**English Python:**

  #!/usr/bin/env python
  # File name: while.twpy
  number = 23
  running = True
  while running:
      guess = int(raw_input('Enter an integer : '))

      if guess == number:
          print 'Congratulations, you guessed it.'
          running = False # this causes the while loop to stop
      elif guess < number:
          print 'No, it is higher than that.'
      else:
          print 'No, it is lower than that.'
  else:
      print 'The while loop is over'
  print 'Done'

I think this is a great project. Certainly, programming is no longer the
“walled garden” or closed loop it was when I was toying around in
QBasic. Today, programmers use lot’s of different libraries, plug-in to
APIs etc, and it would be almost impossible to translate all of these to
Chinese, and sad to have to block yourself from anything not translated.
However, to teach kids the basic principles behind programming, this
would probably be extremely helpful. [Jim
Cummins](http://www.iteachilearn.com/cummins/), who researches bilingual
education, has argued that immigrants who receive most of their primary
education in their own languages, and only a bit of training in English,
actually do much better in school, and speak better English, than those
who are “immersed” in English from day one.

This is because most of the process in primary school centers around
learning advanced concepts and ways of thinking. If this is done in the
mother tongue, the student learns much better, and is easily able to
transfer this to English. I wonder if something similar would be the
case here, that a student that has already learnt the logic behind
programming, and learnt how to think like a programmer, would not have
any problem picking up the few commands “PRINT” and “GOTO” in English.
After all, what they teach you in comp sci classes is not to memorize as
many class names and variables as possible (I usually have to look those
up anyway), but algorithms and ways of thinking. That should be
transferable.

(It would be a great research project to see if this is the case. A) If
kids in China who are exposed to Chinese Python pick up programming
concepts more quickly, and B) If kids who have been trained in Chinese
Python are able to at a certain stage switch to English Python and catch
up with a cohort that was trained in English Python from the get-go).

Stian

[![Reblog this post [with
Zemanta]](http://img.zemanta.com/reblog_e.png?x-id=2c6e5143-27e7-4fd1-876a-9b466469c97d)](http://reblog.zemanta.com/zemified/2c6e5143-27e7-4fd1-876a-9b466469c97d/ "Zemified by Zemanta")
