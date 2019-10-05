class CreatePromotions < ActiveRecord::Migration[5.1]
  def change
    create_table :promotions, id: :uuid do |t|
      t.string :details

      t.timestamps
    end
  end
end
