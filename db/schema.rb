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

ActiveRecord::Schema.define(version: 20160504040043) do

  create_table "diseases", force: :cascade do |t|
    t.string   "disease"
    t.string   "accession"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "related",    default: 0
    t.integer  "unrelated",  default: 0
    t.boolean  "closed",     default: false
  end

  create_table "submissions", force: :cascade do |t|
    t.integer  "disease_id"
    t.integer  "user_id"
    t.boolean  "is_related"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "reason"
  end

  add_index "submissions", ["disease_id"], name: "index_submissions_on_disease_id"
  add_index "submissions", ["user_id", "created_at"], name: "index_submissions_on_user_id_and_created_at"
  add_index "submissions", ["user_id"], name: "index_submissions_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
    t.float    "accuracy",        default: 0.0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
