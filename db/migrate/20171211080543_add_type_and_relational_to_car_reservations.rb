class AddTypeAndRelationalToCarReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :car_reservations, :reservation_type, :string
    add_column :car_reservations, :car_model_detail_id, :uuid

    remove_column :car_reservations, :car_model_id, :uuid
  end
end
