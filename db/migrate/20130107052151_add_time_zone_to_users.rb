class AddTimeZoneToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :timezone, :string
  end
end
