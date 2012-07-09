class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :creator_id
      t.integer :joiner_id
      t.string :name
      t.boolean :busy
      t.integer :session_id
			t.integer :language_id

      t.timestamps
    end
  end
end
