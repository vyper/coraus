require 'sendgrid-ruby'

class SendgridBaseMailer
  def initialize(template_id:, from:, to:, params: {})
    @template_id = template_id
    @from        = from
    @to          = to
    @params      = params
  end

  def deliver
    client._('send').post(request_body: data.to_json)
  end

  private

  def from
    SendGrid::Email.new(@from)
  end

  def to
    SendGrid::Email.new(@to)
  end

  def personalization
    personalization = SendGrid::Personalization.new

    personalization.to = to

    @params.each do |key, value|
      personalization.substitutions = SendGrid::Substitution.new(key: key, value: value)
    end

    personalization
  end

  def data
    mail = SendGrid::Mail.new
    mail.from = from
    mail.personalizations = personalization
    mail.template_id = @template_id
    mail
  end

  def client
    @client ||= begin
      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      sg.client.mail
    end
  end
end
