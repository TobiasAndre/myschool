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

ActiveRecord::Schema.define(version: 2019_09_17_230526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "class_rooms", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "disciplines", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name", null: false
    t.integer "age", default: 0
    t.bigint "class_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_room_id"], name: "index_students_on_class_room_id"
  end

  create_table "teacher_class_room_disciplines", force: :cascade do |t|
    t.bigint "class_room_id"
    t.bigint "teacher_id"
    t.bigint "discipline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_room_id"], name: "index_teacher_class_room_disciplines_on_class_room_id"
    t.index ["discipline_id"], name: "index_teacher_class_room_disciplines_on_discipline_id"
    t.index ["teacher_id"], name: "index_teacher_class_room_disciplines_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
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

  add_foreign_key "students", "class_rooms"
  add_foreign_key "teacher_class_room_disciplines", "class_rooms"
  add_foreign_key "teacher_class_room_disciplines", "disciplines"
  add_foreign_key "teacher_class_room_disciplines", "teachers"
end
