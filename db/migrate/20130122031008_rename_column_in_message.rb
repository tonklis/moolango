class RenameColumnInMessage < ActiveRecord::Migration
  def change
  	rename_column :messages, :room_id, :conversation_id
  end
end
