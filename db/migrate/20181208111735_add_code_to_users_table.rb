class AddCodeToUsersTable < ActiveRecord::Migration[5.1]
  def change
    add_column :api_guardian_users, :code, :string
  end
end
