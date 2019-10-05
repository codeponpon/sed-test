class SendSmsJob < ApplicationJob
  queue_as :sms

  def perform(user, type=nil)
    send_otp = MazdaRama7::Otp.new(user)
    send_otp.create(sms_message(user, type))
  end

  def sms_message(user, type)
    case type
    when 'otp'
      return "#{user.otp_code} is your authentication code."
    when 'phone_verified'
      return 'Your phone has been verified!'
    else
      return 'hello world'
    end
  end
end
