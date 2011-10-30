class CreateSecretaries < ActiveRecord::Migration
  def self.up
    create_table :secretaries do |t|
      t.string :name
      t.integer :age
      t.integer :cleverness
      t.integer :accuracy
      t.integer :user_id
      t.timestamps
    end
    add_index :secretaries, [:user_id]
  end

  def self.down
    drop_table :secretaries
    
  end
end
