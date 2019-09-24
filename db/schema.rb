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

ActiveRecord::Schema.define(version: 20190924075404) do

  create_table "contents", force: :cascade do |t|
    t.string "title"
    t.string "thumbnail"
    t.string "content"
    t.string "level"
    t.string "document"
    t.date "startDate"
    t.boolean "isDone"
    t.boolean "isAppove"
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_contents_on_group_id"
    t.index ["user_id"], name: "index_contents_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "thumbnail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "thumbnail"
    t.string "content"
    t.string "document"
    t.date "startDate"
    t.date "endDate"
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_events_on_group_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "decription"
    t.string "thumbnail"
    t.date "startdate"
    t.integer "course_id"
    t.index ["course_id", nil], name: "index_groups_on_course_id_and_created_at"
    t.index ["course_id"], name: "index_groups_on_course_id"
  end

  create_table "roles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.string "roles"
    t.string "status"
    t.index ["group_id"], name: "index_roles_on_group_id"
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "pictures"
    t.string "givenname"
    t.string "fullname"
    t.datetime "dateofbirth"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
