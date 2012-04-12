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

ActiveRecord::Schema.define(:version => 20120412003031) do

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

  create_table "answers", :force => true do |t|
    t.text     "answer"
    t.integer  "study_id"
    t.integer  "user_id"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_id"
  end

  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"
  add_index "answers", ["study_id", "user_id"], :name => "index_answers_on_study_id_and_user_id"

  create_table "demosurveys", :force => true do |t|
    t.integer  "franchise_num"
    t.integer  "marketing_materials"
    t.integer  "training_materials"
    t.boolean  "new_system"
    t.string   "greatest_benefit"
    t.text     "commentary"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "questions", :force => true do |t|
    t.text     "question"
    t.integer  "study_id"
    t.integer  "user_id"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["study_id", "user_id"], :name => "index_questions_on_study_id_and_user_id"

  create_table "responses", :force => true do |t|
    t.string   "demographic_setting"
    t.string   "demographic_origin"
    t.string   "demographic_current_country"
    t.string   "demographic_highest_degree"
    t.string   "demographic_employment_setting"
    t.string   "demographic_age"
    t.string   "demographic_gender"
    t.string   "demographic_race"
    t.string   "questions_cultural_competence"
    t.boolean  "questions_advanced_practice"
    t.boolean  "questions_academic_institution"
    t.boolean  "questions_healthcare_organization"
    t.boolean  "questions_community"
    t.boolean  "questions_research"
    t.boolean  "questions_administration"
    t.boolean  "questions_other"
    t.string   "questions_other_response"
    t.text     "questions_ideas_for_advancing"
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

  create_table "surveys", :force => true do |t|
    t.string   "aud_age"
    t.boolean  "aud_best_in_country"
    t.boolean  "edu_attend_college"
    t.boolean  "edu_post_grad"
    t.boolean  "edu_jazz_edu_imp"
    t.boolean  "life_buy_cd"
    t.boolean  "life_consume_wine"
    t.boolean  "life_consume_beer"
    t.boolean  "life_intl_travel"
    t.string   "eth_gender"
    t.string   "eth_ethnicity"
    t.boolean  "fest_spec_out_of_state"
    t.boolean  "fest_spec_travel_by_air"
    t.boolean  "fest_spec_intl_visit"
    t.boolean  "fest_spec_area_hotel"
    t.string   "avg_hh_income"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

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
