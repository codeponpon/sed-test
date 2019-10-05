class ChangeInterestTypeInCarReservationsToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :car_reservations, :interest, :float
    change_column :car_reservations, :installment, :float
  end
end
