class Book < ActiveRecord::Base
  belongs_to :user
  validates :title, :presence=>true,:length=>{:maximum=>30}
  scope :latest ,order('updated_at desc')
end
