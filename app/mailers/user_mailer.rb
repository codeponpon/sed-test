class UserMailer < ApplicationMailer
  default from: "mazdaramaseven@gmail.com"

  def welcome_email(user)
    @user = user
    mailer(@user.email, "Welcome to Mazda Rama 7!")
  end

  def reset_password_instructions(user, reset_url=nil)
    @user = user
    @reset_url = reset_url
    mailer(@user.email, "Reset password instuctions")
  end

  def reset_password_otp(user)
    @user = user
    mailer(@user.email, "ยืนยันการเปลี่ยนรหัสผ่าน")
  end

  def reset_password_completed(user)
    @user = user
    mailer(email, "แจ้งผลการเปลี่ยนรหัสผ่าน")
  end

  private

  def mailer(email, subject)
    if ENV.fetch('POSTMARK_API_TOKEN').blank?
      mail(to: email, subject: subject)
    else
      mail(to: email, subject: subject, track_opens: 'true')
    end
  end
end
