ApiGuardian.configure do |config|
  # In order to change the base user class, you'd need to uncomment this line and
  # enter your own class name. Your class will need to include the
  # ApiGuardian::Concerns::Models::User module.
  config.user_class = 'User'
  config.role_class = 'Role'
  config.permission_class = 'Permission'
  config.role_permission_class = 'RolePermission'
  config.identity_class = 'Identity'

  # Change the minimum password length to set a user's password. Default is 8 add
  # it is recommended that it not be any lower.
  # config.minimum_password_length = 8

  # The scores 0, 1, 2, 3 or 4 are given
  # when the estimated crack time (seconds) is less than 10**2, 10**4, 10**6, 10**8, Infinity.
  # A score of less than 3 is not recommended.
  config.minimum_password_score = 1

  # Enable two-factor authentication
  config.enable_2fa = true

  # Methods for sending the 2FA one-time password. Note: it is not recommended
  # that 2FA codes be sent through email.
  # config.available_2fa_methods = %w(sms voice google_auth email)

  # Allow anonymous user authentication
  config.allow_guest_authentication = false

  # 2FA header name. This header is used to validate a OTP and can be customized
  # to have the app name, for example.
  # config.otp_header_name = 'AG-2FA-TOKEN'

  # 2FA Send From Number. This is the Twilio number we will send from.
  # config.twilio_send_from = nil

  # Twilio Account SID and token (used with two-factor authentication)
  # config.twilio_id = nil
  # config.twilio_token = nil

  # Access token expiration time (default 2 hours).
  config.access_token_expires_in = 1.year

  # WWW-Authenticate Realm (default 'ApiGuardian').
  config.realm = 'SEDIGITAL API'

  # JSON Web Tokens are used as the OAuth2 access token. Generating the JWT can
  # be configured in the following ways:
  #
  # The JWT issuer can be configured. The default is 'api_guardian_' with the
  # current version of ApiGuardian appended.
  config.jwt_issuer = 'sedigital'
  #
  # The JWT secret can be customized to improve security of the JWT payload. By
  # default, a simple secret token is used. But, if you're using RS* encoding, you
  # must specify the path to your secret key.
  config.jwt_secret = ENV['JWT_SERCRET']
  # config.jwt_secret_key_path = 'path/to/file.pem'
  #
  # The Encryption Method can use any of the valid methods found in
  # https://github.com/jwt/ruby-jwt. The default is HMAC 256.
  config.jwt_encryption_method = :hs256

  # The Client Password Reset URL is used in the email sent when resetting
  # a user's password. The client should post the token provided along with the
  # users's new password to /complete-reset-password. This is done because this
  # library is meant to be used on API-Only Rails apps which means there is no
  # internal route for the user to reset their password, and the functionality
  # must be provided by the client.
  config.client_password_reset_url = ENV['HOST_NAME']

  # You can use this block to hook into what happens when a one-time password token
  # needs to be sent via SMS. This allows you to use any provider for sending the SMS.
  config.on_send_otp_via_sms = lambda do |user|
    # Example using Twilio - twilio-ruby
    SendSmsJob.perform_later(user, 'otp')
  end

  # You can use this block to hook into what happens when user's phone number is
  # verified. Often, you'll want to send a thank you.
  config.on_phone_verified = lambda do |user|
    # Example using Twilio - twilio-ruby
    SendSmsJob.perform_later(user, 'phone_verified')
  end

  # Often, applications will want to send emails or do other things specific to
  # registration. You can use this block to hook into what happens after a user is
  # registered.
  config.after_user_registered = lambda do |user|
    # SendEmailJob.perform_later(user, 'welcome')
    # SubscribeUserToMailingListJob.perform_later(user)
  end

  # You can use this block to hook into what happens after a user's password
  # reset is initiated. `reset_url` will be provided and can be used to customize
  # an email sent to the user.
  config.on_reset_password = lambda do |user, reset_url|
    UserMailer.reset_password_instructions(user).deliver_later
  end

  config.on_send_otp_via_email = lambda do |user|
    UserMailer.reset_password_otp(user).deliver_later
  end

  config.on_reset_password_complete = lambda do |user|
    UserMailer.reset_password_completed(user).deliver_later
  end
end
