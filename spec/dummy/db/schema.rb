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

ActiveRecord::Schema.define(version: 20140625174008) do

  create_table "translated_words", force: true do |t|
    t.string   "translatable_type", null: false
    t.integer  "translatable_id",   null: false
    t.string   "key",               null: false
    t.string   "locale",            null: false
    t.string   "value",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "translated_words", ["translatable_type", "translatable_id", "key", "locale"], name: "translated_word", unique: true

  create_table "users", force: true do |t|
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
