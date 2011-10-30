class Task < ActiveRecord::Base
  belongs_to :user
  validates :title, :presence=>true,:length=>{:maximum=>60}
  validates :priority, :numericality =>true
  scope :latest, order('updated_at desc')
end
