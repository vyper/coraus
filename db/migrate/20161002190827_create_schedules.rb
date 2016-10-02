class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.references :listener,     null: false, foreign_key: true
      t.references :talker,       null: true,  foreign_key: true
      t.datetime   :scheduled_to, null: false

      t.timestamps
    end
  end
end
