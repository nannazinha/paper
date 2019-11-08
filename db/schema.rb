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

ActiveRecord::Schema.define(version: 2019_11_05_201118) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.integer "role"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["company_id"], name: "index_admins_on_company_id"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.string "number"
    t.date "start"
    t.date "finish"
    t.bigint "user_id"
    t.bigint "unit_id"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_contracts_on_room_id"
    t.index ["unit_id"], name: "index_contracts_on_unit_id"
    t.index ["user_id"], name: "index_contracts_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.date "pay_date"
    t.string "items_description"
    t.string "fees"
    t.string "total"
    t.string "link"
    t.string "status"
    t.integer "slip_days"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "number"
    t.boolean "shared"
    t.boolean "rented"
    t.string "price"
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_rooms_on_unit_id"
  end

  create_table "service_quantities", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "service_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_service_quantities_on_service_id"
    t.index ["user_id"], name: "index_service_quantities_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price"
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "manager"
    t.string "cnpj"
    t.string "bank"
    t.string "agency"
    t.string "account_number"
    t.string "rooms_qty"
    t.bigint "admin_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_units_on_admin_id"
    t.index ["company_id"], name: "index_units_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.date "birth_date"
    t.integer "gender"
    t.boolean "responsible"
    t.string "sponsor"
    t.string "sponsor_cpf"
    t.string "phone_prefix"
    t.string "phone_number"
    t.string "zip_code"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "district"
    t.string "street"
    t.string "number"
    t.string "complement"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["admin_id"], name: "index_users_on_admin_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "admins", "companies"
  add_foreign_key "contracts", "rooms"
  add_foreign_key "contracts", "units"
  add_foreign_key "contracts", "users"
  add_foreign_key "invoices", "users"
  add_foreign_key "rooms", "units"
  add_foreign_key "service_quantities", "services"
  add_foreign_key "service_quantities", "users"
  add_foreign_key "units", "admins"
  add_foreign_key "units", "companies"
  add_foreign_key "users", "admins"
end
