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

ActiveRecord::Schema.define(:version => 20110125154721) do

  create_table "favorites", :force => true do |t|
    t.integer "user_id"
    t.integer "signature_id"
  end

  create_table "settings", :force => true do |t|
    t.integer "random_mode", :default => 0
    t.boolean "remember_me", :default => true
  end

  create_table "signatures", :force => true do |t|
    t.text     "body"
    t.integer  "rank",       :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "up",         :default => 0
    t.integer  "down",       :default => 0
    t.integer  "user_id"
    t.integer  "status",     :default => 1
  end

  create_table "users", :force => true do |t|
    t.string   "location"
    t.string   "uid"
    t.text     "content"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon"
    t.string   "location_name"
    t.string   "title"
    t.string   "homepage"
    t.string   "signature"
    t.integer  "setting_id"
  end

end
