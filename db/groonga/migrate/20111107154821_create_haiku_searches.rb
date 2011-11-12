class CreateHaikuSearches < ActiveGroonga::Migration
  def up
    create_table(:haiku_searches) do |table|
      table.short_text(:sentence)
      table.integer(:user_id)
      table.timestamps
    end
  end

  def down
    remove_table(:haiku_searches)
  end
end
