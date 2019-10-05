class AddStatusUpdateToMaintenancesTable < ActiveRecord::Migration[5.1]
  def change
    add_column :maintenances, :status_update, :string
  end
end
