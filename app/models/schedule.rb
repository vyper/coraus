class Schedule < ApplicationRecord
  belongs_to :listener
  belongs_to :talker, required: false

  validates :listener,     presence: true
  validates :scheduled_to, presence: true

  scope :available, -> { includes(:listener).where(talker_id: nil) }

  delegate :name, to: :listener
end
