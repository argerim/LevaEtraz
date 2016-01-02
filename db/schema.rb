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

ActiveRecord::Schema.define(version: 20160102050615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "citext"

  create_table "cities", force: :cascade do |t|
    t.citext   "name"
    t.integer  "map_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["map_id"], name: "index_cities_on_map_id", using: :btree
  add_index "cities", ["name"], name: "index_cities_on_name", unique: true, using: :btree

  create_table "maps", force: :cascade do |t|
    t.citext   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "maps", ["name"], name: "index_maps_on_name", unique: true, using: :btree

  create_table "routes", force: :cascade do |t|
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.integer  "distance"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "routes", ["destination_id", "origin_id"], name: "index_routes_on_destination_id_and_origin_id", using: :btree
  add_index "routes", ["destination_id"], name: "index_routes_on_destination_id", using: :btree
  add_index "routes", ["origin_id"], name: "index_routes_on_origin_id", using: :btree

  add_foreign_key "cities", "maps"
end
