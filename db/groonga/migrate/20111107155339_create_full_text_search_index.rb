class CreateFullTextSearchIndex < ActiveGroonga::Migration
  def up
    create_table("bigram",
                 :type=>:patricia_trie,
                 :key_type=>"ShortText",
                 :default_tokenizer => "TokenBigram",
                 :key_normalize=>true) do |table|
      table.index("haiku_searches.sentence")
    end
  end

  def down
     remove_table("bigram")
  end
end
