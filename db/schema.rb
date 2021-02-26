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

ActiveRecord::Schema.define(version: 2021_02_23_175435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "zipcode", null: false
    t.string "public_place", null: false
    t.string "complement"
    t.string "district", null: false
    t.string "ibge_code"
    t.bigint "citizen_id", null: false
    t.bigint "city_id"
    t.bigint "state_id"
    t.index ["citizen_id"], name: "index_addresses_on_citizen_id"
    t.index ["city_id"], name: "index_addresses_on_city_id"
    t.index ["district"], name: "index_addresses_on_district"
    t.index ["ibge_code"], name: "index_addresses_on_ibge_code"
    t.index ["public_place"], name: "index_addresses_on_public_place"
    t.index ["state_id"], name: "index_addresses_on_state_id"
    t.index ["zipcode"], name: "index_addresses_on_zipcode"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_cities_on_name"
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "citizens", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "cpf", null: false
    t.string "email", null: false
    t.date "birthdate", null: false
    t.string "phone", null: false
    t.boolean "status", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file"
    t.bigint "user_id"
    t.index ["cpf"], name: "index_citizens_on_cpf"
    t.index ["email"], name: "index_citizens_on_email"
    t.index ["full_name"], name: "index_citizens_on_full_name"
    t.index ["user_id"], name: "index_citizens_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_states_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "citizens"
  add_foreign_key "addresses", "states"
  add_foreign_key "cities", "states"
  add_foreign_key "citizens", "users"
end
