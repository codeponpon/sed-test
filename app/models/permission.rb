class Permission < ActiveRecord::Base
  include ApiGuardian::Concerns::Models::Permission
end
