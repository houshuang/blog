!#/bin/bash
rsync --delete --stats -avzPe ssh output/blog stian@192.184.94.211:/var/www/
#wget "http://www.google.com/webmasters/tools/ping?sitemap=http://reganmian.net/blog/sitemap.xml"
