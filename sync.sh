!#/bin/bash
rsync --delete --stats -avzPe ssh output/blog houshuan@reganmian.net:~/public_html/
wget "http://www.google.com/webmasters/tools/ping?sitemap=http://reganmian.net/blog/sitemap.xml"
