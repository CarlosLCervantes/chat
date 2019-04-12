class CreateRoomMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :room_messages do |t|
      t.string :body, null: false
      t.references :rooms_user

      t.timestamps
    end
  end
end
