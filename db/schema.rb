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

ActiveRecord::Schema.define(:version => 20121115084548) do

  create_table "billing_addresses", :force => true do |t|
    t.integer  "user_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address"
    t.string   "city"
    t.string   "zipcode"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "iso"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "earner_forms", :force => true do |t|
    t.boolean  "pricing"
    t.boolean  "donate"
    t.string   "email"
    t.boolean  "agree"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "evaluation_buyers", :force => true do |t|
    t.integer  "room_id"
    t.integer  "clarity"
    t.integer  "pronunciation"
    t.integer  "fluency"
    t.integer  "comprehension"
    t.integer  "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "evaluation_sellers", :force => true do |t|
    t.integer  "room_id"
    t.integer  "enjoy"
    t.integer  "recommend"
    t.integer  "helpful"
    t.integer  "confidence"
    t.integer  "improvement"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedback_forms", :force => true do |t|
    t.integer  "rating"
    t.text     "comments"
    t.text     "topics"
    t.integer  "user_id"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", :force => true do |t|
    t.string   "email"
    t.string   "topics"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hints", :force => true do |t|
    t.integer  "topic_id"
    t.string   "thumbnail_url"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "language_id"
  end

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.string   "thumbnail_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "room_id"
    t.integer  "user_id"
  end

  create_table "pricings", :force => true do |t|
    t.float    "price"
    t.integer  "minutes"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", :force => true do |t|
    t.integer  "creator_id"
    t.integer  "joiner_id"
    t.string   "name"
    t.string   "status"
    t.string   "session_id"
    t.integer  "language_id"
    t.integer  "topic_id"
    t.string   "record_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "open_tok_session"
  end

  create_table "schedules", :force => true do |t|
    t.string   "purpose"
    t.datetime "when"
    t.string   "options"
    t.integer  "user_id"
    t.integer  "room_id"
    t.integer  "language_id"
    t.integer  "length"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules_topics", :id => false, :force => true do |t|
    t.integer "schedule_id"
    t.integer "topic_id"
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "super_id"
    t.string   "thumbnail_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enabled"
  end

  create_table "transactions", :force => true do |t|
    t.integer  "user_id"
    t.string   "paypal_trans_id"
    t.integer  "pricing_id"
    t.integer  "billing_address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  :default => "",  :null => false
    t.string   "encrypted_password",     :default => "",  :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.float    "credits",                :default => 0.0
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
