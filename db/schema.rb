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

ActiveRecord::Schema.define(version: 20171214165212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string "attachinariable_type"
    t.bigint "attachinariable_id"
    t.string "scope"
    t.string "public_id"
    t.string "version"
    t.integer "width"
    t.integer "height"
    t.string "format"
    t.string "resource_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent"
    t.index ["attachinariable_type", "attachinariable_id"], name: "index_attachinariable"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "ride_id"
    t.bigint "user_id"
    t.integer "passenger_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "EUR", null: false
    t.jsonb "payment"
    t.index ["ride_id"], name: "index_bookings_on_ride_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "end_points", force: :cascade do |t|
    t.string "address"
    t.float "long"
    t.float "lat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rides", force: :cascade do |t|
    t.string "train_ref"
    t.bigint "user_id"
    t.integer "passengers_allowed"
    t.bigint "start_point_id"
    t.bigint "end_point_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "car_brand"
    t.string "car_model"
    t.datetime "train_arrival_at"
    t.integer "price_cents", default: 0, null: false
    t.integer "remaining_seats"
    t.index ["end_point_id"], name: "index_rides_on_end_point_id"
    t.index ["start_point_id"], name: "index_rides_on_start_point_id"
    t.index ["user_id"], name: "index_rides_on_user_id"
  end

  create_table "start_points", force: :cascade do |t|
    t.string "station"
    t.float "long"
    t.float "lat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station"], name: "index_start_points_on_station"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "sex"
    t.date "birth_date"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "rides"
  add_foreign_key "bookings", "users"
  add_foreign_key "rides", "end_points"
  add_foreign_key "rides", "start_points"
  add_foreign_key "rides", "users"
end
