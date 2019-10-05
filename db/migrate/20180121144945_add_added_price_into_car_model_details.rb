class AddAddedPriceIntoCarModelDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :car_model_details, :added_price, :integer
  end
end
