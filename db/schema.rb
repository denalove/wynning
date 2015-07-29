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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150729231045) do

  create_table "activities", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "done"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "one_month_goals", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.date     "end_date"
    t.date     "date_done"
    t.float    "metric"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "membership_level"
    t.string   "high_level_goal"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "username"
    t.string   "password_digest"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
