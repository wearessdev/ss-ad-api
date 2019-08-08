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

ActiveRecord::Schema.define(version: 2019_08_06_235355) do

  create_table "articles", force: :cascade do |t|
    t.string "name"
    t.integer "school_id"
    t.integer "author_id"
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

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "image"
    t.integer "school_id"
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
    t.integer "school_id"
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
    t.integer "school_id"
    t.integer "team_id"
    t.integer "season_id"
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
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "school_id"
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
    t.integer "school_id"
    t.integer "team_id"
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
    t.integer "school_id"
    t.integer "team_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_staffs_on_school_id"
    t.index ["team_id"], name: "index_staffs_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "school_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end