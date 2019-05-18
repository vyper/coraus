class SuccessfullyScheduledToListenerMailer
  TEMPLATED_ID     = '2babd711-4791-404d-a49f-9fffec5b88c8'.freeze
  DEFAULT_SUBJECT  = 'ATHENTO / Confirmação de Agenda para Sessão Empatica - Amigo Ouvinte'.freeze
  REMINDER_SUBJECT = 'ATHENTO / Lembrete de Agenda para Sessão Empatica - Amigo Ouvinte'.freeze

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
      to: { name: schedule.listener.name, email: schedule.listener.email },
      from: { name: 'Athento', email: 'contato@athento.com.br' },
      params: params
    )
  end

  def params
    {
      '-name-'         => schedule.listener.name,
      '-talker-'       => schedule.talker.name,
      '-scheduled_to-' => I18n.l(schedule.scheduled_to, format: :short),
      '-room_url-'     => schedule.room_url
    }
  end
end
