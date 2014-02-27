---
title: "Big data and Pandas: Some tricks"
created_at: Mon, 3 Feb 2014 16:07:00 +0000
kind: article
tags:
- pandas
- python
- data-analysis
---

[Pandas](http://pandas.pydata.org/) is a library for Python that offers similar functionality to R's data.frame or data.table, allowing you to quickly perform vectorized operations. For example, if `db` is a Pandas DataFrame, which has two numeric columns, a and b, you can create a third column c, containing the sum of a and b for each row, with a simple `db['c'] = db.a + db.b`, instead of having to loop over every row. This is implemented using [Numpy](http://www.numpy.org/) and Cython, making it very fast even for very large tables. Since Pandas is optimized for reading and analysis (slicing, combining etc), rather than updating rows like in a database, and because it typically keeps the entire database in memory, it is able to offer [very high speeds](http://wesmckinney.com/blog/?p=414).

I'm currently working on a project where we are analyzing large clickstream files from MOOCs. The largest ones are around 20GB of nested JSON, with 30-40 different keys (no clear schema, a new key could show up at any time), hundreds of thousands of users, etc. We want to be able to do descriptive statistics over events and users, but also do some fairly complex processing of events (collapsing a number of subsequent video-events into a meta "watched video" event, tagged with "multi-pause, rate-change", etc).

I decided to try using Pandas for this, and having little experience
with both Python and Pandas, it's been an interesting experience. Pandas
is in some ways incredibly powerful, but in others it can be quite
finicky and annoying. After playing with Haskell in the last few months,
it was surprising to have functions return values of different types
seemingly based on the phase of the moon -- you might get a DataFrame,
an Index, a Series, a Multi-Indexed Series, etc. And if a single string
should sneak into  your column with
10,000,000 ints, it will silently be converted to an Object, without any
warning. (Not great for performance)!.

Pandas was primarily developed in the financial industry, and has strong
support for time-series and multi-indices, etc. However, it was a
surprise to me that it had no support for categorical columns. In R, if
you have a column with 10,000 answers given the five options "Not at all
... Completely", it will simply store the five options, and use a few
bits per row to very efficiently represent the values, quite transparent
to the user. In Pandas, any string results in an Object, which requires
much more storage space, and there is also no support for ordering
values (in R, you can tell it that Not at all < Rarely, and it will
remember the ordering, and use it when graphing, etc).

One of the things that makes Pandas well suited to "biggish" data is its
integration with [HDF5](http://www.hdfgroup.org/HDF5/) through
[PyTables](http://www.pytables.org/moin). HDF5 is an
"industrial-strength" storage system for big data (actually developed
for academia), and is a much better solution to storing millions of rows
than CSV files. However, just like Pandas, there is no support for
categorical columns.

One of the reasons I began thinking of using Pandas and PyTables to
process the logfiles was actually a very interesting presentation at the
[MOOC Research Conference](http://www.moocresearch.com/mooc-conference/program)
in Dallas last December, where Una May O'Reilly presented her work on
[MOOCdb](http://edf.stanford.edu/readings/moocdb-developing-data-standards-mooc-data-science),
the idea of creating a common storage format for clickstreams (and other
data) from different MOOC providers (Coursera, EdX, etc), together with
importers from different formats. Once the data was in a common format,
tools could then be built on top, for example to visualize, or conduct
certain complex analyses. One of her points was that clickstream data,
as it arrives from the MOOC providers, is optimized for fast writing,
and not for research -- there's actually a massive amount of redundancy.

Example of one clickstream entry:
```json
{"key": "user.video.lecture.action","value": "{\"currentTime\":257.066689,\"playbackRate\":1,\"paused\":false,\"error\":null,\"networkState\":1,\"readyState\":4,\"eventTimestamp\":13752243249891,\"initTimestamp\":137524554345511,\"type\":\"ratechange\",\"prevTime\":227.066689}","username": "9930a0523403499b7347707c92bccbcbff1a","timestamp": 13752234234277,"page_url": "https://class.mooc-platform.org/course-001/lecture/view?lecture_id=31","client": "spark","session": "30423409-1323423042304","language": "en-US,en;q=0.5","from": "https://class.mooc-platform.org/course-001/lecture/view?lecture_id=31","user_ip": "123.255.122.167","user_agent": "Mozilla/5.0 (Windows NT 6.1; rv:22.0) Gecko/20100101 Firefox/22.0", "12": ["{\"height\":678,\"width\":1207}"], "13": [0]}
```

For example, in the whole clickstream, "key" can only have one of four
values. And yet, for every one of the millions of lines, the textual
representation is eating up 10-15 characters. (Which sounds little, but
15 characters * 5M lines adds up). Look at the page_url, there are only
a few thousand unique pages, the same with pretty much every field in
the big "blob" above.

So if Pandas won't give me categorical columns, I figured I'd have to
roll my own. I wrote a simple "memoizer" class, where an object keeps
track of values. After initializing it, you can feed it values, and get
indices back -- if the value already exists, it will give you the same
index, if not, it will store it, and give you the new index.

Here's an example of usage:
```python
bread = memo.Memo('breads')
bread['wonderbread'] # => 1
bread['German rye']  # => 2
bread['wonderbread'] # => 1
```

The class uses Pandas series internally, and is very simple:
```python
import pandas as pd
import numpy as np

class Memo(object):
    """Gives back the index number if object already exists, or stores
    and returns index

    Example:
    a = Memo()
    a['http://reganmian.net'] # => 1
    a['http://google.com'] # => 2
    a['http://reganmian.net'] # => 1
    """

    def __init__(self, name):
        self.db = pd.Series()
        self.counter = 0
        self.name = name

    def get(self, s):
        if s is None or pd.isnull(s):
            return -1

        item = self.db.get(s)
        if item:
            return item
        else:
            self.counter += 1
            self.db[s] = self.counter
            return self.counter

    def __getitem__(self, s):
        return(self.get(s))

    def store(self, store):
        store[self.name] = self.db
```
