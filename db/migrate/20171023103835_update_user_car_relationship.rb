class UpdateUserCarRelationship < ActiveRecord::Migration[5.1]
  def change
    add_column :user_cars, :car_model_id, :uuid
    remove_index :user_cars, :car_id
    remove_column :user_cars, :car_id, :uuid
    add_index :user_cars, :car_model_id
  end
end
