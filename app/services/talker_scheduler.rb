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
    mail = SendgridBaseMailer.new(
      template_id: '77bb51d5-6871-4622-825d-d32e0074a301',
      to: { name: talker.name, email: talker.email },
      from: { name: 'Athento', email: 'contato@athento.com.br' },
      params: { '-name-' => talker.name, '-listener-' => schedule.listener.name, '-scheduled_to-' => I18n.l(schedule.scheduled_to, format: :short), '-room_url-' => schedule.room_url }
    )

    mail.deliver
  end

  def notify_listener
    mail = SendgridBaseMailer.new(
      template_id: '2babd711-4791-404d-a49f-9fffec5b88c8',
      to: { name: schedule.listener.name, email: schedule.listener.email },
      from: { name: 'Athento', email: 'contato@athento.com.br' },
      params: { '-name-' => schedule.listener.name, '-talker-' => talker.name, '-scheduled_to-' => I18n.l(schedule.scheduled_to, format: :short), '-room_url-' => schedule.room_url }
    )

    mail.deliver
  end
end
