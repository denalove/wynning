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

ActiveRecord::Schema.define(version: 20150808164919) do

  create_table "activities", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "done"
    t.string   "summary"
    t.date     "last"
    t.integer  "score"
    t.date     "due_date"
    t.integer  "one_month_goal_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "activities", ["one_month_goal_id"], name: "index_activities_on_one_month_goal_id"

  create_table "high_levels", force: :cascade do |t|
    t.string   "title"
    t.date     "due"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "done"
  end

  add_index "high_levels", ["user_id"], name: "index_high_levels_on_user_id"

  create_table "one_month_goals", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.date     "end_date"
    t.date     "date_done"
    t.float    "metric"
    t.boolean  "done"
    t.integer  "high_level_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "one_month_goals", ["high_level_id"], name: "index_one_month_goals_on_high_level_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "membership_level"
    t.string   "high_level_goal"
    t.string   "username"
    t.string   "password_digest"
    t.string   "phone_number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
