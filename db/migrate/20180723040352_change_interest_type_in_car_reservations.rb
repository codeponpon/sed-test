class ChangeInterestTypeInCarReservations < ActiveRecord::Migration[5.1]
  def change
    change_column :car_reservations, :interest, :decimal
    change_column :car_reservations, :installment, :decimal
  end
end
