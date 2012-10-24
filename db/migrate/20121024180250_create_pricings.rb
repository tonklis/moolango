class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|
      t.float :price
      t.integer :minutes
      t.string :description

      t.timestamps
    end
  end
end
