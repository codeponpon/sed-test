class AddOrderToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :priority, :integer, default: 0
    add_column :car_models, :priority, :integer, default: 0
    add_column :spare_parts, :priority, :integer, default: 0
    add_column :promotions, :priority, :integer, default: 0
    add_column :faqs, :priority, :integer, default: 0
  end
end
