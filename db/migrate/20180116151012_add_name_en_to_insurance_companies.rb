class AddNameEnToInsuranceCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :insurance_companies, :name_en, :string
  end
end
