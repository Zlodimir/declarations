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

ActiveRecord::Schema.define(version: 20160125164919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "declarations", force: :cascade do |t|
    t.date     "date"
    t.string   "dept_name",                limit: 255
    t.integer  "operation_id",                                         null: false
    t.string   "owner_last_name",          limit: 255
    t.string   "owner_first_name",         limit: 255
    t.string   "owner_second_name",        limit: 255
    t.string   "owner_company_name",       limit: 255
    t.date     "owner_birth_date"
    t.date     "owner_registration_date"
    t.string   "owner_doc_series",         limit: 8
    t.string   "owner_doc_number",         limit: 8
    t.date     "owner_doc_date"
    t.string   "owner_doc_dept",           limit: 255
    t.string   "owner_inn",                limit: 15
    t.string   "owner_address_fl",         limit: 300
    t.string   "owner_address_ul",         limit: 300
    t.string   "owner_telephone",          limit: 10
    t.string   "owner_email",              limit: 35
    t.boolean  "owner_company",                        default: false
    t.string   "trustee_last_name",        limit: 255
    t.string   "trustee_first_name",       limit: 255
    t.string   "trustee_second_name",      limit: 255
    t.string   "trustee_doc_series",       limit: 8
    t.string   "trustee_doc_number",       limit: 8
    t.date     "trustee_doc_date"
    t.string   "trustee_doc_dept",         limit: 255
    t.string   "trustee_address",          limit: 300
    t.string   "trustee_telephone",        limit: 10
    t.string   "vehicle_model",            limit: 100
    t.integer  "vehicle_year"
    t.string   "vehicle_type"
    t.string   "vehicle_category",         limit: 10
    t.string   "vehicle_color",            limit: 255
    t.string   "vehicle_regnum",           limit: 12
    t.string   "vehicle_vin",              limit: 17
    t.string   "vehicle_body",             limit: 20
    t.string   "vehicle_chassis",          limit: 20
    t.float    "vehicle_power_hp"
    t.float    "vehicle_power_kvt"
    t.integer  "vehicle_weight_min"
    t.integer  "vehicle_weight_max"
    t.string   "vehicle_ecological_class", limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "trustee_series",           limit: 8
    t.string   "trustee_number",           limit: 10
    t.date     "trustee_date"
    t.string   "trustee_dept",             limit: 255
  end

  create_table "ecological_classes", force: :cascade do |t|
    t.string   "name",       limit: 25, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operations", force: :cascade do |t|
    t.integer  "root_operation_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                              default: "",    null: false
    t.string   "encrypted_password",                 default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "username",               limit: 255
    t.string   "provider",               limit: 25
    t.string   "uid",                    limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.boolean  "is_admin",                           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username", "provider"], name: "index_users_on_username_and_provider", unique: true, using: :btree

  create_table "vehicle_categories", force: :cascade do |t|
    t.string   "name",       limit: 25, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_types", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "declarations", "operations", on_delete: :cascade
  add_foreign_key "declarations", "users"
end
