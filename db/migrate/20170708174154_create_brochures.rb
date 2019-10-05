class CreateBrochures < ActiveRecord::Migration[5.1]
  def change
    create_table :brochures, id: :uuid do |t|
      t.uuid :car_model_id, index: true
      t.string :url

      t.timestamps
    end
  end
end
