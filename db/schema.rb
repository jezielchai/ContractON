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

ActiveRecord::Schema.define(:version => 20120505191057) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "industry"
    t.string   "password"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "remember_token"
    t.string   "password_digest"
  end

  add_index "companies", ["remember_token"], :name => "index_companies_on_remember_token"

  create_table "contractor_profiles", :force => true do |t|
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.float    "lat"
    t.float    "lng"
    t.string   "school"
    t.string   "major"
    t.string   "degree"
    t.string   "license"
    t.text     "skills"
    t.text     "interests"
    t.string   "website"
    t.string   "work"
    t.string   "length"
    t.integer  "salary"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "profession"
    t.integer  "contractor_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "contractors", :force => true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "contractors", ["email"], :name => "index_contractors_on_email", :unique => true
  add_index "contractors", ["remember_token"], :name => "index_contractors_on_remember_token"

end
