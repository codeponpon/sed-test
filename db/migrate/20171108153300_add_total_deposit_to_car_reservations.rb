class AddTotalDepositToCarReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :car_reservations, :total_deposit, :float
  end
end
