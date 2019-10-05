class AddIdToCarPromotionsTable < ActiveRecord::Migration[5.1]
  def up
    add_column :car_promotions, :id, :primary_key, default: -> { "gen_random_uuid()" }
  end

  def down
    remove_column :car_promotions, :id, :primary_key
  end
end
