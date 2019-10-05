class AddNameToApiGuardianUser < ActiveRecord::Migration[5.1]
  def change
    add_column :api_guardian_users, :name, :string
    remove_column :api_guardian_users, :first_name
    remove_column :api_guardian_users, :last_name
  end
end
