class AddImageToPicture < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :image, :string
    change_column :pictures, :url, :string, null: true
  end
end
