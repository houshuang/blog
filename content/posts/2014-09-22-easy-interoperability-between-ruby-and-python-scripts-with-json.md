---
title: Easy interoperability between Ruby and Python scripts with JSON
created_at: 2014-09-22 17:57:15 -0400
kind: article
location: Toronto, Canada
tags: tech
---

I recently needed to call a Ruby script from Python to do some data processing. I was generating some Etherpad-scripts in Python, and needed to restructure tags (using [tag-extract](http://reganmian.net/blog/2012/06/13/tag-extract-a-tool-to-automatically-restructure-textoutline-using-tags/)) with a Ruby script. The complication was that this script does not just return a simple string or number, but a somewhat complex data structure, that I needed to process further in the Python script.

Luckily, searching online I came across the idea to use JSON as the interchange format, which worked swimmingly. Given that all the information was in text format, and the data structure was not that complex (just some lists and dictionaries), JSON could cope well with the complexity, and was easier to debug, since it's a text format. If I had had other requirements, like binary data, I would have had to investigate other data formats.

<!-- more -->
[The Ruby script](https://github.com/houshuang/folders2web/blob/master/tag-extract.rb) already had several different output options, controlled through command-line switches. I added the option to output through JSON, and the code required to do the actual output was simply:

```ruby
puts JSON.generate(tags)
```

I also reconfigured the script to accept input from standard-in:

```ruby
if ARGV.size == 0
  a = ARGF.read
else
  a = try { File.read(ARGV[1]) }
  unless a
    puts "Could not read input file"
    exit
  end
end
```

This meant that I could simply pipe the information from the Python script through the Ruby script, writing to standard-out and reading from standard-in, not having to create any temporary files at all.

I created a helper function in Python to let me run a command, putting into standard-out, and reading from standard-in:

```python
def apply_external(cmd_ary, out):
	proc = subprocess.Popen(
	    cmd_ary,stdout=subprocess.PIPE,
	    stdin=subprocess.PIPE)
	proc.stdin.write(bytes(out, "UTF-8"))
	proc.stdin.close()
	result = proc.stdout.read()
	result = result.decode("UTF-8")
	return(result)
```

and then I simply call it with the text I want transformed, and receive the transformed text structure back.

```python
def tag_extract(text):
	ret = apply_external(['ruby', '/Users/Stian/src/folders2web/tag-extract.rb'], text)
	return json.loads(ret)
```

Although the idea was simple, there was a bit of fiddling getting the pipes set up in Python, etc., so I figured that documenting it might be helpful to others.