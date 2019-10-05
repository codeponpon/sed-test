class AddNameEnToSpareParts < ActiveRecord::Migration[5.1]
  def change
    add_column :spare_parts, :name_en, :string
  end
end
