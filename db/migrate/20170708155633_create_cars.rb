class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars, id: :uuid do |t|
      t.string :car_model

      t.timestamps
    end
  end
end
