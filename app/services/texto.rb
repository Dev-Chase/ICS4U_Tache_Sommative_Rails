class Texto
  def initialize
    @client = Twilio::REST::Client.new(ENV["TWILIO_SID"], ENV["TWILIO_AUTH"])
  end

  def envoye_message(numero_recipient, message)
    @client.messages.create(from: ENV["TWILIO_FROM"], to: numero_recipient, body: message)
  end
end
