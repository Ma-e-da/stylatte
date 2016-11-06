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

ActiveRecord::Schema.define(version: 20161106103219) do

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "scomment_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "favorites", ["scomment_id"], name: "index_favorites_on_scomment_id"
  add_index "favorites", ["user_id", "scomment_id"], name: "index_favorites_on_user_id_and_scomment_id", unique: true
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "picture"
    t.string   "product"
    t.string   "for_who"
    t.string   "size"
    t.string   "color"
    t.string   "style_genre"
    t.string   "scene"
    t.string   "season"
    t.string   "price_range"
    t.datetime "deadline"
  end

  add_index "posts", ["user_id", "created_at"], name: "index_posts_on_user_id_and_created_at"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "ratings", force: :cascade do |t|
    t.integer  "user_id",       null: false
    t.integer  "scomment_id",   null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "scomment_user"
    t.integer  "star"
  end

  add_index "ratings", ["scomment_id"], name: "index_ratings_on_scomment_id"
  add_index "ratings", ["scomment_user", "star"], name: "index_ratings_on_scomment_user_and_star"
  add_index "ratings", ["scomment_user"], name: "index_ratings_on_scomment_user"
  add_index "ratings", ["user_id", "scomment_id"], name: "index_ratings_on_user_id_and_scomment_id"
  add_index "ratings", ["user_id", "scomment_user"], name: "index_ratings_on_user_id_and_scomment_user"
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "scomments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
  end

  add_index "scomments", ["post_id"], name: "index_scomments_on_post_id"
  add_index "scomments", ["user_id", "created_at"], name: "index_scomments_on_user_id_and_created_at"
  add_index "scomments", ["user_id"], name: "index_scomments_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.boolean  "stylist",           default: false
    t.integer  "gender"
    t.integer  "country"
    t.string   "picture"
    t.string   "website"
    t.text     "bio"
    t.string   "height"
    t.string   "size"
    t.string   "age"
    t.string   "hair_style"
    t.string   "hair_color"
    t.string   "eyes_color"
    t.text     "favs"
    t.boolean  "public",            default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
