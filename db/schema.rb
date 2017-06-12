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

ActiveRecord::Schema.define(version: 20170531070554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ads", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "run_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "visits",        default: 0
    t.boolean  "selfpromotion", default: false
    t.index ["company_id"], name: "index_ads_on_company_id", using: :btree
    t.index ["run_id"], name: "index_ads_on_run_id", using: :btree
    t.index ["visits"], name: "index_ads_on_visits", using: :btree
  end

  create_table "campaigns", force: :cascade do |t|
    t.string   "name"
    t.string   "targetcountries"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.integer  "campaigntype_id"
    t.integer  "company_id"
    t.boolean  "worldwide",                               default: true
    t.boolean  "america"
    t.boolean  "europe"
    t.boolean  "asia"
    t.boolean  "oceania"
    t.integer  "givenvisits",                             default: 1
    t.integer  "obtainedvisits",                          default: 1
    t.decimal  "visitratio",      precision: 5, scale: 4, default: "1.0"
    t.integer  "ads_received",                            default: 0
    t.index ["ads_received"], name: "index_campaigns_on_ads_received", using: :btree
    t.index ["campaigntype_id"], name: "index_campaigns_on_campaigntype_id", using: :btree
    t.index ["company_id"], name: "index_campaigns_on_company_id", using: :btree
    t.index ["created_at"], name: "index_campaigns_on_created_at", using: :btree
    t.index ["visitratio"], name: "index_campaigns_on_visitratio", using: :btree
  end

  create_table "campaigntypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.integer  "companytype_id"
    t.string   "name"
    t.string   "title",          limit: 70
    t.string   "description"
    t.string   "url"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "ads_received",              default: 0
    t.boolean  "own_style",                 default: true
    t.index ["companytype_id"], name: "index_companies_on_companytype_id", using: :btree
  end

  create_table "companies_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "company_id"
    t.index ["company_id"], name: "index_companies_users_on_company_id", using: :btree
    t.index ["user_id"], name: "index_companies_users_on_user_id", using: :btree
  end

  create_table "company_runs", force: :cascade do |t|
    t.integer  "run_id"
    t.integer  "company_id"
    t.integer  "printnumber"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "companytypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_companytypes_on_name", using: :btree
  end

  create_table "flyers", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "language_id"
    t.string   "image"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "confirmed",   default: false
    t.index ["confirmed"], name: "index_flyers_on_confirmed", using: :btree
  end

  create_table "languages", force: :cascade do |t|
    t.string   "iso"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "text"
    t.integer  "chatroom_id"
    t.integer  "visitor_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id", using: :btree
    t.index ["visitor_id"], name: "index_messages_on_visitor_id", using: :btree
  end

  create_table "prints", force: :cascade do |t|
    t.integer  "run_id"
    t.integer  "company_number"
    t.integer  "print"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "promotions", force: :cascade do |t|
    t.integer  "campaigntype_id"
    t.integer  "campaign_id"
    t.integer  "company_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["campaign_id"], name: "index_promotions_on_campaign_id", using: :btree
    t.index ["campaigntype_id"], name: "index_promotions_on_campaigntype_id", using: :btree
    t.index ["company_id"], name: "index_promotions_on_company_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "survey_id"
    t.string   "test"
    t.boolean  "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "runs", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "campaign_id"
    t.integer  "runprintnumber"
    t.integer  "ownads"
    t.string   "status",         default: "to print"
    t.string   "city"
    t.string   "location"
    t.integer  "language_id"
    t.index ["campaign_id"], name: "index_runs_on_campaign_id", using: :btree
    t.index ["language_id"], name: "index_runs_on_language_id", using: :btree
    t.index ["status"], name: "index_runs_on_status", using: :btree
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "firstname"
    t.string   "lastname"
    t.string   "country"
    t.string   "city"
    t.string   "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "visitors", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ads", "companies"
  add_foreign_key "ads", "runs"
  add_foreign_key "campaigns", "campaigntypes"
  add_foreign_key "campaigns", "companies"
  add_foreign_key "companies", "companytypes"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "visitors"
  add_foreign_key "runs", "campaigns"
  add_foreign_key "runs", "languages"
end
