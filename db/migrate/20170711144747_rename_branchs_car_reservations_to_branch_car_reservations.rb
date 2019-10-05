class RenameBranchsCarReservationsToBranchCarReservations < ActiveRecord::Migration[5.1]
  def change
    rename_table :branchs_car_reservations, :branch_car_reservations
  end
end
