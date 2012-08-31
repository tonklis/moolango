class CreateEvaluationSellers < ActiveRecord::Migration
  def change
    create_table :evaluation_sellers do |t|
      t.integer :room_id
      t.integer :enjoy
      t.integer :recommend
      t.integer :helpful
      t.integer :confidence
      t.integer :improvement

      t.timestamps
    end
  end
end
