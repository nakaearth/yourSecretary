class AddColumnUsersForImagePath < ActiveRecord::Migration
  def self.up
    add_column :users, :image_path, :string,:default=>"",:null => false
  end

  def self.down
    remove_column :users, :image_path
  end
end
