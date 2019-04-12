class MessagingChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messaging_channel"
  end

  def unsubscribed
    stop_all_streams
  end

  def speak(data)
    rooms_user_id = data.dig('rooms_user', 'id')
    rooms_user = RoomsUser.find(rooms_user_id)

    message = RoomMessage.create!(rooms_user: rooms_user, body: data['message'])

    ActionCable.server.broadcast 'messaging_channel', { message: message, user: current_user }
  end
end
