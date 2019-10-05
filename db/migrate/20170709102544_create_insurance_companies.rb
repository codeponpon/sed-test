class CreateInsuranceCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :insurance_companies, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
