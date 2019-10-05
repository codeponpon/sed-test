class CreateBranches < ActiveRecord::Migration[5.1]
  def change
    create_table :branches, id: :uuid do |t|
      t.string :name
      t.string :branch_type

      t.timestamps
    end
  end
end
