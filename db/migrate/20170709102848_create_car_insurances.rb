class CreateCarInsurances < ActiveRecord::Migration[5.1]
  def change
    create_table :car_insurances, id: :uuid do |t|
      t.uuid :car_service_id, index: true
      t.uuid :insurance_company_id, index: true
    end
  end
end
