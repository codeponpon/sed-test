class RemoveCarServiceIdFromMaintenances < ActiveRecord::Migration[5.1]
  def change
    remove_column :maintenances, :car_service_id, :uuid
    add_column :maintenances, :user_id, :uuid

    add_index :maintenances, :user_id, unique: true
  end
end
