class Talker < ApplicationRecord
  validates :name,        presence: true
  validates :email,       presence: true
  validates :phone,       presence: true
  validates :forecast_at, presence: true

  def to_s
    name
  end
end
