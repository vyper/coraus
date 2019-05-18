class Schedule < ApplicationRecord
  belongs_to :listener
  belongs_to :talker, required: false

  validates :listener,     presence: true
  validates :scheduled_to, presence: true
  validates :room_url,     presence: true, format: URI::regexp(%w(http https))

  scope :near,               -> { where(arel_table[:scheduled_to].gt(Time.current)) }
  scope :pending_occurrence, -> { where(occurred_at: nil).where(arel_table[:scheduled_to].lt(Time.current)) }
  scope :available, ->(gender = nil) do
    gender = Listener.genders.keys if gender.nil? or gender == 'indifferent'

    joins(:listener)
      .where(talker_id: nil)
      .where(listeners: { gender: gender })
  end
  scope :remindable, -> do
    two_hours_reminder_base = Time.current + 2.hours
    two_hours_reminder_interval = two_hours_reminder_base.beginning_of_hour..two_hours_reminder_base.end_of_hour
    one_day_reminder_base = Time.current + 1.day
    one_day_reminder_interval = one_day_reminder_base.beginning_of_hour..one_day_reminder_base.end_of_hour

    where(occurred_at: nil).where(scheduled_to: two_hours_reminder_interval).or(where(scheduled_to: one_day_reminder_interval))
  end

  after_initialize do
    self.room_url = "https://meet.jit.si/athento-#{Digest::SHA1.hexdigest(Time.current.to_f.to_s)[0..10]}"
  end

  delegate :name, to: :listener

  def occurred?
    occurred_at.present?
  end
end
