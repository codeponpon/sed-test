class CreateMaintenances < ActiveRecord::Migration[5.1]
  def change
    create_table :maintenances, id: :uuid do |t|
      t.uuid :car_service_id, index: true
      t.datetime :date_time_at

      t.timestamps
    end
  end
end
