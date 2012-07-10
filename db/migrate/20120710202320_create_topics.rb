class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.string :description
      t.integer :super_id
      t.string :thumbnail_url

      t.timestamps
    end
  end
end
