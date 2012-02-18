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

ActiveRecord::Schema.define(:version => 20120218195043) do

  create_table "access_controls", :force => true do |t|
    t.integer  "study_id"
    t.integer  "user_id"
    t.boolean  "is_admin"
    t.boolean  "can_read"
    t.boolean  "can_write"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "access_controls", ["study_id", "user_id"], :name => "index_access_controls_on_study_id_and_user_id"

  create_table "announcements", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "study_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "announcements", ["study_id", "user_id"], :name => "index_announcements_on_study_id_and_user_id"

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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "studies", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "studies", ["id"], :name => "index_studies_on_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
