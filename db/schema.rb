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

ActiveRecord::Schema.define(:version => 20120423151805) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "industry"
    t.string   "password"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "remember_token"
  end

  add_index "companies", ["remember_token"], :name => "index_companies_on_remember_token"

  create_table "contractors", :force => true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "profession"
    t.string   "remember_token"
  end

  add_index "contractors", ["remember_token"], :name => "index_contractors_on_remember_token"

end

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

ActiveRecord::Schema.define(:version => 20120429225713) do

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

  create_table "contractors", :force => true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "profession"
    t.string   "remember_token"
  end

  add_index "contractors", ["email"], :name => "index_contractors_on_email", :unique => true
  add_index "contractors", ["remember_token"], :name => "index_contractors_on_remember_token"

end
>>>>>>> 067f9cba143f01c3faa9ee15f5f3a71785df085f
