# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.
include Nanoc3::Helpers::Blogging
include Nanoc3::Helpers::Tagging
include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::LinkTo
require 'date'

def grouped_articles
  sorted_articles.group_by do |a|
    [ Time.parse(a[:created_at]).year, Time.parse(a[:created_at]).month ]
  end.sort.reverse
end

def month(which)
  months = %w(January February  March April May June  July  August  September October November  December)
  return months[which-1]
end

module PostHelper
  def get_pretty_date(post)
    if post[:created_at]
      Date.parse(post[:created_at]).strftime('%B %-d, %Y')
    else
      ""
    end
  end
end

include PostHelper

class Replacements < Nanoc3::Filter
  identifier :replacements
  def run(content, params={})
    content.gsub(/^```(.+?)$/, '```language-\1')  # easier to type ```ruby than ```language-ruby
  end
end

class FixImages < Nanoc3::Filter
  identifier :fix_images
  def run(content, params={})
    resp = content.gsub(/\!\[(.*?)\]\((.+?)\)/m) do
      if $1[0..0] == ' ' && $1[-1..-1] == ' '
        align = 'float:centre'
      elsif $1[0..0] == ' '
        align = "float:left"
      elsif $1[-1..-1] == ' '
        align = 'float:right'
      else
        align = 'none'
      end
      "<img src='#{$2}' style='#{align}'>"
    end
  resp
  end
end