class AddLocaleToBankAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :bank_accounts, :locale, :string
    add_column :bank_accounts, :bank_name, :string
  end
end
