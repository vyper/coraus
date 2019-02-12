class Talker < ApplicationRecord
  validates :name,                      presence: true
  validates :email,                     presence: true
  validates :phone,                     presence: true
  validates :preferred_listener_gender, presence: true

  has_one :schedule, required: false

  scope :without_schedule,       -> { left_outer_joins(:schedule).where(schedules: { talker_id: nil }).order(forecast_at: :asc) }
  scope :waiting_for_session,    -> { joins(:schedule).merge(Schedule.near).merge(Schedule.order(scheduled_to: :asc)) }
  scope :waiting_for_occurrence, -> { joins(:schedule).merge(Schedule.pending_occurrence).merge(Schedule.order(scheduled_to: :asc)) }

  enum preferred_listener_gender: { male: 'male', female: 'female', indifferent: 'indifferent' }, _prefix: true

  def to_s
    name
  end
end
