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

ActiveRecord::Schema[7.2].define(version: 2025_06_13_143121) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_prerequisites", force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "prerequisite_course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_prerequisites_on_course_id"
    t.index ["prerequisite_course_id"], name: "index_course_prerequisites_on_prerequisite_course_id"
  end

  create_table "course_sessions", force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "room_id", null: false
    t.time "start_time"
    t.integer "duration"
    t.integer "day_of_week"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_sessions_on_course_id"
    t.index ["room_id"], name: "index_course_sessions_on_room_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "code"
    t.string "school_year"
    t.string "description"
    t.string "required_equipment"
    t.integer "teacher_id", null: false
    t.integer "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["subject_id"], name: "index_courses_on_subject_id"
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "code"
    t.integer "floor_level"
    t.integer "building_id", null: false
    t.string "directions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_rooms_on_building_id"
  end

  create_table "student_courses", force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "student_id", null: false
    t.integer "average_grade"
    t.boolean "credit_obtained"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_student_courses_on_course_id"
    t.index ["student_id"], name: "index_student_courses_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.integer "grade_level"
    t.integer "grade_average"
    t.string "emergency_contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teacher_certifications", force: :cascade do |t|
    t.string "certifier"
    t.datetime "date_obtained"
    t.integer "subject_id", null: false
    t.integer "teacher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_teacher_certifications_on_subject_id"
    t.index ["teacher_id"], name: "index_teacher_certifications_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.integer "main_subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["main_subject_id"], name: "index_teachers_on_main_subject_id"
  end

  add_foreign_key "course_prerequisites", "courses"
  add_foreign_key "course_prerequisites", "courses", column: "prerequisite_course_id"
  add_foreign_key "course_sessions", "courses"
  add_foreign_key "course_sessions", "rooms"
  add_foreign_key "courses", "subjects"
  add_foreign_key "courses", "teachers"
  add_foreign_key "rooms", "buildings"
  add_foreign_key "student_courses", "courses"
  add_foreign_key "student_courses", "students"
  add_foreign_key "teacher_certifications", "subjects"
  add_foreign_key "teacher_certifications", "teachers"
  add_foreign_key "teachers", "subjects", column: "main_subject_id"
end
