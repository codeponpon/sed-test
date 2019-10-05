class AddReferrenceIdToCarReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :car_reservations, :car_id, :uuid, index: true
    add_column :car_reservations, :car_model_id, :uuid, index: true
    add_column :car_reservations, :branch_id, :uuid, index: true
  end
end
