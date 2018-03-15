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

ActiveRecord::Schema.define(version: 20180311181936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "current_status"
    t.string "total_cost"
    t.string "exposure_view_count"
    t.string "video_focus_people"
    t.string "video_focus_product"
    t.string "video_duration"
    t.string "video_title"
    t.string "video_link_url"
    t.string "video_like_count"
    t.string "video_comment_count"
    t.string "video_share_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "qr_code_scan_count"
    t.string "selected_video_style"
    t.string "video_thumbnail_url"
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "business_name"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.string "password_hash"
    t.string "password_salt"
    t.string "customer_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["token"], name: "index_users_on_token"
  end

  create_table "video_styles", force: :cascade do |t|
    t.string "name"
    t.string "video_comments_count"
    t.string "video_likes_count"
    t.string "video_shares_count"
    t.string "video_url"
    t.string "thumbnail_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "video_style"
    t.integer "video_views", default: 0
    t.string "business_name"
  end

  create_table "videostyles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "campaigns", "users"
end
