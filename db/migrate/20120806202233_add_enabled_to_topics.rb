class AddEnabledToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :enabled, :boolean
  end
end
