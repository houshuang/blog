# encoding: utf-8

# copies template to tmp, and opens it in sublime
require 'Appscript'
Blogpath = '/Users/Stian/src/blog'

def get_current_app
  app = Appscript.app("System Events")
  return app.application_processes[app.application_processes.frontmost.get.index(true)+1].name.get.strip
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

  #{Script_path}/growlnotify -t "#{title}" -m "#{text}"`

  growlapp=Appscript.app('Growl')
  growlapp.register({:as_application=>'Researchr', :all_notifications=>['Note'], :default_notifications=>['Note']})
  growlapp.notify({:with_name=>'Note',:title=>title,:description=>text,:application_name=>'Researchr', :callback_URL=>url})
end



if ARGV[0] == 'new'
  `cp #{Blogpath}/post_template.txt /tmp/nanoc_draft.md`
  `/usr/local/bin/subl /tmp/nanoc_draft.md`
end

def current_window_sublime
  app = Appscript.app("System Events")
  idx = app.application_processes.name.get.index("Sublime Text 2")
  st = app.application_processes[idx+1]
  window = st.UI_elements[0].name.get
  return window.split(" ")[0].strip
end

def nanoc_compile
  `export LC_ALL=en_US.UTF-8;export LANG=en_US.UTF-8;cd '#{Blogpath}';/usr/local/bin/nanoc`
end

if ARGV[0] == 'save'
  a = File.read('/tmp/nanoc_draft.md')
  title = a.scan(/^title: (.+?)$/)[0][0]
  a.gsub!(/^created_at:(.*?)$/, "created_at: #{Time.now.to_s}")
  slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  date = Time.now.strftime("%Y-%m-%d")
  path = Blogpath + "/content/posts/#{date}-#{slug}.md"
  File.open(path, 'w') {|f| f << a}
  nanoc_compile
  datepath = date.gsub("-","/")
  `open 'http://localhost/blog/#{datepath}/#{slug}'`
end

if ARGV[0] == 'preview'
  window = current_window_sublime
  datepath = window[0..9].gsub('-','/')
  slug = datepath + "/" + window[11..-4]

  nanoc_compile
  #sleep(1)
  `open 'http://localhost/blog/#{slug}'`
end
