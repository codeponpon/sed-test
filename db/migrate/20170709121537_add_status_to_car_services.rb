class AddStatusToCarServices < ActiveRecord::Migration[5.1]
  def change
    add_column :car_services, :status, :string
  end
end
