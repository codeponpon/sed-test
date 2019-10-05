class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks, id: :uuid do |t|
      t.text :detail

      t.timestamps
    end
  end
end
