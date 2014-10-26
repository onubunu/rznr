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

ActiveRecord::Schema.define(:version => 20141025091406) do

  create_table "contact_messages", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "title"
    t.string   "subject"
    t.string   "prename"
  end

  create_table "employees", :force => true do |t|
    t.string   "employeename"
    t.string   "employeeimage"
    t.text     "employeeabout"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "homeboxes", :force => true do |t|
    t.string   "homeboxtitle"
    t.string   "homeboximage"
    t.text     "homeboxtext"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "homeboxlink"
    t.string   "source"
  end

  create_table "homesliders", :force => true do |t|
    t.string   "sliderimage"
    t.string   "sliderlink"
    t.string   "slidertext"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "source"
  end

  create_table "jobs", :force => true do |t|
    t.string   "jobtitle"
    t.text     "jobdescription"
    t.datetime "validdate"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "referenceboxes", :force => true do |t|
    t.string   "referencetitle"
    t.string   "referenceimage"
    t.text     "referencetext"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "serviceboxes", :force => true do |t|
    t.string   "serviceboxtitle"
    t.string   "serviceboximage"
    t.text     "serviceboxtext"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "source"
  end

  create_table "settings", :force => true do |t|
    t.string   "firmlogo"
    t.string   "firmname"
    t.string   "firmnameadd"
    t.string   "firmowner"
    t.string   "firmstreet"
    t.string   "firmzipcode"
    t.string   "firmcity"
    t.string   "firmcountry"
    t.string   "firmphone"
    t.string   "firmfax"
    t.string   "firmmail"
    t.string   "firmweb"
    t.string   "firmtaxno1"
    t.string   "firmtaxno2"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.text     "serviceinfo"
    t.text     "referenceinfo"
    t.text     "aboutinfo"
    t.text     "contactinfo"
    t.text     "terminfo"
    t.text     "legalnoticeinfo"
    t.text     "jobinfo"
    t.text     "terms"
    t.text     "legalnotice"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
