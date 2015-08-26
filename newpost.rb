# encoding: utf-8

# copies template to tmp, and opens it in sublime
# require 'Appscript'
Blogpath = '/Users/stian/src/blog'

# given a start of a filename, and an end, looks if there are already any files existing with the filename (pre)01(post)
# increments number with one and returns. used to generate filenames like picture01.png picture02.png etc
def filename_in_series(pre,post)
  existingfile =  File.last_added("#{pre}*#{post}")
  if existingfile
    c = existingfile.scan(/(..)#{post}/)[0][0].to_i
    c += 1
  else
    c = 1
  end

  pagenum = c.to_s
  pagenum = "0" + pagenum if pagenum.size == 1
  return "#{pre}#{pagenum}#{post}", pagenum
end


# writes text to clipboard, using a pipe to avoid shell mangling
# rewritten using osascript for better UTF8 support (from http://www.coderaptors.com/?action=browse&diff=1&id=Random_tips_for_Mac_OS_X)
def pbcopy(text)
  `osascript -e 'set the clipboard to "#{text}"'`
  #IO.popen("osascript -e 'set the clipboard to do shell script \"cat\"'","w+") {|pipe| pipe << text}
end

# gets text from clipboard
def pbpaste
  a = IO.popen("osascript -e 'the clipboard as unicode text' | tr '\r' '\n'", 'r+').read
  a.strip.force_encoding("UTF-8")
end

class File
  class << self

    # adds File.write - analogous to File.read, writes text to filename
    def write(filename, text)
      File.open(filename,"w") {|f| f << text}
    end

    # adds File.append - analogous to File.read, writes text to filename
    def append(filename, text)
      File.open(filename,"a") {|f| f << text + "\n"}
    end

    # find the last file added in directory
    def last_added(path)
      path += "*" unless path.index("*")
      Dir.glob(path, File::FNM_CASEFOLD).select {|f| test ?f, f}.sort_by {|f|  File.mtime f}.pop
    end

    # find the last file added in directory
    def last_added_dir(path)
      path += "*" unless path.index("*")
      Dir.glob(path + "/*/", File::FNM_CASEFOLD).sort_by {|f| File.mtime f}.pop
    end


    def replace(path, before, after, newpath = "")
      a = File.read(path)
      a.gsub!(before, after)
      newpath = path if newpath == ""
      File.write(newpath, a)
    end
  end
end


# displays and error message and exits (could optionally log, not implemented right now)
# mainly to enable one-liners instead of if...end
def fail(message)
  growl "Failure!", message
  exit
end

def growl(title,text='',url='')
  if text == ''
    text = title
    title = ''
  end

  `growlnotify -t "#{title}" -m "#{text}"`

  # growlapp=Appscript.app('Growl')
  # growlapp.register({:as_application=>'Linkify', :all_notifications=>['Note'], :default_notifications=>['Note']})
  # growlapp.notify({:with_name=>'Note',:title=>title,:description=>text,:application_name=>'Linkify', :callback_URL=>url})
end

# ----------------------------------------------------------------------------------

if ARGV[0] == 'new'
  `cp #{Blogpath}/post_template.txt /tmp/nanoc_draft.md`
  `/usr/local/bin/sublime /tmp/nanoc_draft.md`
end

def current_window_sublime
  app = Appscript.app("System Events")
  idx = app.application_processes.name.get.index("Sublime Text")
  st = app.application_processes[idx+1]
  window = st.UI_elements[0].name.get
  return window.split(" ")[0].strip
end

def nanoc_compile
  `export LC_ALL=en_US.UTF-8;export LANG=en_US.UTF-8;cd '#{Blogpath}';/usr/bin/nanoc`
end

if ARGV[0] == 'save'
  a = File.read('/tmp/nanoc_draft.md')

  title = a.scan(/^title: (.+?)$/)[0][0]
  a.gsub!(/^created_at:(.*?)$/, "created_at: #{Time.now.to_s}")
  slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  date = Time.now.strftime("%Y-%m-%d")
  path = Blogpath + "/content/posts/#{date}-#{slug}.md"
  File.open(path, 'w') {|f| f << a}
  `/usr/local/bin/sublime #{path}`
end

if ARGV[0] == 'preview'
  window = current_window_sublime
  datepath = window[0..9].gsub('-','/')
  slug = datepath + "/" + window[11..-4]
  a=File.read("/Users/stian/src/blog/content/posts/#{window}")
  draft = a =~ /status: draft\n/ ? "draft/" : ""
  nanoc_compile
  `open 'http://localhost/blog/#{draft}#{slug}'`
end

if ARGV[0] == 'edit'
  url = get_current_url
  urlpattern = /^http\:\/\/(.+?)\/blog\//

  fail "Not a blog post" unless url.index(urlpattern)

  page = url.gsub(urlpattern, '')
  y,m,d,slug = /([0-9]+)\/([0-9]+)\/([0-9]+)\/([^\/]+)/.match(url).captures
  page = Blogpath + "/content/posts/#{y}-#{m}-#{d}-#{slug}.md"
  `/usr/local/bin/subl #{page}`
end

if ARGV[0] == 'pic'
  if ARGV[1] == 'half'
    width = 320
    suffix = "half"
  else
    width = 640
    suffix = "whole"
  end

  pic_path = "/Users/stian/src/blog/content/images/"
  window = File.last_added("/Users/stian/src/blog/content/posts/*.md").split("/").last.gsub(".md", "")

  curfile =  File.last_added("/Users/stian/Desktop/Screen*.png") # this might be different between different OSX versions
  fail "No screenshots available" if curfile == nil

  newfilename, pagenum = filename_in_series("#{pic_path+window}_-_#{suffix}-",".png")
  print newfilename
  if File.exists?(newfilename)
    pbcopy("")
    fail "File already exists, aborting!"
  end

  `cp "#{curfile.strip}" "#{newfilename}"`

  # check if needs resizing
  picwidth = Integer(%x{sips --getProperty pixelWidth "#{newfilename}" 2>&1}.split(":")[1])
  if picwidth > width # only resize if pic is too large
    `cp "#{newfilename}" "#{newfilename.gsub(".png","")}-orig.png"` # keep original size
    `sips --resampleWidth #{width} "#{newfilename}"`
  end

  `mv "#{curfile.strip}" /tmp/image.png`
  `touch "#{newfilename}"`  # to make sure it comes up as newest next time we run filename_in_series

  justfilename = newfilename.split("/").last
  pbcopy("![](/blog/images/#{justfilename})")
end
