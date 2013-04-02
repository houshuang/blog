!#/bin/bash
rsync --delete --stats -avzPe ssh output/blog houshuan@reganmian.net:~/public_html/
