ActiveGroonga::Schema.define(:version => 20111112040913) do |schema|
  schema.instance_eval do
    create_table("bigram",
                 :type => :patricia_trie,
                 :key_type => "ShortText",
                 :key_normalize => true,
                 :default_tokenizer => "TokenBigram",
                 :force => true) do |table|
    end

    create_table("haiku_searches",
                 :force => true) do |table|
      table.time("created_at")
      table.short_text("sentence")
      table.time("updated_at")
    end

    create_table("schema_migrations",
                 :type => :hash,
                 :key_type => "UInt64",
                 :force => true) do |table|
      table.time("migrated_at")
    end

    create_table("terms",
                 :type => :patricia_trie,
                 :key_type => "ShortText",
                 :key_normalize => true,
                 :default_tokenizer => "TokenBigram",
                 :force => true) do |table|
    end

    change_table("bigram") do |table|
      table.index("haiku_searches", "sentence", :name => "haiku_searches_sentence")
    end

    change_table("terms") do |table|
      table.index("haiku_searches", "sentence", :name => "haiku_searches_sentence")
    end
  end
end
