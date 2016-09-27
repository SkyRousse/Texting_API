class InboundMessage
  def initialize(body, to, from)
    @body = body
    @to = to
    @from = from
    binding.pry
  end
  attr_accessor :body, :to, :from

  def reply(message)
    begin
    response = RestClient::Request.new(
      :method => :post,
      :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
      :user => ENV['TWILIO_ACCOUNT_SID'],
      :password => ENV['TWILIO_AUTH_TOKEN'],
      :payload => { :Body => message,
                    :To => from,
                    :From => to }
    ).execute
  rescue Exception => err
    throw(:abort)
  end
  end
end
