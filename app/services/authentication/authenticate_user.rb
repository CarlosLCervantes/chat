module Authentication
  class AuthenticateUser
    prepend SimpleCommand

    def initialize(handle)
      @handle = handle
    end

    def call
      if user = User.find_by(handle: @handle)
        room = Room.default_room
        rooms_user = RoomsUser.where(room_id: room.id, user_id: user.id).first
        { user: user, room: room, rooms_user: rooms_user }
      else
        errors.add(:authentication, I18n.t("authenticate_user.failure"))
        nil
      end
    end
  end
end