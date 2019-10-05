class AddMidToSettingsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :mid, :uuid
  end
end
