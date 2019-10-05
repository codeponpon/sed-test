class Api::V1::UsersController < Api::V1::ApiController
  skip_before_action :doorkeeper_authorize!, only: [:add_phone, :verify_phone, :verify_otp, :expire_token]

  def_param_group :user do
    param :data, Hash, required: true do
      param :user, Hash, required: true do
        param :name, String
        param :email, String
        param :address, String
        param :role_id, String
        param :password, String
        param :password_confirmation, String
        param :line_id, String
        param :document_address, String, 'กรณีเลือกที่อยู่สำหรับจัดส่งเอกสาร'
        param :setting_attributes, Hash, of: Hash do
          param :notification, [true, false], 'Do you need a notification?'
          param :language, [:th, :en], 'TH|EN'
          param :mid, String, 'Onesignal Player id'
        end
      end
    end
  end

  def index
    policy_scope(User)
    users = User.all
    render json: users, include: [:picture, :cars, :car_reservations, :setting, :user_cars], adapter: :json_api, status: :ok
  end

  def show
    render json: current_user, include: [:picture, :cars, :car_reservations, :setting, :user_cars], adapter: :json_api, status: :ok
  end

  api :GET, '/users/:id/setting', 'Show a user setting'
  error :code => 401, :desc => "Unauthorized"
  description "method description"
  formats ['json']
  example '
  {URL}/auth/users/{ID}/setting
  Response:
  {
    "data": {
      "id": "18",
      "type": "settings",
      "attributes": {
        "notification": true,
        "language": "th",
        "mid": "d09c6834-9100-4876-8386-228e9184a40a"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "560a2dae-d4fb-4065-b394-9344d93d8345",
            "type": "users"
          }
        }
      }
    }
  }'
  def setting
    render json: current_user.setting, adapter: :json_api, include: [:user], status: :ok
  end

  api :POST, '/users/:id/add_phone', 'Add phone number'
  description "method description"
  formats ['json']
  param :data, Hash, required: true do
    param :attributes, Hash, required: true do
      param :email, String, required: true
      param :phone_number, String, required: true
      param :country_code, String
      param :password, String
    end
  end
  def add_phone
    resource_store.add_phone(resource, add_phone_params)
    render json: {status: 'Success'}, adapter: :json_api, status: :created
  end

  api :POST, '/users/:id/verify_phone', 'Verify phone number'
  description "method description"
  formats ['json']
  def verify_phone
    user = resource
    user.otp_enabled = false if user.otp_enabled
    unless resource_store.verify_phone(user, verify_phone_params)
      return phone_verification_failed
    end
    UserStore.reset_password(user.email)
    render json: {token: resource.reset_password_token}, status: :ok
  end

  api :POST, '/users/:id/verify_otp', 'Verify OTP that send to user'
  description "method description"
  formats ['json']
  def verify_otp
    user = resource
    if user.authenticate_otp params[:data][:attributes][:otp], drift: 180
      user.reset_password_token = SecureRandom.hex(64)
      user.reset_password_sent_at = DateTime.now.utc
      user.save
      return render json: {token: resource.reset_password_token}, status: :ok
    end
    otp_verification_failed
  end

  api :PUT, '/users/:id', 'Update car detail'
  error :code => 400, :desc => 'Bad Request'
  description "method description"
  formats ['json']
  param_group :user
  example '
  {
      "data": {
          "id": "7f594786-7b3b-43de-82b2-12e234d8bf7b",
          "type": "users",
          "attributes": {
              "name": "Admin Pond",
              "email": "admin@example.com",
              "email-confirmed-at": null,
              "phone-number": "0874352540",
              "phone-number-confirmed-at": null,
              "created-at": "2017-10-14T15:02:37.102Z",
              "updated-at": "2017-11-23T14:14:46.540Z",
              "is-guest": false
          },
          "relationships": {
              "role": {
                  "data": {
                      "id": "f51189af-422e-416c-ad46-aa2400a30ba4",
                      "type": "roles"
                  }
              },
              "setting": {
                  "data": {
                      "id": "23321795-a771-49c0-876e-2bfd5977fedc",
                      "type": "settings"
                  }
              },
              "picture": {
                  "data": null
              },
              "car-models": {
                  "data": [
                      {
                          "id": "4a076eb9-0465-4da1-a6a9-aa8cba3ac08d",
                          "type": "car-models"
                      }
                  ]
              },
              "car-reservations": {
                  "data": [
                      {
                          "id": "549c08cc-89ce-4576-aba9-9ea1398a111c",
                          "type": "car-reservations"
                      }
                  ]
              },
              "car-check-appointments": {
                  "data": []
              }
          }
      },
      "included": [
          {
              "id": "23321795-a771-49c0-876e-2bfd5977fedc",
              "type": "settings",
              "attributes": {
                  "notification": true,
                  "language": "th",
                  "mid": "d09c6834-9100-4876-8386-228e9184a40a"
              },
              "relationships": {
                  "user": {
                      "data": {
                          "id": "7f594786-7b3b-43de-82b2-12e234d8bf7b",
                          "type": "users"
                      }
                  }
              }
          },
          {
              "id": "4a076eb9-0465-4da1-a6a9-aa8cba3ac08d",
              "type": "car-models",
              "attributes": {
                  "name": "Civic Type R",
                  "price": 1000000
              },
              "relationships": {
                  "car-model-details": {
                      "data": []
                  },
                  "brochure": {
                      "data": null
                  }
              }
          }
      ]
  }'
  def update
    authorize current_user
    current_user.update_attributes!(update_resource_params)
    render json: current_user, adapter: :json_api, status: :created, include: [:role, :setting, :car_models, :picture]
  end

  def destroy
    authorize User
    return_bad_request unless User.find_by_id(params[:id]).really_destroy!
    render json: {status: 'success'}, adapter: :json_api, status: :ok
  end

  api :DELETE, '/users/:id/user_cars/:user_car_id', 'Delete use\'s car'
  error :code => 400, :desc => 'Bad Request'
  error :code => 401, :desc => 'Not Authenticated'
  description "method description"
  formats ['json']
  example '
  {
    "message": "success"
  }'
  def destroy_user_car
    authorize User
    return_bad_request unless current_user.user_cars.find(params[:user_car_id]).destroy
    render json: {status: 'success'}, adapter: :json_api, status: :ok
  end

  def expire_token
    authorize current_user
    render json: {status: 'success'}, adapter: :json_api, status: :ok if OauthAccessToken.find_by_resource_owner_id(current_user.id).destroy
  end

  protected

  def resource
    password = params[:data][:attributes][:password].nil? ? 'asdqwe123' : params[:data][:attributes][:password]
    ApiGuardian.authenticate(:email, email: params[:data][:attributes][:email], password: password)
  end

  def resource_store
    UserStore.new(nil)
  end

  def create_params
    [:name, :email, :address, :role_id, :password, :password_confirmation, { setting: [:notification, :language, :mid] }]
  end

  def update_resource_params
    params.require(:data).require(:user).permit(:name,
                                                :email,
                                                :address,
                                                :role_id,
                                                :password,
                                                :password_confirmation,
                                                :phone_number,
                                                :line_id,
                                                :document_address,
                                                setting_attributes: [:notification, :language, :mid],
                                                user_cars_attributes: [:car_model_id, :license_plate, :body_number])
  end

  def add_phone_params
    params[:data][:attributes][:password] = 'asdqwe123' if params[:data][:attributes][:password].nil?
    params.require(:data).require(:attributes).permit(:password, :phone_number, :country_code)
  end

  def verify_phone_params
    params.require(:data).require(:attributes).permit(:otp)
  end

  def phone_verification_failed
    error = {
        code: 'phone_verification_failed',
        status: 422,
        title: 'Phone Verification Failed',
        detail: 'The authentication code you provided is invalid or expired.'
    }
    render json: { errors: [error] }, status: error[:status]
  end
end
