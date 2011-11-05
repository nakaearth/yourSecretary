#:conding utf-8
require 'rubygems'
require 'groonga'

Groonga::Context.default_options={:encoding =>:utf8}
Groonga::Database.create(:path=>'/data/groonga.db') 
Groonga::Schema.create_table("haiku_search",:type=>:hash)
Groonga::Schema.change_table("haiku_search") do |table|
  table.text("sentence")
end
Groonga::Schema.create_table("terms",:type=>:patricia_trie,
                             :key_normalize=>true,
                             :default_tokenizer=>"TokenBigram")
Groonga::Schema.change_table("terms") do |table|
  table.index("heroku_search.sentence")
end

