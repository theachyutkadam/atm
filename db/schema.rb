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

ActiveRecord::Schema.define(version: 20170829194059) do

  create_table "atms", force: :cascade do |t|
    t.integer  "bank_id"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "atms", ["bank_id"], name: "index_atms_on_bank_id"

  create_table "banks", force: :cascade do |t|
    t.string   "name"
    t.string   "branch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "mobile"
    t.string   "atm_no"
    t.integer  "atm_pin"
    t.integer  "bank_id"
    t.decimal  "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "customers", ["bank_id"], name: "index_customers_on_bank_id"

  create_table "transactions", force: :cascade do |t|
    t.string   "transaction_type"
    t.decimal  "balance"
    t.integer  "customer_id"
    t.integer  "bank_id"
    t.integer  "atm_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "transactions", ["atm_id"], name: "index_transactions_on_atm_id"
  add_index "transactions", ["bank_id"], name: "index_transactions_on_bank_id"
  add_index "transactions", ["customer_id"], name: "index_transactions_on_customer_id"

  create_table "transfers", force: :cascade do |t|
    t.integer  "reciever_id"
    t.integer  "sender_id"
    t.integer  "bank_id"
    t.integer  "atm_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.decimal  "balance"
  end

  add_index "transfers", ["atm_id"], name: "index_transfers_on_atm_id"
  add_index "transfers", ["bank_id"], name: "index_transfers_on_bank_id"

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
