class CreateCarServices < ActiveRecord::Migration[5.1]
  def change
    create_table :car_services, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
