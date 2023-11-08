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

ActiveRecord::Schema.define(version: 2023_11_03_054740) do

  create_table "action_text_rich_texts", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.text "body", size: :long
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.integer "category_type"
    t.boolean "editable", default: true
    t.bigint "website_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["website_id"], name: "index_categories_on_website_id"
  end

  create_table "map_images", charset: "utf8mb4", force: :cascade do |t|
    t.string "image"
    t.bigint "website_id"
    t.string "element_name"
    t.string "parent_div"
    t.string "page_name"
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["website_id"], name: "index_map_images_on_website_id"
  end

  create_table "maps", charset: "utf8mb4", force: :cascade do |t|
    t.integer "map_type"
    t.integer "variant"
    t.string "template_name"
    t.string "parent_div"
    t.string "page_name"
    t.string "category_name"
    t.integer "limit_item"
    t.bigint "website_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["website_id"], name: "index_maps_on_website_id"
  end

  create_table "pages", charset: "utf8mb4", force: :cascade do |t|
    t.text "html"
    t.string "url"
    t.string "name"
    t.bigint "website_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["website_id"], name: "index_pages_on_website_id"
  end

  create_table "posts", charset: "utf8mb4", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.string "url"
    t.string "image"
    t.string "refer_ids", default: "[]"
    t.bigint "category_id"
    t.bigint "user_id"
    t.bigint "website_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_posts_on_category_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
    t.index ["website_id"], name: "index_posts_on_website_id"
  end

  create_table "product_images", charset: "utf8mb4", force: :cascade do |t|
    t.string "image"
    t.bigint "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "products", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.integer "price"
    t.text "description"
    t.string "refer_ids", default: "[]"
    t.bigint "user_id"
    t.bigint "website_id", null: false
    t.bigint "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["user_id"], name: "index_products_on_user_id"
    t.index ["website_id"], name: "index_products_on_website_id"
  end

  create_table "repo_websites", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "repo_id"
    t.bigint "website_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["repo_id"], name: "index_repo_websites_on_repo_id"
    t.index ["website_id"], name: "index_repo_websites_on_website_id"
  end

  create_table "repos", charset: "utf8mb4", force: :cascade do |t|
    t.string "path"
    t.string "vercel_domain"
    t.boolean "is_available", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_website_roles", charset: "utf8mb4", force: :cascade do |t|
    t.integer "role", default: 0, null: false
    t.bigint "user_id"
    t.bigint "website_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_website_roles_on_user_id"
    t.index ["website_id"], name: "index_user_website_roles_on_website_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "websites", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "domain_vercel"
    t.string "domain_website"
    t.string "title"
    t.string "description"
    t.string "province"
    t.string "logo"
    t.string "icon"
    t.string "resources"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
