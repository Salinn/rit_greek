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

ActiveRecord::Schema.define(version: 20150410204343) do

  create_table "community_services", force: :cascade do |t|
    t.integer  "event_id"
    t.float    "total_hours"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "community_services", ["event_id"], name: "index_community_services_on_event_id"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "type_of_event"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "philanthropies", force: :cascade do |t|
    t.integer  "event_id"
    t.float    "total_raised"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "philanthropies", ["event_id"], name: "index_philanthropies_on_event_id"

  create_table "user_organizations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "organization_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "user_organizations", ["organization_id"], name: "index_user_organizations_on_organization_id"
  add_index "user_organizations", ["user_id"], name: "index_user_organizations_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "login",               default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["login"], name: "index_users_on_login", unique: true

end
