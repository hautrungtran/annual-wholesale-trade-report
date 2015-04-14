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

ActiveRecord::Schema.define(version: 20150413023930) do

  create_table "annual_reports", force: :cascade do |t|
    t.integer "data_item_id",               limit: 4
    t.integer "industry_classification_id", limit: 4
    t.integer "operation_type_id",          limit: 4
    t.integer "year",                       limit: 4
    t.decimal "value",                                precision: 13, scale: 2
  end

  add_index "annual_reports", ["data_item_id"], name: "index_annual_reports_on_data_item_id", using: :btree
  add_index "annual_reports", ["industry_classification_id"], name: "index_annual_reports_on_industry_classification_id", using: :btree
  add_index "annual_reports", ["operation_type_id"], name: "index_annual_reports_on_operation_type_id", using: :btree

  create_table "data_items", force: :cascade do |t|
    t.string "code", limit: 255
    t.string "name", limit: 255
  end

  add_index "data_items", ["code"], name: "index_data_items_on_code", using: :btree
  add_index "data_items", ["name"], name: "index_data_items_on_name", using: :btree

  create_table "industry_classifications", force: :cascade do |t|
    t.string "code", limit: 255
    t.string "name", limit: 255
  end

  add_index "industry_classifications", ["code"], name: "index_industry_classifications_on_code", using: :btree

  create_table "operation_types", force: :cascade do |t|
    t.string "code", limit: 255
    t.string "name", limit: 255
  end

  add_index "operation_types", ["code"], name: "index_operation_types_on_code", using: :btree
  add_index "operation_types", ["name"], name: "index_operation_types_on_name", using: :btree

end
