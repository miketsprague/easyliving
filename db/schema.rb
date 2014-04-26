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

ActiveRecord::Schema.define(version: 20140426020658) do

  create_table "landlords", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "phone_number"
    t.string   "address"
  end

  create_table "properties", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "property_type"
    t.string   "description"
    t.integer  "landlord_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "size_type"
    t.string   "rent"
    t.string   "security_deposit"
    t.date     "date_available"
    t.string   "image_urls"
  end

  add_index "properties", ["landlord_id"], name: "index_properties_on_landlord_id"

end
