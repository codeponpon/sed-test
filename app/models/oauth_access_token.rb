class OauthAccessToken < ApplicationRecord
  belongs_to :resource_owner, class_name: User, foreign_key: 'resource_owner_id'
end