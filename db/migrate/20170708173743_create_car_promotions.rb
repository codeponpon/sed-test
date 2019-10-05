class CreateCarPromotions < ActiveRecord::Migration[5.1]
  def change
    create_table :car_promotions, id: false do |t|
      t.uuid :car_id, index: true
      t.uuid :promotion_id, index: true

      t.timestamps
    end
  end
end
