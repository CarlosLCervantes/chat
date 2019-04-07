# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_06_053803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "room_messages", force: :cascade do |t|
    t.string "body", null: false
    t.bigint "users_rooms_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_rooms_id"], name: "index_room_messages_on_users_rooms_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms_users", id: false, force: :cascade do |t|
    t.bigint "rooms_id"
    t.bigint "users_id"
    t.index ["rooms_id"], name: "index_rooms_users_on_rooms_id"
    t.index ["users_id"], name: "index_rooms_users_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "handle", null: false
    t.datetime "last_login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["handle"], name: "index_users_on_handle"
  end

end
