class Room < ApplicationRecord
  has_and_belongs_to_many :users

  # Note: Doing this avoid a Room index
  def self.default_room
    Room.find_or_create_by!(name: 'Party Time')
  end

  # Note: This is not optimal at all
  def messages
    user_ids = users.pluck(:id)
    rooms_user_ids = RoomsUser.where(room_id: self.id, user_id: user_ids).pluck(:id)
    RoomMessage.where(rooms_user_id: rooms_user_ids).order(created_at: :asc)
  end
end
