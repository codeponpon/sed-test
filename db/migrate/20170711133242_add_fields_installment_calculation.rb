class AddFieldsInstallmentCalculation < ActiveRecord::Migration[5.1]
  def change
    add_column :car_reservations, :status, :string
    add_column :car_reservations, :down_payment, :integer
    add_column :car_reservations, :installment, :integer
    add_column :car_reservations, :interest, :integer
  end
end
