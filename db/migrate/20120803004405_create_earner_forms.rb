class CreateEarnerForms < ActiveRecord::Migration
  def change
    create_table :earner_forms do |t|
      t.boolean :pricing
      t.boolean :donate
      t.string :email
      t.boolean :agree
			t.integer :user_id

      t.timestamps
    end
  end
end
