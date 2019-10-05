class UserSerializer < ActiveModel::Serializer
  type :users

  attributes :id, :code, :name, :email, :email_confirmed_at,
             :phone_number, :phone_number_confirmed_at,
             :address, :line_id, :document_address,
             :created_at, :updated_at

  attribute :guest?, key: :is_guest

  belongs_to :role
  has_one :setting
end