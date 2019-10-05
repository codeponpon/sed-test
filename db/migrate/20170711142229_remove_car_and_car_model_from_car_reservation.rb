class RemoveCarAndCarModelFromCarReservation < ActiveRecord::Migration[5.1]
  def change
    remove_column :car_reservations, :car_id, :uuid
    remove_column :car_reservations, :car_model_id, :uuid
  end
end
