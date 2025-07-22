# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_07_22_145922) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "listing_images", force: :cascade do |t|
    t.string "image_url"
    t.bigint "listing_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_listing_images_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.decimal "price"
    t.string "condition"
    t.boolean "accepting_trades"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "trade_id", null: false
    t.bigint "user_id", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trade_id"], name: "index_messages_on_trade_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "trade_id", null: false
    t.bigint "reviewer_id"
    t.bigint "reviewee_id"
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reviewee_id"], name: "index_reviews_on_reviewee_id"
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
    t.index ["trade_id"], name: "index_reviews_on_trade_id"
  end

  create_table "trade_items", force: :cascade do |t|
    t.bigint "trade_id", null: false
    t.bigint "listing_id", null: false
    t.bigint "owner_id"
    t.string "side"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_trade_items_on_listing_id"
    t.index ["owner_id"], name: "index_trade_items_on_owner_id"
    t.index ["trade_id"], name: "index_trade_items_on_trade_id"
  end

  create_table "trades", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.string "status"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_trades_on_receiver_id"
    t.index ["sender_id"], name: "index_trades_on_sender_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "profile_image_url"
    t.text "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "listing_images", "listings"
  add_foreign_key "listings", "users"
  add_foreign_key "messages", "trades"
  add_foreign_key "messages", "users"
  add_foreign_key "reviews", "trades"
  add_foreign_key "reviews", "users", column: "reviewee_id"
  add_foreign_key "reviews", "users", column: "reviewer_id"
  add_foreign_key "trade_items", "listings"
  add_foreign_key "trade_items", "trades"
  add_foreign_key "trade_items", "users", column: "owner_id"
  add_foreign_key "trades", "users", column: "receiver_id"
  add_foreign_key "trades", "users", column: "sender_id"
end
