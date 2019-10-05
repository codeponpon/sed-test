class CreateBankAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_accounts, id: :uuid do |t|
      t.string :branch_name
      t.string :name
      t.string :account_number

      t.timestamps
    end
  end
end
