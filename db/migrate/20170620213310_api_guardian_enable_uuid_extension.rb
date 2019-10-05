class ApiGuardianEnableUuidExtension < ActiveRecord::Migration[5.1]
  def change
  	enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    enable_extension 'uuid-ossp'
  end
end
