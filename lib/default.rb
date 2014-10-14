# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.
include Nanoc3::Helpers::Blogging
include Nanoc3::Helpers::Tagging
include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::LinkTo
include Nanoc3::Helpers::XMLSitemap
require 'time'
require 'fast-aleck'
require 'openssl'
require 'nanoc-embed'

def grouped_articles
  art = sorted_articles.group_by do |a|
    create_date = Time.parse(a[:created_at].to_s)
    [ create_date.year, create_date.month ]
  end.sort.reverse

  years = []
  sorted_articles.each do |a|
    create_date = Time.parse(a[:created_at].to_s)
    years << create_date.year
  end

  return [art, years.sort.reverse.uniq]
end

def location
  item[:location] || 'Toronto, Canada'
end

def day(post)
  return number_to_ordinal(Time.parse(post[:created_at].to_s).day)
end

def year(post)
  return number_to_ordinal(Time.parse(post[:created_at].to_s).day)
end

def month(which)
  months = %w(January February  March April May June  July  August  September October November  December)
  return months[which-1]
end

def number_to_ordinal(num)
  num = num.to_i
  if (10...20)===num
    "#{num}th"
  else
    g = %w{ th st nd rd th th th th th th }
    a = num.to_s
    c=a[-1..-1].to_i
    a + g[c]
  end
end

module PostHelper
  def get_pretty_date(post)
    if post[:created_at]
      Date.parse(post[:created_at].to_s).strftime('%B %-d, %Y')
    else
      ""
    end
  end

  def get_post_start(post)
    content = post.compiled_content
    if content =~ /<!-- more -->/
      content = content.partition('<!-- more -->').first
    else
      a = content.index("</p>")
      while content[0..a-1].scan(" ").size < 200 do
        b = content.index("</p>", a+1)
        break unless b
        a = b
      end
      content = content[0..a-1]
    end
    content = content.gsub(/\<div style(.+?)\<\/div\>/m, "")
    return content + "<div class='read-more'><a href='#{post.path}'>Continue reading &rsaquo;</a></div>"
  end
end

include PostHelper

class Replacements < Nanoc3::Filter
  identifier :replacements
  def run(content, params={})
    content.gsub(/^```(.+?)$/, '```language-\1')  # easier to type ```ruby than ```language-ruby
  end
end

class MyToc < Nanoc3::Filter
  identifier :mytoc
  def run(content, params={})
    c = 0
    headers = []
    tmp = content.gsub(/\<h2\>(.+?)\<\/h2\>/) do |hit|
      hit = hit[4..-6]
      headers += [hit]
      c += 1
      "<h2 id=#{c-1}>#{hit}</h2>"
    end
    out = "<ul>"
    toc = headers.each_with_index do |header, i|
      out += "<li><a href=##{i}>#{header}</a></li>"
    end
    "<div style=\"float:right;font-size:80%;margin:30px;\">" + out + "</ul></div>" + tmp
  end
end


class Fast < Nanoc3::Filter
  identifier :fast
  def run(content, params={})
    content
    #content = FastAleck.process(content)
  end
end

# totally ugly to avoid [[]] being transformed inside <div> (code blocks)
class Wiki < Nanoc3::Filter
  identifier :wiki
  def run(content, params={})
    content.gsub(/\<pre\>.+?\<\/pre\>/m) do |hit|
      hit.gsub(/\[\[(.+?)\]\]/m) do |spechit|
        spechit = spechit[2..-3]
        "&&&&#{spechit}&&&&"
      end
    end.gsub(/\[\[(.+?)\]\]/m) do |aphit|
      aphit = aphit[2..-3]
      aphit.index("|") ? (link, text = aphit.split('|')) : (link, text = [aphit, aphit])
      "<a href='http://reganmian.net/wiki/#{link.gsub(" ", "%20")}'>#{text}</a>"
    end.gsub(/\&\&\&\&(.+?)\&\&\&\&/m) do |kohit|
      kohit = kohit[4..-5]
      "[[#{kohit}]]"
    end
  end
end

class FixImages < Nanoc3::Filter
  identifier :fix_images
  def run(content, params={})
    resp = content.gsub(/\!\[(.*?)\]\((.+?)\)/m) do
      if $1[0..0] == ' ' && $1[-1..-1] == ' '
        align = 'float:centre; margin-left: 10px; margin-right: 10px'
      elsif $1[0..0] == ' '
        align = "float:left; margin-right: 10px"
      elsif $1[-1..-1] == ' '
        align = 'float:right; margin-left: 10px'
      else
        align = 'none'
      end
      "<img src='#{$2}' style='#{align}'>"
    end
    resp.gsub(/\[((\<img).+?)\]\((.+?)\)/m, '<a href="\3">\1</a>')
  end
end