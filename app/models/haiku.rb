class Haiku < ActiveRecord::Base
  belongs_to :user
  validates :title, :presence=>true
  validates :sentence, :presence=>true

end
