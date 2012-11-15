class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :email
      t.string :topics

      t.timestamps
    end
  end
end
