class SuccessfullyScheduledToTalkerMailer
  TEMPLATED_ID     = '77bb51d5-6871-4622-825d-d32e0074a301'.freeze
  DEFAULT_SUBJECT  = 'ATHENTO / Confirmação de Agenda para Sessão Empatica - Amigo Falante'.freeze
  REMINDER_SUBJECT = 'ATHENTO / Lembrete de Agenda para Sessão Empatica - Amigo Falante'.freeze

  attr_reader :schedule, :reminder

  def initialize(schedule, reminder: false)
    @schedule = schedule
    @reminder = reminder
  end

  def deliver
    mailer.deliver
  end

  private

  def mailer
    @mailer = SendgridBaseMailer.new(
      template_id: TEMPLATED_ID,
      subject: reminder ? REMINDER_SUBJECT : DEFAULT_SUBJECT,
      to: { name: schedule.talker.name, email: schedule.talker.email },
      from: { name: 'Athento', email: 'contato@athento.com.br' },
      params: params
    )
  end

  def params
    {
      '-name-'         => schedule.talker.name,
      '-listener-'     => schedule.listener.name,
      '-scheduled_to-' => I18n.l(schedule.scheduled_to, format: :short),
      '-room_url-'     => schedule.room_url,
    }
  end
end
