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

ActiveRecord::Schema.define(version: 20160217223007) do

  create_table "bids", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "amount"
  end

  add_index "bids", ["customer_id"], name: "index_bids_on_customer_id"
  add_index "bids", ["product_id"], name: "index_bids_on_product_id"

  create_table "customers", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.integer  "products_id"
    t.integer  "bids_id"
    t.integer  "user_id"
    t.integer  "reviews_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "customers", ["bids_id"], name: "index_customers_on_bids_id"
  add_index "customers", ["products_id"], name: "index_customers_on_products_id"
  add_index "customers", ["reviews_id"], name: "index_customers_on_reviews_id"
  add_index "customers", ["user_id"], name: "index_customers_on_user_id"

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.date     "deadline"
    t.integer  "customer_id"
    t.integer  "bids_id"
    t.integer  "reviews_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "min_bid"
  end

  add_index "products", ["bids_id"], name: "index_products_on_bids_id"
  add_index "products", ["customer_id"], name: "index_products_on_customer_id"
  add_index "products", ["reviews_id"], name: "index_products_on_reviews_id"

  create_table "reviews", force: :cascade do |t|
    t.text     "description"
    t.integer  "product_id"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "reviews", ["customer_id"], name: "index_reviews_on_customer_id"
  add_index "reviews", ["product_id"], name: "index_reviews_on_product_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "customer_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["customer_id"], name: "index_users_on_customer_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
