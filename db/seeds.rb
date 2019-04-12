# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#

carlos = User.find_or_create_by!(handle: 'CCER')
charles = User.find_or_create_by!(handle: 'CHRLS')

party_room = Room.find_or_create_by!(name: 'Party Time')

carlos_party_room = RoomsUser.find_or_create_by!(user_id: carlos.id, room_id: party_room.id)
charles_party_room = RoomsUser.find_or_create_by!(user_id: charles.id, room_id: party_room.id)

RoomMessage.create!(rooms_user: carlos_party_room, body: 'Initial Message')




