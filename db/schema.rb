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

ActiveRecord::Schema[7.0].define(version: 2022_09_28_110555) do
  create_table "addresses", force: :cascade do |t|
    t.string "address_name"
    t.string "addressable_type"
    t.integer "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable"
  end

  create_table "admincontrols", force: :cascade do |t|
    t.integer "student_id"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_admincontrols_on_student_id"
    t.index ["teacher_id"], name: "index_admincontrols_on_teacher_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.datetime "date_of_birth"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "address_id_id"
    t.integer "contact_number"
    t.string "address"
    t.index ["address_id_id"], name: "index_admins_on_address_id_id"
    t.index ["user_id"], name: "index_admins_on_user_id"
  end

  create_table "classnames", force: :cascade do |t|
    t.string "class_name"
    t.integer "student_id"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_classnames_on_student_id"
    t.index ["teacher_id"], name: "index_classnames_on_teacher_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "contact_name"
    t.string "contactable_type"
    t.integer "contactable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contactable_type", "contactable_id"], name: "index_contacts_on_contactable"
  end

  create_table "student_teachers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
    t.integer "teacher_id"
    t.index ["student_id"], name: "index_student_teachers_on_student_id"
    t.index ["teacher_id"], name: "index_student_teachers_on_teacher_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "father_name"
    t.string "gender"
    t.datetime "date_of_birth"
    t.string "roll_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "address_id_id"
    t.integer "contact_number"
    t.string "address"
    t.index ["address_id_id"], name: "index_students_on_address_id_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.datetime "date_of_birth"
    t.string "salery"
    t.string "subject_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "address_id_id"
    t.integer "contact_number"
    t.string "address"
    t.index ["address_id_id"], name: "index_teachers_on_address_id_id"
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "admincontrols", "students"
  add_foreign_key "admincontrols", "teachers"
  add_foreign_key "admins", "users"
  add_foreign_key "classnames", "students"
  add_foreign_key "classnames", "teachers"
  add_foreign_key "students", "users"
  add_foreign_key "teachers", "users"
end
