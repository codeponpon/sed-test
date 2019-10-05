class CreateCarReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :car_reservations, id: :uuid do |t|
      t.uuid :user_id, index: true
      t.uuid :car_id, index: true
      t.uuid :car_model_id, index: true
      t.string :details

      t.timestamps
    end
  end
end
