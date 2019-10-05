class AddLineIdAndDocumentAddressToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :api_guardian_users, :line_id, :string
    add_column :api_guardian_users, :document_address, :text
  end
end
