class AddStatusUpdateToCarReservationsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :car_reservations, :status_update, :string
  end
end
