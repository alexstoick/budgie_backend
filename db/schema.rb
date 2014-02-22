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

ActiveRecord::Schema.define(version: 20140222143957) do

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "items", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "price"
  end

  create_table "properties", force: true do |t|
    t.integer  "number_of_bedrooms"
    t.integer  "number_of_bathrooms"
    t.integer  "rent_a_week"
    t.string   "address"
    t.string   "streetName"
    t.string   "agentName"
    t.string   "agentPhoneNo"
    t.string   "imageUrl"
    t.string   "thumbnailUrl"
    t.text     "shortDescription"
    t.string   "detailsUrl"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "zone_id"
    t.text     "description"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "properties", ["detailsUrl"], name: "index_properties_on_detailsUrl", unique: true, using: :btree

  create_table "receipt_entries", force: true do |t|
    t.integer  "receipt_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receipts", force: true do |t|
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_watch_zones", force: true do |t|
    t.integer  "user_id"
    t.integer  "zone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "min_rent"
    t.integer  "max_rent"
    t.integer  "min_bedrooms"
    t.integer  "max_bedrooms"
  end

  create_table "users", force: true do |t|
    t.string   "deviceToken"
    t.string   "deviceType"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "zones", force: true do |t|
    t.string   "postcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
