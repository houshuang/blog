# copies template to tmp, and opens it in sublime
require 'Appscript'

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

blogpath = '/Users/Stian/src/blog'


if ARGV[0] == 'new'
  `cp #{blogpath}/post_template.txt /tmp/nanoc_draft.md`
  `/usr/local/bin/subl /tmp/nanoc_draft.md`
end

if ARGV[0] == 'save'
  a = File.read('/tmp/nanoc_draft.md')
  title = a.scan(/^title: (.+?)$/)[0][0]
  a.gsub!(/^created_at:(.*?)$/, "created_at: #{Time.now.to_s}")
  slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  date = Time.now.strftime("%Y-%m-%d")
  path = blogpath + "/content/posts/#{date}-#{slug}.md"
  File.open(path, 'w') {|f| f << a}
  `/usr/local/bin/subl #{path}`
end
