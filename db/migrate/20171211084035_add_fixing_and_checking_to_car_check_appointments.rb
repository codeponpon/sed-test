class AddFixingAndCheckingToCarCheckAppointments < ActiveRecord::Migration[5.1]
  def change
    add_column :car_check_appointments, :fix_up, :boolean
    add_column :car_check_appointments, :check_up, :boolean
    remove_column :car_check_appointments, :appointment_type, :string
  end
end
