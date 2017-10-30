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

ActiveRecord::Schema.define(version: 20171030044909) do

  create_table "addresses", force: :cascade do |t|
    t.string "street1"
    t.string "street2"
    t.string "suburb"
    t.string "postcode"
    t.string "state"
    t.string "country"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_addresses_on_client_id"
  end

  create_table "attendees", force: :cascade do |t|
    t.integer "client_id"
    t.integer "event_id"
    t.decimal "price", precision: 8, scale: 2
    t.integer "attendee_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_attendees_on_client_id"
    t.index ["event_id"], name: "index_attendees_on_event_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "firstname"
    t.string "surname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
    t.string "email_address"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "age", precision: 8, scale: 2
    t.integer "sex"
    t.boolean "desexed"
    t.index ["client_id"], name: "index_dogs_on_client_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "date"
    t.string "location"
    t.decimal "price", precision: 8, scale: 2
    t.integer "duration"
    t.boolean "cancelled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_type"
  end

  create_table "notes", force: :cascade do |t|
    t.string "annotatable_type"
    t.integer "annotatable_id"
    t.text "annotation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["annotatable_type", "annotatable_id"], name: "index_notes_on_annotatable_type_and_annotatable_id"
  end

end
