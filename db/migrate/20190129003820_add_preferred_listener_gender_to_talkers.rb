class AddPreferredListenerGenderToTalkers < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      CREATE TYPE talker_preferred_listener_gender AS ENUM ('male', 'female', 'indifferent');
    SQL

    add_column :talkers, :preferred_listener_gender, :talker_preferred_listener_gender
  end

  def down
    remove_column :talkers, :preferred_listener_gender

    execute <<-SQL
      DROP TYPE talker_preferred_listener_gender;
    SQL
  end
end
