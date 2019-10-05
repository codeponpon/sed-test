module MazdaRama7
  class Otp

    def initialize(user)
      @phone_number = user.phone_number
      @twilio_client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    end

    def create(body_msg)
      @twilio_client.messages.create(
        from: ENV['TWILIO_PHONE_NUMBER'],
        to: @phone_number.gsub(/^0/, '+66'),
        body: body_msg
      )
    end

    private

    attr_reader :phone_number, :twilio_client

  end
end