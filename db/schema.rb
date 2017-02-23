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

ActiveRecord::Schema.define(version: 20170223114720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_comments_on_game_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.float    "critic_rating"
    t.integer  "time_to_beat"
    t.integer  "pegi_rating"
    t.string   "cover_img"
    t.string   "video_url"
    t.string   "release_date"
    t.integer  "genres",        default: [],              array: true
    t.integer  "platforms",     default: [],              array: true
    t.string   "screenshots",   default: [],              array: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "libraries", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.boolean  "played"
    t.boolean  "owned"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_libraries_on_game_id", using: :btree
    t.index ["user_id"], name: "index_libraries_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "profile_img"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "comments", "games"
  add_foreign_key "comments", "users"
  add_foreign_key "libraries", "games"
  add_foreign_key "libraries", "users"
end
