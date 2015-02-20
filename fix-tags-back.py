#!/usr/bin/python

import os
import re

# traverse root directory, and list directories as dirs and files as files
def transform_text(text):
	tags = re.search(r"^tags: (.+?)$", text, flags=re.M)
	if tags is None:
		return text
	tags = tags.groups()[0]
	newtags = '  - ' + '\n  -'.join(tags.split(','))
	return text.replace("tags: "+tags, "tags:\n"+newtags)

for root, dirs, files in os.walk("./content/posts/"):
	path = root.split('/')
	for file in files:
		if file.endswith('.md') and not file.startswith('.'):
			fname = 'content/posts/%s' % file
			txt = open(fname, 'rt').read()
			newtxt = transform_text(txt)
			with open(fname, 'wt') as f:
				f.write(newtxt)
