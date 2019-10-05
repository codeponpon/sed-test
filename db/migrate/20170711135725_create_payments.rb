class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments, id: :uuid do |t|
      t.uuid :car_reservation_id, index: true
      t.uuid :bank_account_id
      t.string :payment_type
      t.integer :total
      t.string :status

      t.timestamps
    end
  end
end
