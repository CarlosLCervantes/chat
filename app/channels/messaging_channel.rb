class MessagingChannel < ApplicationCable::Channel
  def subscribed
    stream_from channel_identifier
  end

  def unsubscribed
    stop_all_streams
  end

  def speak(data)
    rooms_user_id = data.dig('rooms_user', 'id')
    rooms_user = RoomsUser.find(rooms_user_id)

    message = RoomMessage.create!(rooms_user: rooms_user, body: data['message'])

    ActionCable.server.broadcast channel_identifier, { message: message }
  end

  private

  def channel_identifier
    # Note, this should be unique to the Room. But since I restricted to one Room. It's fine.
    'messaging_channel'
  end
end
