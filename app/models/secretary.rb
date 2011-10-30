class Secretary < ActiveRecord::Base
  belongs_to :user
  belongs_to :secretary_word
  validates :name, :presence=>true,:length=>{ :maximum => 30 }
  validates :age, :presence=>true,:numericality => true
  scope :latest, order('updated_at desc')
  scope :is_main, where("main_flag=1")

  def save_and_update_word
    value = cleverness * accuracy
    p value
    if value > 12 && value <= 16
      #secretary_word のid=1と紐付ける
      self.secretary_word_id = 5
    elsif value >8 && value <= 12
       #secretary_word のid=2と紐付ける
      self.secretary_word_id = 4
    elsif value > 4 && value <= 8
       #secretary_word のid=3と紐付ける
      self.secretary_word_id =3
    elsif value > 1 && value <= 4
       #secretary_word のid=4と紐付ける
      self.secretary_word_id = 2
    elsif value >= 0 && value <= 1
       #secretary_word のid=5と紐付ける
      self.secretary_word_id = 1
    end
    save
  end

    def update_attributes_and_update_word secretary_attribute
    value = secretary_attribute[:cleverness].to_i * secretary_attribute[:accuracy].to_i
    p value
    if value > 12 && value <= 16
      #secretary_word のid=1と紐付ける
      self.secretary_word_id = 5
    elsif value >8 && value <= 12
       #secretary_word のid=2と紐付ける
      self.secretary_word_id = 4
    elsif value > 4 && value <= 8
       #secretary_word のid=3と紐付ける
      self.secretary_word_id =3
    elsif value > 1 && value <= 4
       #secretary_word のid=4と紐付ける
      self.secretary_word_id = 2
    elsif value >= 0 && value <= 1
       #secretary_word のid=5と紐付ける
      self.secretary_word_id = 1
    end
    save
  end
end
