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

ActiveRecord::Schema.define(version: 20190202203553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

# Could not dump table "listeners" because of following StandardError
#   Unknown type 'listener_gender' for column 'gender'

  create_table "schedules", id: :serial, force: :cascade do |t|
    t.integer "listener_id", null: false
    t.integer "talker_id"
    t.datetime "scheduled_to", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "room_url"
    t.datetime "occurred_at"
    t.integer "duration"
    t.index ["listener_id"], name: "index_schedules_on_listener_id"
    t.index ["talker_id"], name: "index_schedules_on_talker_id"
  end

# Could not dump table "talkers" because of following StandardError
#   Unknown type 'talker_preferred_listener_gender' for column 'preferred_listener_gender'

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "schedules", "listeners"
  add_foreign_key "schedules", "talkers"
end
