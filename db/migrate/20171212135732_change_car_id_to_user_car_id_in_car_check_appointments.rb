class ChangeCarIdToUserCarIdInCarCheckAppointments < ActiveRecord::Migration[5.1]
  def change
    remove_column :car_check_appointments, :car_id, :uuid
    add_column :car_check_appointments, :user_car_id, :uuid
  end
end
