# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_06_05_154154) do
  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gossip_tags", force: :cascade do |t|
    t.integer "gossip_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gossip_id"], name: "index_gossip_tags_on_gossip_id"
    t.index ["tag_id"], name: "index_gossip_tags_on_tag_id"
  end

  create_table "gossips", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_gossips_on_user_id"
  end

  create_table "join_table_recipient_pms", force: :cascade do |t|
    t.integer "private_message_id", null: false
    t.integer "recipient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["private_message_id"], name: "index_join_table_recipient_pms_on_private_message_id"
    t.index ["recipient_id"], name: "index_join_table_recipient_pms_on_recipient_id"
  end

  create_table "private_messages", force: :cascade do |t|
    t.text "content"
    t.integer "sender_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sender_id"], name: "index_private_messages_on_sender_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.string "email"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "city_id", null: false
    t.index ["city_id"], name: "index_users_on_city_id"
  end

  add_foreign_key "gossip_tags", "gossips"
  add_foreign_key "gossip_tags", "tags"
  add_foreign_key "gossips", "users"
  add_foreign_key "join_table_recipient_pms", "private_messages"
  add_foreign_key "join_table_recipient_pms", "users", column: "recipient_id"
  add_foreign_key "private_messages", "users", column: "sender_id"
  add_foreign_key "users", "cities"
end
