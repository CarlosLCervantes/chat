class MessagingChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messaging_channel"
    # TODO: Replace with Room object
  end

  def unsubscribed
    # stop_all_streams
  end

  def speak
    # ??
  end
end
