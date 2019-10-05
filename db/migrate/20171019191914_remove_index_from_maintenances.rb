class RemoveIndexFromMaintenances < ActiveRecord::Migration[5.1]
  def change
    remove_index :maintenances, :user_id

    add_index :maintenances, :user_id
  end
end
