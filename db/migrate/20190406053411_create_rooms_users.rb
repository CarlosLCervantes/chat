class CreateRoomsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms_users do |t|
      t.belongs_to :rooms, index: true
      t.belongs_to :users, index: true
    end
  end
end
