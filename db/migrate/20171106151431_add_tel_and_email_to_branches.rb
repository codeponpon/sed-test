class AddTelAndEmailToBranches < ActiveRecord::Migration[5.1]
  def change
    add_column :branches, :phone_no, :string
    add_column :branches, :email, :string
  end
end
