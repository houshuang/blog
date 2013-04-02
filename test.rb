require 'open-uri'
def try(default = nil, &block)
  if defined?(DEBUG)
    yield block
  else
    begin
      yield block
    rescue
      return default
    end
  end
end

out = File.open("badfiles.txt", 'w')
sites = File.read('sitemap.txt')
sites.split("\n").each do |url|
  a = try { open(url).read }
  unless a
    out << url + "\n"
  end
end
# require 'date'
# a = File.read('badfiles.txt')
# a.split("\n").each do |bad|
#   fname = bad[28..-1]
#   restname = fname[11..-2]
#   date = fname[0..9].gsub("/","-")
#   newdate = (Date.parse(date) +1).strftime("%Y-%m-%d")
#   oldfname = "content/posts/#{newdate}-#{restname}.md"
#   newfname = "content/posts/#{date}-#{restname}.md"
#   `git mv '#{oldfname}' '#{newfname}'`

#   a = File.read(newfname)
#   a.gsub!(/^created_at:(.+?)$/, "created_at: #{(Date.parse(date)).
#     to_time.to_s}")
#   File.open(newfname, 'w') {|f| f << a}
#   puts "content/posts/#{date}-#{restname}.md"
# end