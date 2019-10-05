class SendEmailJob < ApplicationJob
  queue_as :email

  def perform(ojb, type=nil)
    case type
      when 'welcome'
        UserMailer.welcome_email(ojb).deliver_later
      when 'otp'
        ApiGuardian.configuration.on_send_otp_via_email.call(ojb)
    end
  end
end
