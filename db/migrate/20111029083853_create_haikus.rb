class CreateHaikus < ActiveRecord::Migration
  def self.up
    create_table :haikus do |t|
      t.string :title
      t.string :sentence
      t.integer :user_id
      t.integer :point

      t.timestamps
    end
  end

  def self.down
    drop_table :haikus
  end
end
