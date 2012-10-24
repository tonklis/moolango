class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.string :paypal_trans_id
      t.integer :pricing_id
      t.integer :billing_address_id

      t.timestamps
    end
  end
end
