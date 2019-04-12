require "rails_helper"

RSpec.describe MessagingChannel, :type => :channel do
  it "successfully subscribes" do
    room = create(:room)
    user = create(:user)
    rooms_user = create(:rooms_user, room_id: room.id, user_id: user.id)

    stub_connection handle: user.handle
    subscribe

    perform :speak, rooms_user: rooms_user.attributes, message: 'World Hello!'

    expect(subscription).to be_confirmed
    expect(subscription).to have_stream_from("messaging_channel")
  end
end