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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130327021548) do

  create_table "access_controls", :force => true do |t|
    t.integer  "study_id"
    t.integer  "user_id"
    t.boolean  "is_admin"
    t.boolean  "can_read"
    t.boolean  "can_write"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "access_controls", ["study_id", "user_id"], :name => "index_access_controls_on_study_id_and_user_id"

  create_table "announcements", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "study_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "announcements", ["study_id", "user_id"], :name => "index_announcements_on_study_id_and_user_id"

  create_table "answers", :force => true do |t|
    t.text     "answer"
    t.integer  "study_id"
    t.integer  "user_id"
    t.boolean  "correct"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "question_id"
  end

  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"
  add_index "answers", ["study_id", "user_id"], :name => "index_answers_on_study_id_and_user_id"

  create_table "data", :force => true do |t|
    t.integer  "study_id"
    t.integer  "form_id"
    t.integer  "field_id"
    t.string   "data_point"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "data_set_id"
    t.string   "uuid"
  end

  create_table "data_sets", :force => true do |t|
    t.integer  "form_id"
    t.string   "uuid"
    t.hstore   "data_set"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "study_id"
  end

  create_table "demosurveys", :force => true do |t|
    t.integer  "franchise_num"
    t.integer  "marketing_materials"
    t.integer  "training_materials"
    t.boolean  "new_system"
    t.string   "greatest_benefit"
    t.text     "commentary"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "example_subjects", :force => true do |t|
    t.boolean  "locked"
    t.integer  "study_id"
    t.string   "identifier"
    t.float    "height"
    t.float    "weight"
    t.string   "weight_units"
    t.string   "height_units"
    t.integer  "heart_rate"
    t.integer  "blood_pressure_diastolic"
    t.integer  "blood_pressure_systolic"
    t.integer  "pulse_ox"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "user_id"
  end

  create_table "fields", :force => true do |t|
    t.integer  "form_id"
    t.string   "name"
    t.string   "type"
    t.string   "helptext"
    t.boolean  "isnull"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "question"
    t.hstore   "metadata"
    t.integer  "position"
    t.boolean  "is_subject_id"
  end

  add_index "fields", ["form_id"], :name => "index_fields_on_form_id"

  create_table "forms", :force => true do |t|
    t.integer  "study_id"
    t.integer  "user_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "name"
    t.hstore   "meta_data"
    t.boolean  "is_published"
    t.boolean  "is_mobile"
    t.integer  "required_form_id"
    t.boolean  "can_be_used_multiple_times"
    t.string   "subject_auto_complete_field"
    t.integer  "subject_auto_complete_form"
  end

  add_index "forms", ["study_id", "user_id"], :name => "index_forms_on_study_id_and_user_id"

  create_table "questions", :force => true do |t|
    t.text     "question"
    t.integer  "study_id"
    t.integer  "user_id"
    t.boolean  "correct"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "questions", ["study_id", "user_id"], :name => "index_questions_on_study_id_and_user_id"

  create_table "reminders", :force => true do |t|
    t.integer  "study_id"
    t.integer  "user_id"
    t.datetime "last_reminded_date"
    t.integer  "interval"
    t.string   "contact_method"
    t.text     "contact_information"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "form_id"
  end

  create_table "studies", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.boolean  "is_active"
  end

  add_index "studies", ["id"], :name => "index_studies_on_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
