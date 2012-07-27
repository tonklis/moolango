class AddCreditsToUser < ActiveRecord::Migration
  def change
    add_column :users, :credits, :float, :default => 2.00
  end
end
