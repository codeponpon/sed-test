class CreateCarModelDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :car_model_details, id: :uuid do |t|
      t.uuid :car_model_id
      t.string :color

      t.timestamps
    end
  end
end
