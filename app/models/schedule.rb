class Schedule < ApplicationRecord
  belongs_to :listener
  belongs_to :talker, required: false

  validates :listener,     presence: true
  validates :scheduled_to, presence: true
end
