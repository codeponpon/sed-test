class RemoveCarIdFromCarReservations < ActiveRecord::Migration[5.1]
  def up
    remove_column :car_reservations, :car_id, :uuid
    change_column :car_reservations, :interest, :float
    rename_column :car_reservations, :car_id_img, :card_id_img
    add_column :car_reservations, :booking_date, :datetime
  end

  def down
    add_column :car_reservations, :car_id, :uuid
    change_column :car_reservations, :interest, :integer
    rename_column :car_reservations, :card_id_img, :car_id_img
    remove_column :car_reservations, :booking_date, :datetime
  end
end
