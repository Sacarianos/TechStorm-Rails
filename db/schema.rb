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

ActiveRecord::Schema.define(version: 20141110003446) do

  create_table "collaborates", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "project_id"
  end

  add_index "collaborates", ["user_id", "project_id"], name: "index_collaborates_on_user_id_and_project_id"

  create_table "comments_on", primary_key: "uid", force: true do |t|
    t.integer   "pid"
    t.timestamp "date"
    t.text      "comment"
  end

  add_index "comments_on", ["uid", "pid"], name: "sqlite_autoindex_comments_on_1", unique: true

  create_table "follows", primary_key: "uid", force: true do |t|
    t.integer "pid"
  end

  add_index "follows", ["uid", "pid"], name: "sqlite_autoindex_follows_1", unique: true

  create_table "has_skills", primary_key: "uid", force: true do |t|
    t.string "skill", limit: 30
  end

  add_index "has_skills", ["uid", "skill"], name: "sqlite_autoindex_has_skills_1", unique: true

  create_table "has_tags", primary_key: "pid", force: true do |t|
    t.string "tag", limit: 30
  end

  add_index "has_tags", ["pid", "tag"], name: "sqlite_autoindex_has_tags_1", unique: true

  create_table "has_tasks", primary_key: "user1", force: true do |t|
    t.integer "user2"
    t.boolean "pending"
  end

  add_index "has_tasks", ["user1", "user2"], name: "sqlite_autoindex_has_tasks_1", unique: true

  create_table "messages", force: true do |t|
    t.string    "title",     limit: 40
    t.text      "content"
    t.timestamp "send_time"
    t.timestamp "seen_time"
  end

  add_index "messages", ["id"], name: "sqlite_autoindex_messages_1", unique: true

  create_table "projects", force: true do |t|
    t.integer  "creator_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slogan"
    t.string   "link"
    t.string   "git"
  end

  create_table "requires_skills", primary_key: "pid", force: true do |t|
    t.string "skill", limit: 30
  end

  add_index "requires_skills", ["pid", "skill"], name: "sqlite_autoindex_requires_skills_1", unique: true

  create_table "sends", primary_key: "sender", force: true do |t|
    t.integer "receiver"
    t.integer "mid"
  end

  add_index "sends", ["sender", "receiver", "mid"], name: "sqlite_autoindex_sends_1", unique: true

  create_table "skills", primary_key: "skill_name", force: true do |t|
  end

  add_index "skills", ["skill_name"], name: "sqlite_autoindex_skills_1", unique: true

  create_table "tags", primary_key: "tag_name", force: true do |t|
  end

  add_index "tags", ["tag_name"], name: "sqlite_autoindex_tags_1", unique: true

  create_table "tasks", primary_key: "tid", force: true do |t|
    t.integer "pid"
    t.string  "task_name",   limit: 30
    t.text    "description"
    t.integer "completed"
  end

  add_index "tasks", ["tid", "pid"], name: "sqlite_autoindex_tasks_1", unique: true

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "photo"
    t.string   "works_in"
    t.integer  "ranking"
    t.boolean  "privacy"
    t.text     "info"
    t.integer  "visits"
    t.string   "last_name"
    t.string   "location"
    t.string   "interest"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "github"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "works_on", primary_key: "uid", force: true do |t|
    t.integer "tid"
    t.integer "pid"
  end

  add_index "works_on", ["uid", "tid", "pid"], name: "sqlite_autoindex_works_on_1", unique: true

end
