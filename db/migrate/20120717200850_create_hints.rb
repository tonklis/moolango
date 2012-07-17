class CreateHints < ActiveRecord::Migration
  def change
    create_table :hints do |t|
      t.integer :topic_id
      t.string :thumbnail_url
      t.string :description

      t.timestamps
    end
  end
end
