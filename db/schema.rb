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

ActiveRecord::Schema.define(version: 20151215193227) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "declarations", force: :cascade do |t|
    t.date     "date"
    t.integer  "operation_id",                        null: false
    t.string   "owner_last_name",         limit: 255, null: false
    t.string   "owner_first_name",        limit: 255, null: false
    t.string   "owner_second_name",       limit: 255
    t.string   "owner_name",              limit: 255
    t.date     "owner_birth_date"
    t.date     "owner_registration_date"
    t.string   "owner_doc_series",        limit: 8
    t.string   "owner_doc_number",        limit: 8
    t.date     "owner_doc_date"
    t.string   "owner_doc_dept",          limit: 255
    t.string   "owner_inn",               limit: 15
    t.string   "owner_address_fl",        limit: 300, null: false
    t.string   "owner_address_ul",        limit: 300, null: false
    t.string   "owner_telephone",         limit: 10
    t.string   "owner_email",             limit: 35
    t.string   "trustee_last_name",       limit: 255, null: false
    t.string   "trustee_first_name",      limit: 255, null: false
    t.string   "trustee_second_name",     limit: 255
    t.string   "trustee_doc_series",      limit: 8
    t.string   "trustee_doc_number",      limit: 8
    t.date     "trustee_doc_date"
    t.string   "trustee_doc_dept",        limit: 255
    t.string   "trustee_address",         limit: 300
    t.string   "trustee_telephone",       limit: 10
    t.string   "vehicle_model",           limit: 100, null: false
    t.integer  "vehicle_year",                        null: false
    t.string   "vehicle_type",            limit: 255
    t.string   "vehicle_color",           limit: 255
    t.string   "vehicle_regnum",          limit: 12
    t.string   "vehicle_vin",             limit: 17
    t.string   "vehicle_body",            limit: 20
    t.string   "vehicle_chassis",         limit: 20
    t.integer  "vehicle_power"
    t.string   "vehicle_ecological",      limit: 5
    t.integer  "vehicle_weight_min"
    t.integer  "vehicle_weight_max"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operations", force: :cascade do |t|
    t.integer  "root_operation_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_types", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "declarations", "operations", on_delete: :cascade
end
