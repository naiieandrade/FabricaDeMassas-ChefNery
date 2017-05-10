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

ActiveRecord::Schema.define(version: 20170510124711) do

  create_table "Orders_Products", id: false, force: :cascade do |t|
    t.integer "order_id",   null: false
    t.integer "product_id", null: false
  end

  add_index "Orders_Products", ["order_id", "product_id"], name: "index_Orders_Products_on_order_id_and_product_id"
  add_index "Orders_Products", ["product_id", "order_id"], name: "index_Orders_Products_on_product_id_and_order_id"

  create_table "comments", force: :cascade do |t|
    t.string   "title",            limit: 50, default: ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.string   "role",                        default: "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "couriers", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status",     default: 0
  end

  create_table "fillings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredient_factories", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "ingredient_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "type_ingredient"
  end

  create_table "ingredients_products", id: false, force: :cascade do |t|
    t.integer "product_id"
    t.integer "ingredient_id"
  end

  add_index "ingredients_products", ["ingredient_id"], name: "index_ingredients_products_on_ingredient_id"
  add_index "ingredients_products", ["product_id"], name: "index_ingredients_products_on_product_id"

  create_table "invoicing_ledger_items", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.string   "type"
    t.datetime "issue_date"
    t.string   "currency",     limit: 3,                           null: false
    t.decimal  "total_amount",            precision: 20, scale: 4
    t.decimal  "tax_amount",              precision: 20, scale: 4
    t.string   "status",       limit: 20
    t.string   "identifier",   limit: 50
    t.string   "description"
    t.datetime "period_start"
    t.datetime "period_end"
    t.string   "uuid",         limit: 40
    t.datetime "due_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoicing_line_items", force: :cascade do |t|
    t.integer  "ledger_item_id"
    t.string   "type"
    t.decimal  "net_amount",                precision: 20, scale: 4
    t.decimal  "tax_amount",                precision: 20, scale: 4
    t.string   "description"
    t.string   "uuid",           limit: 40
    t.datetime "tax_point"
    t.decimal  "quantity",                  precision: 20, scale: 4
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoicing_tax_rates", force: :cascade do |t|
    t.string   "description"
    t.decimal  "rate",           precision: 20, scale: 4
    t.datetime "valid_from",                              null: false
    t.datetime "valid_until"
    t.integer  "replaced_by_id"
    t.boolean  "is_default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.decimal  "unit_price"
    t.integer  "quantity"
    t.decimal  "total_price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id"

  create_table "order_statuses", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.text     "shippment_address"
    t.float    "amount"
    t.integer  "products_number"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.decimal  "subtotal"
    t.integer  "user_id"
    t.integer  "courier_id"
    t.integer  "order_status_id"
    t.decimal  "delivery_price",    precision: 8, scale: 2, default: 10.0
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id"

  create_table "pasta", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.float    "amount"
    t.integer  "responseCode"
    t.string   "responseMessage"
    t.string   "xref"
    t.float    "amountReceived"
    t.string   "transactionID"
    t.string   "cardNumberMask"
    t.string   "cardTypeCode"
    t.string   "cardType"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "order_id"
  end

# Could not dump table "products" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "product_id"
  end

  create_table "sauces", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "storages", force: :cascade do |t|
    t.integer  "product_unit"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "is_administrator", default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
