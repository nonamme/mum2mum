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

ActiveRecord::Schema.define(version: 20170814041007) do

  create_table "addresses", force: :cascade do |t|
    t.string "city"
    t.string "street"
    t.integer "home_number"
    t.string "post_code"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_addresses_on_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "commenter_id"
    t.integer "user_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "begin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "place_id"
  end

  create_table "newsletters", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.integer "local_no"
    t.string "street"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "post_code"
    t.string "link"
    t.string "open_hours"
    t.text "description"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

# Could not dump table "socials" because of following StandardError
#   Unknown type 'reference' for column 'user_id'

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "password_digest"
    t.index ["id"], name: "index_users_on_id"
  end

end
