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

ActiveRecord::Schema.define(version: 20140403203108) do

  create_table "dummy_users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scroll_page_translations", force: true do |t|
    t.integer  "scroll_page_id"
    t.string   "title"
    t.string   "locale"
    t.string   "slug"
    t.text     "html"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "md_file"
    t.string   "md_file_tmp"
    t.string   "md_remote"
    t.string   "content_type"
  end

  add_index "scroll_page_translations", ["locale"], name: "index_scroll_page_translations_on_locale"
  add_index "scroll_page_translations", ["scroll_page_id"], name: "index_scroll_page_translations_on_scroll_page_id"
  add_index "scroll_page_translations", ["slug"], name: "index_scroll_page_translations_on_slug"

  create_table "scroll_pages", force: true do |t|
    t.boolean  "active"
    t.string   "image"
    t.string   "image_tmp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
