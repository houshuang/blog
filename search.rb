require 'picky'
    index = Picky::Index.new :posts do
      Picky::Backends::SQLite.new
      category :url
      category :title
      category :tags
      category :text
    end
index.load
 #   Picky::Indexes.index

    people = Picky::Search.new index do
  searching splits_text_on: /[\s,-]/
end

results = people.search 'Norway'
p results.ids # => [2]
