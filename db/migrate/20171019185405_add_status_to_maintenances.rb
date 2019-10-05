class AddStatusToMaintenances < ActiveRecord::Migration[5.1]
  def change
    add_column :maintenances, :status, :string
  end
end
