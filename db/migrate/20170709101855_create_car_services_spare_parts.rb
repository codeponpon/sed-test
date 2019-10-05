class CreateCarServicesSpareParts < ActiveRecord::Migration[5.1]
  def change
    create_table :car_services_spare_parts, id: false do |t|
      t.uuid :car_service_id, index: true
      t.uuid :spare_part_id, index: true
    end
  end
end
