class CreateBranchsCarReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :branchs_car_reservations, id: false do |t|
      t.uuid :car_reservation_id, index: true
      t.uuid :branch_id, index: true
    end
  end
end
