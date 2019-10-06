class Api::V1::RegistrationController < ApiGuardian::RegistrationController

  api :POST, '/register', 'Sign up'
  error :code => 400, :desc => 'Bad Request'
  description "method description"
  formats ['json']
  param :email, String, required: true
  param :phone_number, String, required: true
  param :name, String, required: true
  example '
  {
    "data": {
        "id": "ac54aefa-fac6-4680-b42c-8742254c480e",
        "type": "users",
        "attributes": {
            "code": "C20191065918",
            "name": "Pond",
            "email": "user@example.com",
            "email-confirmed-at": "2019-10-06T19:59:16.310+07:00",
            "phone-number": "0623939898",
            "phone-number-confirmed-at": null,
            "address": null,
            "line-id": null,
            "document-address": null,
            "created-at": "2019-10-06T19:59:17.689+07:00",
            "updated-at": "2019-10-06T19:59:18.210+07:00",
            "is-guest": false
        },
        "relationships": {
            "role": {
                "data": {
                    "id": "4eecd34d-d6ea-4495-8839-f892bd1ede2d",
                    "name": "customer",
                    "default": true,
                    "created_at": "2019-10-05T15:30:51.545+07:00",
                    "updated_at": "2019-10-05T15:30:51.545+07:00"
                }
            },
            "setting": {
                "data": {
                    "id": "f99dc485-8c73-4b78-999b-498a848ed0db",
                    "user_id": "ac54aefa-fac6-4680-b42c-8742254c480e",
                    "notification": true,
                    "language": "th",
                    "created_at": "2019-10-06T19:59:17.782+07:00",
                    "updated_at": "2019-10-06T19:59:17.782+07:00",
                    "mid": null
                }
            }
        }
    }
}'
  def create
    user = UserStore.register(register_params)
    UserStore.new(nil).add_phone(user, add_phone_params)
    render json: user, adapter: :json_api, status: :created, include: ['role']
  end

  api :POST, '/set-password', 'Set new password'
  error :code => 400, :desc => 'Bad Request'
  description "method description"
  formats ['json']
  param :data, Hash, required: true do
    param :user, Hash, required: true do
      param :token, String, required: true
      param :email, String, required: true
      param :password, String, required: true
      param :password_confirmation, String, required: true
    end
  end
  example '
  {
      "status": "OK"
  }'
  def set_password
    user = User.find_by_email(params[:data][:user][:email])
    if user.nil? || (user && user.phone_number_confirmed_at.nil?)
      error = {
        code: 'not_found',
        status: 404,
        title: 'Not Found',
        detail: 'Resource not found or endpoint missing: ' + request.original_url
      }
      return render json: { errors: [error] }, status: error[:status]
    end

    user.assign_attributes(complete_reset_password_params.slice(:password, :password_confirmation))
    if user.save!
      user.send_welcome_email_to_user
      return render json: user, adapter: :json_api, status: :ok, include: [:role]
    else
      return render json: {status: 'Bad Request'}, status: :bad_request
    end
  end

  api :POST, '/reset-password', 'Reset new password'
  error :code => 400, :desc => 'Bad Request'
  description "method description"
  formats ['json']
  param :data, Hash, required: true do
    param :user, Hash, required: true do
      param :phone_number, String
      param :country_code, String, 'default is 66'
      param :email, String
      param :password, String
      param :password_confirmation, String
    end
  end
  example '
  {
      "data": {
          "user_id": "b8dd09b0-fcc3-4248-82e7-f95e2f05a6b7"
      }
  }'
  def reset_password
    if params[:data][:user][:phone_number].present?
      phone_number = params[:data][:user][:phone_number].gsub(/^0/, '66')
      user = User.find_by(phone_number: phone_number)
      reset_by = 'sms' if user.present?
    elsif params[:data][:user][:email].present?
      user = User.find_by(email: params[:data][:user][:email])
      reset_by = 'email' if user.present?
    end

    if user.nil? || !user.update_attributes(password: 'asdqwe123', password_confirmation: 'asdqwe123')
      return render json: { errors: [error_404] }, status: error_404[:status]
    end

    user.otp_enabled = true
    user.reset_password_token = SecureRandom.hex(64)
    user.reset_password_sent_at = DateTime.now.utc
    user.save

    if reset_by.eql?('sms')
      SendSmsJob.perform_later(user, 'otp')
    else
      SendEmailJob.perform_later(user, 'otp')
    end

    render json: {status: 'success', id: user.id, email: user.email}, adapter: :json_api, status: :ok
  end

  protected

  def register_params
    params[:password] = 'asdqwe123'
    params[:password_confirmation] = 'asdqwe123'
    params.require(:type)
    strategy = find_strategy(params.fetch(:type, nil))
    params.permit(:type, *strategy.params, :name, :phone_number)
  end

  def add_phone_params
    params[:country_code] = '66'
    params.permit(:password, :phone_number, :country_code)
  end

  def complete_reset_password_params
    params.require(:data).require(:user).permit(:token, :email, :password, :password_confirmation)
  end

  def reset_password_params
    if params[:data][:user][:password].nil?
      params[:data][:user][:password] = 'asdqwe123'
      params[:data][:user][:password_confirmation] = 'asdqwe123'
    end

    params[:data][:user][:country_code] = '66' if params[:data][:user][:country_code].nil?
    params.require(:data).require(:user).permit(:email, :phone_number, :password, :password_confirmation, :country_code)
  end

  def error_404
    {
        code: 'not_found',
        status: 404,
        title: 'Not Found',
        detail: 'Resource not found or endpoint missing: ' + request.original_url
    }
  end
end
