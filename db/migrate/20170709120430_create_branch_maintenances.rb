class CreateBranchMaintenances < ActiveRecord::Migration[5.1]
  def change
    create_table :branch_maintenances, id: :uuid do |t|
      t.uuid :maintenance_id, index: true
      t.uuid :branch_id, index: true

      t.timestamps
    end
  end
end
