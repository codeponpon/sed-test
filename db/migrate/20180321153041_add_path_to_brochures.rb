class AddPathToBrochures < ActiveRecord::Migration[5.1]
  def change
    add_column :brochures, :path, :string
  end
end
