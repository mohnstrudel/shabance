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

ActiveRecord::Schema.define(version: 2018_08_11_195609) do

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

  create_table "article_categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.bigint "article_id"
    t.index ["article_id"], name: "index_article_categories_on_article_id"
    t.index ["slug"], name: "index_article_categories_on_slug", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "article_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "video"
    t.string "cite"
    t.string "logo"
    t.string "link"
    t.string "images"
    t.boolean "featured"
    t.text "keywords"
    t.index ["article_category_id"], name: "index_articles_on_article_category_id"
    t.index ["slug"], name: "index_articles_on_slug", unique: true
  end

  create_table "blocks", force: :cascade do |t|
    t.text "block_body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "service_id"
    t.index ["service_id"], name: "index_blocks_on_service_id"
  end

  create_table "cases", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
    t.string "author"
    t.string "subtitle"
    t.index ["slug"], name: "index_cases_on_slug", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
    t.string "slug"
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "contact_requests", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "subject"
    t.text "body"
    t.string "page_reference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "newsletter_requests", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "opening_hours", force: :cascade do |t|
    t.string "title"
    t.string "value"
    t.bigint "setting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setting_id"], name: "index_opening_hours_on_setting_id"
  end

  create_table "phones", force: :cascade do |t|
    t.string "value"
    t.bigint "setting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setting_id"], name: "index_phones_on_setting_id"
  end

  create_table "post_categories", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_categories_on_post_id"
    t.index ["slug"], name: "index_post_categories_on_slug", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "post_category_id"
    t.string "logo"
    t.string "images"
    t.string "cite"
    t.string "video"
    t.string "link"
    t.boolean "featured"
    t.text "keywords"
    t.index ["post_category_id"], name: "index_posts_on_post_category_id"
    t.index ["slug"], name: "index_posts_on_slug", unique: true
  end

  create_table "requests", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "message"
    t.string "phone"
    t.string "subject"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seos", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image"
    t.string "keywords", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "post_id"
    t.bigint "case_id"
    t.bigint "article_id"
    t.bigint "service_id"
    t.bigint "setting_id"
    t.index ["article_id"], name: "index_seos_on_article_id"
    t.index ["case_id"], name: "index_seos_on_case_id"
    t.index ["post_id"], name: "index_seos_on_post_id"
    t.index ["service_id"], name: "index_seos_on_service_id"
    t.index ["setting_id"], name: "index_seos_on_setting_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "title"
    t.text "leading_description"
    t.text "ending_description"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "service_type"
    t.bigint "block_id"
    t.string "logo"
    t.index ["block_id"], name: "index_services_on_block_id"
    t.index ["category_id"], name: "index_services_on_category_id"
    t.index ["slug"], name: "index_services_on_slug", unique: true
  end

  create_table "settings", force: :cascade do |t|
    t.string "url"
    t.string "address"
    t.string "long"
    t.string "lat"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "article_categories", "articles"
  add_foreign_key "articles", "article_categories"
  add_foreign_key "blocks", "services"
  add_foreign_key "categories", "categories", column: "parent_id"
  add_foreign_key "opening_hours", "settings"
  add_foreign_key "phones", "settings"
  add_foreign_key "post_categories", "posts"
  add_foreign_key "posts", "post_categories"
  add_foreign_key "seos", "articles"
  add_foreign_key "seos", "cases"
  add_foreign_key "seos", "posts"
  add_foreign_key "seos", "services"
  add_foreign_key "seos", "settings"
  add_foreign_key "services", "blocks"
  add_foreign_key "services", "categories"
end
