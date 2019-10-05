class AddImageFieldInCarReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :car_reservations, :car_id_img, :string
    add_column :car_reservations, :house_registration_img, :string
    add_column :car_reservations, :book_bank_img, :string
    add_column :car_reservations, :payment_confirmation_img, :string
  end
end
