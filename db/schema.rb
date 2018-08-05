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

ActiveRecord::Schema.define(version: 2018_08_05_165642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "anomaly_types", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assignments", force: :cascade do |t|
    t.date "due_date"
    t.date "stimated_time"
    t.date "management_date"
    t.string "collection_entity"
    t.date "payment_date"
    t.date "commitment_date"
    t.boolean "personal_contact"
    t.integer "id_number"
    t.string "payment_holder"
    t.string "phone"
    t.string "email"
    t.string "observations"
    t.integer "reading_signature"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "task_id"
    t.integer "user_id"
    t.integer "management_type_id"
    t.integer "result_type_id"
    t.integer "anomaly_type_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.integer "number"
    t.string "source"
    t.string "state"
    t.date "init_date"
    t.date "finish_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.integer "NIC"
    t.string "unicom"
    t.integer "NIS"
    t.string "departament"
    t.string "municipality"
    t.string "corregimiento"
    t.string "neighborhood"
    t.string "street_type"
    t.string "street_name"
    t.string "duplicator"
    t.integer "number"
    t.string "CGV"
    t.string "address"
    t.string "name"
    t.integer "id_number"
    t.string "phone"
    t.string "rate"
    t.string "state"
    t.integer "route"
    t.integer "reading_itinerary"
    t.integer "AOL"
    t.string "measurer"
    t.string "measurer_type"
    t.string "measurer_brand"
    t.integer "energy_debt"
    t.integer "irregular_debt"
    t.integer "third_party_debt"
    t.integer "financed_debt"
    t.integer "overdue_bills"
    t.integer "agreed_bills"
    t.boolean "dataphone_payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "delegation_id"
  end

  create_table "contractors", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delegations", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "management_types", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "result_types", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "validity"
    t.integer "period"
    t.string "plan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "campaign_id"
    t.integer "client_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "password"
    t.string "name"
    t.string "lastname"
    t.integer "id_number"
    t.integer "contractor_id"
    t.string "phone"
    t.string "address"
    t.boolean "active"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer "role_id"
    t.integer "delegation_id"
    t.string "position"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
