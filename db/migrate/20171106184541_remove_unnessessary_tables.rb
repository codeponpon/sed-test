class RemoveUnnessessaryTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :car_car_reservations
    drop_table :branch_car_reservations
  end
end
