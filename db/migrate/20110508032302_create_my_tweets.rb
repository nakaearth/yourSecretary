class CreateMyTweets < ActiveRecord::Migration
  def self.up
    create_table :my_tweets do |t|
      t.integer :user_id ,:null => false
      t.string :tweet ,:default=>"", :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :my_tweets
  end
end
