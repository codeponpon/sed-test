class CreateFaqs < ActiveRecord::Migration[5.1]
  def change
    create_table :faqs, id: :uuid do |t|
      t.string :question
      t.text :answer

      t.timestamps
    end
  end
end
