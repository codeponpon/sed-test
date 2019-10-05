class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations, id: :uuid do |t|
      t.uuid :booking_id, index: true
      t.string :booking_type, index: true
      t.string :booking_no, index: true
      t.string :booking_date
      t.string :booking_code
      t.string :booking_count

      t.timestamps
    end
  end
end
