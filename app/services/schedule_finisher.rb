class ScheduleFinisher
  attr_reader :schedule, :params

  def initialize(schedule, params)
    @schedule = schedule
    @params   = params
  end

  def call
    schedule.update(params)

    notify_listener
    notify_talker

    true
  end

  private

  def notify_listener
    mail = SendgridBaseMailer.new(
      template_id: 'a51cd01a-d111-4bac-aa2c-78d0e4a4b869',
      to: { name: schedule.listener.name, email: schedule.listener.email },
      from: { name: 'Athento', email: 'contato@athento.com.br' },
      params: { '-name-' => schedule.listener.name, '-talker-' => schedule.talker.name, '-scheduled_to-' => I18n.l(schedule.scheduled_to, format: :short) }
    )

    mail.deliver
  end

  def notify_talker
    mail = SendgridBaseMailer.new(
      template_id: '9744401c-9cce-41c1-8150-0d5145d73c09',
      to: { name: schedule.talker.name, email: schedule.talker.email },
      from: { name: 'Athento', email: 'contato@athento.com.br' },
      params: { '-name-' => schedule.talker.name, '-listener-' => schedule.listener.name, '-scheduled_to-' => I18n.l(schedule.scheduled_to, format: :short) }
    )

    mail.deliver
  end
end
