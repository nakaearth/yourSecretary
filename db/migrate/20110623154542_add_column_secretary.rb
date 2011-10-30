class AddColumnSecretary < ActiveRecord::Migration
  def self.up
    add_column :secretaries ,:main_flag ,:integer,:default=>0,:length=>2
    add_column :secretaries ,:secretary_word_id ,:integer
  end

  def self.down
    remove_column :secretaries ,:main_flag
    remove_column :secretaries ,:secretary_word_id
  end
end
