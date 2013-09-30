usage       'index'
summary     'loads the content (in output/) into the Solr search index'
description 'Default behaviour (when neither --local nor --output is specified) is
to load the index into Solr on nanoc.fosdem.org through ssh'

class SolrIndex < ::Nanoc::CLI::CommandRunner
  def remove_tags_and_clean html
    html.gsub /<\s*([a-oq-z]|p\w|\!)[^>]*>|<\s*\/\s*([a-oq-z]|p\w)[^>]*>/im, ''
  end
 

  def run
    require 'nanoc3'
    require 'picky'
    require 'nokogiri'

    site = Nanoc3::Site.new('.')
    site.compile
    indexitems = Array.new
    c = 0 
    site.items.each do |item| 
      c += 1
      next if item.binary?
      obj = Struct.new(:id, :url, :title, :tags, :text)
      id = item.path || ""
      title = item.attributes[:title] || ""
      tags = item.attributes[:tags] || ""
      tags = tags.join(" ") if tags.class == Array
      cont = item.compiled_content(:snapshot => :pre) || ""
      next if cont == ""
      indexitems << obj.new(c, id.dup, title.dup,
                            tags.dup,
                            remove_tags_and_clean(cont.dup) )
    end

    index = Picky::Index.new :posts do
      Picky::Backends::SQLite.new
      source { indexitems }
      category :url
      category :title
      category :tags
      category :text
    end

    Picky::Indexes.index Picky::Scheduler.new(parallel: true)

    people = Picky::Search.new index do
  searching splits_text_on: /[\s,-]/
end

results = people.search 'Miller'
p results.ids # => [2]
  end
end

runner SolrIndex