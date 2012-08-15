class AddOpenTokSessionToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :open_tok_session, :string
  end
end
