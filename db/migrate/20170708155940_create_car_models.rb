class CreateCarModels < ActiveRecord::Migration[5.1]
  def change
    create_table :car_models, id: :uuid do |t|
      t.uuid :car_id, index: true
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
