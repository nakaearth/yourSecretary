class CreateTerms < ActiveGroonga::Migration
  def up
#    create_table(:terms, :type => :patricia_trie, :key_type => "ShortText", :key_normalize => true, :default_tokenizer => "TokenBigram") do |table|
#     table.index("haiku_searches.sentence")
#    end
  end

  def down
#    remove_table(:terms)
  end
end
