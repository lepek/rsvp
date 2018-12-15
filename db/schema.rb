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

ActiveRecord::Schema.define(version: 2018_12_15_142912) do

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.time "time"
    t.text "address"
    t.text "description"
    t.string "image"
    t.string "header"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guests", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "main_guest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "kid"
    t.index ["main_guest_id"], name: "index_guests_on_main_guest_id"
  end

  create_table "guests_invitations", force: :cascade do |t|
    t.integer "guest_id"
    t.integer "invitation_id"
    t.index ["guest_id"], name: "index_guests_invitations_on_guest_id"
    t.index ["invitation_id"], name: "index_guests_invitations_on_invitation_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer "event_id"
    t.integer "main_guest_id"
    t.integer "attendance", default: 0
    t.text "notes"
    t.integer "adults", default: 0
    t.integer "kids", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_invitations_on_event_id"
    t.index ["main_guest_id"], name: "index_invitations_on_main_guest_id"
  end

  create_table "main_guests", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "total_guests"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_main_guests_on_email", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
