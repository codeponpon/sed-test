class CreateMaintenanceInsuranceCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :maintenance_insurance_companies, id: :uuid do |t|
      t.uuid :maintenance_id
      t.uuid :insurance_company_id

      t.timestamps
    end
  end
end
