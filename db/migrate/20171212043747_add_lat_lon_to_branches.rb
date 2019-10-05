class AddLatLonToBranches < ActiveRecord::Migration[5.1]
  def change
    add_column :branches, :lat, :string
    add_column :branches, :lng, :string
  end
end
