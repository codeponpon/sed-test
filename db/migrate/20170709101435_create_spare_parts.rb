class CreateSpareParts < ActiveRecord::Migration[5.1]
  def change
    create_table :spare_parts, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
