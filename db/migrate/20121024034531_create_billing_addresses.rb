class CreateBillingAddresses < ActiveRecord::Migration
  def change
    create_table :billing_addresses do |t|
      t.integer :user_id
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :city
      t.string :zipcode
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
