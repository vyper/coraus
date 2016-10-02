class TalkerScheduler
  attr_reader :talker, :schedule

  def initialize(talker, schedule)
    @talker   = talker
    @schedule = schedule
  end

  def call
    schedule.update(talker: talker)
  end
end
