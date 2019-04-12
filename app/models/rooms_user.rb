class RoomsUser < ApplicationRecord
  has_one :room
  has_one :user
  has_many :room_messages
end
