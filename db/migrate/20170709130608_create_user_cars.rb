class CreateUserCars < ActiveRecord::Migration[5.1]
  def change
    create_table :user_cars, id: :uuid do |t|
      t.uuid :user_id, index: true
      t.uuid :car_id, index: true
      t.string :license_plate
      t.string :body_number

      t.timestamps
    end
  end
end
