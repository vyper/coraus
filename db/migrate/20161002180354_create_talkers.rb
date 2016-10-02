class CreateTalkers < ActiveRecord::Migration[5.0]
  def change
    create_table :talkers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.datetime :forecast_at

      t.timestamps
    end
  end
end
