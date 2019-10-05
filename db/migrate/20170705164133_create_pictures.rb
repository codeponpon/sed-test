class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures, id: :uuid do |t|
      t.string :url, null: false
      t.uuid :image_id, index: true
      t.string :image_type, index: true
      t.timestamps
    end
  end
end
