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

ActiveRecord::Schema.define(version: 20131126171532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.string   "response"
    t.boolean  "correct"
    t.integer  "question_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "choice_id"
  end

  add_index "answers", ["choice_id"], name: "index_answers_on_choice_id", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["student_id"], name: "index_answers_on_student_id", using: :btree

  create_table "assignments", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "datetime_to_send"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["teacher_id"], name: "index_assignments_on_teacher_id", using: :btree

  create_table "choices", force: true do |t|
    t.string   "content"
    t.string   "option"
    t.boolean  "correctness"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "choices", ["question_id"], name: "index_choices_on_question_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["teacher_id"], name: "index_groups_on_teacher_id", using: :btree

  create_table "messages", force: true do |t|
    t.string   "from"
    t.string   "to"
    t.string   "content"
    t.integer  "assignment_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "sent_at"
  end

  add_index "messages", ["assignment_id"], name: "index_messages_on_assignment_id", using: :btree
  add_index "messages", ["student_id"], name: "index_messages_on_student_id", using: :btree

  create_table "questions", force: true do |t|
    t.string   "content"
    t.integer  "assignment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order"
  end

  add_index "questions", ["assignment_id"], name: "index_questions_on_assignment_id", using: :btree

  create_table "student_assignments", force: true do |t|
    t.integer  "student_id"
    t.integer  "assignment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_assignments", ["assignment_id"], name: "index_student_assignments_on_assignment_id", using: :btree
  add_index "student_assignments", ["student_id"], name: "index_student_assignments_on_student_id", using: :btree

  create_table "student_groups", force: true do |t|
    t.integer  "student_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_groups", ["group_id"], name: "index_student_groups_on_group_id", using: :btree
  add_index "student_groups", ["student_id"], name: "index_student_groups_on_student_id", using: :btree

  create_table "students", force: true do |t|
    t.string   "name"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_assignment"
    t.integer  "current_question"
  end

  create_table "teachers", force: true do |t|
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
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone_number"
  end

  add_index "teachers", ["email"], name: "index_teachers_on_email", unique: true, using: :btree
  add_index "teachers", ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true, using: :btree

end
