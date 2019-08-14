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

ActiveRecord::Schema.define(version: 2019_08_14_190003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "name"
    t.bigint "school_id"
    t.bigint "author_id"
    t.string "content"
    t.boolean "is_published"
    t.datetime "publish_date"
    t.integer "likes", default: 0
    t.integer "loves", default: 0
    t.string "thumbnail"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_articles_on_author_id"
    t.index ["school_id"], name: "index_articles_on_school_id"
  end

  create_table "articles_categories", id: false, force: :cascade do |t|
    t.bigint "article_id"
    t.bigint "category_id"
    t.index ["article_id"], name: "index_articles_categories_on_article_id"
    t.index ["category_id"], name: "index_articles_categories_on_category_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "image"
    t.bigint "school_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_authors_on_school_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "date"
    t.string "location"
    t.integer "likes", default: 0
    t.integer "loves", default: 0
    t.bigint "school_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_events_on_school_id"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "date"
    t.string "opponent"
    t.string "location"
    t.string "home_away"
    t.boolean "win"
    t.boolean "loss"
    t.string "score"
    t.bigint "school_id"
    t.bigint "team_id"
    t.bigint "season_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_games_on_school_id"
    t.index ["season_id"], name: "index_games_on_season_id"
    t.index ["team_id"], name: "index_games_on_team_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.string "caption"
    t.string "file"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "article_id"
    t.bigint "event_id"
    t.index ["article_id"], name: "index_images_on_article_id"
    t.index ["event_id"], name: "index_images_on_event_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "school_id"
    t.integer "team_id"
    t.integer "jersey_number"
    t.string "position"
    t.string "height"
    t.string "weight"
    t.string "class_name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_players_on_school_id"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "year_start"
    t.integer "year_end"
    t.bigint "school_id"
    t.bigint "team_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_seasons_on_school_id"
    t.index ["team_id"], name: "index_seasons_on_team_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "email"
    t.string "phone"
    t.bigint "school_id"
    t.bigint "team_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_staffs_on_school_id"
    t.index ["team_id"], name: "index_staffs_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "school_id"
    t.string "sport"
    t.string "thumbnail"
    t.string "twitter_url"
    t.string "facebook_url"
    t.string "instagram_url"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_teams_on_school_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.string "user_id"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["token"], name: "index_tokens_on_token", unique: true
    t.index ["user_id"], name: "index_tokens_on_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.bigint "school_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["school_id"], name: "index_users_on_school_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "articles", "authors"
  add_foreign_key "articles", "schools"
  add_foreign_key "authors", "schools"
  add_foreign_key "events", "schools"
  add_foreign_key "games", "schools"
  add_foreign_key "games", "seasons"
  add_foreign_key "games", "teams"
  add_foreign_key "images", "articles"
  add_foreign_key "images", "events"
  add_foreign_key "players", "schools"
  add_foreign_key "players", "teams"
  add_foreign_key "seasons", "schools"
  add_foreign_key "seasons", "teams"
  add_foreign_key "staffs", "schools"
  add_foreign_key "staffs", "teams"
  add_foreign_key "teams", "schools"
  add_foreign_key "users", "schools"
end
