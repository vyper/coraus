class AddGenderToListener < ActiveRecord::Migration[5.1]
  def up
    execute "CREATE TYPE listener_gender AS ENUM ('male', 'female')"
    add_column :listeners, :gender, :listener_gender
  end

  def down
    remove_column :listeners, :gender
    execute "DROP TYPE listener_gender"
  end
end
