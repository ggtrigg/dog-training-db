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

ActiveRecord::Schema[7.0].define(version: 2022_02_13_001510) do
  create_table "active_storage_attachments", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb3", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: nil, null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "street1"
    t.string "street2"
    t.string "suburb"
    t.string "postcode"
    t.string "state"
    t.string "country"
    t.bigint "client_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["client_id"], name: "index_addresses_on_client_id"
  end

  create_table "attendees", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "event_id"
    t.decimal "price", precision: 8, scale: 2
    t.integer "attendee_status"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["client_id"], name: "index_attendees_on_client_id"
    t.index ["event_id"], name: "index_attendees_on_event_id"
  end

  create_table "clients", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "firstname"
    t.string "surname"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "phone_number"
    t.string "email_address"
  end

  create_table "dogs", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.bigint "client_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "age"
    t.integer "sex"
    t.boolean "desexed"
    t.string "services"
    t.date "dob"
    t.index ["client_id"], name: "index_dogs_on_client_id"
  end

  create_table "events", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.datetime "date", precision: nil
    t.string "location"
    t.decimal "price", precision: 8, scale: 2
    t.integer "duration"
    t.boolean "cancelled"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "event_type"
  end

  create_table "intake_details", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.text "text"
    t.bigint "intake_form_id"
    t.bigint "intake_item_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["intake_form_id"], name: "index_intake_details_on_intake_form_id"
    t.index ["intake_item_id"], name: "index_intake_details_on_intake_item_id"
  end

  create_table "intake_forms", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "dog_id"
    t.index ["dog_id"], name: "index_intake_forms_on_dog_id"
  end

  create_table "intake_items", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.text "text"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "notes", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "annotatable_type"
    t.bigint "annotatable_id"
    t.text "annotation"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["annotatable_type", "annotatable_id"], name: "index_notes_on_annotatable_type_and_annotatable_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "clients"
  add_foreign_key "dogs", "clients"
  add_foreign_key "intake_details", "intake_forms"
  add_foreign_key "intake_details", "intake_items"
  add_foreign_key "intake_forms", "dogs"
end
