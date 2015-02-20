---
title: GNU Parallel, quick and easy
created_at: Sun Mar  9 19:36:29 2014
location: Toronto, Canada
kind: article
tags:
  - tech
  - command line
---

I haven't been blogging for months, and there is a lot of things I'd like to write about. But rather than waiting until I have the time to do that, I thought I'd just quickly capture a neat function that many might not know about.

Running shell commands on multiple files is something we do every day, usually with different wildcard patterns (like `rm *`, which deletes all the files in the current directory). What's sometimes not quite clear to me is when the wildcard-expansion happens by the shell (and ie. `rm` is given hundreds of arguments), and when it is passed to the command to do it's own expansion.

But sometimes you want to do something on files in multiple directories. Some shells like zsh will let you do `**/*.md` to list all Markdown files, arbitrarily nested, whereas in Bash, this only goes down one directory. An alternative to this is to first generate a list of the files, and then execute the command once for each file. `xargs` can be used to do this (although I always somehow found its syntax a bit difficult). A great alternative is `gnu parallel`, which does the same, but in parallel. Since most current computers have four, eight, or even more cores, this can speed things up significantly. (And even more so if the function needs to wait for a network connection, for example pinging hosts, downloading files with curl, etc).

My concrete problem was that I received some zip files with clickstream logs. These zip files had thousands of log files, in nested sub-directories, all individually encrypted with my gpg public key. I needed to traverse all the directories, decrypt the files, and remove the originally encrypted files, before I begin parsing them.

`parallel` has detailed [documentation](http://www.gnu.org/software/parallel/parallel_tutorial.html), and I'm just scratching the surface in terms of functionality. Because I needed to do two actions (decrypt, and then delete the original file), I chose to create a small bash script that would be run once for each file. This has the advantage that I can easily test this on a single file, and make sure all the arguments are correct etc. Because I also read in my gpg password from the command line, I obviate the need to remember a complex command, but don't have to store my gpg password in a file (on a shared server).

Here's my quick script:

```bash
#!/bin/bash
echo $1|gpg --batch --passphrase-fd 0 --decrypt-files $2 &> /dev/null
rm $2
```

I can try to run it on a single file first, and once I am happy that it works properly, I can fire away:

```bash
find . | grep gpg$ | parallel --progress -j 8 ./decrypt.sh MY-PASS-PHRASE
```

This uses find . to get a list of all files in the current directory and all subdirectories, and grep to select those ending in gpg. For file A, it would then execute `./decrypt.sh MY-PASS-PHRASE A`. `-j 8` specifies that it should run 8 jobs in parallel (the server has 8 cores), and `--progress` shows a simple progress meter. Here's how it looks when I run it:

```bash
Computers / CPU cores / Max jobs to run
1:local / 8 / 8

Computer:jobs running/jobs completed/%of started jobs/Average seconds to complete
local:1/886/100%/0.1s
```

In a few seconds, it decrypted 886 files for me. Very quick to write, quick to repeat in the future, quick to execute -- what's not to love? (From the status above, you see `computers`, which indicates that `parallel` can also be used across multiple computers. Read the instruction for more advanced usage.
