class Listener < ApplicationRecord
  validates :name,   presence: true
  validates :email,  presence: true
  validates :phone,  presence: true
  validates :gender, presence: true

  enum gender: { male: 'male', female: 'female' }, _prefix: true

  def to_s
    name
  end
end
