class AddUserIdToCarCheckAppointments < ActiveRecord::Migration[5.1]
  def change
    add_column :car_check_appointments, :user_id, :uuid, index: true
  end
end
