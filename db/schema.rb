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

ActiveRecord::Schema[7.1].define(version: 2024_04_26_011808) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "chatrooms", force: :cascade do |t|
    t.bigint "user1_id", null: false
    t.bigint "user2_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user1_id"], name: "index_chatrooms_on_user1_id"
    t.index ["user2_id"], name: "index_chatrooms_on_user2_id"
  end

  create_table "film_libraries", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "genres", default: [], array: true
    t.integer "runtime"
    t.string "release_date"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tmdb_id"
    t.string "backdrop_url"
    t.string "directed_by", default: [], array: true
    t.string "cast", default: [], array: true
  end

  create_table "film_lists", force: :cascade do |t|
    t.text "notes"
    t.bigint "film_id", null: false
    t.bigint "list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["film_id"], name: "index_film_lists_on_film_id"
    t.index ["list_id"], name: "index_film_lists_on_list_id"
  end

  create_table "films", force: :cascade do |t|
    t.boolean "like", default: false
    t.boolean "watched", default: false
    t.boolean "watchlist", default: false
    t.integer "rating", default: 0
    t.bigint "user_id", null: false
    t.bigint "film_library_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "like_updated_at"
    t.datetime "watched_updated_at"
    t.datetime "watchlist_updated_at"
    t.datetime "rating_updated_at"
    t.index ["film_library_id"], name: "index_films_on_film_library_id"
    t.index ["user_id"], name: "index_films_on_user_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.date "date", null: false
    t.text "review", null: false
    t.integer "rating", default: 0, null: false
    t.bigint "film_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "film_library_id", null: false
    t.index ["film_id"], name: "index_reviews_on_film_id"
    t.index ["film_library_id"], name: "index_reviews_on_film_library_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chatrooms", "users", column: "user1_id"
  add_foreign_key "chatrooms", "users", column: "user2_id"
  add_foreign_key "film_lists", "films"
  add_foreign_key "film_lists", "lists"
  add_foreign_key "films", "film_libraries"
  add_foreign_key "films", "users"
  add_foreign_key "lists", "users"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "reviews", "film_libraries"
  add_foreign_key "reviews", "films"
  add_foreign_key "reviews", "users"
end
