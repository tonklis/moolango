class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :purpose
      t.datetime :when
      t.string :options
			t.integer :user_id
			t.integer :room_id
			t.integer :language_id
			t.integer :length

      t.timestamps
    end
  end
end
