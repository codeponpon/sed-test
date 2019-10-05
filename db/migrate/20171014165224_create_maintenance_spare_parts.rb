class CreateMaintenanceSpareParts < ActiveRecord::Migration[5.1]
  def change
    create_table :maintenance_spare_parts, id: :uuid do |t|
      t.uuid :maintenance_id
      t.uuid :spare_part_id

      t.timestamps
    end
  end
end
