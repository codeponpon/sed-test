class AddNameToCarModelDetailsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :car_model_details, :name, :string
  end
end
