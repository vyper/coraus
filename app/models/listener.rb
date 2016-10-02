class Listener < ApplicationRecord
  validates :name,  presence: true
  validates :email, presence: true
  validates :phone, presence: true

  def to_s
    name
  end
end
