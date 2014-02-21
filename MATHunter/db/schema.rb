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

ActiveRecord::Schema.define(version: 20140221120743) do

  create_table "chapters", force: true do |t|
    t.integer  "tutorial_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chapters", ["tutorial_id"], name: "index_chapters_on_tutorial_id", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "chapter_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["chapter_id"], name: "index_comments_on_chapter_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "questions", force: true do |t|
    t.integer  "chapter_id"
    t.integer  "type"
    t.text     "content"
    t.text     "response"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["chapter_id"], name: "index_questions_on_chapter_id", using: :btree

  create_table "tutorials", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.integer  "difficulty"
    t.integer  "score"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tutorials", ["user_id"], name: "index_tutorials_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "mail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
