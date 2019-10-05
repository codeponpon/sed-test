class AddLocaleToFaqs < ActiveRecord::Migration[5.1]
  def change
    add_column :faqs, :locale, :string
  end
end
