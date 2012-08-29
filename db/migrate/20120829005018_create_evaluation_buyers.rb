class CreateEvaluationBuyers < ActiveRecord::Migration
  def change
    create_table :evaluation_buyers do |t|
      t.integer :room_id
      t.integer :clarity
      t.integer :pronunciation
      t.integer :fluency
      t.integer :comprehension
      t.integer :content

      t.timestamps
    end
  end
end
