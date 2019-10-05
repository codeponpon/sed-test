class Api::V1::ApiController < ApiGuardian::ApiController
  include AbstractController::Helpers
  helper_method :require_bot

  def return_bad_request
    render_error(
      400, 'invalid_request_body', 'Invalid Request Body', "Please check your request body."
    )
  end

  def require_bot
    render_error(
        401, 'identity_authorization_failed', 'Identity Authorization Failed', 'Please contact Admin!!'
      ) unless current_user.role.name.eql?('bot')
  end

  def otp_verification_failed
    render_error(
      422, 'otp_verification_failed', 'OTP Verification Failed',
      'The authentication code you provided is invalid or expired.'
    )
  end
end
