class AddAddressToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :api_guardian_users, :address, :text
  end
end
