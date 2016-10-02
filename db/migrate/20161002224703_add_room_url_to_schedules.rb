class AddRoomUrlToSchedules < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :room_url, :string
  end
end
