class RemoveRoomIdFromEvaluation < ActiveRecord::Migration
  def up
	rename_column :evaluation_buyers, :room_id, :conversation_id
	rename_column :evaluation_sellers, :room_id, :conversation_id
  end

  def down
	rename_column :evaluation_buyers, :conversation_id, :room_id
	rename_column :evaluation_sellers, :conversation_id, :room_id	
  end
end
