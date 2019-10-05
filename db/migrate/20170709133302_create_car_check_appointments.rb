class CreateCarCheckAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :car_check_appointments, id: :uuid do |t|
      t.string :appointment_type
      t.string :details
      t.uuid :car_service_id
      t.uuid :car_id
      t.uuid :branch_id
      t.datetime :date_time_at

      t.timestamps
    end
  end
end
