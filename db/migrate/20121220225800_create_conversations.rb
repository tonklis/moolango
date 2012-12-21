class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.datetime :when
      t.integer :language_id
      t.string :topic
      t.integer :duration
      t.integer :buyer_id
      t.integer :seller_id
      t.integer :status_id
      t.string :opentok_session
      t.string :internal_session
      t.string :purpose
      t.string :slide_deck

      t.timestamps
    end
  end
end
