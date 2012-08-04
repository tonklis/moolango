class AddLanguageToHints < ActiveRecord::Migration
  def change
    add_column :hints, :language_id, :integer
  end
end
