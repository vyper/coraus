class CreateListeners < ActiveRecord::Migration[5.0]
  def change
    create_table :listeners do |t|
      t.string :name
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
