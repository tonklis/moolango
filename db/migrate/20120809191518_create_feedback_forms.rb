class CreateFeedbackForms < ActiveRecord::Migration
  def change
    create_table :feedback_forms do |t|
      t.integer :rating
      t.text :comments
      t.text :topics
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
