class AddFieldsToBranches < ActiveRecord::Migration[5.1]
  def change
    add_column :branches, :address, :string
    add_column :branches, :address_en, :string
    add_column :branches, :name_en, :string
    add_column :branches, :fax_no, :string
    add_column :branches, :line_id, :string
    add_column :branches, :tax_id, :string
    add_column :branches, :dealer_code, :string
  end
end
