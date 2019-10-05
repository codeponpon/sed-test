class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings, id: :uuid do |t|
      t.uuid :user_id, index: true
      t.boolean :notification, default: true
      t.string :language, default: 'th'

      t.timestamps
    end
  end
end
