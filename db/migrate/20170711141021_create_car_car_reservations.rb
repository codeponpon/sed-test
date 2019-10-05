class CreateCarCarReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :car_car_reservations, id: :uuid do |t|
      t.uuid :car_reservation_id, index: true
      t.uuid :car_id, index: true
      t.uuid :car_model_id, index: true

      t.timestamps
    end
  end
end
