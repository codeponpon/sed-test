class AddStatusToCarCheckAppointmentTable < ActiveRecord::Migration[5.1]
  def change
    add_column :car_check_appointments, :status, :string
  end
end
