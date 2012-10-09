class CreateSchedulesTopicsJoin < ActiveRecord::Migration
  def up
		create_table :schedules_topics, :id => false do |t|
      t.integer :schedule_id
      t.integer :topic_id
		end
  end

  def down
		drop_table :schedules_topics
  end
end
