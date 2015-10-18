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

ActiveRecord::Schema.define(version: 20151012121637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  null: false, index: {name: "index_users_on_email", unique: true}
    t.string   "encrypted_password",     null: false
    t.string   "reset_password_token",   index: {name: "index_users_on_reset_password_token", unique: true}
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id",    null: false, index: {name: "fk__friendships_user_id"}, foreign_key: {references: "users", name: "fk_friendships_user_id", on_update: :no_action, on_delete: :no_action}
    t.integer  "accepted",   default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "friend_id",  null: false, index: {name: "fk__friendships_friend_id"}, foreign_key: {references: "users", name: "fk_friendships_friend_id", on_update: :no_action, on_delete: :no_action}
  end

  create_table "missions", force: :cascade do |t|
    t.integer  "user_id",       null: false, index: {name: "fk__missions_user_id"}, foreign_key: {references: "users", name: "fk_missions_user_id", on_update: :no_action, on_delete: :no_action}
    t.integer  "supervisor_id", index: {name: "fk__missions_supervisor_id"}, foreign_key: {references: "users", name: "fk_missions_supervisor_id", on_update: :no_action, on_delete: :no_action}
    t.string   "target",        null: false
    t.string   "description"
    t.datetime "deadline"
    t.integer  "status",        default: 0, null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "mission_comments", force: :cascade do |t|
    t.integer  "user_id",    null: false, index: {name: "fk__mission_comments_user_id"}, foreign_key: {references: "users", name: "fk_mission_comments_user_id", on_update: :no_action, on_delete: :no_action}
    t.integer  "mission_id", null: false, index: {name: "fk__mission_comments_mission_id"}, foreign_key: {references: "missions", name: "fk_mission_comments_mission_id", on_update: :no_action, on_delete: :no_action}
    t.text     "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
