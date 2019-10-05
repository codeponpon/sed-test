class AddLicensePlateDetailToUserCars < ActiveRecord::Migration[5.1]
  def change
    add_column :user_cars, :license_alphabet_group, :string
    add_column :user_cars, :license_number_group, :string
    add_column :user_cars, :license_province, :string
  end
end
