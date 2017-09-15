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

ActiveRecord::Schema.define(version: 20170818094850) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "mobile",     limit: 255, null: false
    t.string   "region",     limit: 255, null: false
    t.string   "address",    limit: 255, null: false
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "attachments", force: :cascade do |t|
    t.string   "file",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "authorizations", force: :cascade do |t|
    t.string   "uid",        limit: 120, null: false
    t.string   "provider",   limit: 255, null: false
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "authorizations", ["provider", "uid"], name: "index_auths_on_provider_uid", using: :btree
  add_index "authorizations", ["user_id"], name: "index_authorizations_on_user_id", using: :btree

  create_table "banners", force: :cascade do |t|
    t.string   "image",      limit: 255,             null: false
    t.string   "link",       limit: 255
    t.integer  "sort",       limit: 4,   default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",           limit: 255,             null: false
    t.string   "image",          limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "products_count", limit: 4,   default: 0
    t.integer  "sort",           limit: 4,   default: 0
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree
  add_index "categories", ["sort"], name: "index_categories_on_sort", using: :btree

  create_table "coupons", force: :cascade do |t|
    t.string   "title",           limit: 255,             null: false
    t.string   "body",            limit: 255
    t.string   "note",            limit: 255
    t.integer  "value",           limit: 4,               null: false
    t.integer  "max_value",       limit: 4,               null: false
    t.integer  "coupon_type",     limit: 4,   default: 1
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "expired_days",    limit: 4
    t.integer  "use_type",        limit: 4,   default: 1
    t.integer  "except_products", limit: 4
  end

  add_index "coupons", ["title"], name: "index_coupons_on_title", using: :btree

  create_table "discount_events", force: :cascade do |t|
    t.string   "code",       limit: 255,               null: false
    t.string   "title",      limit: 255,               null: false
    t.text     "body",       limit: 65535,             null: false
    t.date     "expired_on"
    t.integer  "score",      limit: 4,     default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "coupon_ids", limit: 4
  end

  add_index "discount_events", ["code"], name: "index_discount_events_on_code", unique: true, using: :btree

  create_table "discountings", force: :cascade do |t|
    t.integer  "coupon_id",     limit: 4
    t.integer  "user_id",       limit: 4
    t.datetime "discounted_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.date     "expired_on"
  end

  add_index "discountings", ["coupon_id"], name: "index_discountings_on_coupon_id", using: :btree
  add_index "discountings", ["user_id"], name: "index_discountings_on_user_id", using: :btree

  create_table "expresses", force: :cascade do |t|
    t.string   "name",         limit: 255, null: false
    t.string   "exp_no",       limit: 255, null: false
    t.string   "company_code", limit: 255
    t.integer  "order_id",     limit: 4,   null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "expresses", ["exp_no"], name: "index_expresses_on_exp_no", unique: true, using: :btree
  add_index "expresses", ["order_id"], name: "index_expresses_on_order_id", using: :btree

  create_table "invite_logs", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "invite_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "invite_logs", ["invite_id"], name: "index_invite_logs_on_invite_id", using: :btree
  add_index "invite_logs", ["user_id"], name: "index_invite_logs_on_user_id", using: :btree

  create_table "invites", force: :cascade do |t|
    t.string   "title",            limit: 255,             null: false
    t.string   "body",             limit: 255,             null: false
    t.string   "link",             limit: 255,             null: false
    t.string   "icon",             limit: 255
    t.integer  "inviter_benefits", limit: 4,   default: 0
    t.integer  "invitee_benefits", limit: 4,   default: 0
    t.integer  "score",            limit: 4,   default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "share_body",       limit: 255
  end

  add_index "invites", ["score"], name: "index_invites_on_score", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "to_user_type", limit: 4,   default: 1
    t.string   "content",      limit: 255
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "order_products", force: :cascade do |t|
    t.string   "sku",               limit: 255,                                              null: false
    t.string   "product_images",    limit: 255,                         default: "--- []\n"
    t.integer  "order_id",          limit: 4
    t.decimal  "price",                         precision: 8, scale: 2
    t.string   "unit",              limit: 255
    t.string   "quantity",          limit: 255
    t.string   "shipment_quantity", limit: 255
    t.datetime "created_at",                                                                 null: false
    t.datetime "updated_at",                                                                 null: false
    t.decimal  "pack_cost",                     precision: 8, scale: 2
    t.decimal  "shipment_cost",                 precision: 8, scale: 2
    t.decimal  "pay_buyer_loss",                precision: 8, scale: 2, default: 0.0
  end

  add_index "order_products", ["order_id"], name: "index_order_products_on_order_id", using: :btree
  add_index "order_products", ["sku"], name: "index_order_products_on_sku", unique: true, using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "order_no",     limit: 255,                     null: false
    t.integer  "product_id",   limit: 4
    t.string   "note",         limit: 255
    t.integer  "user_id",      limit: 4
    t.string   "state",        limit: 255, default: "pending"
    t.integer  "quantity",     limit: 4,   default: 1
    t.integer  "total_fee",    limit: 4,   default: 0
    t.integer  "discount_fee", limit: 4,   default: 0
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "partner_id",   limit: 4
    t.integer  "shipment_id",  limit: 4
  end

  add_index "orders", ["order_no"], name: "index_orders_on_order_no", unique: true, using: :btree
  add_index "orders", ["partner_id"], name: "index_orders_on_partner_id", using: :btree
  add_index "orders", ["product_id"], name: "index_orders_on_product_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "title",      limit: 255,   null: false
    t.text     "body",       limit: 65535, null: false
    t.string   "slug",       limit: 255,   null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "pages", ["slug"], name: "index_pages_on_slug", unique: true, using: :btree

  create_table "partners", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "mobile",        limit: 255
    t.string   "address",       limit: 255
    t.string   "service_scope", limit: 255
    t.string   "pay_type",      limit: 255
    t.string   "pay_card_no",   limit: 255
    t.integer  "orders_count",  limit: 4,   default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "pay_account",   limit: 255
  end

  create_table "products", force: :cascade do |t|
    t.string   "title",         limit: 255,                      null: false
    t.integer  "price",         limit: 4,   default: 0,          null: false
    t.integer  "m_price",       limit: 4,   default: 0,          null: false
    t.string   "intro",         limit: 255
    t.integer  "stock",         limit: 4,   default: 1000,       null: false
    t.integer  "category_id",   limit: 4
    t.boolean  "visible",                   default: true
    t.boolean  "on_sale",                   default: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "images",        limit: 255, default: "--- []\n"
    t.string   "detail_images", limit: 255, default: "--- []\n"
    t.integer  "visit",         limit: 4,   default: 0
    t.integer  "orders_count",  limit: 4,   default: 0
    t.integer  "sort",          limit: 4,   default: 0
    t.string   "param_images",  limit: 255, default: "--- []\n"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["sort"], name: "index_products_on_sort", using: :btree

  create_table "redactor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable", using: :btree
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type", using: :btree

  create_table "rewards", force: :cascade do |t|
    t.integer  "recommending_id", limit: 4
    t.integer  "recommended_id",  limit: 4
    t.integer  "order_id",        limit: 4
    t.decimal  "money",                     precision: 8, scale: 2, default: 0.0
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
  end

  add_index "rewards", ["recommending_id", "order_id"], name: "index_rewards_on_recommending_id_and_order_id", unique: true, using: :btree
  add_index "rewards", ["recommending_id"], name: "index_rewards_on_recommending_id", using: :btree

  create_table "shipments", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "mobile",     limit: 255, null: false
    t.string   "region",     limit: 255
    t.string   "address",    limit: 255, null: false
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "shipments", ["user_id"], name: "index_shipments_on_user_id", using: :btree

  create_table "site_configs", force: :cascade do |t|
    t.string   "key",        limit: 255
    t.string   "value",      limit: 255
    t.string   "note",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "trades", force: :cascade do |t|
    t.string   "money",      limit: 255, null: false
    t.integer  "partner_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "operator",   limit: 4
    t.integer  "orders",     limit: 4
    t.string   "note",       limit: 255
  end

  add_index "trades", ["operator"], name: "index_trades_on_operator", using: :btree
  add_index "trades", ["partner_id"], name: "index_trades_on_partner_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "mobile",              limit: 255
    t.string   "nickname",            limit: 255
    t.string   "private_token",       limit: 255
    t.string   "avatar",              limit: 255
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.boolean  "verified",                        default: true
    t.boolean  "visible",                         default: true
    t.integer  "current_shipment_id", limit: 4
    t.string   "nb_code",             limit: 255
    t.integer  "balance",             limit: 4,   default: 0
    t.integer  "score",               limit: 4,   default: 0
    t.integer  "recommender",         limit: 4
  end

  add_index "users", ["mobile"], name: "index_users_on_mobile", unique: true, using: :btree
  add_index "users", ["nb_code"], name: "index_users_on_nb_code", unique: true, using: :btree
  add_index "users", ["private_token"], name: "index_users_on_private_token", unique: true, using: :btree
  add_index "users", ["recommender"], name: "index_users_on_recommender", using: :btree

  create_table "wechat_auths", force: :cascade do |t|
    t.string   "open_id",       limit: 255, null: false
    t.string   "access_token",  limit: 255, null: false
    t.integer  "user_id",       limit: 4
    t.string   "union_id",      limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "refresh_token", limit: 255
    t.string   "avatar_url",    limit: 255
  end

  add_index "wechat_auths", ["open_id"], name: "index_wechat_auths_on_open_id", unique: true, using: :btree
  add_index "wechat_auths", ["union_id"], name: "index_wechat_auths_on_union_id", unique: true, using: :btree
  add_index "wechat_auths", ["user_id"], name: "index_wechat_auths_on_user_id", using: :btree

  create_table "wechat_users", force: :cascade do |t|
    t.string   "uid",           limit: 255,                null: false
    t.string   "nickname",      limit: 255
    t.string   "avatar_url",    limit: 255
    t.boolean  "verified",                  default: true
    t.string   "private_token", limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
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
