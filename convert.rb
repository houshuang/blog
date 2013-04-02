def convert(file)
  newfile = "#{file[0..-6]}.md"
  `pandoc -f markdown -t html "#{file}" -o /tmp/out.html`
  `pandoc -f html -t markdown "/tmp/out.html" -o "#{file[0..-6]}.md"`
  `rm #{file}`
  a = File.read(newfile)
  a.gsub!('created\_at', 'created at')
  File.open(newfile, 'w') {|f| f << a}
end

#convert(ARGV[0])
Dir.glob("content/pages/*.html").each {|f| puts f; convert(f)}