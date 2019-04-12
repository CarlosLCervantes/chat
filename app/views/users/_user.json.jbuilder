json.handle @user.handle
json.room @room
json.rooms_user @rooms_user

json.messages(@room.messages) do |message|
  json.id message.id
  json.body message.body
  json.created_at message.created_at
end