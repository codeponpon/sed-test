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

ActiveRecord::Schema.define(version: 20190821160806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"
  enable_extension "uuid-ossp"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type", null: false
    t.uuid "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "api_guardian_identities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "provider", null: false
    t.string "provider_uid", null: false
    t.json "tokens", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_api_guardian_identities_on_user_id"
  end

  create_table "api_guardian_permissions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_guardian_role_permissions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "role_id"
    t.uuid "permission_id"
    t.boolean "granted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_guardian_roles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.boolean "default", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_guardian_users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email"
    t.datetime "email_confirmed_at"
    t.string "phone_number"
    t.datetime "phone_number_confirmed_at"
    t.string "password_digest", null: false
    t.boolean "active", default: false
    t.uuid "role_id", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "otp_secret_key"
    t.boolean "otp_enabled", default: false
    t.string "otp_method", default: "sms"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "address"
    t.string "line_id"
    t.text "document_address"
    t.string "code"
    t.index ["deleted_at"], name: "index_api_guardian_users_on_deleted_at"
    t.index ["email"], name: "index_api_guardian_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_api_guardian_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_api_guardian_users_on_role_id"
  end

  create_table "bank_accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "branch_name"
    t.string "name"
    t.string "account_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "locale"
    t.string "bank_name"
  end

  create_table "branch_maintenances", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "maintenance_id"
    t.uuid "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_branch_maintenances_on_branch_id"
    t.index ["maintenance_id"], name: "index_branch_maintenances_on_maintenance_id"
  end

  create_table "branches", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "branch_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_no"
    t.string "email"
    t.string "lat"
    t.string "lng"
    t.string "address"
    t.string "address_en"
    t.string "name_en"
    t.string "fax_no"
    t.string "line_id"
    t.string "tax_id"
    t.string "dealer_code"
  end

  create_table "brochures", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "car_model_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "path"
    t.index ["car_model_id"], name: "index_brochures_on_car_model_id"
  end

  create_table "car_check_appointments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "details"
    t.uuid "car_service_id"
    t.uuid "branch_id"
    t.datetime "date_time_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.boolean "fix_up"
    t.boolean "check_up"
    t.uuid "user_car_id"
    t.string "status"
    t.string "status_update"
  end

  create_table "car_insurances", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "car_service_id"
    t.uuid "insurance_company_id"
    t.index ["car_service_id"], name: "index_car_insurances_on_car_service_id"
    t.index ["insurance_company_id"], name: "index_car_insurances_on_insurance_company_id"
  end

  create_table "car_model_details", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "car_model_id"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hex_color"
    t.integer "price"
    t.integer "added_price"
    t.string "name"
  end

  create_table "car_models", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "car_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority", default: 0
    t.index ["car_id"], name: "index_car_models_on_car_id"
  end

  create_table "car_promotions", force: :cascade do |t|
    t.uuid "car_id"
    t.uuid "promotion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_car_promotions_on_car_id"
    t.index ["promotion_id"], name: "index_car_promotions_on_promotion_id"
  end

  create_table "car_reservations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.string "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.integer "down_payment"
    t.float "installment"
    t.float "interest"
    t.string "card_id_img"
    t.string "house_registration_img"
    t.string "book_bank_img"
    t.string "payment_confirmation_img"
    t.uuid "branch_id"
    t.datetime "booking_date"
    t.float "total_deposit"
    t.string "reservation_type"
    t.uuid "car_model_detail_id"
    t.string "status_update"
    t.index ["user_id"], name: "index_car_reservations_on_user_id"
  end

  create_table "car_services", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "car_services_spare_parts", id: false, force: :cascade do |t|
    t.uuid "car_service_id"
    t.uuid "spare_part_id"
    t.index ["car_service_id"], name: "index_car_services_spare_parts_on_car_service_id"
    t.index ["spare_part_id"], name: "index_car_services_spare_parts_on_spare_part_id"
  end

  create_table "cars", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "car_model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority", default: 0
  end

  create_table "faqs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "question"
    t.text "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "locale"
    t.integer "priority", default: 0
  end

  create_table "feedbacks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id"
  end

  create_table "insurance_companies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name_en"
    t.integer "priority", default: 0
  end

  create_table "maintenance_insurance_companies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "maintenance_id"
    t.uuid "insurance_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maintenance_spare_parts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "maintenance_id"
    t.uuid "spare_part_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "pending"
  end

  create_table "maintenances", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "date_time_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.string "status"
    t.string "status_update"
    t.index ["user_id"], name: "index_maintenances_on_user_id"
  end

  create_table "oauth_access_grants", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "resource_owner_id", null: false
    t.uuid "application_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "resource_owner_id"
    t.uuid "application_id"
    t.text "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "confidential", default: true, null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "payments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "car_reservation_id"
    t.uuid "bank_account_id"
    t.string "payment_type"
    t.integer "total"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ref_code"
    t.uuid "car_check_appointment_id"
    t.index ["car_reservation_id"], name: "index_payments_on_car_reservation_id"
  end

  create_table "pictures", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "url"
    t.uuid "image_id"
    t.string "image_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["image_id"], name: "index_pictures_on_image_id"
    t.index ["image_type"], name: "index_pictures_on_image_type"
  end

  create_table "promotions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority", default: 0
  end

  create_table "reservations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "booking_id"
    t.string "booking_type"
    t.string "booking_no"
    t.string "booking_date"
    t.string "booking_code"
    t.string "booking_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reservations_on_booking_id"
    t.index ["booking_no"], name: "index_reservations_on_booking_no"
    t.index ["booking_type"], name: "index_reservations_on_booking_type"
  end

  create_table "settings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.boolean "notification", default: true
    t.string "language", default: "th"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "mid"
    t.index ["user_id"], name: "index_settings_on_user_id"
  end

  create_table "spare_parts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name_en"
    t.integer "priority", default: 0
  end

  create_table "user_cars", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.string "license_plate"
    t.string "body_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "car_model_id"
    t.string "license_alphabet_group"
    t.string "license_number_group"
    t.string "license_province"
    t.index ["car_model_id"], name: "index_user_cars_on_car_model_id"
    t.index ["user_id"], name: "index_user_cars_on_user_id"
  end

end
