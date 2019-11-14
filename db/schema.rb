# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_14_140918) do

  create_table "bookings", force: :cascade do |t|
    t.integer "price"
    t.integer "rating"
    t.integer "user_id"
    t.integer "trip_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "carriers", force: :cascade do |t|
    t.string "name"
    t.string "range"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "planets", force: :cascade do |t|
    t.string "name"
    t.integer "distance_from_earth"
    t.integer "gravity"
    t.string "hostility"
    t.integer "population"
    t.boolean "breathable_atmosphere"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rockets", force: :cascade do |t|
    t.string "name"
    t.integer "speed"
    t.integer "passenger_capacity"
    t.string "ship_model_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trips", force: :cascade do |t|
    t.integer "destination_id"
    t.integer "origin_id"
    t.integer "rocket_id"
    t.integer "carrier_id"
    t.datetime "takeoff_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "price"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "sparklegasm"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
