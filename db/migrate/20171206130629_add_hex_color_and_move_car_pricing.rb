class AddHexColorAndMoveCarPricing < ActiveRecord::Migration[5.1]
  def change
    add_column :car_model_details, :hex_color, :string
    remove_column :car_models, :price, :integer
    add_column :car_model_details, :price, :integer
  end
end
