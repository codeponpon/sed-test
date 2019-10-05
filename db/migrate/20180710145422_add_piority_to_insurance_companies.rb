class AddPiorityToInsuranceCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :insurance_companies, :priority, :integer, default: 0
  end
end
