class Schedule < ActiveRecord::Base
  belongs_to :user
  scope :latest, order('updated_at desc')
end
