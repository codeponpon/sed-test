class Role < ActiveRecord::Base
  include ApiGuardian::Concerns::Models::Role
  scope :find_default_role, -> { find_by_default(true) }

  def self.get_default_role
    find_default_role
  end
end
