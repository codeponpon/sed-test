class AddStatusToMaintenanceSparePartsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :maintenance_spare_parts, :status, :string, default: 'pending'
  end
end
