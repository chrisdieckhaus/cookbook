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

ActiveRecord::Schema.define(version: 20160804015402) do

  create_table "recipes", force: true do |t|
    t.string   "title"
    t.integer  "rating"
    t.text     "ingredients"
    t.text     "directions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
    t.integer  "user_id"
  end

  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id"

  create_table "reviews", force: true do |t|
    t.string   "reviewer"
    t.text     "body"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating"
    t.integer  "user_id"
  end

  add_index "reviews", ["recipe_id"], name: "index_reviews_on_recipe_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "review_id"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["review_id"], name: "index_users_on_review_id"

end
