class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.string :title
      t.string :detail
      t.integer :user_id
      t.timestamp :date

      t.timestamps
    end
  end

  def self.down
    drop_table :schedules
  end
end
