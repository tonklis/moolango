class ChangeDefaultCredits < ActiveRecord::Migration
  def change
    change_column :users, :credits, :float, :default => 10.00
  end
end
