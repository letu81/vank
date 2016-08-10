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

ActiveRecord::Schema.define(version: 20160523073814) do

  # These are extensions that must be enabled in order to support this database

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.string   "name"
    t.string   "mobile",     null: false
    t.string   "region",     null: false
    t.string   "address",    null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
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

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "attachments", force: :cascade do |t|
    t.string   "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authorizations", force: :cascade do |t|
    t.string   "uid",        limit: 1000, null: false
    t.string   "provider",                null: false
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "authorizations", ["provider", "uid"], name: "index_authorizations_on_provider_and_uid", using: :btree
  add_index "authorizations", ["user_id"], name: "index_authorizations_on_user_id", using: :btree

  create_table "banners", force: :cascade do |t|
    t.string   "image",                  null: false
    t.string   "link"
    t.integer  "sort",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",                       null: false
    t.string   "image"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "products_count", default: 0
    t.integer  "sort",           default: 0
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree
  add_index "categories", ["sort"], name: "index_categories_on_sort", using: :btree

  create_table "coupons", force: :cascade do |t|
    t.string   "title",                        null: false
    t.string   "body"
    t.string   "note"
    t.integer  "value",                        null: false
    t.integer  "max_value",                    null: false
    t.integer  "coupon_type",     default: 1
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "expired_days"
    t.integer  "use_type",        default: 1
    t.integer  "except_products", default: [],              array: true
  end

  create_table "discount_events", force: :cascade do |t|
    t.string   "code",                    null: false
    t.string   "title",                   null: false
    t.text     "body",                    null: false
    t.date     "expired_on"
    t.integer  "score",      default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "coupon_ids", default: [],              array: true
  end

  add_index "discount_events", ["code"], name: "index_discount_events_on_code", unique: true, using: :btree

  create_table "discountings", force: :cascade do |t|
    t.integer  "coupon_id"
    t.integer  "user_id"
    t.datetime "discounted_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.date     "expired_on"
  end

  add_index "discountings", ["coupon_id"], name: "index_discountings_on_coupon_id", using: :btree
  add_index "discountings", ["user_id"], name: "index_discountings_on_user_id", using: :btree

  create_table "expresses", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "exp_no",       null: false
    t.string   "company_code"
    t.integer  "order_id",     null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "expresses", ["exp_no"], name: "index_expresses_on_exp_no", unique: true, using: :btree
  add_index "expresses", ["order_id"], name: "index_expresses_on_order_id", using: :btree

  create_table "invite_logs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "invite_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "invite_logs", ["invite_id"], name: "index_invite_logs_on_invite_id", using: :btree
  add_index "invite_logs", ["user_id"], name: "index_invite_logs_on_user_id", using: :btree

  create_table "invites", force: :cascade do |t|
    t.string   "title",                        null: false
    t.string   "body",                         null: false
    t.string   "link",                         null: false
    t.string   "icon"
    t.integer  "inviter_benefits", default: 0
    t.integer  "invitee_benefits", default: 0
    t.integer  "score",            default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "share_body"
  end

  add_index "invites", ["score"], name: "index_invites_on_score", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "to_user_type", default: 1
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "order_products", force: :cascade do |t|
    t.string   "sku",                                                     null: false
    t.string   "product_images",                            default: [],               array: true
    t.integer  "order_id"
    t.decimal  "price",             precision: 8, scale: 2
    t.string   "unit"
    t.string   "quantity"
    t.string   "shipment_quantity"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.decimal  "pack_cost",         precision: 8, scale: 2
    t.decimal  "shipment_cost",     precision: 8, scale: 2
    t.decimal  "pay_buyer_loss",    precision: 8, scale: 2, default: 0.0
  end

  add_index "order_products", ["order_id"], name: "index_order_products_on_order_id", using: :btree
  add_index "order_products", ["sku"], name: "index_order_products_on_sku", unique: true, using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "order_no",                         null: false
    t.integer  "product_id"
    t.string   "note"
    t.integer  "user_id"
    t.string   "state",        default: "pending"
    t.integer  "quantity",     default: 1
    t.integer  "total_fee",    default: 0
    t.integer  "discount_fee", default: 0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "partner_id"
    t.integer  "shipment_id"
  end

  add_index "orders", ["order_no"], name: "index_orders_on_order_no", unique: true, using: :btree
  add_index "orders", ["partner_id"], name: "index_orders_on_partner_id", using: :btree
  add_index "orders", ["product_id"], name: "index_orders_on_product_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "body",       null: false
    t.string   "slug",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pages", ["slug"], name: "index_pages_on_slug", unique: true, using: :btree

  create_table "partners", force: :cascade do |t|
    t.string   "name"
    t.string   "mobile"
    t.string   "address"
    t.string   "service_scope"
    t.string   "pay_type"
    t.string   "pay_card_no"
    t.integer  "orders_count",  default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "pay_account"
  end

  create_table "products", force: :cascade do |t|
    t.string   "title",                         null: false
    t.integer  "price",         default: 0,     null: false
    t.integer  "m_price",       default: 0,     null: false
    t.string   "intro"
    t.integer  "stock",         default: 1000,  null: false
    t.integer  "category_id"
    t.boolean  "visible",       default: true
    t.boolean  "on_sale",       default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "images",        default: [],                 array: true
    t.string   "detail_images", default: [],                 array: true
    t.integer  "visit",         default: 0
    t.integer  "orders_count",  default: 0
    t.integer  "sort",          default: 0
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["sort"], name: "index_products_on_sort", using: :btree

  create_table "redactor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable", using: :btree
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type", using: :btree

  create_table "rewards", force: :cascade do |t|
    t.integer  "recommending_id"
    t.integer  "recommended_id"
    t.integer  "order_id"
    t.decimal  "money",           precision: 8, scale: 2, default: 0.0
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  add_index "rewards", ["recommending_id", "order_id"], name: "index_rewards_on_recommending_id_and_order_id", unique: true, using: :btree
  add_index "rewards", ["recommending_id"], name: "index_rewards_on_recommending_id", using: :btree

  create_table "shipments", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "mobile",     null: false
    t.string   "region"
    t.string   "address",    null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shipments", ["user_id"], name: "index_shipments_on_user_id", using: :btree

  create_table "site_configs", force: :cascade do |t|
    t.string   "key"
    t.string   "value"
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trades", force: :cascade do |t|
    t.string   "money",                   null: false
    t.integer  "partner_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "operator"
    t.integer  "orders",     default: [],              array: true
    t.string   "note"
  end

  add_index "trades", ["operator"], name: "index_trades_on_operator", using: :btree
  add_index "trades", ["partner_id"], name: "index_trades_on_partner_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "mobile"
    t.string   "nickname"
    t.string   "private_token"
    t.string   "avatar"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "verified",            default: true
    t.boolean  "visible",             default: true
    t.integer  "current_shipment_id"
    t.string   "nb_code"
    t.integer  "balance",             default: 0
    t.integer  "score",               default: 0
    t.integer  "recommender"
  end

  add_index "users", ["mobile"], name: "index_users_on_mobile", unique: true, using: :btree
  add_index "users", ["nb_code"], name: "index_users_on_nb_code", unique: true, using: :btree
  add_index "users", ["private_token"], name: "index_users_on_private_token", unique: true, using: :btree
  add_index "users", ["recommender"], name: "index_users_on_recommender", using: :btree

  create_table "wechat_auths", force: :cascade do |t|
    t.string   "open_id",       null: false
    t.string   "access_token",  null: false
    t.integer  "user_id"
    t.string   "union_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "refresh_token"
    t.string   "avatar_url"
  end

  add_index "wechat_auths", ["open_id"], name: "index_wechat_auths_on_open_id", unique: true, using: :btree
  add_index "wechat_auths", ["union_id"], name: "index_wechat_auths_on_union_id", unique: true, using: :btree
  add_index "wechat_auths", ["user_id"], name: "index_wechat_auths_on_user_id", using: :btree

  create_table "wechat_users", force: :cascade do |t|
    t.string   "uid",                          null: false
    t.string   "nickname"
    t.string   "avatar_url"
    t.boolean  "verified",      default: true
    t.string   "private_token"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "wechat_users", ["private_token"], name: "index_wechat_users_on_private_token", unique: true, using: :btree
  add_index "wechat_users", ["uid"], name: "index_wechat_users_on_uid", unique: true, using: :btree

  add_foreign_key "addresses", "users"
  add_foreign_key "authorizations", "users"
  add_foreign_key "invite_logs", "invites"
  add_foreign_key "invite_logs", "users"
  add_foreign_key "messages", "users"
  add_foreign_key "orders", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "shipments", "users"
  add_foreign_key "wechat_auths", "users"
end
