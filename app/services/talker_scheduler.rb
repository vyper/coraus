class TalkerScheduler
  attr_reader :talker, :schedule

  def initialize(talker, schedule)
    @talker   = talker
    @schedule = schedule
  end

  def call
    schedule.update(talker: talker)

    notify_talker
    notify_listener

    true
  end

  private

  def notify_talker
    SuccessfullyScheduledToTalkerMailer.new(schedule).deliver
  end

  def notify_listener
    SuccessfullyScheduledToListenerMailer.new(schedule).deliver
  end
end
