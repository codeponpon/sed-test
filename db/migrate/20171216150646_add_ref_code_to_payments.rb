class AddRefCodeToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :ref_code, :string
    add_column :payments, :car_check_appointment_id, :uuid
  end
end
