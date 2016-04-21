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

ActiveRecord::Schema.define(version: 20160321170644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "grades", force: :cascade do |t|
    t.float   "value"
    t.integer "year"
    t.integer "semester"
    t.string  "genre",      default: "s"
    t.integer "student_id"
    t.integer "subject_id"
  end

  add_index "grades", ["student_id"], name: "index_grades_on_student_id", using: :btree
  add_index "grades", ["subject_id"], name: "index_grades_on_subject_id", using: :btree

  create_table "group_subjects", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "subjects_teacher_id"
    t.integer  "subjects_teachers_id"
    t.integer  "year"
  end

  add_index "group_subjects", ["subjects_teachers_id"], name: "index_group_subjects_on_subjects_teachers_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.integer  "year",                 null: false
    t.string   "letter",     limit: 1, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "teacher_id"
    t.string   "profile"
  end

  add_index "groups", ["teacher_id"], name: "index_groups_on_teacher_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.integer "year"
    t.string  "integer"
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "idnp"
    t.date     "birthday"
    t.string   "email"
    t.string   "phone"
    t.string   "p_first_name"
    t.string   "p_last_name"
    t.string   "p_phone"
    t.string   "p_email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "subject_id"
    t.integer  "group_id"
  end

  add_index "students", ["group_id"], name: "index_students_on_group_id", using: :btree
  add_index "students", ["subject_id"], name: "index_students_on_subject_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "start_year",  default: 1
    t.string   "genre",       default: "b"
    t.integer  "finish_year", default: 12
  end

  create_table "subjects_teachers", force: :cascade do |t|
    t.integer "teacher_id", null: false
    t.integer "subject_id", null: false
  end

  create_table "subjects_theses", id: false, force: :cascade do |t|
    t.integer "thesis_id",  null: false
    t.integer "subject_id", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthday"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "theses", force: :cascade do |t|
    t.integer  "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "semester"
    t.string   "profile"
    t.integer  "session_id"
    t.integer  "year"
  end

  add_index "theses", ["session_id"], name: "index_theses_on_session_id", using: :btree

  add_foreign_key "grades", "students"
  add_foreign_key "grades", "subjects"
  add_foreign_key "group_subjects", "subjects_teachers"
  add_foreign_key "groups", "teachers"
  add_foreign_key "students", "groups"
  add_foreign_key "students", "subjects"
  add_foreign_key "theses", "sessions"
end
