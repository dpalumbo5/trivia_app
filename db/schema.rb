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

ActiveRecord::Schema.define(version: 20170801143026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auth_tokens", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string  "token",   null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "answers",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "body",       null: false
    t.integer  "topic_id",   null: false
  end

  create_table "responses", force: :cascade do |t|
    t.integer "question_id",  null: false
    t.boolean "is_correct",   null: false
    t.integer "round_id",     null: false
    t.text    "users_answer", null: false
  end

  add_index "responses", ["question_id"], name: "index_responses_on_question_id", using: :btree
  add_index "responses", ["round_id"], name: "index_responses_on_round_id", using: :btree

  create_table "rounds", force: :cascade do |t|
    t.integer "topic_id", null: false
    t.integer "game_id",  null: false
  end

  add_index "rounds", ["game_id"], name: "index_rounds_on_game_id", using: :btree
  add_index "rounds", ["topic_id"], name: "index_rounds_on_topic_id", using: :btree

  create_table "scores", force: :cascade do |t|
    t.integer "response_id", null: false
    t.integer "points",      null: false
  end

  add_index "scores", ["response_id"], name: "index_scores_on_response_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "email",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password",   null: false
  end

  add_foreign_key "auth_tokens", "users"
  add_foreign_key "games", "users"
  add_foreign_key "questions", "topics"
  add_foreign_key "responses", "questions"
  add_foreign_key "responses", "rounds"
  add_foreign_key "rounds", "games"
  add_foreign_key "rounds", "topics"
  add_foreign_key "scores", "responses"
end
