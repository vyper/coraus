class AddOccurredAtToSchedules < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :occurred_at, :datetime
  end
end
