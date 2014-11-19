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

ActiveRecord::Schema.define(version: 20141118171304) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "baskets", force: true do |t|
    t.string   "number"
    t.string   "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "payment_status"
    t.string   "operation_id"
    t.float    "transaction_amount"
    t.boolean  "notified_to_back_office"
    t.string   "transaction_id"
    t.boolean  "notified_to_ecommerce"
    t.float    "fees"
    t.integer  "currency_id"
    t.float    "paid_transaction_amount"
    t.integer  "paid_currency_id"
    t.float    "rate"
    t.float    "conflictual_transaction_amout"
    t.string   "conflictual_currency",          limit: 3
    t.float    "compensation_rate"
    t.integer  "acknowledgement_count"
    t.string   "original_transaction_amount"
  end

  add_index "baskets", ["number"], name: "index_baskets_on_number", using: :btree
  add_index "baskets", ["operation_id"], name: "index_baskets_on_operation_id", using: :btree
  add_index "baskets", ["service_id"], name: "index_baskets_on_service_id", using: :btree

  create_table "countries", force: true do |t|
    t.string   "name"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currencies", force: true do |t|
    t.string   "name",       limit: 64
    t.string   "code",       limit: 3
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
    t.string   "symbol",     limit: 7
  end

  create_table "currencies_matches", id: false, force: true do |t|
    t.string "first_code",  limit: 3
    t.string "second_code", limit: 3
    t.float  "rate"
  end

  create_table "delayed_payments", force: true do |t|
    t.string   "number"
    t.string   "service_id"
    t.boolean  "payment_status"
    t.string   "operation_id"
    t.boolean  "notified_to_back_office"
    t.float    "transaction_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "transaction_id"
    t.boolean  "notified_to_ecommerce"
  end

  create_table "om_logs", force: true do |t|
    t.text     "log_rl"
    t.text     "log_tv"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operations", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "comment"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
    t.string   "authentication_token"
  end

  create_table "orange_money_ci_baskets", force: true do |t|
    t.string   "number"
    t.string   "service_id"
    t.boolean  "payment_status"
    t.string   "operation_id"
    t.float    "transaction_amount"
    t.boolean  "notified_to_back_office"
    t.string   "transaction_id"
    t.float    "fees"
    t.integer  "currency_id"
    t.float    "paid_transaction_amount"
    t.integer  "paid_currency_id"
    t.float    "rate"
    t.float    "conflictual_transaction_amount"
    t.string   "conflictual_currency",           limit: 3
    t.float    "compensation_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ompay_token"
    t.string   "ompay_clientid"
    t.string   "ompay_cname"
    t.string   "ompay_payid"
    t.string   "ompay_date"
    t.string   "ompay_time"
    t.string   "ompay_ipaddr"
    t.string   "ompay_signature"
    t.string   "original_transaction_amount"
    t.text     "log_rl"
    t.text     "log_tv"
  end

  create_table "parameters", force: true do |t|
    t.string   "second_origin_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "paymoney_url"
    t.string   "orange_money_ci_initialization_url"
    t.string   "orange_money_ci_url"
    t.string   "qash_url"
    t.string   "qash_merchant_id"
    t.string   "qash_verify_url"
    t.string   "orange_money_ci_verify_url"
  end

  create_table "payment_way_fees", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.float    "fee"
    t.boolean  "percentage"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
    t.boolean  "enabled"
    t.integer  "wallet_id"
  end

  create_table "paypal_baskets", force: true do |t|
    t.string   "number"
    t.string   "service_id"
    t.string   "operation_id"
    t.boolean  "payment_status"
    t.float    "transaction_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "notified_to_back_office"
    t.string   "transaction_id"
    t.boolean  "notified_to_ecommerce"
    t.float    "fees"
    t.integer  "currency_id"
    t.float    "paid_transaction_amount"
    t.integer  "paid_currency_id"
    t.float    "rate"
    t.float    "conflictual_transaction_amout"
    t.string   "conflictual_currency",          limit: 3
    t.float    "compensation_rate"
    t.string   "original_transaction_amount"
  end

  create_table "products", force: true do |t|
    t.string   "name",          limit: 100
    t.integer  "price"
    t.date     "expiring_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
  end

  create_table "qash_baskets", force: true do |t|
    t.string   "number"
    t.string   "service_id"
    t.boolean  "payment_status"
    t.string   "operation_id"
    t.float    "transaction_amount"
    t.boolean  "notified_to_back_office"
    t.string   "transaction_id"
    t.float    "fees"
    t.integer  "currency_id"
    t.float    "paid_transaction_amount"
    t.integer  "paid_currency_id"
    t.float    "rate"
    t.float    "conflictual_transaction_amount"
    t.string   "conflictual_currency",           limit: 3
    t.float    "compensation_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "qash_transaction_id"
    t.string   "original_transaction_amount"
  end

  create_table "services", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sales_area"
    t.string   "url_on_success"
    t.string   "url_on_error"
    t.string   "url_on_session_expired"
    t.string   "url_on_hold_success"
    t.string   "url_on_hold_error"
    t.string   "url_on_hold_listener"
    t.string   "authentication_token"
    t.string   "comment"
    t.string   "url_on_basket_already_paid"
    t.string   "url_to_ipn"
    t.boolean  "published"
  end

  add_index "services", ["code"], name: "index_services_on_code", using: :btree
  add_index "services", ["name"], name: "index_services_on_name", using: :btree

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "simple_captcha_data", force: true do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], name: "idx_key", using: :btree

  create_table "wallets", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
    t.boolean  "published"
    t.string   "authentication_token"
    t.integer  "currency_id"
    t.float    "fee"
    t.boolean  "percentage"
  end

end
