class AddCreditsToUser < ActiveRecord::Migration
  def change
    add_column :users, :credits, :float, :default => 0.00
  end
end
