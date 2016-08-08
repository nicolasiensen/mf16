# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160808193906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "category"
    t.text     "short_description"
    t.text     "long_description"
    t.string   "address"
    t.datetime "start_at"
    t.string   "facebook_link"
    t.string   "google_calendar_link"
    t.boolean  "has_streaming"
    t.integer  "organizer_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "group_subscriptions", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "kind"
    t.string   "name"
    t.string   "district"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.string   "facebook_page"
    t.string   "facebook_group"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "theme"
  end

  create_table "settings", force: :cascade do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                               default: "", null: false
    t.string   "encrypted_password",                  default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "mailchimp_id"
    t.string   "facebook_id"
    t.string   "facebook_token"
    t.json     "facebook_friends"
    t.string   "district"
    t.string   "cell_phone_number"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "facebook_image"
    t.boolean  "admin"
    t.boolean  "has_signed_debate_petition"
    t.boolean  "wants_to_receive_tasks_via_whatsapp"
    t.boolean  "wants_to_donate"
    t.string   "school"
    t.string   "favorite_tasks",                      default: [],              array: true
    t.string   "favorite_topics",                     default: [],              array: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
